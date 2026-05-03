"""Phase 3 smoketest: 5 questions through the Hub.

Builds 11 nodes (one per db_id in the 320 split), the broker, and runs
a small sample with Haiku. Used to verify wiring before running the full
320 eval on Cerebras.
"""

from __future__ import annotations

import json

from openai import OpenAI

from config import (
    ANTHROPIC_MODEL,
    BASE_DIR,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_DATABASE_DIR,
    TEST_JSON,
    TEST_TABLES_JSON,
    TRAIN_SPIDER_JSON,
)
from federated.broker import Broker
from federated.cost_logger import CostLogger
from federated.hub import Hub
from federated.node import Node
from few_shot_examples import load_train_spider
from schema_loader import load_tables
from vector_store import load_index


DB_IDS = [
    "e_commerce", "customers_and_orders", "vehicle_driver", "soccer_3",
    "online_exams", "cre_Students_Information_Systems", "bbc_channels",
    "tv_shows", "government_shift", "vehicle_rent", "region_building",
]


def main():
    tables_data = load_tables(TEST_TABLES_JSON)
    openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    vector_index = load_index()
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)

    nodes = {
        db: Node(db, tables_data, TEST_DATABASE_DIR, openai_client, vector_index)
        for db in DB_IDS
    }
    broker = Broker(BASE_DIR / "federated" / "blurbs", openai_client)
    logger = CostLogger("_phase3_demo")

    hub = Hub(
        broker=broker,
        nodes_by_db_id=nodes,
        primary_model=ANTHROPIC_MODEL,
        prompt_strategy="few_shot",
        retrieval="hybrid",
        masking=True,
        mask_style="hard",
        routing_mode="broker",
        max_retries=2,  # keep smoketest cheap
        cost_logger=logger,
        train_rows=train_rows,
    )

    questions = json.load(open(TEST_JSON))
    indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    eval_qs = [(i, questions[i]) for i in indices]

    # Pick 5 spread across difficulties
    sample = eval_qs[:1] + eval_qs[80:81] + eval_qs[160:161] + eval_qs[240:241] + eval_qs[300:301]

    for q_idx, q in sample:
        print(f"\n=== q_idx={q_idx}  gold_db={q['db_id']} ===")
        print(f"Q: {q['question']}")
        rec = hub.answer(q["question"], oracle_db_id=q["db_id"], question_idx=q_idx)
        print(f"  routed_to: {rec.db_id_used}  (broker_pick={rec.broker_pick}, correct={rec.broker_correct})")
        print(f"  retries: {rec.retries}  re_picked: {rec.re_picked}")
        print(f"  masked_sql: {rec.masked_sql_final}")
        print(f"  real_sql:   {rec.real_sql_final}")
        print(f"  success={rec.success}  rows_or_error={str(rec.rows_or_error)[:150]}")
    print(f"\nTotal cost: ${logger.total_cost_usd:.6f}")


if __name__ == "__main__":
    main()
