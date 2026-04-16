"""Schema retriever for Spider text-to-SQL.

Two retrieval modes:
  1. Lexical (keyword overlap) — fast, no API calls
  2. Hybrid (lexical + vector reranking) — uses OpenAI embeddings to
     rescue tables that lexical scoring misses due to synonym gaps

Given a natural-language question and a database schema, ranks tables and
columns and returns a *reduced* schema string in the same format as
schema_loader.get_schema_string().
"""

from __future__ import annotations

import math
import re
from typing import Optional

# ── Stopwords ────────────────────────────────────────────────────────────
# Words filtered from questions when scoring tables/columns.
# COLUMN_NAME_WORDS are stopwords for question parsing but are valid column
# names, so _score checks for them separately to avoid missing columns like
# "name", "number", etc.
COLUMN_NAME_WORDS = frozenset(
    "name number total count average maximum minimum".split()
)
STOPWORDS = frozenset(
    "a an the is are was were be been being do does did have has had "
    "will would shall should can could may might must "
    "i me my we our you your he she it they them their its "
    "this that these those there here "
    "and or but not no nor so if then than too also "
    "of in on at to for with by from as into about between through "
    "how what which who whom whose where when why "
    "all any each every some many much more most other another "
    "find show list give get display return tell name "
    "total number count average maximum minimum".split()
)

JOIN_LIKE_PATTERNS = (
    "for each",
    "across",
    "between",
    "with their",
    "together with",
    "along with",
    "joined with",
    "per ",
    "in each",
    "for every",
    "who have",
    "that have",
    "with the most",
    "with at least",
    "without",
    "not ",
    "or have",
)


def _tokenize(text: str) -> list[str]:
    """Lowercase, split on non-alphanumeric, drop stopwords and short tokens."""
    tokens = re.findall(r"[a-z0-9]+", text.lower())
    return [t for t in tokens if t not in STOPWORDS and len(t) > 1]


def _stem(word: str) -> str:
    """Minimal suffix stripping for morphological variants."""
    if word.endswith("ment") and len(word) > 5:
        return word[:-4]
    if word.endswith("tion") and len(word) > 5:
        return word[:-4]
    if word.endswith("sion") and len(word) > 5:
        return word[:-4]
    if word.endswith("ies") and len(word) > 4:
        return word[:-3] + "y"
    if word.endswith("ses") or word.endswith("xes") or word.endswith("zes"):
        return word[:-2]
    if word.endswith("ped") and len(word) > 4:
        return word[:-3]
    if word.endswith("ing") and len(word) > 4:
        return word[:-3]
    if word.endswith("ed") and len(word) > 3:
        return word[:-2]
    if word.endswith("er") and len(word) > 4:
        return word[:-2]
    if word.endswith("es") and len(word) > 4:
        return word[:-2]
    if word.endswith("s") and not word.endswith("ss") and len(word) > 3:
        return word[:-1]
    return word


def _name_tokens(name: str) -> list[str]:
    """Split a SQL name like 'first_name' or 'FirstName' into word tokens."""
    parts = name.replace("_", " ").lower()
    parts = re.findall(r"[a-z0-9]+", parts)
    return [p for p in parts if len(p) > 1]


def _score(question_stems: set[str], name: str, question_raw_tokens: set[str] | None = None) -> float:
    """Score a table or column name against stemmed question tokens.

    question_raw_tokens: full lowercase tokens from the question (before
    stopword removal).  Used to match column names like "name" or "number"
    that are stripped as stopwords from question_stems.
    """
    name_toks = _name_tokens(name)
    if not name_toks:
        return 0.0

    score = 0.0
    name_stems = {_stem(t) for t in name_toks}

    for ns in name_stems:
        if ns in question_stems:
            score += 2.0  # exact stem match
        elif question_raw_tokens and ns in COLUMN_NAME_WORDS and ns in question_raw_tokens:
            score += 2.0  # column-name word that was stripped as stopword
        else:
            for qs in question_stems:
                if len(ns) >= 3 and len(qs) >= 3:
                    if ns in qs or qs in ns:
                        score += 1.0
                        break
    return score


