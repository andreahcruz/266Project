"""Cerebras few-shot + RAG with self-correction on execution errors.

Combines the best prompting strategy (few-shot) with schema retrieval (RAG)
and self-correction: generate SQL -> execute -> if error, feed error back
to the model to fix.

Run from repository root:
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/self_correction_cerebras_rag.py

Evaluate:
  SPIDER_TEST_SPLIT=balanced_80x4 python run_eval.py --pred baseline/results/cerebras_few_shot_self_correction_rag_balanced_80x4.sql --etype exec
"""

import argparse
import json
import random
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
    SPIDER_TEST_SPLIT,
    balanced_pred_filename,
    CEREBRAS_API_KEY,
    CEREBRAS_BASE_URL,
    CEREBRAS_MAX_TOKENS,
    CEREBRAS_MODEL,
    DATABASE_DIR_FOR_RUN,
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    MAX_RETRIES,
    NUM_QUESTIONS,
    QUESTIONS_JSON,
    RESULTS_DIR,
    RETRIEVER_TOP_K_TABLES,
    RETRIEVER_TOP_N_COLUMNS,
    TABLES_FOR_RUN,
    TRAIN_SPIDER_JSON,
    select_test_questions,
)
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


def main():
    parser = argparse.ArgumentParser(
        description="Cerebras few-shot + RAG + self-correction on Spider test",
    )
    parser.add_argument(
        "-n", "--num-questions", type=int, default=None,
        help=f"Override number of questions (default: {NUM_QUESTIONS})",
    )
    parser.add_argument(
        "--top-k-tables", type=int, default=RETRIEVER_TOP_K_TABLES,
        help=f"Max tables to retrieve (default: {RETRIEVER_TOP_K_TABLES})",
    )
    parser.add_argument(
        "--top-n-columns", type=int, default=RETRIEVER_TOP_N_COLUMNS,
        help=f"Max columns per table (default: {RETRIEVER_TOP_N_COLUMNS})",
    )
    args = parser.parse_args()
    if BALANCED_INDICES is not None and args.num_questions is not None:
        print(
            f"Note: -n ignored when SPIDER_TEST_SPLIT={SPIDER_TEST_SPLIT} "
            f"(using {NUM_QUESTIONS} stratified questions).",
        )

    if not CEREBRAS_API_KEY:
        sys.exit("Set CEREBRAS_API_KEY in .env")

    client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)

    with open(QUESTIONS_JSON, encoding="utf-8") as f:
        all_q = json.load(f)
    questions = select_test_questions(all_q, args.num_questions)

    tables_data = load_tables(TABLES_FOR_RUN)
    fs_template = load_prompt("few_shot.txt")
    sc_template = load_prompt("self_correction.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out_path = RESULTS_DIR / balanced_pred_filename("cerebras_few_shot_self_correction_rag")

    # Load training examples for few-shot
    print(f"Loading train examples from {TRAIN_SPIDER_JSON} ...")
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)
    by_db_indices = index_train_by_db(train_rows)
    rng = random.Random(FEW_SHOT_SEED)

    print(
        f"Running Cerebras ({CEREBRAS_MODEL}) few-shot + RAG + self-correction "
        f"(top_k={args.top_k_tables}, top_n={args.top_n_columns}, retries={MAX_RETRIES}) "
        f"on {len(questions)} questions..."
    )
    with open(out_path, "w", encoding="utf-8") as out:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]

            # Retrieved schema
            schema = retrieve_schema(
                question, db_id, tables_data,
                top_k_tables=args.top_k_tables,
                top_n_columns=args.top_n_columns,
            )

            # Initial generation: few-shot + RAG
            demos = build_few_shot_examples(
                train_rows, by_db_indices, db_id, FEW_SHOT_K, rng,
            )
            examples_block = format_examples_for_prompt(demos)
            prompt = fs_template.format(
                schema=schema, question=question, examples=examples_block,
            )
            try:
                raw = call_cerebras(client, prompt)
                sql = parse_sql_response(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i} initial: {e}")
                sql = "SELECT 1"

            # Self-correction loop: execute and fix errors
            for attempt in range(MAX_RETRIES):
                ok, result = execute_sql(db_id, sql, DATABASE_DIR_FOR_RUN)
                if ok:
                    break
                error_msg = result
                correction_prompt = sc_template.format(
                    schema=schema,
                    question=question,
                    sql=sql,
                    error=error_msg,
                )
                try:
                    raw = call_cerebras(client, correction_prompt)
                    sql = parse_sql_response(raw)
                except Exception as e:
                    print(f"  [ERROR] Question {i} correction {attempt + 1}: {e}")
                    break
                time.sleep(API_DELAY)

            out.write(sql + "\n")
            out.flush()
            print(f"  Question {i + 1}/{len(questions)}")
            time.sleep(API_DELAY)

    print(f"Saved {len(questions)} predictions to {out_path}")
    print("Done")


if __name__ == "__main__":
    main()
