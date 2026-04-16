"""Cerebras-only extra-hard experiment: does broader schema context help?

Compares three strategies on Spider extra-hard rows:
  1. current_rag: current lexical RAG (top_k/top_n from config/CLI)
  2. broader_rag: less aggressive retrieval (typically top-4, no score-ratio pruning)
  3. full_schema: no RAG, provide the full schema

Examples:
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/extra_schema_context_cerebras.py --limit 20
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/extra_schema_context_cerebras.py --limit 80 --with-self-correction
"""

from __future__ import annotations

import argparse
import json
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
from evaluation import Evaluator, Schema, get_schema as get_db_schema
from few_shot_examples import (
    build_few_shot_examples,
    format_examples_for_prompt,
    index_train_by_db,
    load_train_spider,
)
from process_sql import get_sql
from prompt_utils import load_prompt
from retriever import retrieve_schema
from schema_loader import get_schema_string, load_tables
from sql_executor import execute_sql
from sqlgen_parse import parse_sql_response


def call_cerebras(client, prompt, max_attempts=5):
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=CEREBRAS_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=CEREBRAS_MAX_TOKENS,
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
            raw = call_cerebras(client, correction_prompt)
            fixed = parse_sql_response(raw)
        except Exception:
            return fixed
        time.sleep(API_DELAY)
    return fixed


def main():
    parser = argparse.ArgumentParser(description="Extra-only schema context test with Cerebras")
    parser.add_argument("--limit", type=int, default=20)
    parser.add_argument("--seed", type=int, default=42)
    parser.add_argument("--top-k-tables", type=int, default=RETRIEVER_TOP_K_TABLES)
    parser.add_argument("--top-n-columns", type=int, default=RETRIEVER_TOP_N_COLUMNS)
    parser.add_argument("--broader-top-k", type=int, default=4)
    parser.add_argument("--with-self-correction", action="store_true")
    parser.add_argument(
        "--save-json",
        type=Path,
        default=RESULTS_DIR / "extra_schema_context_cerebras.json",
    )
    args = parser.parse_args()

    if not CEREBRAS_API_KEY:
        sys.exit("Set CEREBRAS_API_KEY in .env")

    client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)
    tables_data = load_tables(TABLES_FOR_RUN)
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)
    by_db_indices = index_train_by_db(train_rows)
    rng = random.Random(args.seed)
    fs_template = load_prompt("few_shot.txt")
    sc_template = load_prompt("self_correction.txt")
    rows = select_extra_rows(args.limit)

    print(
        f"Running Cerebras extra-only schema-context experiment on {len(rows)} rows "
        f"(current_top_k={args.top_k_tables}, broader_top_k={args.broader_top_k}, "
        f"self_correction={args.with_self_correction})"
    )

    strategy_correct = {"current_rag": 0, "broader_rag": 0, "full_schema": 0}
    detailed = []

    for i, row in enumerate(rows, start=1):
        db_id = row["db_id"]
        question = row["question"]
        db_path = ROOT / "test_database" / db_id / f"{db_id}.sqlite"
        demos = build_few_shot_examples(train_rows, by_db_indices, db_id, FEW_SHOT_K, rng)
        examples_block = format_examples_for_prompt(demos)

        current_schema = retrieve_schema(
            question,
            db_id,
            tables_data,
            top_k_tables=args.top_k_tables,
            top_n_columns=args.top_n_columns,
            mode="lexical",
            score_ratio_threshold=0.35,
        )
        broader_schema = retrieve_schema(
            question,
            db_id,
            tables_data,
            top_k_tables=args.broader_top_k,
            top_n_columns=args.top_n_columns,
            mode="lexical",
            score_ratio_threshold=0.0,
        )
        full_schema = get_schema_string(db_id, tables_data)

        row_result = {
            **row,
            "strategies": {},
        }
        for strategy_name, schema in [
            ("current_rag", current_schema),
            ("broader_rag", broader_schema),
            ("full_schema", full_schema),
        ]:
            prompt = fs_template.format(schema=schema, question=question, examples=examples_block)
            try:
                raw = call_cerebras(client, prompt)
                sql = parse_sql_response(raw)
            except Exception as e:
                print(f"  [ERROR] row {i} strategy {strategy_name}: {e}")
                sql = "SELECT 1"
            if args.with_self_correction:
                sql = maybe_self_correct(client, schema, question, sql, db_id, sc_template)
            ok = exec_match(sql, row["gold_sql"], db_path)
            strategy_correct[strategy_name] += int(ok)
            row_result["strategies"][strategy_name] = {
                "sql": sql,
                "exec_ok": ok,
                "schema_chars": len(schema),
            }
            time.sleep(API_DELAY)

        detailed.append(row_result)
        print(
            f"  {i}/{len(rows)} db={db_id} "
            f"current={'1' if row_result['strategies']['current_rag']['exec_ok'] else '0'} "
            f"broader={'1' if row_result['strategies']['broader_rag']['exec_ok'] else '0'} "
            f"full={'1' if row_result['strategies']['full_schema']['exec_ok'] else '0'}"
        )

    summary = {
        k: v / len(rows) if rows else 0.0
        for k, v in strategy_correct.items()
    }
    payload = {
        "config": {
            "limit": args.limit,
            "seed": args.seed,
            "top_k_tables": args.top_k_tables,
            "top_n_columns": args.top_n_columns,
            "broader_top_k": args.broader_top_k,
            "with_self_correction": args.with_self_correction,
            "model": CEREBRAS_MODEL,
        },
        "summary": summary,
        "results": detailed,
    }
    args.save_json.parent.mkdir(parents=True, exist_ok=True)
    with open(args.save_json, "w", encoding="utf-8") as f:
        json.dump(payload, f, indent=2)

    print("")
    print("Summary")
    print(f"  Current RAG exec accuracy:  {summary['current_rag']*100:.1f}%")
    print(f"  Broader RAG exec accuracy:  {summary['broader_rag']*100:.1f}%")
    print(f"  Full schema exec accuracy:  {summary['full_schema']*100:.1f}%")
    print(f"Saved JSON report to {args.save_json}")


if __name__ == "__main__":
    main()
