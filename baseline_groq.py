"""Baseline pipeline for Groq on the Spider **dev** split (full dev.json).

For Cerebras on the **test** split (first NUM_QUESTIONS examples), use:
  python baseline/baseline_cerebras.py
  python baseline/self_correction_cerebras.py
Evaluate with: python run_eval.py --pred baseline/results/cerebras_zero_shot.sql
"""

import json
import time
import argparse
from groq import Groq

from config import (
    GROQ_API_KEY, GROQ_MODEL, DEV_JSON, TABLES_JSON,
    DATABASE_DIR, PROMPT_DIR, RESULTS_DIR, MAX_RETRIES, API_DELAY,
)
from schema_loader import load_tables, get_schema_string
from sql_executor import execute_sql
from sqlgen_parse import parse_sql_response
from prompt_utils import load_prompt


def call_groq(client, prompt, max_attempts=5):
    """Send a prompt to Groq and return the response text.

    Retries with exponential backoff on rate-limit (429) errors.
    """
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=GROQ_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=512,
            )
            return response.choices[0].message.content
        except Exception as e:
            if "429" in str(e) or "rate_limit" in str(e):
                wait = min(2 ** attempt * 10, 120)
                print(f"    Rate limited, waiting {wait}s (attempt {attempt + 1}/{max_attempts})...")
                time.sleep(wait)
            else:
                raise
    raise RuntimeError("Rate limit exceeded after all retries")


def run_zero_shot(questions, tables_data, client, output_path):
    """Run zero-shot prompting on all questions and save predictions."""
    template = load_prompt("zero_shot.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out = open(output_path, "w", encoding="utf-8")

    print(f"Running zero-shot on {len(questions)} questions...")
    try:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)
            prompt = template.format(schema=schema, question=question)

            try:
                raw = call_groq(client, prompt)
                sql = parse_sql_response(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i}: {e}")
                sql = "SELECT 1"

            out.write(sql + "\n")
            out.flush()

            if (i + 1) % 50 == 0:
                print(f"  Progress: {i + 1}/{len(questions)}")

            time.sleep(API_DELAY)
    finally:
        out.close()

    print(f"Saved {len(questions)} predictions to {output_path}")
    return output_path


def run_self_correction(questions, tables_data, client, output_path):
    """Run zero-shot with self-correction on execution errors."""
    zs_template = load_prompt("zero_shot.txt")
    sc_template = load_prompt("self_correction.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out = open(output_path, "w", encoding="utf-8")

    print(f"Running self-correction on {len(questions)} questions...")
    try:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)

            prompt = zs_template.format(schema=schema, question=question)
            try:
                raw = call_groq(client, prompt)
                sql = parse_sql_response(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i} initial: {e}")
                sql = "SELECT 1"

            for attempt in range(MAX_RETRIES):
                ok, result = execute_sql(db_id, sql, DATABASE_DIR)
                if ok:
                    break

                error_msg = result
                correction_prompt = sc_template.format(
                    schema=schema, question=question, sql=sql, error=error_msg,
                )
                try:
                    raw = call_groq(client, correction_prompt)
                    sql = parse_sql_response(raw)
                except Exception as e:
                    print(f"  [ERROR] Question {i} correction {attempt + 1}: {e}")
                    break

                time.sleep(API_DELAY)

            out.write(sql + "\n")
            out.flush()

            if (i + 1) % 50 == 0:
                print(f"  Progress: {i + 1}/{len(questions)}")

            time.sleep(API_DELAY)
    finally:
        out.close()

    print(f"Saved {len(questions)} predictions to {output_path}")
    return output_path


def main():
    parser = argparse.ArgumentParser(description="Groq baseline runner")
    parser.add_argument(
        "--mode", choices=["zero_shot", "self_correction", "both"],
        default="both", help="Which experiment(s) to run",
    )
    args = parser.parse_args()

    client = Groq(api_key=GROQ_API_KEY)

    with open(DEV_JSON) as f:
        questions = json.load(f)

    tables_data = load_tables(TABLES_JSON)

    if args.mode in ("zero_shot", "both"):
        run_zero_shot(
            questions, tables_data, client,
            RESULTS_DIR / "groq_zero_shot.sql",
        )

    if args.mode in ("self_correction", "both"):
        run_self_correction(
            questions, tables_data, client,
            RESULTS_DIR / "groq_self_correction.sql",
        )


if __name__ == "__main__":
    main()
