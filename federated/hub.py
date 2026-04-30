"""Hub orchestrator for the federated pipeline.

Routes a question through:

  question → broker (or oracle db_id)
           → Node.retrieve_and_mask
           → LLM with masked prompt
           → Node.unmask_and_execute
           → on error: self-correction retry with masked error
           → return AnswerRecord

Reuses existing prompt templates (zero_shot.txt, few_shot.txt,
self_correction.txt) — the masked schema slots into ``{schema}`` so
templates work unchanged.
"""

from __future__ import annotations

import random
import re
from dataclasses import asdict, dataclass, field
from typing import Optional

from federated.broker import Broker
from federated.cost_logger import CostLogger
from federated.llm_clients import complete
from federated.masker import unmask_sql
from federated.node import Node
from federated.session import SessionState
from few_shot_examples import (
    build_few_shot_examples,
    format_examples_for_prompt,
    index_train_by_db,
    load_train_spider,
)
from prompt_utils import load_prompt


@dataclass
class AnswerRecord:
    question_idx: Optional[int]
    db_id_gold: Optional[str]
    db_id_used: str
    routing_mode: str
    broker_pick: Optional[str]
    broker_correct: Optional[bool]
    masked_schema: str
    masked_sql_final: str
    real_sql_final: str
    success: bool
    rows_or_error: object
    retries: int
    cost_usd_so_far: float
    re_picked: bool = False
    extras: dict = field(default_factory=dict)


_FENCE_RE = re.compile(r"^```(?:sql)?\s*\n?", re.IGNORECASE)


def _strip_sql_response(text: str) -> str:
    """Strip markdown fences / leading 'sql' / trailing semicolons."""
    t = text.strip()
    if t.startswith("```"):
        t = _FENCE_RE.sub("", t)
        if t.endswith("```"):
            t = t[: -3].rstrip()
    if t.lower().startswith("sql\n"):
        t = t[4:]
    # If the model returned multiple lines, take from first SELECT/UPDATE/...
    m = re.search(r"(?im)^(select|with|update|delete|insert)\b", t)
    if m:
        t = t[m.start():]
    t = t.strip()
    if t.endswith(";"):
        t = t[:-1].rstrip()
    return t


