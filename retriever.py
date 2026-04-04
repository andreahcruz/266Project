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


def _score(question_stems: set[str], name: str) -> float:
    """Score a table or column name against stemmed question tokens."""
    name_toks = _name_tokens(name)
    if not name_toks:
        return 0.0

    score = 0.0
    name_stems = {_stem(t) for t in name_toks}

    for ns in name_stems:
        if ns in question_stems:
            score += 2.0  # exact stem match
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
    """Score a table by name match + column name matches."""
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
) -> str:
    """Return a filtered schema string with only the most relevant tables/columns.

    Args:
        mode: "lexical" (keyword only) or "hybrid" (lexical + vector reranking)
        openai_client: Required for hybrid mode. An OpenAI client instance.
        vector_threshold: Cosine similarity threshold for vector rescue (hybrid).

    Falls back to the full schema when the database has few tables.
    Output format matches schema_loader.get_schema_string().
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
        return get_schema_string(db_id, tables_data)

    # ── Score tables (lexical) ───────────────────────────────────────────
    q_tokens = _tokenize(question)
    q_stems = {_stem(t) for t in q_tokens}

    table_scores: list[tuple[int, float]] = []
    for tbl_idx in range(num_tables):
        s = _score_table(tbl_idx, entry, table_names, columns, q_stems)
        table_scores.append((tbl_idx, s))

    table_scores.sort(key=lambda x: x[1], reverse=True)

    # ── Strict top-k selection ───────────────────────────────────────────
    selected_tables: set[int] = set()
    for tbl_idx, s in table_scores[:top_k_tables]:
        selected_tables.add(tbl_idx)

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
                    s = _score(q_stems, col_name) + _score(q_stems, human_name) * 0.5
                    col_scored.append((s, col_idx, col_name, col_type, is_pk))

            col_scored.sort(key=lambda x: x[0], reverse=True)
            remaining_slots = max(0, top_n_columns - len(must_include))
            extra = [(ci, cn, ct, pk) for _, ci, cn, ct, pk in col_scored[:remaining_slots]]
            selected_cols = must_include + extra
            col_order = {ci: i for i, (ci, _, _, _) in enumerate(cols)}
            selected_cols.sort(key=lambda x: col_order.get(x[0], 0))

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

    return "\n".join(lines)


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
