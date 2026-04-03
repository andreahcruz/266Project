"""Keyword-based schema retriever for Spider text-to-SQL.

Given a natural-language question and a database schema, ranks tables and
columns by keyword overlap and returns a *reduced* schema string in the
same format as schema_loader.get_schema_string().
"""

from __future__ import annotations

import re
from typing import Optional

# ── Stopwords ────────────────────────────────────────────────────────────
# Common English + question words that add noise to keyword matching.
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
    # Split on underscores, then on camelCase boundaries
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
            # substring match (e.g., "depart" in "department")
            for qs in question_stems:
                if len(ns) >= 3 and len(qs) >= 3:
                    if ns in qs or qs in ns:
                        score += 1.0
                        break
    return score


def _fk_connected_tables(
    selected: set[int],
    foreign_keys: list[list[int]],
    columns: list[list],
) -> set[int]:
    """Return table indices connected to *selected* via foreign keys."""
    connected = set()
    for src_idx, dst_idx in foreign_keys:
        src_tbl = columns[src_idx][0]
        dst_tbl = columns[dst_idx][0]
        if src_tbl in selected and dst_tbl not in selected:
            connected.add(dst_tbl)
        elif dst_tbl in selected and src_tbl not in selected:
            connected.add(src_tbl)
    return connected


def retrieve_schema(
    question: str,
    db_id: str,
    tables_data: dict,
    top_k_tables: int = 4,
    top_n_columns: int = 8,
) -> str:
    """Return a filtered schema string with only the most relevant tables/columns.

    Falls back to the full schema when the database has few tables.
    Output format matches schema_loader.get_schema_string().
    """
    entry = tables_data[db_id]
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]  # [[tbl_idx, col_name], ...]
    col_types = entry["column_types"]
    primary_keys = set(entry["primary_keys"])
    foreign_keys = entry["foreign_keys"]  # [[col_idx, col_idx], ...]

    num_tables = len(table_names)

    # Small-schema shortcut: no filtering needed
    if num_tables <= top_k_tables:
        from schema_loader import get_schema_string
        return get_schema_string(db_id, tables_data)

    # ── Score tables ─────────────────────────────────────────────────────
    q_tokens = _tokenize(question)
    q_stems = {_stem(t) for t in q_tokens}

    # Build column groups for column-based table scoring
    cols_by_table: dict[int, list[str]] = {i: [] for i in range(num_tables)}
    human_cols_by_table: dict[int, list[str]] = {i: [] for i in range(num_tables)}
    for col_idx, (tbl_idx, col_name) in enumerate(columns):
        if tbl_idx == -1:
            continue
        cols_by_table[tbl_idx].append(col_name)
        human_col = entry.get("column_names", columns)[col_idx]
        if isinstance(human_col, list):
            human_cols_by_table[tbl_idx].append(human_col[1])

    table_scores: list[tuple[int, float]] = []
    for tbl_idx, tbl_name in enumerate(table_names):
        # Score table name
        human_name = entry.get("table_names", table_names)[tbl_idx]
        s = max(
            _score(q_stems, tbl_name),
            _score(q_stems, human_name),
        )
        # Boost score based on column name matches (a table is relevant if
        # the question mentions its columns, even if not its name)
        col_score = 0.0
        for col_name in cols_by_table[tbl_idx]:
            col_score += _score(q_stems, col_name)
        for col_name in human_cols_by_table[tbl_idx]:
            col_score += _score(q_stems, col_name) * 0.5
        s += col_score * 0.5  # weight column evidence lower than table name
        table_scores.append((tbl_idx, s))

    table_scores.sort(key=lambda x: x[1], reverse=True)

    # Select tables: start with top-k, then add all with positive scores
    selected_tables: set[int] = set()
    for tbl_idx, s in table_scores[:top_k_tables]:
        selected_tables.add(tbl_idx)
    # Also include any table with a positive score (don't drop relevant ones)
    for tbl_idx, s in table_scores:
        if s > 0:
            selected_tables.add(tbl_idx)

    # Expand via FK links: add ALL tables directly connected to selected tables
    # This ensures join paths are available even when the question doesn't
    # mention the bridge/junction table by name
    fk_neighbors = _fk_connected_tables(selected_tables, foreign_keys, columns)
    selected_tables.update(fk_neighbors)

    # Ensure at least one table is selected
    if not selected_tables:
        selected_tables.add(table_scores[0][0])

    # ── Score and select columns per table ───────────────────────────────
    # Group columns by table
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
            # Keep all columns if table is small
            selected_cols = cols
        else:
            # Score columns and select top-n, always keeping PK/FK
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
            # Sort by original order
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

    # Test on a few sample questions
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
        print("\n--- FULL SCHEMA ---")
        print(get_schema_string(db_id, tables))
        print("\n--- RETRIEVED SCHEMA ---")
        print(retrieve_schema(question, db_id, tables))
        print()
