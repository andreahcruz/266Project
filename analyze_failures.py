"""Categorize wrong predictions to explain *why* a cell failed.

Reads ``runs/<experiment_id>/per_question.csv`` + ``predictions.sql`` for one
or more experiments and classifies each non-success into one of:

  - parse_failure        Spider's evaluator could not parse the predicted SQL
  - exec_runtime_error   pred SQL raised a SQLite error (per_question exec_success=False)
  - wrong_table          pred touches different tables than gold
  - wrong_column         same tables but column references diverge
  - missing_clause       gold has a SQL keyword that pred lacks (ORDER BY, GROUP BY, LIMIT, DISTINCT, HAVING)
  - extra_clause         pred has one of those keywords that gold doesn't
  - wrong_values         same table+column shape but filter literals differ
  - other                anything that doesn't fit above

Outputs ``runs/<experiment_id>/failure_analysis.csv`` per experiment plus an
optional comparative bar chart PNG when matplotlib is installed.

Usage::

    python analyze_failures.py --experiment-ids control masked-oracle masked-oracle-hints-320
    python analyze_failures.py --experiment-ids "$(ls runs | grep -v '^_')"
"""

from __future__ import annotations

import argparse
import csv
import json
import re
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import BASE_DIR, RUNS_DIR, TEST_GOLD


SQL_KEYWORDS = ["order by", "group by", "limit", "distinct", "having", "join", "union", "intersect", "except"]


def load_gold_lines() -> list[str]:
    with open(TEST_GOLD, encoding="utf-8") as f:
        return f.readlines()


def parse_evaluation_log(path: Path) -> set[int]:
    """Return the set of pred indices (0-based) that Spider's evaluator failed
    to parse. Spider prints ``eval_err_num:N`` lines but doesn't tell us *which*
    pos N. We use the order of those prints relative to the row ordering in
    evaluation.py — they correspond to the predictions in file order.

    Best-effort: returns the count, indexed by the order the eval saw them.
    """
    if not path.exists():
        return set()
    indices: set[int] = set()
    seen_count = 0
    with open(path) as f:
        for line in f:
            if line.startswith("eval_err_num:"):
                # Spider prints these in pred order, but the print number is the
                # cumulative count, not the pred index. So we can't recover the
                # exact pos here without modifying evaluation.py. Fall back to
                # parser-emulation in the per-row classifier below.
                seen_count += 1
    # We don't return positions here — see classify_row().
    return indices


def _normalize(sql: str) -> str:
    s = sql.strip().lower()
    s = re.sub(r"\s+", " ", s)
    s = s.rstrip(";")
    return s


def _table_aliases(sql: str) -> set[str]:
    """Pull a rough set of table identifiers from a SQL string."""
    s = sql.lower()
    tables = set()
    for m in re.finditer(r"(?:from|join)\s+([a-zA-Z_][a-zA-Z_0-9]*)", s):
        tables.add(m.group(1))
    return tables


def _columns_referenced(sql: str) -> set[str]:
    """Rough column reference set: anything that looks like an identifier."""
    s = sql.lower()
    # Strip strings to avoid picking literal contents
    s = re.sub(r"'[^']*'", "''", s)
    s = re.sub(r'"[^"]*"', '""', s)
    cols = set()
    for m in re.finditer(r"\b([a-zA-Z_][a-zA-Z_0-9]*)\b", s):
        tok = m.group(1)
        if tok in {
            "select", "from", "where", "and", "or", "not", "in", "is", "null",
            "join", "on", "group", "by", "order", "asc", "desc", "limit",
            "having", "distinct", "as", "between", "like", "exists", "all",
            "any", "case", "when", "then", "else", "end", "left", "right",
            "inner", "outer", "full", "cross", "union", "intersect", "except",
            "count", "sum", "avg", "min", "max", "abs", "round",
            "true", "false",
        }:
            continue
        if tok.isdigit():
            continue
        cols.add(tok)
    return cols


def _has_keyword(sql: str, kw: str) -> bool:
    return re.search(rf"\b{re.escape(kw)}\b", sql.lower()) is not None


def classify(pred_sql: str, gold_sql: str, exec_success: bool) -> str:
    """Return the dominant failure category for one (pred, gold) pair."""
    if not pred_sql or pred_sql.strip().lower() in {"select 1", ""}:
        return "parse_failure"  # placeholder used when generation fully failed

    if not exec_success:
        return "exec_runtime_error"

    pred_tables = _table_aliases(pred_sql)
    gold_tables = _table_aliases(gold_sql)
    if pred_tables and gold_tables and pred_tables.isdisjoint(gold_tables):
        return "wrong_table"
    if gold_tables and not pred_tables.issuperset(gold_tables):
        if (gold_tables - pred_tables):
            # Pred missing at least one table gold uses
            return "wrong_table"

    # Clause checks
    for kw in ["order by", "group by", "limit", "distinct", "having"]:
        gold_has = _has_keyword(gold_sql, kw)
        pred_has = _has_keyword(pred_sql, kw)
        if gold_has and not pred_has:
            return "missing_clause"
        if pred_has and not gold_has:
            return "extra_clause"

    pred_cols = _columns_referenced(pred_sql)
    gold_cols = _columns_referenced(gold_sql)
    # Drop table tokens from column sets
    pred_cols -= pred_tables
    gold_cols -= gold_tables
    if gold_cols and not gold_cols.issubset(pred_cols):
        if gold_cols - pred_cols:
            return "wrong_column"
    if pred_cols - gold_cols:
        # Pred references columns not in gold — could be extra column or wrong choice
        return "wrong_column"

    # If everything matches structurally but values differ
    pred_lits = set(re.findall(r"'([^']*)'", pred_sql))
    gold_lits = set(re.findall(r"'([^']*)'", gold_sql))
    if gold_lits and pred_lits != gold_lits:
        return "wrong_values"

    return "other"


