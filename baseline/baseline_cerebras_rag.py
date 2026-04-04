"""Cerebras text-to-SQL with schema retrieval (RAG).

Two retrieval modes:
  --mode lexical  : keyword-overlap only (fast, no extra API calls)
  --mode hybrid   : lexical + OpenAI vector reranking for low-confidence tables

Run from repository root:
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/baseline_cerebras_rag.py --strategy few_shot
  SPIDER_TEST_SPLIT=balanced_80x4 python baseline/baseline_cerebras_rag.py --strategy few_shot --mode hybrid

Evaluate:
  SPIDER_TEST_SPLIT=balanced_80x4 python run_eval.py --pred baseline/results/cerebras_few_shot_rag_balanced_80x4.sql --etype exec
  SPIDER_TEST_SPLIT=balanced_80x4 python run_eval.py --pred baseline/results/cerebras_few_shot_hybrid_rag_balanced_80x4.sql --etype exec
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
    CEREBRAS_MAX_TOKENS_COT,
    CEREBRAS_MODEL,
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    NUM_QUESTIONS,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    QUESTIONS_JSON,
    RESULTS_DIR,
    TABLES_FOR_RUN,
    TRAIN_SPIDER_JSON,
    RETRIEVER_TOP_K_TABLES,
    RETRIEVER_TOP_N_COLUMNS,
    VECTOR_INDEX_PATH,
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
from vector_store import load_index
from schema_loader import load_tables
from sqlgen_parse import parse_sql_after_chain_of_thought, parse_sql_response


def call_cerebras(client, prompt, max_tokens=None, max_attempts=5):
    """Send prompt to Cerebras (OpenAI-compatible); retry on rate limits."""
    mt = CEREBRAS_MAX_TOKENS if max_tokens is None else max_tokens
    for attempt in range(max_attempts):
        try:
            response = client.chat.completions.create(
                model=CEREBRAS_MODEL,
                messages=[{"role": "user", "content": prompt}],
                temperature=0,
                max_tokens=mt,
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


def load_vector_index_or_exit():
    """Load the persistent ChromaDB index with a clear hybrid-mode error."""
    try:
        return load_index(VECTOR_INDEX_PATH)
    except Exception as exc:
        sys.exit(
            f"Failed to load vector store from {VECTOR_INDEX_PATH}: {exc}\n"
            "Rebuild it with `python build_vector_index.py` before running hybrid mode.",
        )


def main():
    parser = argparse.ArgumentParser(
        description="Cerebras text-to-SQL with schema retrieval (RAG) on Spider test",
    )
    parser.add_argument(
        "--strategy",
        choices=["zero_shot", "chain_of_thought", "few_shot"],
        default="few_shot",
        help="Prompting strategy (default: few_shot)",
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
    parser.add_argument(
        "--mode",
        choices=["lexical", "hybrid"],
        default="lexical",
        help="Retrieval mode: lexical (keyword only) or hybrid (lexical + vector reranking)",
    )
    args = parser.parse_args()
    if BALANCED_INDICES is not None and args.num_questions is not None:
        print(
            f"Note: -n/--num-questions is ignored when SPIDER_TEST_SPLIT={SPIDER_TEST_SPLIT} "
            f"(using {NUM_QUESTIONS} stratified questions).",
        )

    if not CEREBRAS_API_KEY:
        sys.exit("Set CEREBRAS_API_KEY in .env")
    if args.mode == "hybrid" and not OPENAI_API_KEY:
        sys.exit("Set OPENAI_API_KEY in .env (needed for hybrid vector reranking)")

    strategy = args.strategy
    rag_suffix = "hybrid_rag" if args.mode == "hybrid" else "rag"
    if strategy == "zero_shot":
        template_name = "zero_shot.txt"
        out_name = balanced_pred_filename(f"cerebras_zero_shot_{rag_suffix}")
        parse_fn = parse_sql_response
        max_tok = CEREBRAS_MAX_TOKENS
    elif strategy == "chain_of_thought":
        template_name = "chain_of_thought.txt"
        out_name = balanced_pred_filename(f"cerebras_chain_of_thought_{rag_suffix}")
        parse_fn = parse_sql_after_chain_of_thought
        max_tok = CEREBRAS_MAX_TOKENS_COT
    else:
        template_name = "few_shot.txt"
        out_name = balanced_pred_filename(f"cerebras_few_shot_{rag_suffix}")
        parse_fn = parse_sql_response
        max_tok = CEREBRAS_MAX_TOKENS

    client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)

    # Separate OpenAI client for embeddings (hybrid mode only)
    embed_client = None
    vector_index = None
    if args.mode == "hybrid":
        embed_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
        print(f"Loading vector index from {VECTOR_INDEX_PATH}...")
        vector_index = load_vector_index_or_exit()

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
        f"Running Cerebras ({CEREBRAS_MODEL}) {label} + {args.mode} RAG "
        f"(top_k={args.top_k_tables}, top_n={args.top_n_columns}) "
        f"on {len(questions)} questions (test split)..."
    )
    with open(out_path, "w", encoding="utf-8") as out:
        for i, q in enumerate(questions):
            db_id = q["db_id"]
            question = q["question"]

            # ── Schema retrieval (the key difference from baseline) ──
            schema = retrieve_schema(
                question, db_id, tables_data,
                top_k_tables=args.top_k_tables,
                top_n_columns=args.top_n_columns,
                mode=args.mode,
                openai_client=embed_client,
                vector_index=vector_index,
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
                raw = call_cerebras(client, prompt, max_tokens=max_tok)
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
