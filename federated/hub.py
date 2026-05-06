"""Hub orchestrator for the federated pipeline.

Routes a question through:

  question → broker (or oracle db_id)
           → Node.retrieve_and_mask
           → LLM with masked prompt
           → Node.unmask_and_execute
           → on error: self-correction retry with masked error (few-shot demos
             included when ``prompt_strategy`` is ``few_shot``)
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
from prompt_utils import load_prompt, sql_chat_system_prompt


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
    difficulty: Optional[str] = None
    model_used: Optional[str] = None
    retrieval_used: Optional[str] = None
    # Broker diagnostics / margin tie-break (oracle runs leave these falsy).
    embedding_top1_margin: Optional[float] = None
    routing_tiebreak_used: bool = False
    db_routing_correct: Optional[bool] = None
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
        mask_style: str = "hard",
        routing_mode: str = "broker",  # "broker" | "oracle"
        max_retries: int = 3,
        cost_logger: Optional[CostLogger] = None,
        train_rows: Optional[list] = None,
        few_shot_k: int = 3,
        few_shot_seed: int = 42,
        use_phrase_hints: bool = False,
        model_for_difficulty: Optional[dict[str, str]] = None,
        retrieval_for_difficulty: Optional[dict[str, str]] = None,
        top_k_tables: int = 4,
        top_n_columns: int = 6,
        broker_margin_delta: float = 0.07,
    ):
        self.broker = broker
        self.nodes = nodes_by_db_id
        self.primary_model = primary_model
        self.prompt_strategy = prompt_strategy
        self.retrieval = retrieval
        self.masking = masking
        self.mask_style = mask_style
        self.routing_mode = routing_mode
        self.max_retries = max_retries
        self.cost_logger = cost_logger
        self._zero_shot_tpl = load_prompt("zero_shot.txt")
        self._few_shot_tpl = load_prompt("few_shot.txt")
        self._few_shot_hints_tpl = load_prompt("few_shot_with_hints.txt")
        self._cot_tpl = load_prompt("chain_of_thought.txt")
        self._self_correct_tpl = load_prompt("self_correction.txt")
        self._few_shot_sc_tpl = load_prompt("few_shot_self_correction.txt")
        self._few_shot_hints_sc_tpl = load_prompt("few_shot_with_hints_self_correction.txt")
        self._train_rows = train_rows or []
        self._train_by_db = index_train_by_db(self._train_rows) if self._train_rows else {}
        self._few_shot_k = few_shot_k
        self._rng = random.Random(few_shot_seed)
        self.use_phrase_hints = use_phrase_hints
        # Optional difficulty→model map for cascade routing. When set, the Hub
        # picks the model for each question based on the precomputed difficulty
        # passed via answer(... difficulty=...). Falls back to primary_model
        # when difficulty is None or not in the dict.
        self.model_for_difficulty = model_for_difficulty or {}
        self.retrieval_for_difficulty = retrieval_for_difficulty or {}
        self.top_k_tables = top_k_tables
        self.top_n_columns = top_n_columns
        self.broker_margin_delta = broker_margin_delta
        self._system_primary_sql = sql_chat_system_prompt(masking=masking, correction=False)
        self._system_correction_sql = sql_chat_system_prompt(correction=True)

    # ── Routing ───────────────────────────────────────────────
    def _broker_resolve_with_optional_tiebreak(
        self, question: str
    ) -> tuple[str, str, list[tuple[str, float]], bool, Optional[float]]:
        """Return (db_id_used, embedding_top1_db_id, ranking, tiebreak_used, margin).

        ``broker_pick`` (embedding MacroRAG top-1) is always ``embedding_top1_db_id``.
        If blurb cosine margin is below ``broker_margin_delta``, each of the top-2
        nodes emits a lexical alignment scalar; we pick whichever is higher.

        Tie-break comparisons use only aggregates computed inside sovereign nodes —
        schema strings are not surfaced to the broker.
        """
        assert self.broker is not None
        ranking = self.broker.route(question)
        embed_top_db = ranking[0][0]
        top_sim = ranking[0][1]
        second_sim = ranking[1][1] if len(ranking) > 1 else None
        margin = (top_sim - second_sim) if second_sim is not None else None

        db_id_used = embed_top_db
        tiebreak_used = False

        if (
            margin is not None
            and second_sim is not None
            and len(ranking) >= 2
            and self.broker_margin_delta > 0
            and margin < self.broker_margin_delta
        ):
            a, b = ranking[0][0], ranking[1][0]
            na = self.nodes.get(a)
            nb = self.nodes.get(b)
            if na is not None and nb is not None:
                ta = na.routing_tiebreaker_score(question)
                tb = nb.routing_tiebreaker_score(question)
                tiebreak_used = True
                if tb > ta:
                    db_id_used = b

        return db_id_used, embed_top_db, ranking, tiebreak_used, margin

    # ── Prompt construction ───────────────────────────────────
    @staticmethod
    def _format_hints(hints: list[tuple[str, str]]) -> str:
        if not hints:
            return "(none)"
        lines = []
        for phrase, token in hints:
            if token.startswith("T"):
                lines.append(f'- table for "{phrase}" → {token}')
            else:
                lines.append(f'- column for "{phrase}" → {token}')
        return "\n".join(lines)

    def _build_prompt(
        self,
        question: str,
        schema: str,
        db_id_for_examples: str,
        hints: Optional[list[tuple[str, str]]] = None,
        *,
        few_shot_examples_formatted: Optional[str] = None,
    ) -> tuple[str, Optional[str]]:
        """Return ``(user_prompt, system_prompt)``."""
        sys_msg = self._system_primary_sql
        if self.prompt_strategy == "zero_shot":
            return self._zero_shot_tpl.format(schema=schema, question=question), sys_msg
        if self.prompt_strategy == "few_shot":
            if not self._train_rows:
                # fall back to zero-shot if train rows not provided
                return self._zero_shot_tpl.format(schema=schema, question=question), sys_msg
            if few_shot_examples_formatted is None:
                demos = build_few_shot_examples(
                    self._train_rows,
                    self._train_by_db,
                    db_id_for_examples,
                    self._few_shot_k,
                    self._rng,
                )
                few_shot_examples_formatted = format_examples_for_prompt(demos)
            if self.use_phrase_hints and hints is not None:
                return (
                    self._few_shot_hints_tpl.format(
                        examples=few_shot_examples_formatted,
                        schema=schema,
                        hints=self._format_hints(hints),
                        question=question,
                    ),
                    sys_msg,
                )
            return (
                self._few_shot_tpl.format(
                    examples=few_shot_examples_formatted,
                    schema=schema,
                    question=question,
                ),
                sys_msg,
            )
        if self.prompt_strategy == "self_correction":
            # First attempt is zero-shot; correction kicks in on retry.
            return self._zero_shot_tpl.format(schema=schema, question=question), sys_msg
        if self.prompt_strategy == "chain_of_thought":
            return self._cot_tpl.format(schema=schema, question=question), sys_msg
        raise ValueError(f"unknown prompt_strategy {self.prompt_strategy!r}")

    def _build_correction_prompt(
        self,
        question: str,
        schema: str,
        sql: str,
        error: str,
        db_id_for_examples: str,
        hints: Optional[list[tuple[str, str]]] = None,
        *,
        few_shot_examples_formatted: Optional[str] = None,
    ) -> str:
        """Retry prompt: same few-shot block as primary when strategy is few_shot."""
        if self.prompt_strategy == "few_shot" and self._train_rows:
            examples_block = few_shot_examples_formatted
            if examples_block is None:
                demos = build_few_shot_examples(
                    self._train_rows,
                    self._train_by_db,
                    db_id_for_examples,
                    self._few_shot_k,
                    self._rng,
                )
                examples_block = format_examples_for_prompt(demos)
            if self.use_phrase_hints and hints is not None:
                return self._few_shot_hints_sc_tpl.format(
                    examples=examples_block,
                    schema=schema,
                    hints=self._format_hints(hints),
                    question=question,
                    sql=sql,
                    error=error,
                )
            return self._few_shot_sc_tpl.format(
                examples=examples_block,
                schema=schema,
                question=question,
                sql=sql,
                error=error,
            )
        return self._self_correct_tpl.format(
            schema=schema, question=question, sql=sql, error=error
        )

    # ── Entry point ───────────────────────────────────────────
    def _model_for(self, difficulty: Optional[str]) -> str:
        """Resolve which LLM model to use for this question."""
        if difficulty and self.model_for_difficulty:
            return self.model_for_difficulty.get(difficulty, self.primary_model)
        return self.primary_model

    def _retrieval_for(self, difficulty: Optional[str]) -> str:
        """Resolve which retrieval mode to use for this question."""
        if difficulty and self.retrieval_for_difficulty:
            return self.retrieval_for_difficulty.get(difficulty, self.retrieval)
        return self.retrieval

    def answer(
        self,
        question: str,
        *,
        oracle_db_id: Optional[str] = None,
        question_idx: Optional[int] = None,
        difficulty: Optional[str] = None,
    ) -> AnswerRecord:
        embedding_top1_margin: Optional[float] = None
        routing_tiebreak_used = False
        ranking: list[tuple[str, float]] = []

        if self.routing_mode == "oracle":
            assert oracle_db_id is not None, "oracle routing needs oracle_db_id"
            db_id_used = oracle_db_id
            broker_pick: Optional[str] = None
            broker_correct = None
        else:
            db_id_used, broker_pick, ranking, routing_tiebreak_used, embedding_top1_margin = (
                self._broker_resolve_with_optional_tiebreak(question)
            )
            broker_correct = (
                (broker_pick == oracle_db_id)
                if (broker_pick is not None and oracle_db_id is not None)
                else None
            )

        db_routing_correct = (
            (db_id_used == oracle_db_id)
            if oracle_db_id is not None
            else None
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
                    embedding_top1_margin=embedding_top1_margin,
                    routing_tiebreak_used=routing_tiebreak_used,
                    db_routing_correct=db_routing_correct,
                )

        session = SessionState(db_id=db_id_used)
        node = self.nodes[db_id_used]
        retrieval_used = self._retrieval_for(difficulty)
        masked_schema = node.retrieve_and_mask(
            question,
            session,
            retrieval=retrieval_used,
            masking=self.masking,
            mask_style=self.mask_style,
            top_k_tables=self.top_k_tables,
            top_n_columns=self.top_n_columns,
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
                        question,
                        session,
                        retrieval=retrieval_used,
                        masking=self.masking,
                        mask_style=self.mask_style,
                        top_k_tables=self.top_k_tables,
                        top_n_columns=self.top_n_columns,
                    )
                    re_picked = True
                    break

        # Optionally compute phrase hints — node-side embedding match between
        # question content words and real column names. Only token IDs leak.
        hints: list[tuple[str, str]] = []
        if self.use_phrase_hints and self.masking:
            try:
                hints = node.compute_phrase_hints(question, session)
            except Exception as exc:  # noqa: BLE001
                # Hints are advisory; never fail the pipeline if they break.
                hints = []
                print(f"  [hints] {db_id_used}: {exc!r}")

        few_shot_block: Optional[str] = None
        if self.prompt_strategy == "few_shot" and self._train_rows:
            demos0 = build_few_shot_examples(
                self._train_rows,
                self._train_by_db,
                db_id_used,
                self._few_shot_k,
                self._rng,
            )
            few_shot_block = format_examples_for_prompt(demos0)

        prompt, system = self._build_prompt(
            question,
            masked_schema,
            db_id_used,
            hints=hints,
            few_shot_examples_formatted=few_shot_block,
        )
        # Resolve which model to use — cascade if difficulty is provided and
        # model_for_difficulty is set, otherwise primary_model.
        chosen_model = self._model_for(difficulty)
        # First attempt
        text, _usage = complete(
            messages=[{"role": "user", "content": prompt}],
            model=chosen_model,
            system=system,
            cost_logger=self.cost_logger,
            question_idx=question_idx,
            db_id=db_id_used,
            retry_idx=0,
            note=f"{self.prompt_strategy}|diff={difficulty or 'na'}",
        )
        masked_sql = _strip_sql_response(text)

        ok, rows, real_sql = node.unmask_and_execute(masked_sql, session)
        retries = 0

        # Self-correction retries (use the same chosen_model as the first attempt)
        while not ok and retries < self.max_retries:
            retries += 1
            error_msg = str(rows)[:500]
            correction_prompt = self._build_correction_prompt(
                question,
                masked_schema,
                masked_sql,
                error_msg,
                db_id_used,
                hints=hints,
                few_shot_examples_formatted=few_shot_block,
            )
            sc_note = (
                "self_correction_few_shot|diff="
                if self.prompt_strategy == "few_shot" and self._train_rows
                else "self_correction|diff="
            )
            text, _usage = complete(
                messages=[{"role": "user", "content": correction_prompt}],
                model=chosen_model,
                system=self._system_correction_sql,
                cost_logger=self.cost_logger,
                question_idx=question_idx,
                db_id=db_id_used,
                retry_idx=retries,
                note=f"{sc_note}{difficulty or 'na'}",
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
            difficulty=difficulty,
            model_used=chosen_model,
            retrieval_used=retrieval_used,
            embedding_top1_margin=embedding_top1_margin,
            routing_tiebreak_used=routing_tiebreak_used,
            db_routing_correct=db_routing_correct,
        )
