"""Dr.Spider robustness evaluation for Cerebras + RAG.

Runs few-shot + RAG predictions on Dr.Spider perturbation sets and compares
pre-perturbation vs post-perturbation execution accuracy.

Perturbation types:
  NLQ_* — question rewordings (same schema, same gold SQL)
  DB_*  — schema renamings (same question, modified tables/columns/databases)
  SQL_* — equivalent gold SQL rewrites (for eval-side robustness)

Usage:
  python baseline/dr_spider_eval.py --perturbations NLQ_keyword_synonym NLQ_column_synonym
  python baseline/dr_spider_eval.py --category NLQ   # all NLQ perturbations
  python baseline/dr_spider_eval.py --all             # all 17 sets (slow)
"""

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
    CEREBRAS_API_KEY,
    CEREBRAS_BASE_URL,
    CEREBRAS_MAX_TOKENS,
    CEREBRAS_MODEL,
    FEW_SHOT_K,
    FEW_SHOT_SEED,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    RESULTS_DIR,
    TRAIN_SPIDER_JSON,
    VECTOR_INDEX_PATH,
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
from sqlgen_parse import parse_sql_response
from vector_store import load_index

DR_SPIDER_DIR = ROOT / "dr_spider"
SQL_TIMEOUT = 30


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
                print(f"    Rate limited, waiting {wait}s...")
                time.sleep(wait)
            else:
                raise
    raise RuntimeError("Cerebras: rate limit retries exhausted")


def exec_match(pred_sql, gold_sql, db_path):
    """Check execution accuracy: do pred and gold return the same result set?"""
    if not db_path.exists():
        return False
    try:
        conn = sqlite3.connect(str(db_path))
        conn.execute(f"PRAGMA busy_timeout = {SQL_TIMEOUT * 1000}")
        pred_res = set(conn.execute(pred_sql).fetchall())
        gold_clean = gold_sql.split("\t")[0].strip().rstrip(";")
        gold_res = set(conn.execute(gold_clean).fetchall())
        conn.close()
        return pred_res == gold_res
    except Exception:
        return False


def get_perturbation_sets():
    """List all perturbation set names."""
    return sorted(
        d for d in os.listdir(DR_SPIDER_DIR)
        if (d.startswith("NLQ_") or d.startswith("DB_") or d.startswith("SQL_"))
        and (DR_SPIDER_DIR / d / "questions_post_perturbation.json").exists()
    )


def run_perturbation(
    name, client, template, train_rows, by_db_indices, rng, top_k_tables, top_n_columns,
    max_per_set=None, mode="lexical", embed_client=None, vector_index=None,
):
    """Run pre and post perturbation predictions and return accuracy."""
    pset_dir = DR_SPIDER_DIR / name
    is_db_perturbation = name.startswith("DB_")

    with open(pset_dir / "questions_pre_perturbation.json") as f:
        pre_questions = json.load(f)
    with open(pset_dir / "questions_post_perturbation.json") as f:
        post_questions = json.load(f)
    with open(pset_dir / "gold_pre_perturbation.sql") as f:
        pre_gold = [l.strip() for l in f.readlines()]
    with open(pset_dir / "gold_post_perturbation.sql") as f:
        post_gold = [l.strip() for l in f.readlines()]

    # Sample if needed
    if max_per_set and len(post_questions) > max_per_set:
        indices = list(range(len(post_questions)))
        sample_rng = random.Random(42)
        sample_rng.shuffle(indices)
        indices = sorted(indices[:max_per_set])
        pre_questions = [pre_questions[i] for i in indices]
        post_questions = [post_questions[i] for i in indices]
        pre_gold = [pre_gold[i] for i in indices]
        post_gold = [post_gold[i] for i in indices]

    # Load tables: pre uses Spider-dev tables, post may use perturbed tables
    pre_tables = load_tables(DR_SPIDER_DIR / "Spider-dev" / "tables.json")
    if is_db_perturbation:
        post_tables = load_tables(pset_dir / "tables_post_perturbation.json")
    else:
        post_tables = pre_tables

    # Database directories
    pre_db_dir = DR_SPIDER_DIR / "Spider-dev" / "databases"
    post_db_dir = (pset_dir / "database_post_perturbation") if is_db_perturbation else pre_db_dir

    n = len(post_questions)
    pre_correct = 0
    post_correct = 0

    for i in range(n):
        # --- Pre-perturbation ---
        pre_q = pre_questions[i]
        db_id_pre = pre_q["db_id"]
        # Strip any suffix like _0 for few-shot lookup
        base_db_id = db_id_pre.rsplit("_", 1)[0] if is_db_perturbation else db_id_pre

        schema_pre = retrieve_schema(
            pre_q["question"], db_id_pre, pre_tables,
            top_k_tables=top_k_tables, top_n_columns=top_n_columns,
            mode=mode, openai_client=embed_client, vector_index=vector_index,
        )
        demos = build_few_shot_examples(train_rows, by_db_indices, base_db_id, FEW_SHOT_K, rng)
        examples_block = format_examples_for_prompt(demos)
        prompt_pre = template.format(schema=schema_pre, question=pre_q["question"], examples=examples_block)

        try:
            raw = call_cerebras(client, prompt_pre)
            sql_pre = parse_sql_response(raw)
        except Exception:
            sql_pre = "SELECT 1"

        db_path_pre = pre_db_dir / db_id_pre / f"{db_id_pre}.sqlite"
        if exec_match(sql_pre, pre_gold[i], db_path_pre):
            pre_correct += 1

        # --- Post-perturbation ---
        post_q = post_questions[i]
        db_id_post = post_q["db_id"]

        schema_post = retrieve_schema(
            post_q["question"], db_id_post, post_tables,
            top_k_tables=top_k_tables, top_n_columns=top_n_columns,
            mode=mode, openai_client=embed_client, vector_index=vector_index,
        )
        # Reuse same few-shot demos (from base db)
        prompt_post = template.format(schema=schema_post, question=post_q["question"], examples=examples_block)

        try:
            raw = call_cerebras(client, prompt_post)
            sql_post = parse_sql_response(raw)
        except Exception:
            sql_post = "SELECT 1"

        db_path_post = post_db_dir / db_id_post / f"{db_id_post}.sqlite"
        if exec_match(sql_post, post_gold[i], db_path_post):
            post_correct += 1

        if (i + 1) % 50 == 0 or i == n - 1:
            print(f"    {i + 1}/{n}")

        time.sleep(API_DELAY)

    pre_acc = pre_correct / n if n > 0 else 0
    post_acc = post_correct / n if n > 0 else 0
    drop = pre_acc - post_acc

    return {
        "name": name,
        "count": n,
        "pre_accuracy": pre_acc,
        "post_accuracy": post_acc,
        "drop": drop,
        "pre_correct": pre_correct,
        "post_correct": post_correct,
    }


