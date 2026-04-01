"""Baseline pipeline for running Gemini-based SQL generation tests."""

import json
import time
import argparse
import google.generativeai as genai

from config import (
    GEMINI_API_KEY, GEMINI_MODEL, DEV_JSON, TABLES_JSON,
    DATABASE_DIR, PROMPT_DIR, RESULTS_DIR, MAX_RETRIES, API_DELAY,
)
from schema_loader import load_tables, get_schema_string
from sql_executor import execute_sql
from baseline_groq import parse_sql_response, load_prompt


def call_gemini(model, prompt):
    """Send a prompt to Gemini and return the response text."""
    response = model.generate_content(prompt)
    try:
        text = response.text
    except (ValueError, AttributeError) as e:
        raise RuntimeError(f"Gemini response unavailable: {e}") from e
    if not text or not text.strip():
        raise RuntimeError("Gemini returned empty text")
    return text


def run_zero_shot(questions, tables_data, model, output_path):
    """Run zero-shot prompting on all questions and save predictions."""
    template = load_prompt("zero_shot.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out = open(output_path, "w", encoding="utf-8")

    print(f"Running Gemini zero-shot on {len(questions)} questions...")
    try:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)
            prompt = template.format(schema=schema, question=question)

            try:
                raw = call_gemini(model, prompt)
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


def run_self_correction(questions, tables_data, model, output_path):
    """Run zero-shot with self-correction on execution errors."""
    zs_template = load_prompt("zero_shot.txt")
    sc_template = load_prompt("self_correction.txt")
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    out = open(output_path, "w", encoding="utf-8")

    print(f"Running Gemini self-correction on {len(questions)} questions...")
    try:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]
            schema = get_schema_string(db_id, tables_data)

            prompt = zs_template.format(schema=schema, question=question)
            try:
                raw = call_gemini(model, prompt)
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
                    raw = call_gemini(model, correction_prompt)
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
    parser = argparse.ArgumentParser(description="Gemini baseline runner")
    parser.add_argument(
        "--mode", choices=["zero_shot", "self_correction", "both"],
        default="both", help="Which experiment(s) to run",
    )
    args = parser.parse_args()

    genai.configure(api_key=GEMINI_API_KEY)
    model = genai.GenerativeModel(GEMINI_MODEL)

    with open(DEV_JSON) as f:
        questions = json.load(f)

    tables_data = load_tables(TABLES_JSON)

    if args.mode in ("zero_shot", "both"):
        run_zero_shot(
            questions, tables_data, model,
            RESULTS_DIR / "gemini_zero_shot.sql",
        )

    if args.mode in ("self_correction", "both"):
        run_self_correction(
            questions, tables_data, model,
            RESULTS_DIR / "gemini_self_correction.sql",
        )


if __name__ == "__main__":
    main()
