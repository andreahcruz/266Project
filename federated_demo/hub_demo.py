"""Hub demo: HTTP-talks to two FastAPI nodes (online_exams, bbc_channels)
and runs the other 9 in-process. Single-question CLI.

Usage::

    # Terminal 1
    python -m federated_demo.node_server --db-id online_exams --port 5001
    # Terminal 2
    python -m federated_demo.node_server --db-id bbc_channels --port 5002
    # Terminal 3
    python -m federated_demo.hub_demo --question "How many students are there?"
"""

from __future__ import annotations

import argparse
import uuid

import requests
from openai import OpenAI

from config import (
    ANTHROPIC_MODEL,
    BASE_DIR,
    CEREBRAS_MODEL,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_DATABASE_DIR,
    TEST_TABLES_JSON,
    TRAIN_SPIDER_JSON,
)
from federated.broker import Broker
from federated.cost_logger import CostLogger
from federated.hub import Hub
from federated.node import Node
from federated.session import SessionState
from few_shot_examples import load_train_spider
from schema_loader import load_tables
from vector_store import load_index


# DBs hosted via FastAPI in the demo
HTTP_NODES = {
    "online_exams": "http://127.0.0.1:5001",
    "bbc_channels": "http://127.0.0.1:5002",
}

# Other DBs run in-process
INPROC_DB_IDS = [
    "e_commerce", "customers_and_orders", "vehicle_driver", "soccer_3",
    "cre_Students_Information_Systems", "tv_shows", "government_shift",
    "vehicle_rent", "region_building",
]


class HTTPNodeProxy:
    """A Node-shaped client that routes to a FastAPI node over HTTP.

    Implements the same retrieve_and_mask / unmask_and_execute / has_returned_empty
    surface the in-process Node uses, so Hub doesn't care which is which.
    """

    def __init__(self, db_id: str, base_url: str):
        self.db_id = db_id
        self.base_url = base_url.rstrip("/")
        self.call_count = 0

    def retrieve_and_mask(self, question: str, session: SessionState, **kw) -> str:
        self.call_count += 1
        session.db_id = self.db_id
        r = requests.post(
            f"{self.base_url}/retrieve_and_mask",
            json={
                "question": question,
                "session_id": session.session_id,
                "retrieval": kw.get("retrieval", "hybrid"),
                "masking": kw.get("masking", True),
            },
            timeout=30,
        )
        r.raise_for_status()
        body = r.json()
        # Hub references session.masked_schema in has_returned_empty
        session.masked_schema = body["masked_schema"]
        # Mark mask_dict as a sentinel "remote" so Hub knows not to unmask locally
        session.mask_dict = {"_remote": True}
        return body["masked_schema"]

    def unmask_and_execute(self, sql: str, session: SessionState):
        r = requests.post(
            f"{self.base_url}/unmask_and_execute",
            json={"sql": sql, "session_id": session.session_id},
            timeout=60,
        )
        r.raise_for_status()
        body = r.json()
        return body["success"], body["rows_or_error"], body["real_sql"]

    def has_returned_empty(self, session: SessionState) -> bool:
        return not (session.masked_schema and session.masked_schema.strip())


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--question", required=True)
    p.add_argument("--model", default=ANTHROPIC_MODEL,
                   help=f"Default Haiku for demo. Use {CEREBRAS_MODEL} for Cerebras.")
    p.add_argument("--routing", default="broker", choices=["broker", "oracle"])
    p.add_argument("--oracle-db-id", default=None)
    args = p.parse_args()

    print("\n=== Sovereign Hub: federated query orchestrator ===")
    print(f"Question: {args.question}")

    # Verify HTTP nodes are alive
    for db_id, url in HTTP_NODES.items():
        try:
            r = requests.get(f"{url}/health", timeout=2)
            r.raise_for_status()
            print(f"[ok] HTTP node {db_id} live at {url}")
        except Exception as e:
            print(f"[!!] HTTP node {db_id} NOT reachable at {url}: {e}")
            print("    Start it with: python -m federated_demo.node_server --db-id "
                  f"{db_id} --port {url.rsplit(':', 1)[-1]}")
            return

    tables_data = load_tables(TEST_TABLES_JSON)
    openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    vector_index = load_index()
    train_rows = load_train_spider(TRAIN_SPIDER_JSON)

    nodes: dict = {}
    for db_id, url in HTTP_NODES.items():
        nodes[db_id] = HTTPNodeProxy(db_id, url)
    for db_id in INPROC_DB_IDS:
        nodes[db_id] = Node(db_id, tables_data, TEST_DATABASE_DIR, openai_client, vector_index)

    broker = Broker(BASE_DIR / "federated" / "blurbs", openai_client) if args.routing == "broker" else None
    logger = CostLogger("_demo_hub", cost_cap_usd=0.10)
    hub = Hub(
        broker=broker,
        nodes_by_db_id=nodes,
        primary_model=args.model,
        prompt_strategy="few_shot",
        retrieval="hybrid",
        masking=True,
        routing_mode=args.routing,
        max_retries=2,
        cost_logger=logger,
        train_rows=train_rows,
    )

    rec = hub.answer(args.question, oracle_db_id=args.oracle_db_id)
    print()
    print(f"Routed to: {rec.db_id_used}  (broker_pick={rec.broker_pick}, re_picked={rec.re_picked})")
    print(f"Masked schema (what the LLM saw):")
    for line in rec.masked_schema.splitlines():
        print(f"  {line}")
    print()
    print(f"Masked SQL from LLM: {rec.masked_sql_final}")
    print(f"Unmasked SQL executed: {rec.real_sql_final}")
    print(f"Success: {rec.success}  retries: {rec.retries}")
    if rec.success:
        rows = rec.rows_or_error
        if isinstance(rows, list) and len(rows) > 10:
            print(f"Result: {rows[:10]} ... ({len(rows)} rows total)")
        else:
            print(f"Result: {rows}")
    else:
        print(f"Error: {rec.rows_or_error}")
    print(f"\nTotal cost: ${logger.total_cost_usd:.6f}")


if __name__ == "__main__":
    main()