def main():
    parser = argparse.ArgumentParser(description="Dr.Spider robustness eval with Cerebras + RAG")
    parser.add_argument(
        "--perturbations", nargs="+", default=None,
        help="Specific perturbation set names to evaluate",
    )
    parser.add_argument(
        "--category", choices=["NLQ", "DB", "SQL"], default=None,
        help="Run all perturbations in a category",
    )
    parser.add_argument("--all", action="store_true", help="Run all 17 perturbation sets")
    parser.add_argument("--top-k-tables", type=int, default=3)
    parser.add_argument("--top-n-columns", type=int, default=8)
    parser.add_argument(
        "--mode",
        choices=["lexical", "hybrid"],
        default="lexical",
        help="Retrieval mode: lexical or hybrid (lexical + vector embeddings)",
    )
    parser.add_argument("--max-per-set", type=int, default=None,
                        help="Max examples per perturbation set (sample for speed)")
    parser.add_argument("--save-json", type=Path, default=None)
    args = parser.parse_args()

    if not CEREBRAS_API_KEY:
        sys.exit("Set CEREBRAS_API_KEY in .env")
    if args.mode == "hybrid" and not OPENAI_API_KEY:
        sys.exit("Set OPENAI_API_KEY in .env for hybrid mode")

    all_sets = get_perturbation_sets()

    if args.all:
        selected = all_sets
    elif args.category:
        selected = [s for s in all_sets if s.startswith(args.category + "_")]
    elif args.perturbations:
        selected = args.perturbations
    else:
        # Default: one from each category for a quick test
        selected = ["NLQ_keyword_synonym", "DB_schema_synonym", "SQL_sort_order"]

    print(f"Dr.Spider robustness eval: {len(selected)} perturbation sets")
    print(f"Model: Cerebras {CEREBRAS_MODEL}, few-shot + {args.mode} RAG")
    print(f"top_k={args.top_k_tables}, top_n={args.top_n_columns}")
    print()

    client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)
    embed_client = None
    vector_index = None
    if args.mode == "hybrid":
        embed_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
        print(f"Loading vector index from {VECTOR_INDEX_PATH}...")
        vector_index = load_index(VECTOR_INDEX_PATH)
    template = load_prompt("few_shot.txt")
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)
    by_db_indices = index_train_by_db(train_rows)
    rng = random.Random(FEW_SHOT_SEED)

    results = []
    for name in selected:
        print(f"  Running: {name} ...")
        r = run_perturbation(
            name, client, template, train_rows, by_db_indices, rng,
            args.top_k_tables, args.top_n_columns, args.max_per_set,
            mode=args.mode, embed_client=embed_client, vector_index=vector_index,
        )
        results.append(r)
        print(
            f"    Pre: {r['pre_accuracy']*100:.1f}%  Post: {r['post_accuracy']*100:.1f}%  "
            f"Drop: {r['drop']*100:+.1f}%  (n={r['count']})"
        )
        print()

    # Summary table
    print("=" * 75)
    print(f"{'Perturbation':<30} {'n':>5} {'Pre':>8} {'Post':>8} {'Drop':>8}")
    print("-" * 75)
    for r in results:
        print(
            f"{r['name']:<30} {r['count']:>5} "
            f"{r['pre_accuracy']*100:>7.1f}% {r['post_accuracy']*100:>7.1f}% "
            f"{r['drop']*100:>+7.1f}%"
        )

    # Category averages
    for cat in ["NLQ", "DB", "SQL"]:
        cat_results = [r for r in results if r["name"].startswith(cat + "_")]
        if cat_results:
            avg_pre = sum(r["pre_accuracy"] for r in cat_results) / len(cat_results)
            avg_post = sum(r["post_accuracy"] for r in cat_results) / len(cat_results)
            avg_drop = avg_pre - avg_post
            print(
                f"{cat + ' (avg)':<30} {'':>5} "
                f"{avg_pre*100:>7.1f}% {avg_post*100:>7.1f}% "
                f"{avg_drop*100:>+7.1f}%"
            )

    if args.save_json:
        args.save_json.parent.mkdir(parents=True, exist_ok=True)
        with open(args.save_json, "w") as f:
            json.dump({"config": {"top_k": args.top_k_tables, "top_n": args.top_n_columns}, "results": results}, f, indent=2)
        print(f"\nSaved to {args.save_json}")


if __name__ == "__main__":
    main()