class Hub:
    """Composes broker + nodes; produces an AnswerRecord per question."""

    def __init__(
        self,
        broker: Optional[Broker],
        nodes_by_db_id: dict[str, Node],
        *,
        primary_model: str,
        prompt_strategy: str = "few_shot",  # "zero_shot" | "few_shot" | "self_correction"
        retrieval: str = "hybrid",  # "hybrid" | "lexical" | "none"
        masking: bool = True,
        routing_mode: str = "broker",  # "broker" | "oracle"
        max_retries: int = 3,
        cost_logger: Optional[CostLogger] = None,
        train_rows: Optional[list] = None,
        few_shot_k: int = 3,
        few_shot_seed: int = 42,
    ):
        self.broker = broker
        self.nodes = nodes_by_db_id
        self.primary_model = primary_model
        self.prompt_strategy = prompt_strategy
        self.retrieval = retrieval
        self.masking = masking
        self.routing_mode = routing_mode
        self.max_retries = max_retries
        self.cost_logger = cost_logger
        self._zero_shot_tpl = load_prompt("zero_shot.txt")
        self._few_shot_tpl = load_prompt("few_shot.txt")
        self._self_correct_tpl = load_prompt("self_correction.txt")
        self._train_rows = train_rows or []
        self._train_by_db = index_train_by_db(self._train_rows) if self._train_rows else {}
        self._few_shot_k = few_shot_k
        self._rng = random.Random(few_shot_seed)

    # ── Routing ───────────────────────────────────────────────
    def _route(
        self, question: str, oracle_db_id: Optional[str]
    ) -> tuple[str, Optional[str], list]:
        if self.routing_mode == "oracle":
            assert oracle_db_id is not None, "oracle routing needs oracle_db_id"
            return oracle_db_id, None, []
        assert self.broker is not None, "broker routing needs a broker"
        ranking = self.broker.route(question)
        return ranking[0][0], ranking[0][0], ranking

    # ── Prompt construction ───────────────────────────────────
    def _build_prompt(
        self, question: str, schema: str, db_id_for_examples: str
    ) -> tuple[str, Optional[str]]:
        """Return ``(user_prompt, system_prompt_or_None)``."""
        if self.prompt_strategy == "zero_shot":
            return self._zero_shot_tpl.format(schema=schema, question=question), None
        if self.prompt_strategy == "few_shot":
            if not self._train_rows:
                # fall back to zero-shot if train rows not provided
                return self._zero_shot_tpl.format(schema=schema, question=question), None
            examples = build_few_shot_examples(
                self._train_rows,
                self._train_by_db,
                db_id_for_examples,
                self._few_shot_k,
                self._rng,
            )
            return (
                self._few_shot_tpl.format(
                    examples=format_examples_for_prompt(examples),
                    schema=schema,
                    question=question,
                ),
                None,
            )
        if self.prompt_strategy == "self_correction":
            # First attempt is zero-shot; correction kicks in on retry.
            return self._zero_shot_tpl.format(schema=schema, question=question), None
        raise ValueError(f"unknown prompt_strategy {self.prompt_strategy!r}")

    def _build_correction_prompt(
        self, question: str, schema: str, sql: str, error: str
    ) -> str:
        return self._self_correct_tpl.format(
            schema=schema, question=question, sql=sql, error=error
        )

    # ── Entry point ───────────────────────────────────────────
    def answer(
        self,
        question: str,
        *,
        oracle_db_id: Optional[str] = None,
        question_idx: Optional[int] = None,
    ) -> AnswerRecord:
        db_id_used, broker_pick, ranking = self._route(question, oracle_db_id)
        broker_correct = (
            (broker_pick == oracle_db_id) if (broker_pick is not None and oracle_db_id is not None) else None
        )

        if db_id_used not in self.nodes:
            # Unknown db_id (shouldn't happen if blurbs cover the eval set).
            # Try broker's #2 if available.
            for db_id, _ in ranking[1:]:
                if db_id in self.nodes:
                    db_id_used = db_id
                    break
            else:
                return AnswerRecord(
                    question_idx=question_idx,
                    db_id_gold=oracle_db_id,
                    db_id_used=db_id_used,
                    routing_mode=self.routing_mode,
                    broker_pick=broker_pick,
                    broker_correct=broker_correct,
                    masked_schema="",
                    masked_sql_final="",
                    real_sql_final="",
                    success=False,
                    rows_or_error=f"No node for {db_id_used!r}",
                    retries=0,
                    cost_usd_so_far=self.cost_logger.total_cost_usd if self.cost_logger else 0.0,
                )

        session = SessionState(db_id=db_id_used)
        node = self.nodes[db_id_used]
        masked_schema = node.retrieve_and_mask(
            question, session, retrieval=self.retrieval, masking=self.masking
        )

        re_picked = False
        # Wrong-node fallback: empty schema → re-pick top-2 (broker mode only)
        if (
            self.routing_mode == "broker"
            and node.has_returned_empty(session)
            and len(ranking) >= 2
        ):
            for alt_db, _ in ranking[1:]:
                if alt_db in self.nodes:
                    db_id_used = alt_db
                    node = self.nodes[db_id_used]
                    session = SessionState(db_id=db_id_used)
                    masked_schema = node.retrieve_and_mask(
                        question, session, retrieval=self.retrieval, masking=self.masking
                    )
                    re_picked = True
                    break

        prompt, system = self._build_prompt(question, masked_schema, db_id_used)
        # First attempt
        text, _usage = complete(
            messages=[{"role": "user", "content": prompt}],
            model=self.primary_model,
            system=system,
            cost_logger=self.cost_logger,
            question_idx=question_idx,
            db_id=db_id_used,
            retry_idx=0,
            note=self.prompt_strategy,
        )
        masked_sql = _strip_sql_response(text)

        ok, rows, real_sql = node.unmask_and_execute(masked_sql, session)
        retries = 0

        # Self-correction retries
        while not ok and retries < self.max_retries:
            retries += 1
            error_msg = str(rows)[:500]
            correction_prompt = self._build_correction_prompt(
                question, masked_schema, masked_sql, error_msg
            )
            text, _usage = complete(
                messages=[{"role": "user", "content": correction_prompt}],
                model=self.primary_model,
                cost_logger=self.cost_logger,
                question_idx=question_idx,
                db_id=db_id_used,
                retry_idx=retries,
                note="self_correction",
            )
            masked_sql = _strip_sql_response(text)
            ok, rows, real_sql = node.unmask_and_execute(masked_sql, session)

        return AnswerRecord(
            question_idx=question_idx,
            db_id_gold=oracle_db_id,
            db_id_used=db_id_used,
            routing_mode=self.routing_mode,
            broker_pick=broker_pick,
            broker_correct=broker_correct,
            masked_schema=masked_schema,
            masked_sql_final=masked_sql,
            real_sql_final=real_sql,
            success=ok,
            rows_or_error=rows if ok else str(rows)[:500],
            retries=retries,
            cost_usd_so_far=self.cost_logger.total_cost_usd if self.cost_logger else 0.0,
            re_picked=re_picked,
        )
