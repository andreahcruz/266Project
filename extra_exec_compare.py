"""Compare per-row execution match on the *extra* tier across prediction files (balanced run).

Uses the same parsing/rebuild/exec logic as evaluation.py. Set SPIDER_TEST_SPLIT in .env
to balanced_16x4 or balanced_80x4. Run from repo root:

  python extra_exec_compare.py
"""

from __future__ import annotations

import os
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
sys.path.insert(0, str(ROOT))

from config import (  # noqa: E402
    BALANCED_INDICES,
    GOLD_SLICE_PATH,
    RESULTS_DIR,
    balanced_pred_filename,
)
from evaluation import (  # noqa: E402
    Evaluator,
    Schema,
    build_foreign_key_map_from_json,
    build_valid_col_units,
    eval_exec_match,
    get_schema,
    rebuild_sql_col,
    rebuild_sql_val,
)
from process_sql import get_sql  # noqa: E402

BASE_DIR = ROOT
TEST_DB_DIR = BASE_DIR / "test_database"
TEST_TABLES = BASE_DIR / "test_tables.json"

EMPTY_PRED_SQL = {
    "except": None,
    "from": {"conds": [], "table_units": []},
    "groupBy": [],
    "having": [],
    "intersect": None,
    "limit": None,
    "orderBy": [],
    "select": [False, []],
    "union": None,
    "where": [],
}


def load_lines(path: Path) -> list[list[str]]:
    rows = []
    with open(path, encoding="utf-8") as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            rows.append(line.split("\t"))
    return rows


def row_exec_match(
    g_str: str,
    p_str: str,
    db_name: str,
    kmaps: dict,
    evaluator: Evaluator,
) -> tuple[bool, bool]:
    """Returns (parse_ok, exec_match). parse_ok False if pred did not parse to AST."""
    db_path = os.path.join(str(TEST_DB_DIR), db_name, db_name + ".sqlite")
    schema = Schema(get_schema(db_path))
    g_sql = get_sql(schema, g_str)
    try:
        p_sql = get_sql(schema, p_str)
        parse_ok = True
    except Exception:
        p_sql = dict(EMPTY_PRED_SQL)
        parse_ok = False

    kmap = kmaps[db_name]
    g_valid = build_valid_col_units(g_sql["from"]["table_units"], schema)
    g_sql = rebuild_sql_val(g_sql)
    g_sql = rebuild_sql_col(g_valid, g_sql, kmap)
    p_valid = build_valid_col_units(p_sql["from"]["table_units"], schema)
    p_sql = rebuild_sql_val(p_sql)
    p_sql = rebuild_sql_col(p_valid, p_sql, kmap)

    ok = bool(eval_exec_match(db_path, p_str, g_str, p_sql, g_sql))
    return parse_ok, ok


def main():
    if BALANCED_INDICES is None:
        sys.exit("Set SPIDER_TEST_SPLIT=balanced_16x4 or balanced_80x4 in .env (this script needs a balanced gold slice).")

    kmaps = build_foreign_key_map_from_json(str(TEST_TABLES.relative_to(BASE_DIR)))
    evaluator = Evaluator()

    preds = {
        "openai_zero_shot": RESULTS_DIR / balanced_pred_filename("openai_zero_shot"),
        "openai_chain_of_thought": RESULTS_DIR / balanced_pred_filename("openai_chain_of_thought"),
        "openai_few_shot": RESULTS_DIR / balanced_pred_filename("openai_few_shot"),
        "openai_self_correction": RESULTS_DIR / balanced_pred_filename("openai_self_correction"),
    }

    glist = load_lines(GOLD_SLICE_PATH)
    plists = {name: load_lines(p) for name, p in preds.items()}

    n = len(glist)
    if any(len(plists[k]) != n for k in plists):
        sys.exit("Gold and all preds must have the same number of lines.")

    # Map file row index -> hardness (from gold)
    extra_rows: list[int] = []
    for i, g in enumerate(glist):
        g_str, db_name = g[0], g[1]
        db_path = os.path.join(str(TEST_DB_DIR), db_name, db_name + ".sqlite")
        schema = Schema(get_schema(db_path))
        g_sql = get_sql(schema, g_str)
        h = evaluator.eval_hardness(g_sql)
        if h == "extra":
            extra_rows.append(i)

    print(f"Gold: {GOLD_SLICE_PATH}")
    print(f"Balanced gold: {n} lines; extra-tier row indices: {extra_rows}")
    print(f"Extra count: {len(extra_rows)}\n")

    # For each extra row, exec match per strategy
    results: dict[int, dict[str, bool]] = {}
    parse_fails: dict[int, dict[str, bool]] = {}

    for i in extra_rows:
        g_str, db_name = glist[i][0], glist[i][1]
        results[i] = {}
        parse_fails[i] = {}
        for name in preds:
            p_str = plists[name][i][0]
            parse_ok, em = row_exec_match(g_str, p_str, db_name, kmaps, evaluator)
            results[i][name] = em
            parse_fails[i][name] = not parse_ok

    # Pretty table: rows = line index, cols = strategy
    names = list(preds.keys())
    header = ["row"] + names
    print(" | ".join(f"{h:28}" for h in header))
    print("-" * (29 * len(header)))
    for i in extra_rows:
        cells = [str(i)] + ["1" if results[i][nm] else "0" for nm in names]
        print(" | ".join(f"{c:28}" for c in cells))

    # Which rows have exec=1 for each strategy
    print("\nExec=1 line indices per strategy:")
    for nm in names:
        wins = [i for i in extra_rows if results[i][nm]]
        print(f"  {nm}: {wins} (count {len(wins)})")

    # Intersection: all strategies agree exec success
    all_win = [i for i in extra_rows if all(results[i][nm] for nm in names)]
    print(f"\nAll four strategies exec=1 on same rows: {all_win}")

    if all_win:
        global_idx = [BALANCED_INDICES[i] for i in all_win]
        print(f"Global test_gold.sql / test.json line indices for those rows: {global_idx}")

    # Pairwise Jaccard of success sets
    def jaccard(a: set, b: set) -> float:
        if not a and not b:
            return 1.0
        u = a | b
        return len(a & b) / len(u) if u else 0.0

    sets = {nm: {i for i in extra_rows if results[i][nm]} for nm in names}
    print("\nPairwise Jaccard of successful extra rows:")
    for i, a in enumerate(names):
        for b in names[i + 1 :]:
            ja, jb = sets[a], sets[b]
            print(f"  {a} vs {b}: {jaccard(ja, jb):.3f}  (|intersection|={len(ja & jb)})")

    # Parse failures on extra rows (any strategy)
    any_parse_fail = [i for i in extra_rows if any(parse_fails[i].values())]
    print(f"\nExtra rows with at least one pred parse failure: {len(any_parse_fail)} rows")
    if any_parse_fail[:5]:
        sample = extra_rows[0]
        print(f"  Example row {sample} parse_ok flags: {parse_fails[sample]}")


if __name__ == "__main__":
    main()
