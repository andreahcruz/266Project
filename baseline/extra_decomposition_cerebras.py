"""Cerebras-only decomposition experiment on Spider extra-hard questions.

Compares:
  1. Baseline: few-shot + retrieval
  2. Decomposition: plan first, then generate SQL from the plan

Optional self-correction can be enabled for both arms to match the current
best pipeline more closely.

Examples:
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/extra_decomposition_cerebras.py --limit 20
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/extra_decomposition_cerebras.py --limit 20 --with-self-correction
"""

from __future__ import annotations

import argparse
import json
import os
import random
import sqlite3
import sys
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from openai import OpenAI

from config import (
    API_DELAY,
    BALANCED_INDICES,
    CEREBRAS_API_KEY,
    CEREBRAS_BASE_URL,
    CEREBRAS_MAX_TOKENS,
    CEREBRAS_MAX_TOKENS_COT,
    CEREBRAS_MODEL,
    DATABASE_DIR_FOR_RUN,
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    MAX_RETRIES,
    QUESTIONS_JSON,
    RESULTS_DIR,
    RETRIEVER_TOP_K_TABLES,
    RETRIEVER_TOP_N_COLUMNS,
    TABLES_FOR_RUN,
    TEST_GOLD,
    TRAIN_SPIDER_JSON,
)
from evaluation import Evaluator
from few_shot_examples import (
    build_few_shot_examples,
    format_examples_for_prompt,
    index_train_by_db,
    load_train_spider,
)
from prompt_utils import load_prompt
from retriever import retrieve_schema
from schema_loader import load_tables
from sql_executor import execute_sql
from sqlgen_parse import parse_sql_after_chain_of_thought, parse_sql_response
from process_sql import get_sql
from evaluation import Schema, get_schema as get_db_schema

PLAN_PROMPT = """You are planning a SQLite query.

Current database schema:
{schema}

Question: {question}

Produce a short structured plan with these headings only:
1. Tables
2. Join path
3. Filters
4. Aggregation / grouping
5. Ordering / limit
6. Subqueries / set operations

Rules:
- Use only table and column names from the schema.
- Do not write SQL.
- Keep it concise and concrete.
"""

SQL_FROM_PLAN_PROMPT = """You are an expert SQL assistant. Use the plan to write the final SQLite query.

{examples}

---
Current database schema:
{schema}

Question: {question}

Plan:
{plan}

Instructions:
- Write a valid SQLite query that answers the question.
- Use ONLY table and column names exactly as they appear in the schema.
- Follow the plan unless the schema makes part of it impossible.
- Return ONLY the SQL query, with no explanation or markdown.
"""


def call_cerebras(client, prompt, max_tokens, max_attempts=5):
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=CEREBRAS_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=max_tokens,
            )
            return response.choices[0].message.content
        except Exception as e:
            err = str(e).lower()
            if "429" in err or "rate" in err or "too many requests" in err:
                wait = min(2**attempt * 10, 120)
                print(f"    Rate limited, waiting {wait}s (attempt {attempt + 1}/{max_attempts})...")
                time.sleep(wait)
            else:
                raise
    raise RuntimeError("Cerebras: rate limit retries exhausted")


def exec_match(pred_sql: str, gold_sql: str, db_path: Path) -> bool:
    if not db_path.exists():
        return False
    try:
        conn = sqlite3.connect(str(db_path))
        conn.text_factory = lambda b: b.decode("utf-8", errors="replace")
        pred_res = set(conn.execute(pred_sql).fetchall())
        gold_clean = gold_sql.split("\t")[0].strip().rstrip(";")
        gold_res = set(conn.execute(gold_clean).fetchall())
        conn.close()
        return pred_res == gold_res
    except Exception:
        return False


def select_extra_rows(limit: int | None) -> list[dict]:
    if BALANCED_INDICES is None:
        sys.exit("Set SPIDER_TEST_SPLIT=balanced_80x4 (or balanced_16x4) before running this script.")

    with open(QUESTIONS_JSON, encoding="utf-8") as f:
        all_questions = json.load(f)
    with open(TEST_GOLD, encoding="utf-8") as f:
        all_gold = [line.strip() for line in f if line.strip()]

    evaluator = Evaluator()
    rows = []
    for local_idx, global_idx in enumerate(BALANCED_INDICES):
        q = all_questions[global_idx]
        gold = all_gold[global_idx]
        db_id = q["db_id"]
        db_path = ROOT / "test_database" / db_id / f"{db_id}.sqlite"
        schema = Schema(get_db_schema(str(db_path)))
        gold_sql = get_sql(schema, gold.split("\t")[0])
        hardness = evaluator.eval_hardness(gold_sql)
        if hardness != "extra":
            continue
        rows.append(
            {
                "local_idx": local_idx,
                "global_idx": global_idx,
                "question": q["question"],
                "db_id": db_id,
                "gold_sql": gold,
            }
        )
    if limit is not None:
        rows = rows[:limit]
    return rows


def maybe_self_correct(client, schema, question, sql, db_id, sc_template):
    fixed = sql
    for _ in range(MAX_RETRIES):
        ok, result = execute_sql(db_id, fixed, DATABASE_DIR_FOR_RUN)
        if ok:
            return fixed
        correction_prompt = sc_template.format(
            schema=schema,
            question=question,
            sql=fixed,
            error=result,
        )
        try:
            raw = call_cerebras(client, correction_prompt, CEREBRAS_MAX_TOKENS)
            fixed = parse_sql_response(raw)
        except Exception:
            return fixed
        time.sleep(API_DELAY)
    return fixed


