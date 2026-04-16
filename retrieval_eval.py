"""Offline retrieval-only evaluation for Spider dev examples.

Phase 1 goal:
  - run retrieval only
  - compute Recall@k, Precision@k, SRR
  - break results down by Easy / Medium / Hard / Extra
  - inspect 10-20 failures

This script does not call generation APIs in lexical mode.

Examples:
  python retrieval_eval.py
  python retrieval_eval.py --per-hardness 25 --top-k-tables 5 --top-n-columns 10
  python retrieval_eval.py --max-examples 64 --failures 12 --save-json baseline/results/retrieval_eval_64.json
"""

from __future__ import annotations

import argparse
import json
import random
import re
from pathlib import Path

from config import DEV_JSON, RETRIEVER_TOP_K_TABLES, RETRIEVER_TOP_N_COLUMNS, TABLES_JSON, OPENAI_API_KEY, VECTOR_INDEX_PATH
from evaluation import Evaluator
from retriever import retrieve_schema_details
from schema_loader import load_tables

LEVELS = ["easy", "medium", "hard", "extra"]


def _extract_gold_items(sql: dict, tables_entry: dict) -> tuple[set[int], set[int]]:
    """Extract gold table ids and column ids from a Spider SQL AST."""
    gold_tables: set[int] = set()
    gold_columns: set[int] = set()

    def visit_col_unit(col_unit):
        if not isinstance(col_unit, (list, tuple)) or len(col_unit) != 3:
            return
        col_id = col_unit[1]
        if isinstance(col_id, int) and col_id > 0:
            gold_columns.add(col_id)
            tbl_idx = tables_entry["column_names_original"][col_id][0]
            if tbl_idx >= 0:
                gold_tables.add(tbl_idx)

    def visit_val_unit(val_unit):
        if not isinstance(val_unit, (list, tuple)) or len(val_unit) != 3:
            return
        visit_col_unit(val_unit[1])
        if val_unit[2] is not None:
            visit_col_unit(val_unit[2])

    def visit_conds(conds):
        if not isinstance(conds, list):
            return
        for cond_unit in conds[::2]:
            if not isinstance(cond_unit, (list, tuple)) or len(cond_unit) != 5:
                continue
            visit_val_unit(cond_unit[2])
            val1, val2 = cond_unit[3], cond_unit[4]
            if isinstance(val1, dict):
                visit_sql(val1)
            if isinstance(val2, dict):
                visit_sql(val2)

    def visit_sql(node):
        if not isinstance(node, dict):
            return

        from_clause = node.get("from", {})
        for table_unit in from_clause.get("table_units", []):
            if not isinstance(table_unit, (list, tuple)) or len(table_unit) != 2:
                continue
            unit_type, unit_value = table_unit
            if unit_type == "table_unit" and isinstance(unit_value, int):
                gold_tables.add(unit_value)
            elif unit_type == "sql" and isinstance(unit_value, dict):
                visit_sql(unit_value)
        visit_conds(from_clause.get("conds", []))

        select_clause = node.get("select", [False, []])
        for item in select_clause[1]:
            if isinstance(item, (list, tuple)) and len(item) == 2:
                visit_val_unit(item[1])

        for col_unit in node.get("groupBy", []):
            visit_col_unit(col_unit)

        order_by = node.get("orderBy", [])
        if order_by and len(order_by) == 2:
            for val_unit in order_by[1]:
                visit_val_unit(val_unit)

        visit_conds(node.get("where", []))
        visit_conds(node.get("having", []))

        for key in ("intersect", "union", "except"):
            nested = node.get(key)
            if isinstance(nested, dict):
                visit_sql(nested)

    visit_sql(sql)
    return gold_tables, gold_columns


def _stratified_slice(rows: list[dict], max_examples: int | None, per_hardness: int, seed: int) -> list[dict]:
    grouped = {level: [] for level in LEVELS}
    for row in rows:
        grouped[row["hardness"]].append(row)

    rng = random.Random(seed)
    for items in grouped.values():
        rng.shuffle(items)

    if max_examples is None:
        chosen = []
        for level in LEVELS:
            chosen.extend(grouped[level][: min(per_hardness, len(grouped[level]))])
        return chosen

    quotas = {level: 0 for level in LEVELS}
    remaining = max_examples
    while remaining > 0:
        progressed = False
        for level in LEVELS:
            if quotas[level] < len(grouped[level]) and remaining > 0:
                quotas[level] += 1
                remaining -= 1
                progressed = True
            if remaining == 0:
                break
        if not progressed:
            break

    chosen = []
    for level in LEVELS:
        chosen.extend(grouped[level][: quotas[level]])
    return chosen


