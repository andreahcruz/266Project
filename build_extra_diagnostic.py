"""Build an extra-query diagnostic sheet for one run."""

from __future__ import annotations

import argparse
import csv
import json
from pathlib import Path

from config import BASE_DIR, RUNS_DIR, TEST_DATABASE_DIR, TEST_GOLD, TEST_JSON
from evaluation import Schema, eval_exec_match, get_schema, get_sql
from semantic_guidance import tag_question


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--experiment-id", required=True)
    p.add_argument("--difficulty", default="extra", choices=["easy", "medium", "hard", "extra"])
    p.add_argument("--out", default=None)
    args = p.parse_args()

    run_dir = RUNS_DIR / args.experiment_id
    csv_path = run_dir / "per_question.csv"
    pred_path = run_dir / "predictions.sql"
    if not csv_path.exists() or not pred_path.exists():
        raise SystemExit(f"Missing run artifacts in {run_dir}")

    per_q = list(csv.DictReader(csv_path.open()))
    pred_lines = pred_path.read_text(encoding="utf-8").splitlines()
    gold_lines = Path(TEST_GOLD).read_text(encoding="utf-8").splitlines()
    questions = json.loads(Path(TEST_JSON).read_text(encoding="utf-8"))

    out_rows: list[dict] = []
    for pos, row in enumerate(per_q):
        if row.get("difficulty") != args.difficulty:
            continue
        test_idx = int(row["test_idx"])
        q = questions[test_idx]["question"]
        focus = tag_question(q, row.get("difficulty"))
        gold_sql, db_id = gold_lines[test_idx].split("\t")
        pred_sql = pred_lines[pos] if pos < len(pred_lines) else ""
        db_path = str(TEST_DATABASE_DIR / db_id / f"{db_id}.sqlite")
        schema = Schema(get_schema(db_path))

        parse_ok = True
        spider_exec_correct = False
        try:
            pred_parsed = get_sql(schema, pred_sql)
        except Exception:
            parse_ok = False
            pred_parsed = {
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
        gold_parsed = get_sql(schema, gold_sql)
        spider_exec_correct = eval_exec_match(db_path, pred_sql, gold_sql, pred_parsed, gold_parsed)

        out_rows.append(
            {
                "pos": pos,
                "test_idx": test_idx,
                "db_id": db_id,
                "difficulty": row.get("difficulty", ""),
                "query_family": focus.query_family,
                "set_op_signal": focus.set_op_signal,
                "return_field": focus.return_field,
                "aggregation": focus.aggregation,
                "needs_multi_hop": focus.needs_multi_hop,
                "parse_ok": parse_ok,
                "spider_exec_correct": spider_exec_correct,
                "question": q,
                "gold_sql": gold_sql,
                "pred_sql": pred_sql,
            }
        )

    out_path = Path(args.out) if args.out else run_dir / f"{args.difficulty}_diagnostic.csv"
    with out_path.open("w", newline="", encoding="utf-8") as f:
        writer = csv.DictWriter(
            f,
            fieldnames=[
                "pos", "test_idx", "db_id", "difficulty",
                "query_family", "set_op_signal", "return_field", "aggregation",
                "needs_multi_hop", "parse_ok", "spider_exec_correct",
                "question", "gold_sql", "pred_sql",
            ],
        )
        writer.writeheader()
        writer.writerows(out_rows)

    by_family: dict[str, list[dict]] = {}
    for row in out_rows:
        by_family.setdefault(row["query_family"], []).append(row)

    print(f"Wrote {len(out_rows)} rows to {out_path}")
    for family, rows in sorted(by_family.items()):
        correct = sum(1 for row in rows if row["spider_exec_correct"])
        print(f"  {family}: {correct}/{len(rows)} = {correct / max(len(rows), 1):.1%}")


if __name__ == "__main__":
    main()