def _score_table(
    tbl_idx: int,
    entry: dict,
    table_names: list[str],
    columns: list[list],
    q_stems: set[str],
) -> float:
    """Score a table by name match + column name matches.

    Column-name words (like "name", "number") are NOT used for table ranking
    because they are too generic — many tables share a "name" column, so
    boosting them here adds noise.  They are used later for column selection
    within already-selected tables.
    """
    tbl_name = table_names[tbl_idx]
    human_name = entry.get("table_names", table_names)[tbl_idx]
    s = max(_score(q_stems, tbl_name), _score(q_stems, human_name))

    # Column evidence (weighted lower)
    col_score = 0.0
    for col_idx, (ci_tbl, col_name) in enumerate(columns):
        if ci_tbl != tbl_idx:
            continue
        col_score += _score(q_stems, col_name)
        human_col = entry.get("column_names", columns)[col_idx]
        if isinstance(human_col, list):
            col_score += _score(q_stems, human_col[1]) * 0.5
    s += col_score * 0.5
    return s


def _looks_like_single_table_question(
    question: str,
    table_scores: list[tuple[int, float]],
    table_names: list[str],
) -> bool:
    """Heuristic for simple one-table questions that should return fewer tables."""
    q = question.lower()
    q_tokens = _tokenize(question)
    short_question = len(q_tokens) <= 8
    has_join_like_language = any(pattern in q for pattern in JOIN_LIKE_PATTERNS)

    normalized_question = " ".join(re.findall(r"[a-z0-9]+", q))
    obvious_table_name_match = False
    for table_name in table_names:
        variants = {
            table_name.lower(),
            table_name.lower().replace("_", " "),
        }
        if any(variant and variant in normalized_question for variant in variants):
            obvious_table_name_match = True
            break

    top_scores = [score for _, score in table_scores[:3]]
    while len(top_scores) < 3:
        top_scores.append(0.0)
    top1, top2, top3 = top_scores
    clear_score_lead = top1 >= top2 + 1.5 and top1 >= top3 + 2.0

    return short_question and obvious_table_name_match and clear_score_lead and not has_join_like_language


def _adaptive_top_k(
    question: str,
    table_scores: list[tuple[int, float]],
    table_names: list[str],
    default_top_k: int,
) -> int:
    """Adaptive top-k with a single-table bias for simple questions."""
    if default_top_k <= 1:
        return default_top_k

    if _looks_like_single_table_question(question, table_scores, table_names):
        return min(2, default_top_k)

    return default_top_k


# ── Vector reranking (OpenAI embeddings) ─────────────────────────────────

def _cosine_sim(a: list[float], b: list[float]) -> float:
    """Cosine similarity between two vectors (pure Python, no numpy)."""
    dot = sum(x * y for x, y in zip(a, b))
    norm_a = math.sqrt(sum(x * x for x in a))
    norm_b = math.sqrt(sum(x * x for x in b))
    if norm_a == 0 or norm_b == 0:
        return 0.0
    return dot / (norm_a * norm_b)


def _get_embeddings(texts: list[str], client) -> list[list[float]]:
    """Get embeddings from OpenAI API in a single batch call."""
    response = client.embeddings.create(
        model="text-embedding-3-small",
        input=texts,
    )
    return [item.embedding for item in response.data]