def _safe_ratio(num: int, den: int) -> float:
    return 0.0 if den == 0 else num / den


def _format_pct(value: float) -> str:
    return f"{value * 100:6.2f}%"


def _tokenize_question(text: str) -> list[str]:
    return re.findall(r"[a-z0-9]+", text.lower())


def _looks_like_obvious_table_name(question: str, table_names: list[str]) -> bool:
    q = question.lower()
    normalized_question = re.sub(r"[^a-z0-9]+", " ", q)
    for table_name in table_names:
        variants = {
            table_name.lower(),
            table_name.lower().replace("_", " "),
        }
        for variant in variants:
            if variant and variant in normalized_question:
                return True
    return False


def _summarize_bucket(rows: list[dict]) -> dict:
    if not rows:
        return {
            "count": 0,
            "recall": 0.0,
            "precision": 0.0,
            "srr": 0.0,
            "column_recall": 0.0,
            "avg_tables_returned": 0.0,
        }
    return {
        "count": len(rows),
        "recall": sum(r["table_recall"] for r in rows) / len(rows),
        "precision": sum(r["table_precision"] for r in rows) / len(rows),
        "srr": sum(r["srr"] for r in rows) / len(rows),
        "column_recall": sum(r["column_recall"] for r in rows) / len(rows),
        "avg_tables_returned": sum(r["retrieved_table_count"] for r in rows) / len(rows),
    }


def _evaluate_rows(rows: list[dict], tables_data: dict, mode: str, top_k_tables: int, top_n_columns: int,
                    openai_client=None, vector_index=None) -> list[dict]:
    results = []
    for row in rows:
        db_entry = tables_data[row["db_id"]]
        gold_tables, gold_columns = _extract_gold_items(row["sql"], db_entry)
        details = retrieve_schema_details(
            question=row["question"],
            db_id=row["db_id"],
            tables_data=tables_data,
            top_k_tables=top_k_tables,
            top_n_columns=top_n_columns,
            mode=mode,
            openai_client=openai_client,
            vector_index=vector_index,
        )
        retrieved_tables = set(details["selected_tables"])
        retrieved_columns = set(details["selected_column_indices"])

        table_hits = gold_tables & retrieved_tables
        column_hits = gold_columns & retrieved_columns
        missing_tables = gold_tables - retrieved_tables
        extra_tables = retrieved_tables - gold_tables
        missing_columns = gold_columns - retrieved_columns
        question_tokens = _tokenize_question(row["question"])

        results.append(
            {
                "index": row["index"],
                "db_id": row["db_id"],
                "question": row["question"],
                "gold_sql": row["query"],
                "hardness": row["hardness"],
                "gold_tables": sorted(gold_tables),
                "gold_table_names": [db_entry["table_names_original"][i] for i in sorted(gold_tables)],
                "retrieved_tables": sorted(retrieved_tables),
                "retrieved_table_names": [db_entry["table_names_original"][i] for i in sorted(retrieved_tables)],
                "missing_table_names": [db_entry["table_names_original"][i] for i in sorted(missing_tables)],
                "extra_table_names": [db_entry["table_names_original"][i] for i in sorted(extra_tables)],
                "gold_columns": sorted(gold_columns),
                "retrieved_columns": sorted(retrieved_columns),
                "missing_columns": sorted(missing_columns),
                "table_recall": _safe_ratio(len(table_hits), len(gold_tables)),
                "table_precision": _safe_ratio(len(table_hits), len(retrieved_tables)),
                "column_recall": _safe_ratio(len(column_hits), len(gold_columns)),
                "srr": 1.0 if not missing_tables else 0.0,
                "retrieved_table_count": len(retrieved_tables),
                "gold_table_count": len(gold_tables),
                "question_token_count": len(question_tokens),
                "is_single_table_gold": len(gold_tables) == 1,
                "has_obvious_table_name": _looks_like_obvious_table_name(
                    row["question"],
                    db_entry["table_names_original"],
                ),
            }
        )
    return results


