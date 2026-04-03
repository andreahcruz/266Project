"""OpenAI (e.g. GPT-5.4 mini) text-to-SQL baselines on the first NUM_QUESTIONS Spider test examples.

Strategies: zero_shot, chain_of_thought, few_shot.

Run from repository root:
  python baseline/baseline_openai.py
  python baseline/baseline_openai.py --strategy chain_of_thought
  python baseline/baseline_openai.py --strategy few_shot

Evaluate (same line count as gold slice):
  python run_eval.py --pred baseline/results/openai_chain_of_thought.sql --etype exec
  python run_eval.py --pred baseline/results/openai_few_shot.sql --etype exec

Dry run one question:
  python baseline/baseline_openai.py --strategy few_shot -n 1
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
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    NUM_QUESTIONS,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    OPENAI_MAX_TOKENS,
    OPENAI_MAX_TOKENS_COT,
    OPENAI_MODEL,
    QUESTIONS_JSON,
    RESULTS_DIR,
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
from schema_loader import load_tables, get_schema_string
from sqlgen_parse import parse_sql_after_chain_of_thought, parse_sql_response


def call_openai(client, prompt, max_tokens=None, max_attempts=5):
    """Send prompt to OpenAI Chat Completions; retry on rate limits."""
    mt = OPENAI_MAX_TOKENS if max_tokens is None else max_tokens
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=OPENAI_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_completion_tokens=mt,
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
    raise RuntimeError("OpenAI: rate limit retries exhausted")


def main():
    parser = argparse.ArgumentParser(
        description="OpenAI text-to-SQL on Spider test (first N questions)",
    )
    parser.add_argument(
        "--strategy",
        choices=["zero_shot", "chain_of_thought", "few_shot"],
        default="zero_shot",
        help="Prompting strategy (default: zero_shot)",
    )
    parser.add_argument(
        "-n",
        "--num-questions",
        type=int,
        default=None,
        help=f"Override number of questions (default: NUM_QUESTIONS from config/env, currently {NUM_QUESTIONS})",
    )
    args = parser.parse_args()
    if BALANCED_INDICES is not None and args.num_questions is not None:
        print(
            f"Note: -n/--num-questions is ignored when SPIDER_TEST_SPLIT={SPIDER_TEST_SPLIT} "
            f"(using {NUM_QUESTIONS} stratified questions).",
        )
    if BALANCED_INDICES is None and args.num_questions is not None and args.num_questions != NUM_QUESTIONS:
        print(
            f"Note: -n {args.num_questions} differs from NUM_QUESTIONS={NUM_QUESTIONS}. "
            "Use the same -n when running run_eval.py.",
        )

    if not OPENAI_API_KEY:
        sys.exit("Set OPENAI_API_KEY in .env")

    strategy = args.strategy
    if strategy == "zero_shot":
        template_name = "zero_shot.txt"
        out_name = balanced_pred_filename("openai_zero_shot")
        parse_fn = parse_sql_response
        max_tok = OPENAI_MAX_TOKENS
    elif strategy == "chain_of_thought":
        template_name = "chain_of_thought.txt"
        out_name = balanced_pred_filename("openai_chain_of_thought")
        parse_fn = parse_sql_after_chain_of_thought
        max_tok = OPENAI_MAX_TOKENS_COT
    else:
        template_name = "few_shot.txt"
        out_name = balanced_pred_filename("openai_few_shot")
        parse_fn = parse_sql_response
        max_tok = OPENAI_MAX_TOKENS

    client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)

    with open(QUESTIONS_JSON, encoding="utf-8") as f:
        all_q = json.load(f)
    questions = select_test_questions(all_q, args.num_questions)

    tables_data = load_tables(TABLES_FOR_RUN)
    template = load_prompt(template_name)
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out_path = RESULTS_DIR / out_name

    train_rows = None
    by_db_indices = None
    rng = random.Random(FEW_SHOT_SEED)
    if strategy == "few_shot":
        print(f"Loading train examples from {TRAIN_SPIDER_JSON} ...")
        train_rows = load_train_spider(TRAIN_SPIDER_JSON)
        by_db_indices = index_train_by_db(train_rows)

    label = strategy.replace("_", " ")
    print(f"Running OpenAI ({OPENAI_MODEL}) {label} on {len(questions)} questions (test split)...")
    with open(out_path, "w", encoding="utf-8") as out:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)

            if strategy == "few_shot":
                assert train_rows is not None and by_db_indices is not None
                demos = build_few_shot_examples(
                    train_rows, by_db_indices, db_id, FEW_SHOT_K, rng,
                )
                examples_block = format_examples_for_prompt(demos)
                prompt = template.format(
                    schema=schema, question=question, examples=examples_block,
                )
            else:
                prompt = template.format(schema=schema, question=question)

            try:
                raw = call_openai(client, prompt, max_tokens=max_tok)
                sql = parse_fn(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i}: {e}")
                sql = "SELECT 1"
            out.write(sql + "\n")
            out.flush()
            print(f"  Question {i + 1}/{len(questions)}")
            time.sleep(API_DELAY)

    print(f"Saved {len(questions)} predictions to {out_path}")
    print("Done")


if __name__ == "__main__":
    main()
