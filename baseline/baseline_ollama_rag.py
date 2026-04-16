"""Ollama text-to-SQL with schema retrieval (RAG).

Uses Ollama's OpenAI-compatible API (localhost:11434).

Run from repository root:
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/baseline_ollama_rag.py --strategy few_shot
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/baseline_ollama_rag.py --strategy zero_shot --model mistral

Evaluate:
  SPIDER_TEST_SPLIT=balanced_80x4 python run_eval.py --pred baseline/results/ollama_llama3.1_few_shot_rag_balanced_80x4.sql --etype exec
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
    BALANCED_INDICES,
    SPIDER_TEST_SPLIT,
    balanced_pred_filename,
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    NUM_QUESTIONS,
    QUESTIONS_JSON,
    RESULTS_DIR,
    TABLES_FOR_RUN,
    TRAIN_SPIDER_JSON,
    RETRIEVER_TOP_K_TABLES,
    RETRIEVER_TOP_N_COLUMNS,
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
from sqlgen_parse import parse_sql_after_chain_of_thought, parse_sql_response

OLLAMA_BASE_URL = "http://localhost:11434/v1"
DEFAULT_MODEL = "llama3.1"
MAX_TOKENS = 512
MAX_TOKENS_COT = 1536


def call_ollama(client, model, prompt, max_tokens=MAX_TOKENS, max_attempts=3):
    """Send prompt to Ollama via OpenAI-compatible API."""
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=model,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=max_tokens,
            )
            return response.choices[0].message.content
        except Exception as e:
            if attempt < max_attempts - 1:
                print(f"    Error: {e}, retrying ({attempt + 1}/{max_attempts})...")
                time.sleep(2)
            else:
                raise


def main():
    parser = argparse.ArgumentParser(
        description="Ollama text-to-SQL with schema retrieval (RAG) on Spider test",
    )
    parser.add_argument(
        "--strategy",
        choices=["zero_shot", "chain_of_thought", "few_shot"],
        default="few_shot",
        help="Prompting strategy (default: few_shot)",
    )
    parser.add_argument(
        "--model",
        type=str,
        default=DEFAULT_MODEL,
        help=f"Ollama model name (default: {DEFAULT_MODEL})",
    )
    parser.add_argument(
        "-n",
        "--num-questions",
        type=int,
        default=None,
        help=f"Override number of questions (default: {NUM_QUESTIONS})",
    )
    parser.add_argument(
        "--top-k-tables",
        type=int,
        default=RETRIEVER_TOP_K_TABLES,
        help=f"Max tables to retrieve (default: {RETRIEVER_TOP_K_TABLES})",
    )
    parser.add_argument(
        "--top-n-columns",
        type=int,
        default=RETRIEVER_TOP_N_COLUMNS,
        help=f"Max columns per table (default: {RETRIEVER_TOP_N_COLUMNS})",
    )
    args = parser.parse_args()
    if BALANCED_INDICES is not None and args.num_questions is not None:
        print(
            f"Note: -n/--num-questions is ignored when SPIDER_TEST_SPLIT={SPIDER_TEST_SPLIT} "
            f"(using {NUM_QUESTIONS} stratified questions).",
        )

    strategy = args.strategy
    # Sanitize model name for filename (e.g. "llama3.1:latest" -> "llama3.1")
    model_slug = args.model.split(":")[0].replace("/", "_")

    if strategy == "zero_shot":
        template_name = "zero_shot.txt"
        out_name = balanced_pred_filename(f"ollama_{model_slug}_zero_shot_rag")
        parse_fn = parse_sql_response
        max_tok = MAX_TOKENS
    elif strategy == "chain_of_thought":
        template_name = "chain_of_thought.txt"
        out_name = balanced_pred_filename(f"ollama_{model_slug}_chain_of_thought_rag")
        parse_fn = parse_sql_after_chain_of_thought
        max_tok = MAX_TOKENS_COT
    else:
        template_name = "few_shot.txt"
        out_name = balanced_pred_filename(f"ollama_{model_slug}_few_shot_rag")
        parse_fn = parse_sql_response
        max_tok = MAX_TOKENS

    client = OpenAI(api_key="ollama", base_url=OLLAMA_BASE_URL)

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
    print(
        f"Running Ollama ({args.model}) {label} + lexical RAG "
        f"(top_k={args.top_k_tables}, top_n={args.top_n_columns}) "
        f"on {len(questions)} questions (test split)..."
    )
    with open(out_path, "w", encoding="utf-8") as out:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]

            schema = retrieve_schema(
                question, db_id, tables_data,
                top_k_tables=args.top_k_tables,
                top_n_columns=args.top_n_columns,
                mode="lexical",
            )

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
                raw = call_ollama(client, args.model, prompt, max_tokens=max_tok)
                sql = parse_fn(raw)
            except Exception as e:
                print(f"  [ERROR] Question {i}: {e}")
                sql = "SELECT 1"
            out.write(sql + "\n")
            out.flush()
            print(f"  Question {i + 1}/{len(questions)}")

    print(f"Saved {len(questions)} predictions to {out_path}")
    print("Done")


if __name__ == "__main__":
    main()