def _print_summary(summary: dict):
    print(
        f"{'Bucket':<10} {'Count':>5} {'Recall@k':>10} {'Precision@k':>13} "
        f"{'SRR':>10} {'ColRecall':>12} {'AvgTabs':>10}"
    )
    for level in LEVELS + ["all"]:
        bucket = summary[level]
        print(
            f"{level:<10} {bucket['count']:>5} "
            f"{_format_pct(bucket['recall']):>10} "
            f"{_format_pct(bucket['precision']):>13} "
            f"{_format_pct(bucket['srr']):>10} "
            f"{_format_pct(bucket['column_recall']):>12} "
            f"{bucket['avg_tables_returned']:>9.2f}"
        )


def _print_inspection(results: list[dict], failures_to_show: int):
    failures = [r for r in results if r["srr"] < 1.0]
    if failures:
        inspection_rows = sorted(
            failures,
            key=lambda r: (r["table_recall"], len(r["missing_table_names"]), r["hardness"], r["index"]),
        )
        inspection_title = "Failure inspection"
    else:
        inspection_rows = sorted(
            results,
            key=lambda r: (r["table_precision"], r["column_recall"], -r["retrieved_table_count"], r["index"]),
        )
        inspection_title = "No SRR failures; lowest-precision cases"
    print("")
    print(f"{inspection_title} ({min(failures_to_show, len(inspection_rows))} shown)")
    for rank, row in enumerate(inspection_rows[: failures_to_show], start=1):
        print("")
        print(
            f"{rank}. idx={row['index']} [{row['hardness']}] db={row['db_id']} "
            f"R@k={row['table_recall']:.2f} P@k={row['table_precision']:.2f} "
            f"CR={row['column_recall']:.2f}"
        )
        print(f"   Q: {row['question']}")
        print(f"   Gold tables: {', '.join(row['gold_table_names']) or '-'}")
        print(f"   Retrieved:   {', '.join(row['retrieved_table_names']) or '-'}")
        print(f"   Missing:     {', '.join(row['missing_table_names']) or '-'}")
        print(f"   Extra:       {', '.join(row['extra_table_names']) or '-'}")


def _print_overretrieval_slices(results: list[dict]):
    slices = [
        ("single-table gold", [r for r in results if r["is_single_table_gold"]]),
        ("short questions (<= 8 tokens)", [r for r in results if r["question_token_count"] <= 8]),
        ("obvious table-name match", [r for r in results if r["has_obvious_table_name"]]),
    ]
    print("")
    print("Over-retrieval slices")
    for label, rows in slices:
        summary = _summarize_bucket(rows)
        print(
            f"{label:<28} n={summary['count']:<4} "
            f"R@k={_format_pct(summary['recall']).strip():>8} "
            f"P@k={_format_pct(summary['precision']).strip():>8} "
            f"AvgTabs={summary['avg_tables_returned']:.2f}"
        )


