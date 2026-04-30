"""Sovereign node — owns one db_id's schema, retriever, executor.

Each Node is the only object in the system that ever sees the *real* DDL
or the executed query results for its database. The Hub interacts with the
node only via two methods:

  - ``retrieve_and_mask(question, session)`` → masked schema string. Mask
    dict is stashed on ``session`` so the unmasker has it later.
  - ``unmask_and_execute(masked_sql, session)`` → ``(success, rows_or_error)``.

Retrieval reuses the existing hybrid retriever from retriever.py.
"""

from __future__ import annotations

from pathlib import Path
from typing import Optional

from sql_executor import execute_sql
from retriever import retrieve_schema_details
from federated.masker import mask_selection, unmask_sql
from federated.session import SessionState


class Node:
    """Local handler for one Spider database."""

    def __init__(
        self,
        db_id: str,
        tables_data: dict,
        db_dir: Path,
        openai_client=None,
        vector_index: Optional[dict] = None,
    ):
        if db_id not in tables_data:
            raise KeyError(f"db_id {db_id!r} not in tables_data")
        self.db_id = db_id
        # Each node only retains its own slice — narrative isolation, not
        # security, since we share the dict by reference.
        self.entry = tables_data[db_id]
        self.tables_data = {db_id: self.entry}
        self.db_dir = Path(db_dir)
        self.openai_client = openai_client
        self.vector_index = vector_index
        # Track whether retrieve_and_mask was called this query — for
        # federation isolation logging.
        self.call_count = 0

    def retrieve_and_mask(
        self,
        question: str,
        session: SessionState,
        *,
        retrieval: str = "hybrid",  # "hybrid" | "lexical" | "none"
        masking: bool = True,
        top_k_tables: int = 4,
        top_n_columns: int = 6,
    ) -> str:
        """Run local retrieval, then mask the selection. Stash the mask
        dict on the session so the unmasker can find it later.

        Returns the schema string the Hub will paste into the prompt.
        When ``masking=False`` (control runs), returns the real schema.
        When ``retrieval="none"``, uses the full DDL.
        """
        self.call_count += 1
        session.db_id = self.db_id

        if retrieval == "none":
            from schema_loader import get_schema_string

            num_tables = len(self.entry["table_names_original"])
            details = {
                "schema": get_schema_string(self.db_id, self.tables_data),
                "selected_tables": set(range(num_tables)),
                "selected_column_indices": {
                    ci for ci, (ti, _) in enumerate(self.entry["column_names_original"]) if ti != -1
                },
                "selected_table_names": list(self.entry["table_names_original"]),
                "table_scores": [],
                "mode": "none",
            }
        else:
            details = retrieve_schema_details(
                question=question,
                db_id=self.db_id,
                tables_data=self.tables_data,
                top_k_tables=top_k_tables,
                top_n_columns=top_n_columns,
                mode=retrieval,
                openai_client=self.openai_client if retrieval == "hybrid" else None,
                vector_index=self.vector_index if retrieval == "hybrid" else None,
            )

        if not masking:
            session.mask_dict = None
            session.masked_schema = details["schema"]
            return details["schema"]

        masked_schema, mask_dict = mask_selection(
            db_id=self.db_id,
            entry=self.entry,
            selected_tables=details["selected_tables"],
            selected_column_indices=details["selected_column_indices"],
        )
        session.mask_dict = mask_dict
        session.masked_schema = masked_schema
        return masked_schema

    def unmask_and_execute(
        self,
        sql: str,
        session: SessionState,
    ) -> tuple[bool, object, str]:
        """Unmask SQL using the session's mask dict (if any), then execute.

        Returns ``(success, rows_or_error, real_sql_after_unmask)``.
        """
        if session.mask_dict is not None:
            real_sql = unmask_sql(sql, session.mask_dict)
        else:
            real_sql = sql
        ok, result = execute_sql(self.db_id, real_sql, self.db_dir)
        return ok, result, real_sql

    def has_returned_empty(self, session: SessionState) -> bool:
        """True if the last masked schema is empty — used by the Hub to
        trigger broker re-pick before consuming retry budget.
        """
        return not (session.masked_schema and session.masked_schema.strip())
