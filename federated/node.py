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
from retriever import (
    lexical_db_question_alignment_score,
    retrieve_schema_details,
    _tokenize as _retriever_tokenize,
)
from federated.masker import mask_selection, unmask_sql
from federated.retail_routing_signals import retail_pair_tiebreak_nudge
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
        self._table_embedding_cache: Optional[dict[int, list[float]]] = None

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

    def routing_tiebreaker_score(self, question: str) -> float:
        """Node-local lexical alignment score for broker routing tie-break only.

        The Hub compares this scalar across the top two blurb-ranked candidates;
        identifiers never leave the node.
        """
        base = lexical_db_question_alignment_score(question, self.db_id, self.tables_data)
        return base + retail_pair_tiebreak_nudge(question, self.db_id)

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

    def _ensure_table_embeddings(self) -> dict[int, list[float]]:
        """Embed every real table name once (lazy, cached)."""
        if self._table_embedding_cache is not None:
            return self._table_embedding_cache
        if self.openai_client is None:
            self._table_embedding_cache = {}
            return self._table_embedding_cache

        table_names = self.entry["table_names_original"]
        if not table_names:
            self._table_embedding_cache = {}
            return self._table_embedding_cache

        resp = self.openai_client.embeddings.create(
            model="text-embedding-3-small", input=table_names
        )
        cache: dict[int, list[float]] = {}
        for ti, item in enumerate(resp.data):
            cache[ti] = item.embedding
        self._table_embedding_cache = cache
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
    def _content_phrases(question: str, max_n: int = 2) -> list[str]:
        """Pull content phrases from the question — unigrams + short n-grams.

        Reuses the retriever's stopword filter so hints align with whatever
        words the retriever already considers meaningful. Longer phrases come
        first so they get a chance to claim a token before generic unigrams.
        """
        toks = _retriever_tokenize(question)
        seen = set()
        out = []
        for n in range(max_n, 0, -1):
            for i in range(len(toks) - n + 1):
                phrase_toks = toks[i:i + n]
                if any(len(t) < 3 for t in phrase_toks):
                    continue
                phrase = " ".join(phrase_toks)
                if phrase in seen:
                    continue
                seen.add(phrase)
                out.append(phrase)
        return out

    @staticmethod
    def _target_phrases(question: str) -> list[str]:
        """Extract a few role-like phrases without exposing schema names.

        These are still question-derived strings, so they do not cross the
        privacy boundary with any new database information. They simply help
        the node emphasize which phrase is likely the projection/filter/sort
        target before masking.
        """
        q = " ".join(re.findall(r"[a-z0-9_]+", question.lower()))
        patterns = [
            r"(?:what|which|list|show|give|return)\s+(?:is\s+|are\s+)?(?:the\s+)?(.+?)(?:\s+from\b|\s+for\b|\s+with\b|\s+where\b|\s+who\b|\s+that\b|\s+whose\b|\?|$)",
            r"(highest|lowest|largest|smallest|most|least)\s+([a-z0-9_ ]{2,40}?)(?:\s+from\b|\s+for\b|\s+with\b|\s+where\b|\?|$)",
            r"(?:ordered by|sort by)\s+([a-z0-9_ ]{2,40}?)(?:\s+from\b|\s+for\b|\s+with\b|\?|$)",
            r"(?:more than|less than|at least|at most|after|before)\s+([a-z0-9_ ]{2,40}?)(?:\s+\d|\?|$)",
        ]
        phrases: list[str] = []
        seen = set()
        for pattern in patterns:
            for match in re.finditer(pattern, q):
                groups = [g for g in match.groups() if g]
                phrase = " ".join(groups).strip()
                phrase = re.sub(r"\s+", " ", phrase)
                if len(phrase) < 3 or phrase in seen:
                    continue
                seen.add(phrase)
                phrases.append(phrase)
        return phrases

    def _adjust_column_hint_score(self, phrase: str, col_idx: int, sim: float) -> float:
        """Bias hint scoring toward the likely semantic role of the phrase."""
        col_name = self.entry["column_names_original"][col_idx][1].lower()
        col_type = self.entry["column_types"][col_idx].lower()
        phrase_toks = set(re.findall(r"[a-z0-9_]+", phrase.lower()))
        col_toks = set(re.findall(r"[a-z0-9_]+", col_name))

        id_like = {"id", "code"} & col_toks or col_name.endswith("_id")
        text_like_words = {
            "name", "country", "title", "status", "manager", "captain",
            "manufacturer", "city", "state", "address", "type",
        }
        numeric_words = {
            "price", "amount", "salary", "earnings", "count", "number",
            "total", "score", "age", "year", "rank", "rating",
        }
        date_words = {"date", "year", "month", "day", "time"}

        if phrase_toks & text_like_words:
            if phrase_toks & col_toks:
                sim += 0.16
            if id_like:
                sim -= 0.18
        if {"id", "code"} & phrase_toks:
            sim += 0.16 if id_like else -0.05
        elif id_like:
            sim -= 0.07

        if phrase_toks & {"how", "many", "count", "number"}:
            if id_like:
                sim -= 0.08
        if phrase_toks & {"highest", "lowest", "largest", "smallest", "most", "least", "average", "avg", "sum", "total"}:
            if col_type in {"number", "integer", "real", "float", "double"} or (numeric_words & col_toks):
                sim += 0.10
            elif text_like_words & col_toks:
                sim -= 0.08
        if phrase_toks & {"after", "before", "date", "year", "month", "day"}:
            if col_type in {"time", "datetime", "date", "year"} or (date_words & col_toks):
                sim += 0.10

        return sim

    def compute_phrase_hints(
        self,
        question: str,
        session: SessionState,
        *,
        sim_threshold: float = 0.40,
        max_hints: int = 8,
    ) -> list[tuple[str, str]]:
        """Map content phrases from the question to their best-matching token.

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

        phrases = self._target_phrases(question) + self._content_phrases(question)
        # Preserve order while de-duplicating so targeted phrases are scored first.
        phrases = list(dict.fromkeys(phrases))
        if not phrases:
            return []

        col_embeds = self._ensure_col_embeddings()
        table_embeds = self._ensure_table_embeddings()
        # Restrict matching to selected (masked) columns only — others have
        # no token to map to.
        candidate_cols = [(ci, col_embeds[ci]) for ci in col_idx_to_token if ci in col_embeds]
        table_idx_to_token = session.mask_dict.get("table_idx_to_token", {})
        candidate_tables = [(ti, table_embeds[ti]) for ti in table_idx_to_token if ti in table_embeds]
        if not candidate_cols and not candidate_tables:
            return []

        # Embed all phrases in one batch
        resp = self.openai_client.embeddings.create(
            model="text-embedding-3-small", input=phrases
        )
        phrase_embeds = [item.embedding for item in resp.data]

        hints: list[tuple[str, str, float, str]] = []
        table_threshold = max(sim_threshold - 0.02, 0.35)
        for phrase, p_emb in zip(phrases, phrase_embeds):
            best_ci, best_col_sim = None, -1.0
            for ci, c_emb in candidate_cols:
                sim = self._adjust_column_hint_score(phrase, ci, self._cosine(p_emb, c_emb))
                if sim > best_col_sim:
                    best_col_sim = sim
                    best_ci = ci
            if best_ci is not None and best_col_sim >= sim_threshold:
                hints.append((phrase, col_idx_to_token[best_ci], best_col_sim, "column"))

            best_ti, best_table_sim = None, -1.0
            for ti, t_emb in candidate_tables:
                sim = self._cosine(p_emb, t_emb)
                if sim > best_table_sim:
                    best_table_sim = sim
                    best_ti = ti
            if best_ti is not None and best_table_sim >= table_threshold:
                hints.append((phrase, table_idx_to_token[best_ti], best_table_sim, "table"))

        # Sort by similarity, then prefer longer phrases and table hints that
        # help the model choose FROM/JOIN targets under masking.
        hints.sort(
            key=lambda t: (t[2], len(t[0].split()), 1 if t[1].startswith("T") else 0),
            reverse=True,
        )
        seen_tokens = set()
        seen_pairs = set()
        deduped: list[tuple[str, str]] = []
        for phrase, tok, _sim, _kind in hints:
            if tok in seen_tokens or (phrase, tok) in seen_pairs:
                continue
            seen_tokens.add(tok)
            seen_pairs.add((phrase, tok))
            deduped.append((phrase, tok))
            if len(deduped) >= max_hints:
                break
        return deduped
