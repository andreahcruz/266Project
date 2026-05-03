"""Sovereign masking: real schema names ⇄ masked schema identifiers.

Operates on Spider ``tables.json`` entries plus a ``selected_tables`` set
returned by the retriever. Only the *selected* portion is masked — that's
what the LLM sees. Tokens are globally unique within a session so the
unmasker can replace them with simple word-boundary regex.

Mask styles:
  - ``hard`` tables → ``T1``, ``T2`` and columns → ``C1``, ``C2``
  - ``semantic`` tables stay ``T1``, ``T2`` but columns become semantic
    proxies such as ``IDENTIFIER_PRIMARY_1`` or ``CURRENCY_AMOUNT_2``

The mask dict is the *forward* (token → real) map, plus index helpers used
when rendering the masked schema. Per-session.
"""

from __future__ import annotations

import re
from typing import Iterable


MASK_STYLES = ("hard", "semantic")


def _semantic_column_base(
    *,
    table_name: str,
    column_name: str,
    column_type: str,
    is_primary_key: bool,
    is_foreign_key: bool,
) -> str:
    """Return a coarse semantic proxy label for a column.

    The goal is to preserve broad SQL-relevant meaning without exposing the
    original schema name. These labels are intentionally generic.
    """
    lower_name = column_name.lower()
    table_lower = table_name.lower()
    toks = set(re.findall(r"[a-z0-9]+", lower_name.replace("_", " ")))
    combined = toks | set(re.findall(r"[a-z0-9]+", table_lower.replace("_", " ")))
    col_type = column_type.lower()

    if is_primary_key:
        return "IDENTIFIER_PRIMARY"
    if is_foreign_key:
        if {"date", "year", "month", "day", "time"} & combined:
            return "CHRONOLOGICAL_REFERENCE"
        return "IDENTIFIER_REFERENCE"
    if "id" in toks or lower_name.endswith("_id") or lower_name.startswith("id_"):
        return "IDENTIFIER_CODE"
    if {"date", "year", "month", "day", "birth", "dob"} & combined or col_type in {"time", "datetime", "date", "year"}:
        return "CHRONOLOGICAL_MARKER"
    if {"salary", "pay", "wage", "income", "revenue", "budget", "price", "cost", "fee", "amount"} & combined:
        return "CURRENCY_AMOUNT"
    if {"total", "count", "num", "number", "quantity", "qty", "score", "age", "population", "size", "length", "height", "weight", "rank", "rating"} & combined:
        return "MEASUREMENT_VALUE"
    if {"percent", "percentage", "ratio", "rate", "avg", "average"} & combined:
        return "STATISTICAL_VALUE"
    if {"name", "title", "type", "category", "class", "status", "level", "gender", "country", "state", "city", "address", "email", "phone"} & combined:
        return "DESCRIPTIVE_ATTRIBUTE"
    if {"first", "last", "middle"} & combined and "name" in combined:
        return "PERSON_NAME"
    if {"first", "last"} & combined:
        return "ORDERING_MARKER"
    if {"comment", "description", "detail", "summary", "note", "remark"} & combined:
        return "TEXTUAL_CONTENT"
    if {"url", "website", "link"} & combined:
        return "WEB_REFERENCE"
    if {"latitude", "longitude", "lat", "lon"} & combined:
        return "GEO_COORDINATE"
    if {"location", "place", "region"} & combined:
        return "LOCATION_ATTRIBUTE"
    if {"yes", "no", "true", "false", "flag", "active"} & combined or col_type == "boolean":
        return "BOOLEAN_FLAG"
    if col_type in {"number", "integer", "real", "float", "double"}:
        return "NUMERIC_FIELD"
    if col_type in {"time", "datetime", "date", "year"}:
        return "CHRONOLOGICAL_MARKER"
    if col_type in {"text", "varchar", "char"}:
        return "TEXT_FIELD"
    return "GENERIC_ATTRIBUTE"


def _make_column_token(
    *,
    style: str,
    col_counter: int,
    table_name: str,
    column_name: str,
    column_type: str,
    is_primary_key: bool,
    is_foreign_key: bool,
) -> str:
    if style == "hard":
        return f"C{col_counter}"
    base = _semantic_column_base(
        table_name=table_name,
        column_name=column_name,
        column_type=column_type,
        is_primary_key=is_primary_key,
        is_foreign_key=is_foreign_key,
    )
    return f"{base}_{col_counter}"


def mask_selection(
    db_id: str,
    entry: dict,
    selected_tables: Iterable[int],
    selected_column_indices: Iterable[int] | None = None,
    mask_style: str = "hard",
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
    foreign_key_columns = {src for src, _ in foreign_keys} | {dst for _, dst in foreign_keys}

    if mask_style not in MASK_STYLES:
        raise ValueError(f"unknown mask_style {mask_style!r}")

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
        token = _make_column_token(
            style=mask_style,
            col_counter=col_counter,
            table_name=table_names[ti],
            column_name=cname,
            column_type=col_types[ci],
            is_primary_key=ci in primary_keys,
            is_foreign_key=ci in foreign_key_columns,
        )
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
        "mask_style": mask_style,
    }
    return "\n".join(lines), mask_dict


def unmask_sql(sql: str, mask_dict: dict) -> str:
    """Replace tokens in SQL with their real schema names.

    Uses word-boundary regex — handles dotted refs like ``T1.C2`` because
    the dot is a non-word char. Quoted identifiers like ``"T1"`` and ``[T1]``
    work too: the brackets/quotes are non-word chars, so the inner token
    still hits a word boundary.
    """
    table_map = mask_dict["token_to_table"]
    col_map = mask_dict["token_to_column"]
    all_tokens = sorted(
        list(table_map.keys()) + list(col_map.keys()),
        key=len,
        reverse=True,
    )
    if not all_tokens:
        return sql
    token_re = re.compile(r"\b(" + "|".join(re.escape(tok) for tok in all_tokens) + r")\b")

    def sub(m: re.Match) -> str:
        tok = m.group(0)
        if tok in table_map:
            return table_map[tok]
        if tok in col_map:
            return col_map[tok]
        return tok  # unknown — leave as-is

    return token_re.sub(sub, sql)


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
