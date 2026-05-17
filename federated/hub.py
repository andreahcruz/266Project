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
    annotate_train_sql_features,
    build_few_shot_examples,
    format_examples_for_prompt,
    index_train_by_db,
    load_train_spider,
)
from prompt_utils import load_prompt
from semantic_guidance import tag_question


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
        few_shot_k_hard_extra: Optional[int] = None,
        few_shot_seed: int = 42,
        use_phrase_hints: bool = False,
        phrase_hint_threshold: float = 0.40,
        phrase_hint_max: int = 8,
        phrase_hint_threshold_hard_extra: Optional[float] = None,
        phrase_hint_max_hard_extra: Optional[int] = None,
        model_for_difficulty: Optional[dict[str, str]] = None,
        retrieval_for_difficulty: Optional[dict[str, str]] = None,
        top_k_tables: int = 4,
        top_n_columns: int = 6,
        broker_smart_routing: bool = False,
        few_shot_family_match: bool = False,
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
        self._train_rows = train_rows or []
        if self._train_rows:
            annotate_train_sql_features(self._train_rows)
        self._train_by_db = index_train_by_db(self._train_rows) if self._train_rows else {}
        self._few_shot_k = few_shot_k
        self._few_shot_k_hard_extra = few_shot_k_hard_extra or few_shot_k
        self._rng = random.Random(few_shot_seed)
        self.use_phrase_hints = use_phrase_hints
        self.phrase_hint_threshold = phrase_hint_threshold
        self.phrase_hint_max = phrase_hint_max
        self.phrase_hint_threshold_hard_extra = (
            phrase_hint_threshold_hard_extra
            if phrase_hint_threshold_hard_extra is not None
            else phrase_hint_threshold
        )
        self.phrase_hint_max_hard_extra = (
            phrase_hint_max_hard_extra
            if phrase_hint_max_hard_extra is not None
            else phrase_hint_max
        )
        # Optional difficulty→model map for cascade routing. When set, the Hub
        # picks the model for each question based on the precomputed difficulty
        # passed via answer(... difficulty=...). Falls back to primary_model
        # when difficulty is None or not in the dict.
        self.model_for_difficulty = model_for_difficulty or {}
        self.retrieval_for_difficulty = retrieval_for_difficulty or {}
        self.top_k_tables = top_k_tables
        self.top_n_columns = top_n_columns
        self.broker_smart_routing = broker_smart_routing
        self.few_shot_family_match = few_shot_family_match

    # ── Routing ───────────────────────────────────────────────
    def _route(
        self, question: str, oracle_db_id: Optional[str]
    ) -> tuple[str, Optional[str], list, dict]:
        if self.routing_mode == "oracle":
            assert oracle_db_id is not None, "oracle routing needs oracle_db_id"
            return oracle_db_id, None, [], {}
        assert self.broker is not None, "broker routing needs a broker"
        ranking_details = self.broker.route_with_details(question)
        ranking = [(item.db_id, item.score) for item in ranking_details]
        top1 = ranking_details[0]
        top2 = ranking_details[1] if len(ranking_details) > 1 else None
        chosen = top1
        override_reason = ""
        margin = top1.score - top2.score if top2 is not None else None
        if (
            self.broker_smart_routing
            and top2 is not None
            and margin is not None
            and margin <= self.broker.low_margin_threshold
            and top2.bonus > top1.bonus
        ):
            chosen = top2
            override_reason = "low_margin_keyword_override"
        elif self.broker_smart_routing:
            # When the embedding winner has no lexical support but a nearby
            # candidate does, prefer the lexically grounded option.
            strong_alt = None
            for cand in ranking_details[1:4]:
                score_gap = top1.score - cand.score
                if score_gap > 0.12:
                    continue
                if cand.bonus < 0.10:
                    continue
                if top1.bonus >= cand.bonus:
                    continue
                if strong_alt is None or (cand.bonus, cand.score) > (strong_alt.bonus, strong_alt.score):
                    strong_alt = cand
            if strong_alt is not None:
                chosen = strong_alt
                override_reason = "strong_keyword_recovery"
        meta = {
            "broker_top1_score": top1.score,
            "broker_top1_raw": top1.raw_score,
            "broker_top1_bonus": top1.bonus,
            "broker_top1_rules": ",".join(top1.matched_rules),
            "broker_top2": top2.db_id if top2 is not None else "",
            "broker_top2_score": top2.score if top2 is not None else None,
            "broker_top2_raw": top2.raw_score if top2 is not None else None,
            "broker_top2_bonus": top2.bonus if top2 is not None else None,
            "broker_top2_rules": ",".join(top2.matched_rules) if top2 is not None else "",
            "broker_margin": margin,
            "broker_override": chosen.db_id != top1.db_id,
            "broker_override_reason": override_reason,
        }
        return chosen.db_id, top1.db_id, ranking, meta

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
        difficulty: Optional[str] = None,
    ) -> tuple[str, Optional[str], dict]:
        """Return ``(user_prompt, system_prompt_or_None, prompt_meta)``."""
        if self.prompt_strategy == "zero_shot":
            return self._zero_shot_tpl.format(schema=schema, question=question), None, {}
        if self.prompt_strategy == "few_shot":
            if not self._train_rows:
                # fall back to zero-shot if train rows not provided
                return self._zero_shot_tpl.format(schema=schema, question=question), None, {}
            chosen_k = (
                self._few_shot_k_hard_extra
                if difficulty in {"hard", "extra"}
                else self._few_shot_k
            )
            examples = build_few_shot_examples(
                self._train_rows,
                self._train_by_db,
                db_id_for_examples,
                chosen_k,
                self._rng,
                question=question,
                target_sql_features=(
                    tag_question(question, difficulty).target_sql_features
                    if self.few_shot_family_match and difficulty in {"hard", "extra"}
                    else None
                ),
            )
            prompt_meta = {
                "few_shot_example_ids": ",".join(str(ex.get("_train_idx", "")) for ex in examples),
                "few_shot_example_dbs": ",".join(ex["db_id"] for ex in examples),
                "few_shot_k_used": chosen_k,
            }
            if self.use_phrase_hints and hints is not None:
                return (
                    self._few_shot_hints_tpl.format(
                        examples=format_examples_for_prompt(examples),
                        schema=schema,
                        hints=self._format_hints(hints),
                        question=question,
                    ),
                    None,
                    prompt_meta,
                )
            return (
                self._few_shot_tpl.format(
                    examples=format_examples_for_prompt(examples),
                    schema=schema,
                    question=question,
                ),
                None,
                prompt_meta,
            )
        if self.prompt_strategy == "self_correction":
            # First attempt is zero-shot; correction kicks in on retry.
            return self._zero_shot_tpl.format(schema=schema, question=question), None, {}
        if self.prompt_strategy == "chain_of_thought":
            return self._cot_tpl.format(schema=schema, question=question), None, {}
        raise ValueError(f"unknown prompt_strategy {self.prompt_strategy!r}")

    def _build_correction_prompt(
        self, question: str, schema: str, sql: str, error: str
    ) -> str:
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
        db_id_used, broker_pick, ranking, route_meta = self._route(question, oracle_db_id)
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
                if difficulty in {"hard", "extra"}:
                    hint_threshold = self.phrase_hint_threshold_hard_extra
                    hint_max = self.phrase_hint_max_hard_extra
                else:
                    hint_threshold = self.phrase_hint_threshold
                    hint_max = self.phrase_hint_max
                hints = node.compute_phrase_hints(
                    question,
                    session,
                    sim_threshold=hint_threshold,
                    max_hints=hint_max,
                )
            except Exception as exc:  # noqa: BLE001
                hints = []
                print(f"  [hints] {db_id_used}: {exc!r}")

        prompt, system, prompt_meta = self._build_prompt(
            question,
            masked_schema,
            db_id_used,
            hints=hints,
            difficulty=difficulty,
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
                question, masked_schema, masked_sql, error_msg
            )
            text, _usage = complete(
                messages=[{"role": "user", "content": correction_prompt}],
                model=chosen_model,
                cost_logger=self.cost_logger,
                question_idx=question_idx,
                db_id=db_id_used,
                retry_idx=retries,
                note=f"self_correction|diff={difficulty or 'na'}",
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
            extras={**route_meta, **prompt_meta},
        )
