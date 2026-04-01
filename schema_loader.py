"""Utilities for loading Spider table schema metadata."""

import json
from pathlib import Path


def load_tables(tables_json_path):
    """Parse tables.json and return a dict keyed by db_id."""
    with open(tables_json_path) as f:
        data = json.load(f)
    return {entry["db_id"]: entry for entry in data}


def get_schema_string(db_id, tables_data):
    """Build a formatted schema string for a given database.

    Includes table names, column names with types, primary keys,
    and foreign key relationships -- everything the LLM needs to
    generate correct SQL.
    """
    entry = tables_data[db_id]
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]  # list of [table_idx, col_name]
    col_types = entry["column_types"]
    primary_keys = set(entry["primary_keys"])
    foreign_keys = entry["foreign_keys"]  # list of [col_idx, col_idx]

    # Group columns by table index
    table_columns = {i: [] for i in range(len(table_names))}
    for col_idx, (tbl_idx, col_name) in enumerate(columns):
        if tbl_idx == -1:
            continue  # skip the wildcard "*" entry
        is_pk = col_idx in primary_keys
        col_type = col_types[col_idx]
        table_columns[tbl_idx].append((col_name, col_type, is_pk))

    # Build per-table descriptions
    lines = []
    for tbl_idx, tbl_name in enumerate(table_names):
        col_parts = []
        for col_name, col_type, is_pk in table_columns[tbl_idx]:
            desc = f"{col_name} ({col_type}"
            if is_pk:
                desc += ", primary key"
            desc += ")"
            col_parts.append(desc)
        lines.append(f"Table: {tbl_name}")
        lines.append(f"  Columns: {', '.join(col_parts)}")

    # Build foreign key descriptions
    if foreign_keys:
        fk_parts = []
        for src_idx, dst_idx in foreign_keys:
            src_tbl = table_names[columns[src_idx][0]]
            src_col = columns[src_idx][1]
            dst_tbl = table_names[columns[dst_idx][0]]
            dst_col = columns[dst_idx][1]
            fk_parts.append(f"{src_tbl}.{src_col} = {dst_tbl}.{dst_col}")
        lines.append(f"Foreign Keys: {', '.join(fk_parts)}")

    return "\n".join(lines)


if __name__ == "__main__":
    from config import TABLES_JSON

    tables = load_tables(TABLES_JSON)
    print(get_schema_string("perpetrator", tables))
    print()
    print(get_schema_string("department_management", tables))