def main():
    parser = argparse.ArgumentParser(description="Offline retrieval-only evaluation on Spider dev")
    parser.add_argument(
        "--mode",
        choices=["lexical", "hybrid"],
        default="lexical",
        help="Retrieval mode: 'lexical' (keyword only) or 'hybrid' (lexical + vector reranking).",
    )
    parser.add_argument(
        "--top-k-tables",
        type=int,
        default=RETRIEVER_TOP_K_TABLES,
        help=f"Requested top-k tables before FK bridge augmentation (default: {RETRIEVER_TOP_K_TABLES})",
    )
    parser.add_argument(
        "--top-n-columns",
        type=int,
        default=RETRIEVER_TOP_N_COLUMNS,
        help=f"Max columns retained per selected table (default: {RETRIEVER_TOP_N_COLUMNS})",
    )
    parser.add_argument(
        "--per-hardness",
        type=int,
        default=20,
        help="Examples sampled per difficulty bucket when --max-examples is not set (default: 20)",
    )
    parser.add_argument(
        "--max-examples",
        type=int,
        default=None,
        help="Total stratified dev slice size, distributed round-robin across difficulty buckets",
    )
    parser.add_argument(
        "--seed",
        type=int,
        default=42,
        help="Random seed for stratified dev slicing (default: 42)",
    )
    parser.add_argument(
        "--failures",
        type=int,
        default=12,
        help="How many failure cases to print for manual inspection (default: 12)",
    )
    parser.add_argument(
        "--save-json",
        type=Path,
        default=None,
        help="Optional path to save full metrics and failure details as JSON",
    )
    parser.add_argument(
        "--sweep-top-k",
        type=int,
        nargs="+",
        default=None,
        help="Evaluate multiple top-k table settings in one run, e.g. --sweep-top-k 1 2 3 4",
    )
    args = parser.parse_args()

    with open(DEV_JSON, encoding="utf-8") as f:
        dev_rows = json.load(f)
    tables_data = load_tables(TABLES_JSON)
    evaluator = Evaluator()

    # Set up hybrid mode resources if needed
    openai_client = None
    vector_index = None
    if args.mode == "hybrid":
        if not OPENAI_API_KEY:
            parser.error("Hybrid mode requires OPENAI_API_KEY to be set.")
        from openai import OpenAI
        from vector_store import load_index
        openai_client = OpenAI(api_key=OPENAI_API_KEY)
        vector_index = load_index(VECTOR_INDEX_PATH)
        print(f"Loaded vector index with {len(vector_index)} databases")

    enriched_rows = []
    for idx, row in enumerate(dev_rows):
        hardness = evaluator.eval_hardness(row["sql"])
        enriched_rows.append(
            {
                "index": idx,
                "db_id": row["db_id"],
                "question": row["question"],
                "query": row["query"],
                "sql": row["sql"],
                "hardness": hardness,
            }
        )

    slice_rows = _stratified_slice(
        rows=enriched_rows,
        max_examples=args.max_examples,
        per_hardness=args.per_hardness,
        seed=args.seed,
    )

    top_k_values = args.sweep_top_k if args.sweep_top_k else [args.top_k_tables]
    all_runs = {}
    for top_k_tables in top_k_values:
        results = _evaluate_rows(
            rows=slice_rows,
            tables_data=tables_data,
            mode=args.mode,
            top_k_tables=top_k_tables,
            top_n_columns=args.top_n_columns,
            openai_client=openai_client,
            vector_index=vector_index,
        )
        by_level = {level: [r for r in results if r["hardness"] == level] for level in LEVELS}
        summary = {level: _summarize_bucket(rows) for level, rows in by_level.items()}
        summary["all"] = _summarize_bucket(results)
        all_runs[str(top_k_tables)] = {"summary": summary, "results": results}

    if len(top_k_values) > 1:
        print(
            f"Retrieval-only sweep on {len(slice_rows)} dev examples "
            f"(mode={args.mode}, top_n_columns={args.top_n_columns})"
        )
        print("")
        print(f"{'top_k':<8} {'Recall@k':>10} {'Precision@k':>13} {'SRR':>10} {'ColRecall':>12} {'AvgTabs':>10}")
        for top_k_tables in top_k_values:
            summary = all_runs[str(top_k_tables)]["summary"]["all"]
            print(
                f"{top_k_tables:<8} "
                f"{_format_pct(summary['recall']):>10} "
                f"{_format_pct(summary['precision']):>13} "
                f"{_format_pct(summary['srr']):>10} "
                f"{_format_pct(summary['column_recall']):>12} "
                f"{summary['avg_tables_returned']:>9.2f}"
            )
        print("")

    selected_key = str(top_k_values[-1])
    results = all_runs[selected_key]["results"]
    summary = all_runs[selected_key]["summary"]

    print(
        f"Retrieval-only eval on {len(results)} dev examples "
        f"(mode={args.mode}, top_k_tables={selected_key}, top_n_columns={args.top_n_columns})"
    )
    print("")
    _print_summary(summary)
    _print_overretrieval_slices(results)
    _print_inspection(results, args.failures)

    if args.save_json is not None:
        payload = {
            "config": {
                "mode": args.mode,
                "top_k_tables": args.top_k_tables,
                "sweep_top_k": top_k_values,
                "top_n_columns": args.top_n_columns,
                "per_hardness": args.per_hardness,
                "max_examples": args.max_examples,
                "seed": args.seed,
            },
            "runs": all_runs,
        }
        args.save_json.parent.mkdir(parents=True, exist_ok=True)
        with open(args.save_json, "w", encoding="utf-8") as f:
            json.dump(payload, f, indent=2)
        print("")
        print(f"Saved JSON report to {args.save_json}")


if __name__ == "__main__":
    main()
