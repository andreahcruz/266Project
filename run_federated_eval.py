"""Run the federated pipeline on the 320-question balanced split.

Usage::

    python run_federated_eval.py --experiment-id control \\
        --routing oracle --retrieval hybrid --no-mask --model llama3.1-8b

Writes to ``runs/<experiment_id>/``:
  - predictions.sql    one SQL per line (consumed by evaluation.py)
  - per_question.csv   per-q metrics
  - calls.jsonl        per-LLM-call cost log
  - summary.json       aggregate accuracy + cost
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import subprocess
import sys
import time
from pathlib import Path

from openai import OpenAI

from config import (
    ANTHROPIC_MODEL,
    BASE_DIR,
    CEREBRAS_MODEL,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    RESULTS_DIR,
    RUNS_DIR,
    TEST_DATABASE_DIR,
    TEST_GOLD,
    TEST_JSON,
    TEST_TABLES_JSON,
    TRAIN_SPIDER_JSON,
)
from federated.broker import Broker
from federated.cost_logger import CostLogger
from federated.hub import Hub
from federated.node import Node
from few_shot_examples import load_train_spider
from schema_loader import load_tables
from vector_store import load_index


# 11 db_ids covered by the balanced 320 split.
DB_IDS_IN_SPLIT = [
    "e_commerce", "customers_and_orders", "vehicle_driver", "soccer_3",
    "online_exams", "cre_Students_Information_Systems", "bbc_channels",
    "tv_shows", "government_shift", "vehicle_rent", "region_building",
]

PLACEHOLDER_SQL = "SELECT 1"  # written when generation/exec fails — keeps line counts aligned


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--experiment-id", required=True)
    p.add_argument("--routing", default="broker", choices=["broker", "oracle"])
    p.add_argument(
        "--retrieval", default="hybrid", choices=["hybrid", "lexical", "none"]
    )
    p.add_argument(
        "--retrieval-easy-medium", default=None, choices=["hybrid", "lexical", "none"],
        help="Optional retrieval override for easy/medium questions."
    )
    p.add_argument(
        "--retrieval-hard-extra", default=None, choices=["hybrid", "lexical", "none"],
        help="Optional retrieval override for hard/extra questions."
    )
    p.add_argument("--no-mask", action="store_true")
    p.add_argument(
        "--mask-style",
        default="hard",
        choices=["hard", "semantic"],
        help="Masked identifier style when masking is enabled.",
    )
    p.add_argument(
        "--prompt", default="few_shot",
        choices=["zero_shot", "few_shot", "self_correction", "chain_of_thought"],
    )
    p.add_argument("--model", default=CEREBRAS_MODEL,
                   help=f"Default {CEREBRAS_MODEL}; pass {ANTHROPIC_MODEL} for Haiku dev.")
    p.add_argument("--max-retries", type=int, default=3)
    p.add_argument("--cost-cap-usd", type=float, default=2.0)
    p.add_argument("--limit", type=int, default=None,
                   help="Process only first N questions (debug). Default: all 320.")
    p.add_argument("--resume", action="store_true",
                   help="Skip questions already in predictions.sql.")
    p.add_argument("--phrase-hints", action="store_true",
                   help="Enable phrase→token column hints from each node.")
    p.add_argument("--top-k-tables", type=int, default=4,
                   help="Number of tables to retrieve when using lexical/hybrid retrieval.")
    p.add_argument("--top-n-columns", type=int, default=6,
                   help="Max columns per selected table when using lexical/hybrid retrieval.")
    p.add_argument("--indices-from", default=None,
                   help="Path to JSON list of test_idx values to evaluate. "
                        "Overrides the default 320 split (used for stratified subsets).")
    p.add_argument("--cascade-hard-model", default=None,
                   help="If set, route hard+extra difficulty questions to this "
                        "model instead of --model. easy/medium still use --model. "
                        "Difficulty is derived from gold SQL via Spider's "
                        "Evaluator.eval_hardness (oracle difficulty).")
    return p.parse_args()


def load_eval_questions():
    """Return list of ``(test_idx, question_dict)`` for the 320 split, in order."""
    questions = json.load(open(TEST_JSON))
    indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    return [(i, questions[i]) for i in indices]


def write_gold_slice(custom_indices: list[int] | None = None, out_name: str = "gold_test_balanced_80x4.sql"):
    if custom_indices is None:
        custom_indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    with open(TEST_GOLD, encoding="utf-8") as f:
        all_lines = f.readlines()
    out = RESULTS_DIR / out_name
    out.parent.mkdir(parents=True, exist_ok=True)
    with open(out, "w", encoding="utf-8") as g:
        for i in custom_indices:
            g.write(all_lines[i])
    return out


def main():
    args = parse_args()
    run_dir = RUNS_DIR / args.experiment_id
    run_dir.mkdir(parents=True, exist_ok=True)

    # Save the config used so the cell is reproducible.
    config_path = run_dir / "config.json"
    config_dump = {
        "experiment_id": args.experiment_id,
        "routing": args.routing,
        "retrieval": args.retrieval,
        "retrieval_easy_medium": args.retrieval_easy_medium or args.retrieval,
        "retrieval_hard_extra": args.retrieval_hard_extra or args.retrieval,
        "top_k_tables": args.top_k_tables,
        "top_n_columns": args.top_n_columns,
        "masking": not args.no_mask,
        "mask_style": args.mask_style if not args.no_mask else "none",
        "prompt": args.prompt,
        "model": args.model,
        "max_retries": args.max_retries,
        "cost_cap_usd": args.cost_cap_usd,
        "limit": args.limit,
    }
    config_path.write_text(json.dumps(config_dump, indent=2))

    pred_path = run_dir / "predictions.sql"
    csv_path = run_dir / "per_question.csv"

    # Resume support
    resume_pos = 0
    if args.resume and pred_path.exists():
        with open(pred_path) as f:
            resume_pos = sum(1 for _ in f)
        print(f"[resume] starting at index {resume_pos}")

    # Bootstrap shared resources
    print("Loading tables, vector index, blurbs, train data ...")
    tables_data = load_tables(TEST_TABLES_JSON)
    openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    uses_hybrid_retrieval = "hybrid" in {
        args.retrieval,
        args.retrieval_easy_medium or args.retrieval,
        args.retrieval_hard_extra or args.retrieval,
    }
    vector_index = load_index() if uses_hybrid_retrieval else None
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)

    nodes = {
        db: Node(db, tables_data, TEST_DATABASE_DIR, openai_client, vector_index)
        for db in DB_IDS_IN_SPLIT
    }
    broker = (
        Broker(BASE_DIR / "federated" / "blurbs", openai_client)
        if args.routing == "broker"
        else None
    )
    cost_logger = CostLogger(args.experiment_id, cost_cap_usd=args.cost_cap_usd)

    # Cascade routing config: easy/medium → primary, hard/extra → cascade model.
    model_for_difficulty: dict[str, str] = {}
    if args.cascade_hard_model:
        model_for_difficulty = {
            "easy": args.model,
            "medium": args.model,
            "hard": args.cascade_hard_model,
            "extra": args.cascade_hard_model,
        }
        config_dump["cascade_hard_model"] = args.cascade_hard_model
        config_path.write_text(json.dumps(config_dump, indent=2))

    retrieval_for_difficulty: dict[str, str] = {}
    if args.retrieval_easy_medium or args.retrieval_hard_extra:
        retrieval_for_difficulty = {
            "easy": args.retrieval_easy_medium or args.retrieval,
            "medium": args.retrieval_easy_medium or args.retrieval,
            "hard": args.retrieval_hard_extra or args.retrieval,
            "extra": args.retrieval_hard_extra or args.retrieval,
        }
        config_path.write_text(json.dumps(config_dump, indent=2))

    hub = Hub(
        broker=broker,
        nodes_by_db_id=nodes,
        primary_model=args.model,
        prompt_strategy=args.prompt,
        retrieval=args.retrieval,
        masking=not args.no_mask,
        mask_style=args.mask_style,
        routing_mode=args.routing,
        max_retries=args.max_retries,
        cost_logger=cost_logger,
        train_rows=train_rows,
        use_phrase_hints=args.phrase_hints,
        model_for_difficulty=model_for_difficulty,
        retrieval_for_difficulty=retrieval_for_difficulty,
        top_k_tables=args.top_k_tables,
        top_n_columns=args.top_n_columns,
    )

    eval_qs = load_eval_questions()
    if args.indices_from:
        wanted = set(json.loads(Path(args.indices_from).read_text()))
        eval_qs = [(i, q) for (i, q) in eval_qs if i in wanted]
    if args.limit:
        eval_qs = eval_qs[: args.limit]

    # Pre-classify difficulty per question via the precomputed JSON.
    # Used by cascade routing; harmless when model_for_difficulty is empty.
    difficulty_by_idx: dict[int, str] = {}
    if model_for_difficulty or retrieval_for_difficulty:
        diff_path = BASE_DIR / "balanced_difficulty.json"
        if not diff_path.exists():
            sys.exit(
                f"difficulty-aware routing needs {diff_path}; run "
                "`python precompute_difficulty.py` first."
            )
        raw = json.loads(diff_path.read_text())
        # JSON keys are strings → convert to int test_idx
        difficulty_by_idx = {int(k): v for k, v in raw.items()}
        from collections import Counter
        c = Counter(difficulty_by_idx.get(idx, "medium") for idx, _q in eval_qs)
        print(f"[cascade] difficulty distribution over {len(eval_qs)} q: {dict(c)}")
        if model_for_difficulty:
            print(f"[cascade] easy/medium model → {args.model}, hard/extra model → {args.cascade_hard_model}")
        if retrieval_for_difficulty:
            print(
                "[cascade] easy/medium retrieval → "
                f"{retrieval_for_difficulty['easy']}, hard/extra retrieval → "
                f"{retrieval_for_difficulty['hard']}"
            )

    # Open files for streaming append
    pred_mode = "a" if (args.resume and resume_pos > 0) else "w"
    csv_mode = "a" if (args.resume and resume_pos > 0) else "w"
    pred_f = open(pred_path, pred_mode)
    csv_f = open(csv_path, csv_mode, newline="")
    csv_w = csv.writer(csv_f)
    if csv_mode == "w":
        csv_w.writerow([
            "pos", "test_idx", "db_id_gold", "db_id_used", "broker_pick",
            "broker_correct", "re_picked", "retries", "exec_success",
            "difficulty", "model_used", "retrieval_used",
            "masked_sql", "real_sql",
        ])

    started = time.time()
    successes = 0
    n_processed = 0
    try:
        for pos, (test_idx, q) in enumerate(eval_qs):
            if pos < resume_pos:
                continue
            try:
                rec = hub.answer(
                    q["question"],
                    oracle_db_id=q["db_id"],
                    question_idx=test_idx,
                    difficulty=difficulty_by_idx.get(test_idx),
                )
                pred_sql = rec.real_sql_final or PLACEHOLDER_SQL
                if not pred_sql.strip():
                    pred_sql = PLACEHOLDER_SQL
                # Strip newlines so the file is one SQL per line
                pred_sql_oneline = " ".join(pred_sql.split())
                pred_f.write(pred_sql_oneline + "\n")
                pred_f.flush()
                csv_w.writerow([
                    pos, test_idx, q["db_id"], rec.db_id_used, rec.broker_pick,
                    rec.broker_correct, rec.re_picked, rec.retries,
                    rec.success,
                    rec.difficulty or "", rec.model_used or "", rec.retrieval_used or "",
                    " ".join(rec.masked_sql_final.split()),
                    pred_sql_oneline,
                ])
                csv_f.flush()
                if rec.success:
                    successes += 1
                n_processed += 1
                if pos % 10 == 0:
                    elapsed = time.time() - started
                    print(
                        f"  [{pos+1}/{len(eval_qs)}] db={q['db_id'][:25]:<25} "
                        f"ok={rec.success} ret={rec.retries} "
                        f"cost=${cost_logger.total_cost_usd:.4f} "
                        f"elapsed={elapsed:.0f}s"
                    )
            except Exception as exc:
                # Write placeholder + log so the run can resume cleanly
                pred_f.write(PLACEHOLDER_SQL + "\n")
                pred_f.flush()
                csv_w.writerow([
                    pos, test_idx, q["db_id"], "ERR", None, None, False, 0,
                    False, difficulty_by_idx.get(test_idx, "") or "", "", "",
                    "", f"ERR: {exc!r}",
                ])
                csv_f.flush()
                print(f"  ! exception at pos={pos}: {exc!r}")
    finally:
        pred_f.close()
        csv_f.close()

    print(f"\nProcessed {n_processed} new questions, {successes} succeeded.")
    print(f"Predictions: {pred_path}")
    print(f"Per-question: {csv_path}")
    print(f"Total LLM cost: ${cost_logger.total_cost_usd:.4f}")

    # Skip evaluator when --limit was used (line counts won't align with gold).
    if args.limit:
        summary = {
            **config_dump,
            "n_processed": n_processed,
            "exec_success_rate_runtime": successes / max(n_processed, 1),
            "spider_exec_accuracy_overall": None,
            "spider_exec_by_difficulty": {},
            "total_cost_usd": cost_logger.total_cost_usd,
            "wall_time_seconds": int(time.time() - started),
            "note": "limited run — Spider eval skipped",
        }
        (run_dir / "summary.json").write_text(json.dumps(summary, indent=2))
        print(json.dumps(summary, indent=2))
        return

    # Run Spider evaluator
    if args.indices_from:
        # Build a custom gold slice ordered to match the predictions we wrote
        ordered_indices = [test_idx for (test_idx, _) in eval_qs]
        slice_name = f"gold_{args.experiment_id}.sql"
        gold_path = write_gold_slice(ordered_indices, out_name=slice_name)
    else:
        gold_path = write_gold_slice()
    cmd = [
        sys.executable,
        str(BASE_DIR / "evaluation.py"),
        "--gold", str(gold_path),
        "--pred", str(pred_path.resolve()),
        "--db", str(TEST_DATABASE_DIR.relative_to(BASE_DIR)),
        "--table", str(TEST_TABLES_JSON.relative_to(BASE_DIR)),
        "--etype", "exec",
    ]
    env = dict(os.environ)
    env["SPIDER_TEST_SPLIT"] = "balanced_80x4"
    print("\nRunning Spider evaluator ...")
    print("  " + " ".join(cmd))
    eval_log = run_dir / "evaluation_stdout.txt"
    with open(eval_log, "w") as f:
        subprocess.run(cmd, cwd=BASE_DIR, env=env, check=False, stdout=f, stderr=subprocess.STDOUT)
    print(f"Evaluator output: {eval_log}")

    # Parse exec accuracy from evaluation output
    overall_exec, by_diff = parse_eval_output(eval_log)
    summary = {
        **config_dump,
        "n_processed": n_processed,
        "exec_success_rate_runtime": successes / max(n_processed, 1),
        "spider_exec_accuracy_overall": overall_exec,
        "spider_exec_by_difficulty": by_diff,
        "total_cost_usd": cost_logger.total_cost_usd,
        "wall_time_seconds": int(time.time() - started),
    }
    summary_path = run_dir / "summary.json"
    summary_path.write_text(json.dumps(summary, indent=2))
    print(f"\nSummary: {summary_path}")
    print(json.dumps(summary, indent=2))


def parse_eval_output(path: Path) -> tuple[float | None, dict]:
    """Pull the EXECUTION ACCURACY block from evaluation.py stdout.

    Spider's evaluator prints a table with a row 'execution' broken down by
    easy/medium/hard/extra and a final 'all' column.
    """
    by_diff: dict[str, float] = {}
    overall: float | None = None
    if not path.exists():
        return None, by_diff
    text = path.read_text()
    # Look for header row "                     easy                 medium               hard                 extra                all"
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if "execution" in line.lower() and ("easy" in lines[max(i - 4, 0):i].__str__().lower() or i > 0):
            # Try to split numeric columns
            parts = line.split()
            if len(parts) >= 6 and parts[0].lower().startswith("execution"):
                try:
                    nums = [float(p) for p in parts[1:6]]
                    by_diff = {
                        "easy": nums[0], "medium": nums[1],
                        "hard": nums[2], "extra": nums[3],
                    }
                    overall = nums[4]
                    break
                except ValueError:
                    continue
    return overall, by_diff


if __name__ == "__main__":
    main()