def _vector_rerank_tables(
    question: str,
    entry: dict,
    table_names: list[str],
    columns: list[list],
    selected: set[int],
    unselected_with_scores: list[tuple[int, float]],
    client,
    similarity_threshold: float = 0.35,
    vector_index: Optional[dict] = None,
    db_id: Optional[str] = None,
) -> set[int]:
    """Use embeddings to rescue unselected tables that are semantically relevant.

    When vector_index is provided, uses pre-computed table embeddings and
    only embeds the question (1 API call). Otherwise falls back to embedding
    both the question and table descriptions on the fly.
    """
    if not unselected_with_scores or client is None:
        return selected

    # Get question embedding (always 1 API call)
    q_emb = _get_embeddings([question], client)[0]

    # Use pre-computed index if available
    if vector_index is not None and db_id is not None and db_id in vector_index:
        index_entries = {e["tbl_idx"]: e["embedding"] for e in vector_index[db_id]}
        rescued = set()
        for tbl_idx, lex_score in unselected_with_scores:
            if tbl_idx in index_entries:
                sim = _cosine_sim(q_emb, index_entries[tbl_idx])
                if sim >= similarity_threshold:
                    rescued.add(tbl_idx)
        return selected | rescued

    # Fallback: embed table descriptions on the fly
    candidate_indices = []
    candidate_texts = []
    for tbl_idx, lex_score in unselected_with_scores:
        human_name = entry.get("table_names", table_names)[tbl_idx]
        col_names = []
        for ci, (ci_tbl, col_name) in enumerate(columns):
            if ci_tbl == tbl_idx:
                human_col = entry.get("column_names", columns)[ci]
                if isinstance(human_col, list):
                    col_names.append(human_col[1])
                else:
                    col_names.append(col_name)
        desc = f"Table: {human_name}. Columns: {', '.join(col_names)}"
        candidate_indices.append(tbl_idx)
        candidate_texts.append(desc)

    if not candidate_texts:
        return selected

    candidate_embeddings = _get_embeddings(candidate_texts, client)

    rescued = set()
    for i, tbl_idx in enumerate(candidate_indices):
        sim = _cosine_sim(q_emb, candidate_embeddings[i])
        if sim >= similarity_threshold:
            rescued.add(tbl_idx)

    return selected | rescued


# ── FK bridge logic ──────────────────────────────────────────────────────

def _add_bridge_tables(
    selected: set[int],
    foreign_keys: list[list[int]],
    columns: list[list],
) -> set[int]:
    """Add only bridge/junction tables that connect two already-selected tables.

    A bridge table is one that is NOT selected but has FK links to at least
    two different selected tables. This is much tighter than adding all FK
    neighbors.
    """
    if len(selected) < 2:
        return set(selected)

    num_tables = max(columns[c][0] for c in range(len(columns)) if columns[c][0] != -1) + 1
    result = set(selected)

    for candidate in range(num_tables):
        if candidate in result:
            continue
        # Count how many distinct selected tables this candidate connects to
        connected_selected = set()
        for src_idx, dst_idx in foreign_keys:
            src_tbl = columns[src_idx][0]
            dst_tbl = columns[dst_idx][0]
            if src_tbl == candidate and dst_tbl in selected:
                connected_selected.add(dst_tbl)
            elif dst_tbl == candidate and src_tbl in selected:
                connected_selected.add(src_tbl)
        if len(connected_selected) >= 2:
            result.add(candidate)

    return result


# ── Main retrieval function ──────────────────────────────────────────────

