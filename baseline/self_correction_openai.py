"""OpenAI baseline with self-correction on execution errors (test split, first N questions).

Run from repository root:
  python baseline/self_correction_openai.py
"""

import argparse
import json
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
    DATABASE_DIR_FOR_RUN,
    MAX_RETRIES,
    NUM_QUESTIONS,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    OPENAI_MODEL,
    QUESTIONS_JSON,
    RESULTS_DIR,
    TABLES_FOR_RUN,
    select_test_questions,
)
from prompt_utils import load_prompt
from schema_loader import load_tables, get_schema_string
from sql_executor import execute_sql
from sqlgen_parse import parse_sql_response


def call_openai(client, prompt, max_attempts=5):
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=OPENAI_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_completion_tokens=512,
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
    parser = argparse.ArgumentParser(description="OpenAI self-correction on Spider test (first N questions)")
    parser.add_argument(
        "-n",
        "--num-questions",
        type=int,
        default=None,
        help=f"Override N (default: NUM_QUESTIONS, currently {NUM_QUESTIONS})",
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

    client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)

    with open(QUESTIONS_JSON, encoding="utf-8") as f:
        all_q = json.load(f)
    questions = select_test_questions(all_q, args.num_questions)

    tables_data = load_tables(TABLES_FOR_RUN)
    zs_template = load_prompt("zero_shot.txt")
    sc_template = load_prompt("self_correction.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out_path = RESULTS_DIR / balanced_pred_filename("openai_self_correction")

    print(f"Running OpenAI ({OPENAI_MODEL}) self-correction on {len(questions)} questions (test split)...")
    with open(out_path, "w", encoding="utf-8") as out:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)

            prompt = zs_template.format(schema=schema, question=question)
            try:
                raw = call_openai(client, prompt)
                sql = parse_sql_response(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i} initial: {e}")
                sql = "SELECT 1"

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
                    raw = call_openai(client, correction_prompt)
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