def analyze_one(experiment_id: str, gold_lines: list[str]) -> tuple[Counter, list[dict]]:
    run_dir = RUNS_DIR / experiment_id
    csv_path = run_dir / "per_question.csv"
    pred_path = run_dir / "predictions.sql"
    if not csv_path.exists() or not pred_path.exists():
        return Counter(), []

    with open(pred_path) as f:
        pred_lines = [l.rstrip("\n") for l in f]

    rows = list(csv.DictReader(open(csv_path)))
    counter: Counter = Counter(success=0)
    rows_out: list[dict] = []

    for i, r in enumerate(rows):
        test_idx_s = r.get("test_idx", "")
        if not test_idx_s.isdigit():
            continue
        test_idx = int(test_idx_s)
        gold_line = gold_lines[test_idx].strip() if test_idx < len(gold_lines) else ""
        gold_sql = gold_line.split("\t")[0] if "\t" in gold_line else gold_line

        pred_sql = pred_lines[i] if i < len(pred_lines) else ""
        exec_ok = (r.get("exec_success", "False").lower() == "true")

        # We don't have ground-truth correctness without re-running Spider's
        # exec compare; but for failure-mode analysis we treat all rows where
        # exec_success=False OR pred is the placeholder as "failed."
        # For the rest we still classify (most "succeeded" rows are still
        # wrong by Spider's exec-compare standard — those land in wrong_*).
        cat = classify(pred_sql, gold_sql, exec_ok)
        counter[cat] += 1
        rows_out.append({
            "pos": i,
            "test_idx": test_idx,
            "difficulty": r.get("difficulty", ""),
            "category": cat,
            "exec_success_runtime": exec_ok,
            "pred_sql": pred_sql[:200],
            "gold_sql": gold_sql[:200],
        })

    return counter, rows_out


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--experiment-ids", nargs="+", required=True)
    p.add_argument("--out-summary", default="failure_summary.csv")
    p.add_argument("--chart", default=None,
                   help="Optional PNG path for a stacked bar comparing experiments.")
    args = p.parse_args()

    gold_lines = load_gold_lines()
    summary_rows: list[dict] = []

    for exp_id in args.experiment_ids:
        counter, rows_out = analyze_one(exp_id, gold_lines)
        if not counter:
            print(f"[skip] {exp_id} — no per_question.csv or predictions.sql")
            continue
        out_path = RUNS_DIR / exp_id / "failure_analysis.csv"
        with open(out_path, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=["pos", "test_idx", "difficulty", "category", "exec_success_runtime", "pred_sql", "gold_sql"])
            w.writeheader()
            w.writerows(rows_out)
        total = sum(counter.values())
        print(f"\n=== {exp_id} (n={total}) ===")
        for cat, c in counter.most_common():
            print(f"  {cat:25} {c:4d}  ({c/total:.1%})")
        summary_rows.append({"experiment_id": exp_id, "n": total, **counter})

    summary_path = BASE_DIR / args.out_summary
    if summary_rows:
        all_cats = sorted({k for r in summary_rows for k in r if k not in {"experiment_id", "n"}})
        fields = ["experiment_id", "n"] + all_cats
        with open(summary_path, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=fields)
            w.writeheader()
            for r in summary_rows:
                row = {k: r.get(k, 0) for k in fields}
                w.writerow(row)
        print(f"\nWrote summary {summary_path}")

    if args.chart and summary_rows:
        try:
            import matplotlib
            matplotlib.use("Agg")
            import matplotlib.pyplot as plt
            import numpy as np
        except ImportError:
            print("matplotlib not installed — skipping chart")
            return
        cats = sorted({k for r in summary_rows for k in r if k not in {"experiment_id", "n"}})
        ids = [r["experiment_id"] for r in summary_rows]
        data = np.array([[r.get(c, 0) for c in cats] for r in summary_rows])
        # Normalize per row for proportions
        totals = data.sum(axis=1, keepdims=True)
        prop = data / np.maximum(totals, 1)
        bottom = np.zeros(len(ids))
        fig, ax = plt.subplots(figsize=(max(8, len(ids) * 1.5), 5))
        for i, c in enumerate(cats):
            ax.bar(ids, prop[:, i], bottom=bottom, label=c)
            bottom += prop[:, i]
        ax.set_ylabel("Proportion of rows")
        ax.set_title("Failure-mode distribution per cell")
        ax.legend(loc="center left", bbox_to_anchor=(1.0, 0.5))
        ax.set_xticklabels(ids, rotation=30, ha="right")
        plt.tight_layout()
        plt.savefig(args.chart, dpi=120)
        print(f"Chart: {args.chart}")


if __name__ == "__main__":
    main()