def generate_baseline(client, schema, question, examples_block):
    template = load_prompt("few_shot.txt")
    prompt = template.format(schema=schema, question=question, examples=examples_block)
    raw = call_cerebras(client, prompt, CEREBRAS_MAX_TOKENS)
    return parse_sql_response(raw)


def generate_decomposition(client, schema, question, examples_block):
    plan_prompt = PLAN_PROMPT.format(schema=schema, question=question)
    plan = call_cerebras(client, plan_prompt, CEREBRAS_MAX_TOKENS_COT)
    sql_prompt = SQL_FROM_PLAN_PROMPT.format(
        schema=schema,
        question=question,
        examples=examples_block,
        plan=plan,
    )
    raw = call_cerebras(client, sql_prompt, CEREBRAS_MAX_TOKENS)
    return plan, parse_sql_response(raw)


def main():
    parser = argparse.ArgumentParser(description="Extra-only decomposition test with Cerebras")
    parser.add_argument("--limit", type=int, default=20, help="How many extra-hard rows to test")
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--top-k-tables", type=int, default=RETRIEVER_TOP_K_TABLES)
    parser.add_argument("--top-n-columns", type=int, default=RETRIEVER_TOP_N_COLUMNS)
    parser.add_argument("--with-self-correction", action="store_true")
    parser.add_argument(
        "--save-json",
        type=Path,
        default=RESULTS_DIR / "extra_decomposition_cerebras.json",
    )
    args = parser.parse_args()

    if not CEREBRAS_API_KEY:
        sys.exit("Set CEREBRAS_API_KEY in .env")

    client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)
    tables_data = load_tables(TABLES_FOR_RUN)
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)
    by_db_indices = index_train_by_db(train_rows)
    rng = random.Random(args.seed)
    sc_template = load_prompt("self_correction.txt")

    rows = select_extra_rows(args.limit)
    print(
        f"Running Cerebras extra-only experiment on {len(rows)} rows "
        f"(top_k={args.top_k_tables}, top_n={args.top_n_columns}, self_correction={args.with_self_correction})"
    )

    baseline_correct = 0
    decomposition_correct = 0
    detailed = []

    for idx, row in enumerate(rows, start=1):
        db_id = row["db_id"]
        question = row["question"]
        schema = retrieve_schema(
            question,
            db_id,
            tables_data,
            top_k_tables=args.top_k_tables,
            top_n_columns=args.top_n_columns,
            mode="lexical",
        )
        demos = build_few_shot_examples(train_rows, by_db_indices, db_id, FEW_SHOT_K, rng)
        examples_block = format_examples_for_prompt(demos)
        db_path = ROOT / "test_database" / db_id / f"{db_id}.sqlite"

        try:
            baseline_sql = generate_baseline(client, schema, question, examples_block)
        except Exception as e:
            print(f"  [ERROR] baseline row {idx}: {e}")
            baseline_sql = "SELECT 1"
        if args.with_self_correction:
            baseline_sql = maybe_self_correct(client, schema, question, baseline_sql, db_id, sc_template)
        baseline_ok = exec_match(baseline_sql, row["gold_sql"], db_path)
        baseline_correct += int(baseline_ok)

        try:
            plan, decomposition_sql = generate_decomposition(client, schema, question, examples_block)
        except Exception as e:
            print(f"  [ERROR] decomposition row {idx}: {e}")
            plan = ""
            decomposition_sql = "SELECT 1"
        if args.with_self_correction:
            decomposition_sql = maybe_self_correct(
                client, schema, question, decomposition_sql, db_id, sc_template
            )
        decomposition_ok = exec_match(decomposition_sql, row["gold_sql"], db_path)
        decomposition_correct += int(decomposition_ok)

        detailed.append(
            {
                **row,
                "baseline_sql": baseline_sql,
                "baseline_exec_ok": baseline_ok,
                "decomposition_plan": plan,
                "decomposition_sql": decomposition_sql,
                "decomposition_exec_ok": decomposition_ok,
            }
        )

        print(
            f"  {idx}/{len(rows)} db={db_id} "
            f"baseline={'1' if baseline_ok else '0'} "
            f"decomposition={'1' if decomposition_ok else '0'}"
        )
        time.sleep(API_DELAY)

    summary = {
        "count": len(rows),
        "baseline_exec_accuracy": baseline_correct / len(rows) if rows else 0.0,
        "decomposition_exec_accuracy": decomposition_correct / len(rows) if rows else 0.0,
        "delta": (decomposition_correct - baseline_correct) / len(rows) if rows else 0.0,
    }
    payload = {
        "config": {
            "limit": args.limit,
            "seed": args.seed,
            "top_k_tables": args.top_k_tables,
            "top_n_columns": args.top_n_columns,
            "with_self_correction": args.with_self_correction,
            "model": CEREBRAS_MODEL,
            "retrieval_mode": "lexical",
        },
        "summary": summary,
        "results": detailed,
    }
    args.save_json.parent.mkdir(parents=True, exist_ok=True)
    with open(args.save_json, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)

    print("")
    print("Summary")
    print(f"  Baseline exec accuracy:      {summary['baseline_exec_accuracy']*100:.1f}%")
    print(f"  Decomposition exec accuracy: {summary['decomposition_exec_accuracy']*100:.1f}%")
    print(f"  Delta:                       {summary['delta']*100:+.1f}%")
    print(f"Saved JSON report to {args.save_json}")


if __name__ == "__main__":
    main()
