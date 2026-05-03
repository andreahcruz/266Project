"""Sovereign node — owns one db_id's schema, retriever, executor.

Each Node is the only object in the system that ever sees the *real* DDL
or the executed query results for its database. The Hub interacts with the
node only via three methods:

  - ``retrieve_and_mask(question, session)`` → masked schema string. Mask
    dict is stashed on ``session`` so the unmasker has it later.
  - ``compute_phrase_hints(question, session)`` → list of (phrase, token)
    pairs derived from question-vs-column embedding similarity. Returns
    only opaque token IDs — real names never leave.
  - ``unmask_and_execute(masked_sql, session)`` → ``(success, rows_or_error)``.

Retrieval reuses the existing hybrid retriever from retriever.py.
"""

from __future__ import annotations

import math
import re
from pathlib import Path
from typing import Optional

from sql_executor import execute_sql
from retriever import retrieve_schema_details, _tokenize as _retriever_tokenize
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
        # Lazy column-embedding cache keyed by column index. Built on first
        # call to compute_phrase_hints so we don't pay for it when hints are off.
        self._col_embedding_cache: Optional[dict[int, list[float]]] = None

    def retrieve_and_mask(
        self,
        question: str,
        session: SessionState,
        *,
        retrieval: str = "hybrid",  # "hybrid" | "lexical" | "none"
        masking: bool = True,
        mask_style: str = "hard",
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
            mask_style=mask_style,
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

    # ── Column-level retrieval hints ──────────────────────────────────
    def _ensure_col_embeddings(self) -> dict[int, list[float]]:
        """Embed every real column name once (lazy, cached).

        Each column gets a textual description "<table>.<column>" embedded so
        the similarity captures both the column name and its table context.
        Result: dict[col_idx → embedding].
        """
        if self._col_embedding_cache is not None:
            return self._col_embedding_cache
        if self.openai_client is None:
            self._col_embedding_cache = {}
            return self._col_embedding_cache

        table_names = self.entry["table_names_original"]
        columns = self.entry["column_names_original"]
        col_indices: list[int] = []
        texts: list[str] = []
        for ci, (ti, cname) in enumerate(columns):
            if ti == -1:
                continue
            col_indices.append(ci)
            texts.append(f"{table_names[ti]}.{cname}")
        if not texts:
            self._col_embedding_cache = {}
            return self._col_embedding_cache

        resp = self.openai_client.embeddings.create(
            model="text-embedding-3-small", input=texts
        )
        cache: dict[int, list[float]] = {}
        for ci, item in zip(col_indices, resp.data):
            cache[ci] = item.embedding
        self._col_embedding_cache = cache
        return cache

    @staticmethod
    def _cosine(a: list[float], b: list[float]) -> float:
        dot = sum(x * y for x, y in zip(a, b))
        na = math.sqrt(sum(x * x for x in a))
        nb = math.sqrt(sum(x * x for x in b))
        if na == 0 or nb == 0:
            return 0.0
        return dot / (na * nb)

    @staticmethod
    def _content_words(question: str) -> list[str]:
        """Pull content words from the question — drop stopwords, dedupe.

        Reuses the retriever's stopword filter so phrase hints align with
        whatever words the retriever already considers meaningful.
        """
        toks = _retriever_tokenize(question)
        # Dedupe but keep order
        seen = set()
        out = []
        for t in toks:
            if t not in seen and len(t) >= 3:
                seen.add(t)
                out.append(t)
        return out

    def compute_phrase_hints(
        self,
        question: str,
        session: SessionState,
        *,
        sim_threshold: float = 0.40,
        max_hints: int = 6,
    ) -> list[tuple[str, str]]:
        """Map content-words from the question to their best-matching token.

        Privacy: the only thing leaving is ``(phrase, token)`` pairs. Real
        column names never appear. The phrase is already in the question,
        so no new info crosses the boundary.

        Returns a ranked list of ``(phrase, token)`` capped at ``max_hints``,
        only including matches above ``sim_threshold``. If the session has no
        mask_dict (masking off), returns an empty list.
        """
        if session.mask_dict is None:
            return []
        col_idx_to_token = session.mask_dict.get("col_idx_to_token", {})
        if not col_idx_to_token:
            return []

        words = self._content_words(question)
        if not words:
            return []

        col_embeds = self._ensure_col_embeddings()
        # Restrict matching to selected (masked) columns only — others have
        # no token to map to.
        candidate_cols = [(ci, col_embeds[ci]) for ci in col_idx_to_token if ci in col_embeds]
        if not candidate_cols:
            return []

        # Embed all words in one batch
        resp = self.openai_client.embeddings.create(
            model="text-embedding-3-small", input=words
        )
        word_embeds = [item.embedding for item in resp.data]

        hints: list[tuple[str, str, float]] = []
        for word, w_emb in zip(words, word_embeds):
            best_ci, best_sim = None, -1.0
            for ci, c_emb in candidate_cols:
                sim = self._cosine(w_emb, c_emb)
                if sim > best_sim:
                    best_sim = sim
                    best_ci = ci
            if best_ci is not None and best_sim >= sim_threshold:
                hints.append((word, col_idx_to_token[best_ci], best_sim))

        # Sort by similarity, dedupe by token (keep highest-sim word per token),
        # cap at max_hints.
        hints.sort(key=lambda t: t[2], reverse=True)
        seen_tokens = set()
        deduped: list[tuple[str, str]] = []
        for word, tok, _ in hints:
            if tok in seen_tokens:
                continue
            seen_tokens.add(tok)
            deduped.append((word, tok))
            if len(deduped) >= max_hints:
                break
        return deduped
