"""Precompute Spider difficulty labels for a chosen test subset or the full test set.

Examples::

    python precompute_difficulty.py
    python precompute_difficulty.py --all-test --output test_difficulty_all.json
    python precompute_difficulty.py --indices-from balanced_test_indices_80x4.json
"""

from __future__ import annotations

import argparse
import json
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import BASE_DIR, TEST_DATABASE_DIR, TEST_GOLD, TEST_JSON
from evaluation import Evaluator
from process_sql import Schema, get_schema, get_sql


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser()
    p.add_argument(
        "--indices-from",
        default=str(BASE_DIR / "balanced_test_indices_80x4.json"),
        help="JSON file containing either a list of test indices or {\"indices\": [...]}",
    )
    p.add_argument(
        "--all-test",
        action="store_true",
        help="Compute difficulty for every test question instead of a subset file.",
    )
    p.add_argument(
        "--output",
        default=str(BASE_DIR / "balanced_difficulty.json"),
        help="Output JSON path for the computed difficulty labels.",
    )
    return p.parse_args()


def _load_indices(args: argparse.Namespace) -> list[int]:
    if args.all_test:
        questions = json.loads(Path(TEST_JSON).read_text())
        return list(range(len(questions)))
    raw = json.loads(Path(args.indices_from).read_text())
    if isinstance(raw, dict):
        raw = raw.get("indices", [])
    return [int(x) for x in raw]


def main() -> None:
    args = parse_args()
    indices = _load_indices(args)
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
        except Exception as exc:  # noqa: BLE001
            print(f"  parse failure idx={test_idx} db={db_id}: {exc!r}")
            by_idx[test_idx] = "medium"

    out_path = Path(args.output)
    out_path.write_text(json.dumps(by_idx, indent=2))
    counts = Counter(by_idx.values())
    print(f"\nWrote {len(by_idx)} entries to {out_path}")
    print(f"Distribution: {dict(counts)}")


if __name__ == "__main__":
    main()