def retrieve_schema_details(
    question: str,
    db_id: str,
    tables_data: dict,
    top_k_tables: int = 4,
    top_n_columns: int = 6,
    mode: str = "lexical",
    openai_client=None,
    vector_threshold: float = 0.35,
    vector_index: Optional[dict] = None,
    score_ratio_threshold: float = 0.35,
) -> dict:
    """Return retrieval details for the most relevant tables/columns.

    Args:
        mode: "lexical" (keyword only) or "hybrid" (lexical + vector reranking)
        openai_client: Required for hybrid mode. An OpenAI client instance.
        vector_threshold: Cosine similarity threshold for vector rescue (hybrid).
        score_ratio_threshold: Min ratio of a table's score to the top score
            to be included. Tables below top_score * ratio are pruned.

    Falls back to the full schema when the database has few tables.
    Output schema format matches schema_loader.get_schema_string().
    """
    entry = tables_data[db_id]
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]
    col_types = entry["column_types"]
    primary_keys = set(entry["primary_keys"])
    foreign_keys = entry["foreign_keys"]

    num_tables = len(table_names)

    # Small-schema shortcut: no filtering needed
    if num_tables <= top_k_tables:
        from schema_loader import get_schema_string
        selected_tables = set(range(num_tables))
        selected_column_indices = {
            col_idx
            for col_idx, (tbl_idx, _) in enumerate(columns)
            if tbl_idx != -1
        }
        return {
            "schema": get_schema_string(db_id, tables_data),
            "selected_tables": selected_tables,
            "selected_column_indices": selected_column_indices,
            "selected_table_names": [table_names[i] for i in sorted(selected_tables)],
            "table_scores": [],
            "mode": mode,
        }

    # ── Score tables (lexical) ───────────────────────────────────────────
    q_tokens = _tokenize(question)
    q_stems = {_stem(t) for t in q_tokens}
    # Raw tokens (before stopword removal) for matching column-name words
    q_raw_tokens = set(re.findall(r"[a-z0-9]+", question.lower()))

    table_scores: list[tuple[int, float]] = []
    for tbl_idx in range(num_tables):
        s = _score_table(tbl_idx, entry, table_names, columns, q_stems)
        table_scores.append((tbl_idx, s))

    table_scores.sort(key=lambda x: x[1], reverse=True)

    # ── Score-ratio pruning ─────────────────────────────────────────────
    # Instead of always taking a fixed top-k, drop tables whose score is
    # a small fraction of the top scorer.  This keeps all top-k tables
    # when scores are close (multi-table queries) but trims irrelevant
    # tables for single-table questions where only 1-2 tables match.
    top_score = table_scores[0][1] if table_scores else 0.0
    score_threshold = top_score * score_ratio_threshold

    selected_tables: set[int] = set()
    for tbl_idx, s in table_scores[:top_k_tables]:
        if s > 0 and s >= score_threshold:
            selected_tables.add(tbl_idx)

    # Always keep at least the top table
    if not selected_tables:
        selected_tables.add(table_scores[0][0])

    # ── Hybrid mode: vector rerank unselected tables ─────────────────────
    if mode == "hybrid" and openai_client is not None:
        unselected = [(tbl_idx, s) for tbl_idx, s in table_scores[top_k_tables:]]
        selected_tables = _vector_rerank_tables(
            question, entry, table_names, columns,
            selected_tables, unselected, openai_client, vector_threshold,
            vector_index=vector_index, db_id=db_id,
        )

    # ── Add only necessary FK bridge tables ──────────────────────────────
    selected_tables = _add_bridge_tables(selected_tables, foreign_keys, columns)

    # Ensure at least one table is selected
    if not selected_tables:
        selected_tables.add(table_scores[0][0])

    # ── Score and select columns per table ───────────────────────────────
    table_columns: dict[int, list[tuple[int, str, str, bool]]] = {
        t: [] for t in selected_tables
    }
    for col_idx, (tbl_idx, col_name) in enumerate(columns):
        if tbl_idx == -1 or tbl_idx not in selected_tables:
            continue
        is_pk = col_idx in primary_keys
        col_type = col_types[col_idx]
        table_columns[tbl_idx].append((col_idx, col_name, col_type, is_pk))

    # FK column indices (for selected tables)
    fk_col_indices: set[int] = set()
    for src_idx, dst_idx in foreign_keys:
        src_tbl = columns[src_idx][0]
        dst_tbl = columns[dst_idx][0]
        if src_tbl in selected_tables and dst_tbl in selected_tables:
            fk_col_indices.add(src_idx)
            fk_col_indices.add(dst_idx)

    # Build output
    lines = []
    selected_column_indices: set[int] = set()
    for tbl_idx in sorted(selected_tables):
        tbl_name = table_names[tbl_idx]
        cols = table_columns[tbl_idx]

        if len(cols) <= top_n_columns:
            selected_cols = cols
        else:
            col_scored = []
            must_include = []
            for col_idx, col_name, col_type, is_pk in cols:
                if is_pk or col_idx in fk_col_indices:
                    must_include.append((col_idx, col_name, col_type, is_pk))
                else:
                    human_col = entry.get("column_names", columns)[col_idx]
                    human_name = human_col[1] if isinstance(human_col, list) else col_name
                    s = _score(q_stems, col_name, q_raw_tokens) + _score(q_stems, human_name, q_raw_tokens) * 0.5  # column-name words matched here
                    col_scored.append((s, col_idx, col_name, col_type, is_pk))

            col_scored.sort(key=lambda x: x[0], reverse=True)
            remaining_slots = max(0, top_n_columns - len(must_include))
            extra = [(ci, cn, ct, pk) for _, ci, cn, ct, pk in col_scored[:remaining_slots]]
            selected_cols = must_include + extra
            col_order = {ci: i for i, (ci, _, _, _) in enumerate(cols)}
            selected_cols.sort(key=lambda x: col_order.get(x[0], 0))

        for col_idx, _, _, _ in selected_cols:
            selected_column_indices.add(col_idx)

        col_parts = []
        for col_idx, col_name, col_type, is_pk in selected_cols:
            desc = f"{col_name} ({col_type}"
            if is_pk:
                desc += ", primary key"
            desc += ")"
            col_parts.append(desc)
        lines.append(f"Table: {tbl_name}")
        lines.append(f"  Columns: {', '.join(col_parts)}")

    # FK lines (only between selected tables)
    fk_parts = []
    for src_idx, dst_idx in foreign_keys:
        src_tbl_idx = columns[src_idx][0]
        dst_tbl_idx = columns[dst_idx][0]
        if src_tbl_idx in selected_tables and dst_tbl_idx in selected_tables:
            src_tbl = table_names[src_tbl_idx]
            src_col = columns[src_idx][1]
            dst_tbl = table_names[dst_tbl_idx]
            dst_col = columns[dst_idx][1]
            fk_parts.append(f"{src_tbl}.{src_col} = {dst_tbl}.{dst_col}")
    if fk_parts:
        lines.append(f"Foreign Keys: {', '.join(fk_parts)}")

    return {
        "schema": "\n".join(lines),
        "selected_tables": selected_tables,
        "selected_column_indices": selected_column_indices,
        "selected_table_names": [table_names[i] for i in sorted(selected_tables)],
        "table_scores": table_scores,
        "mode": mode,
        "score_ratio_threshold": score_ratio_threshold,
    }


