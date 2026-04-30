"""FastAPI wrapper around a Node — used for the live demo only.

Run two instances on different ports for the 3-terminal demo:

    python -m federated_demo.node_server --db-id online_exams --port 5001
    python -m federated_demo.node_server --db-id bbc_channels --port 5002

The Hub demo (federated_demo/hub_demo.py) calls these via HTTP, while
the other 9 nodes stay in-process.
"""

from __future__ import annotations

import argparse
import json
import logging

import uvicorn
from fastapi import FastAPI
from openai import OpenAI
from pydantic import BaseModel

from config import (
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_DATABASE_DIR,
    TEST_TABLES_JSON,
)
from federated.node import Node
from federated.session import SessionState
from schema_loader import load_tables
from vector_store import load_index

# In-memory session store keyed by session_id. Sessions are short-lived
# (per question) and evicted when the client signals done.
_sessions: dict[str, SessionState] = {}
_node: Node | None = None


class RetrieveReq(BaseModel):
    question: str
    session_id: str
    retrieval: str = "hybrid"
    masking: bool = True


class RetrieveResp(BaseModel):
    masked_schema: str
    session_id: str


class ExecuteReq(BaseModel):
    sql: str
    session_id: str


class ExecuteResp(BaseModel):
    success: bool
    rows_or_error: object
    real_sql: str


def make_app(node: Node) -> FastAPI:
    app = FastAPI()

    @app.get("/health")
    def health():
        return {"db_id": node.db_id, "ok": True}

    @app.post("/retrieve_and_mask", response_model=RetrieveResp)
    def retrieve_and_mask(req: RetrieveReq) -> RetrieveResp:
        session = _sessions.get(req.session_id) or SessionState(session_id=req.session_id, db_id=node.db_id)
        masked = node.retrieve_and_mask(
            req.question, session, retrieval=req.retrieval, masking=req.masking
        )
        _sessions[req.session_id] = session
        logging.info(
            "[%s] retrieve_and_mask session=%s len(masked)=%d",
            node.db_id, req.session_id, len(masked),
        )
        return RetrieveResp(masked_schema=masked, session_id=req.session_id)

    @app.post("/unmask_and_execute", response_model=ExecuteResp)
    def unmask_and_execute(req: ExecuteReq) -> ExecuteResp:
        session = _sessions.get(req.session_id)
        if session is None:
            return ExecuteResp(success=False, rows_or_error="unknown session", real_sql="")
        ok, rows, real_sql = node.unmask_and_execute(req.sql, session)
        # Best-effort: convert rows to JSON-serializable form
        try:
            json.dumps(rows)
            payload = rows
        except TypeError:
            payload = [list(r) for r in rows] if isinstance(rows, list) else str(rows)
        logging.info(
            "[%s] unmask_and_execute session=%s ok=%s",
            node.db_id, req.session_id, ok,
        )
        return ExecuteResp(success=ok, rows_or_error=payload if ok else str(rows), real_sql=real_sql)

    @app.post("/end_session")
    def end_session(payload: dict):
        sid = payload.get("session_id")
        if sid in _sessions:
            del _sessions[sid]
        return {"ok": True}

    return app


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--db-id", required=True)
    p.add_argument("--port", type=int, required=True)
    args = p.parse_args()

    logging.basicConfig(level=logging.INFO, format="%(asctime)s [%(levelname)s] %(message)s")
    tables_data = load_tables(TEST_TABLES_JSON)
    openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    vector_index = load_index()
    global _node
    _node = Node(
        db_id=args.db_id,
        tables_data=tables_data,
        db_dir=TEST_DATABASE_DIR,
        openai_client=openai_client,
        vector_index=vector_index,
    )
    app = make_app(_node)
    print(f"=== Sovereign Node serving db_id={args.db_id} on port {args.port} ===")
    print("Endpoints: POST /retrieve_and_mask, POST /unmask_and_execute, POST /end_session, GET /health")
    uvicorn.run(app, host="127.0.0.1", port=args.port, log_level="info")


if __name__ == "__main__":
    main()
