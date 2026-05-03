"""Precompute Spider difficulty (easy/medium/hard/extra) for the 320 split.

Saves to ``balanced_difficulty.json`` keyed by test_idx. Used by the cascade
router in run_federated_eval.py to pick model based on question difficulty
without re-parsing gold SQL on every run.

Run once::

    python precompute_difficulty.py
"""

from __future__ import annotations

import json
import os
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import BASE_DIR, TEST_DATABASE_DIR, TEST_GOLD
from evaluation import Evaluator
from process_sql import Schema, get_schema, get_sql


def main():
    indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    with open(TEST_GOLD, encoding="utf-8") as f:
        gold_lines = f.readlines()

    evaluator = Evaluator()
    by_idx: dict[int, str] = {}
    schema_cache: dict[str, Schema] = {}

    for test_idx in indices:
        line = gold_lines[test_idx].strip()
        if "\t" not in line:
            print(f"  skip idx={test_idx} (no tab in gold line)")
            continue
        gold_sql, db_id = line.split("\t", 1)
        db_id = db_id.strip()
        sqlite_path = TEST_DATABASE_DIR / db_id / f"{db_id}.sqlite"
        if not sqlite_path.exists():
            print(f"  skip idx={test_idx} ({sqlite_path} missing)")
            continue
        if db_id not in schema_cache:
            schema_cache[db_id] = Schema(get_schema(str(sqlite_path)))
        try:
            parsed = get_sql(schema_cache[db_id], gold_sql)
            by_idx[test_idx] = evaluator.eval_hardness(parsed)
        except Exception as exc:
            print(f"  parse failure idx={test_idx} db={db_id}: {exc!r}")
            by_idx[test_idx] = "medium"  # safe fallback

    out_path = BASE_DIR / "balanced_difficulty.json"
    out_path.write_text(json.dumps(by_idx, indent=2))
    counts = Counter(by_idx.values())
    print(f"\nWrote {len(by_idx)} entries to {out_path}")
    print(f"Distribution: {dict(counts)}")


if __name__ == "__main__":
    main()