def retrieve_schema(
    question: str,
    db_id: str,
    tables_data: dict,
    top_k_tables: int = 4,
    top_n_columns: int = 6,
    mode: str = "lexical",
    openai_client=None,
    vector_threshold: float = 0.35,
    vector_index: Optional[dict] = None,
    score_ratio_threshold: float = 0.35,
) -> str:
    """Return only the filtered schema string for backward compatibility."""
    details = retrieve_schema_details(
        question=question,
        db_id=db_id,
        tables_data=tables_data,
        top_k_tables=top_k_tables,
        top_n_columns=top_n_columns,
        mode=mode,
        openai_client=openai_client,
        vector_threshold=vector_threshold,
        vector_index=vector_index,
        score_ratio_threshold=score_ratio_threshold,
    )
    return details["schema"]


if __name__ == "__main__":
    from schema_loader import load_tables, get_schema_string
    from config import TEST_TABLES_JSON

    tables = load_tables(TEST_TABLES_JSON)

    samples = [
        ("soccer_3", "How many clubs are there?"),
        ("soccer_3", "What are the names of players who play for clubs in the Premier League?"),
        ("insurance_and_eClaims", "What is the total claim amount for settlements that are still pending?"),
    ]

    for db_id, question in samples:
        if db_id not in tables:
            print(f"Skipping {db_id} (not in test_tables.json)")
            continue
        print(f"=== {db_id}: \"{question}\" ===")
        full = get_schema_string(db_id, tables)
        retrieved = retrieve_schema(question, db_id, tables)
        print(f"Full schema: {len(full)} chars")
        print(f"Retrieved:   {len(retrieved)} chars ({len(retrieved)/len(full):.0%})")
        print(retrieved)
        print()
