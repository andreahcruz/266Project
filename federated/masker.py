"""Sovereign masking: real schema names ⇄ opaque tokens.

Operates on Spider ``tables.json`` entries plus a ``selected_tables`` set
returned by the retriever. Only the *selected* portion is masked — that's
what the LLM sees. Tokens are globally unique within a session so the
unmasker can replace them with simple word-boundary regex.

Token scheme:
  - Tables → T1, T2, …  (in sorted index order)
  - Columns → C1, C2, …  (in original column index order, only for selected tables)

The mask dict is the *forward* (token → real) map, plus index helpers used
when rendering the masked schema. Per-session.
"""

from __future__ import annotations

import re
from typing import Iterable


def mask_selection(
    db_id: str,
    entry: dict,
    selected_tables: Iterable[int],
    selected_column_indices: Iterable[int] | None = None,
) -> tuple[str, dict]:
    """Mask the selected portion of a schema.

    Returns ``(masked_schema_string, mask_dict)``. The schema string mimics
    ``schema_loader.get_schema_string`` formatting so existing prompt
    templates work unchanged.
    """
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]  # [[tbl_idx, col_name], ...]
    col_types = entry["column_types"]
    primary_keys = set(entry["primary_keys"])
    foreign_keys = entry["foreign_keys"]

    selected_tables = sorted(set(selected_tables))
    if selected_column_indices is None:
        selected_column_indices = {
            ci for ci, (ti, _) in enumerate(columns) if ti in selected_tables and ti != -1
        }
    selected_column_indices = set(selected_column_indices)

    # Forward maps (token → real)
    token_to_table: dict[str, str] = {}
    token_to_column: dict[str, str] = {}
    # Index helpers
    table_idx_to_token: dict[int, str] = {}
    col_idx_to_token: dict[int, str] = {}

    for n, ti in enumerate(selected_tables, start=1):
        token = f"T{n}"
        table_idx_to_token[ti] = token
        token_to_table[token] = table_names[ti]

    col_counter = 0
    for ci, (ti, cname) in enumerate(columns):
        if ti == -1 or ti not in table_idx_to_token:
            continue
        if ci not in selected_column_indices:
            continue
        col_counter += 1
        token = f"C{col_counter}"
        col_idx_to_token[ci] = token
        token_to_column[token] = cname

    # ── Render masked schema string ────────────────────────────────
    lines: list[str] = []
    for ti in selected_tables:
        ttok = table_idx_to_token[ti]
        col_parts = []
        for ci, (col_ti, cname) in enumerate(columns):
            if col_ti != ti or ci not in col_idx_to_token:
                continue
            ctok = col_idx_to_token[ci]
            col_type = col_types[ci]
            desc = f"{ctok} ({col_type}"
            if ci in primary_keys:
                desc += ", primary key"
            desc += ")"
            col_parts.append(desc)
        lines.append(f"Table: {ttok}")
        lines.append(f"  Columns: {', '.join(col_parts)}")

    fk_parts: list[str] = []
    for src_ci, dst_ci in foreign_keys:
        src_ti = columns[src_ci][0]
        dst_ti = columns[dst_ci][0]
        if src_ti not in table_idx_to_token or dst_ti not in table_idx_to_token:
            continue
        if src_ci not in col_idx_to_token or dst_ci not in col_idx_to_token:
            continue
        fk_parts.append(
            f"{table_idx_to_token[src_ti]}.{col_idx_to_token[src_ci]} = "
            f"{table_idx_to_token[dst_ti]}.{col_idx_to_token[dst_ci]}"
        )
    if fk_parts:
        lines.append(f"Foreign Keys: {', '.join(fk_parts)}")

    mask_dict = {
        "db_id": db_id,
        "token_to_table": token_to_table,
        "token_to_column": token_to_column,
        "table_idx_to_token": table_idx_to_token,
        "col_idx_to_token": col_idx_to_token,
    }
    return "\n".join(lines), mask_dict


# Tokens look like T1, C12, T9, etc. Word-boundary safe replace.
_TOKEN_RE = re.compile(r"\b(T\d+|C\d+)\b")


def unmask_sql(sql: str, mask_dict: dict) -> str:
    """Replace tokens in SQL with their real schema names.

    Uses word-boundary regex — handles dotted refs like ``T1.C2`` because
    the dot is a non-word char. Quoted identifiers like ``"T1"`` and ``[T1]``
    work too: the brackets/quotes are non-word chars, so the inner token
    still hits a word boundary.
    """
    table_map = mask_dict["token_to_table"]
    col_map = mask_dict["token_to_column"]

    def sub(m: re.Match) -> str:
        tok = m.group(0)
        if tok in table_map:
            return table_map[tok]
        if tok in col_map:
            return col_map[tok]
        return tok  # unknown — leave as-is

    return _TOKEN_RE.sub(sub, sql)


def find_real_name_leaks(masked_text: str, entry: dict) -> list[str]:
    """Return real table/column names that appear in *masked_text*.

    Used in tests/asserts to verify masking didn't leak.
    """
    leaks: list[str] = []
    real_names = set(entry["table_names_original"])
    for ti, cname in entry["column_names_original"]:
        if ti != -1:
            real_names.add(cname)
    # Drop generic short names that have huge false-positive risk
    real_names = {n for n in real_names if len(n) >= 3 and n != "*"}
    for n in real_names:
        if re.search(rf"\b{re.escape(n)}\b", masked_text, re.IGNORECASE):
            leaks.append(n)
    return leaks
