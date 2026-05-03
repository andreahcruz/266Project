"""Phase 1 smoketest: one question through one Node, end-to-end.

Verifies the LLM never sees real schema names. Default DB: ``online_exams``.

Usage::

    python -m federated.scripts.demo_single_node --db online_exams \
        --question "How many students are there?"
"""

from __future__ import annotations

import argparse

from openai import OpenAI

from config import (
    ANTHROPIC_MODEL,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_DATABASE_DIR,
    TEST_TABLES_JSON,
)
from federated.cost_logger import CostLogger
from federated.llm_clients import complete
from federated.masker import find_real_name_leaks
from federated.node import Node
from federated.session import SessionState
from prompt_utils import load_prompt
from schema_loader import load_tables
from vector_store import load_index


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--db", default="online_exams")
    p.add_argument("--question", default="How many students are there?")
    p.add_argument("--retrieval", default="hybrid", choices=["hybrid", "lexical", "none"])
    p.add_argument("--no-mask", action="store_true")
    p.add_argument("--mask-style", default="hard", choices=["hard", "semantic"])
    p.add_argument("--model", default=ANTHROPIC_MODEL)
    args = p.parse_args()

    tables_data = load_tables(TEST_TABLES_JSON)
    openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    vector_index = load_index()

    node = Node(
        db_id=args.db,
        tables_data=tables_data,
        db_dir=TEST_DATABASE_DIR,
        openai_client=openai_client,
        vector_index=vector_index,
    )
    session = SessionState(db_id=args.db)
    masked_schema = node.retrieve_and_mask(
        args.question,
        session,
        retrieval=args.retrieval,
        masking=not args.no_mask,
        mask_style=args.mask_style,
    )

    print("=== MASKED SCHEMA SENT TO LLM ===")
    print(masked_schema)
    print()

    if not args.no_mask:
        leaks = find_real_name_leaks(masked_schema, node.entry)
        if leaks:
            raise SystemExit(f"LEAK: real names appeared in masked schema: {leaks}")
        print("[ok] no real schema names in masked prompt")
        print()

    template = load_prompt("zero_shot.txt")
    prompt = template.format(schema=masked_schema, question=args.question)
    # NOTE: we only check the schema portion (above) for leaks. The user's
    # question and the template instructions may legitimately contain English
    # words that overlap with real schema names (e.g. "students", "comments").
    # The privacy claim is that *schema metadata* never leaks; user intent
    # in NL is by-design visible to the LLM.

    logger = CostLogger("_phase1_demo")
    text, usage = complete(
        messages=[{"role": "user", "content": prompt}],
        model=args.model,
        cost_logger=logger,
        db_id=args.db,
        note="phase1-smoketest",
    )
    print(f"=== RAW LLM SQL (model={args.model}, tokens={usage}) ===")
    print(text)
    print()

    # Strip markdown code fences if any
    sql = text.strip()
    if sql.startswith("```"):
        lines = sql.splitlines()
        sql = "\n".join(l for l in lines if not l.startswith("```"))
    if sql.lower().startswith("sql\n"):
        sql = sql[4:]
    sql = sql.strip().rstrip(";")

    ok, rows, real_sql = node.unmask_and_execute(sql, session)
    print("=== UNMASKED SQL EXECUTED ===")
    print(real_sql)
    print()
    print(f"success={ok}, rows={rows}")
    print(f"total cost: ${logger.total_cost_usd:.6f}")


if __name__ == "__main__":
    main()
