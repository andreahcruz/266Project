"""Per-call cost + token logger.

Appends one JSON line per LLM call to ``runs/<experiment_id>/calls.jsonl``.
The aggregator reads these to fill the ablation table.
"""

from __future__ import annotations

import json
import time
from dataclasses import asdict, dataclass, field
from pathlib import Path
from typing import Optional

from config import RUNS_DIR


# Pricing in USD per 1M tokens. Cerebras free-tier = 0.
# Update if Anthropic / OpenAI changes pricing.
PRICING_PER_MTOK = {
    "claude-haiku-4-5-20251001": {"in": 1.0, "out": 5.0},
    "claude-sonnet-4-6": {"in": 3.0, "out": 15.0},
    "gpt-4o": {"in": 2.5, "out": 10.0},
    "gpt-5.2": {"in": 1.75, "out": 14.0},
    "gpt-5.4-mini": {"in": 0.15, "out": 0.60},
    "llama3.1-8b": {"in": 0.0, "out": 0.0},  # Cerebras free tier
    "gpt-oss-120b": {"in": 0.0, "out": 0.0},
}


def estimate_cost_usd(model: str, prompt_tokens: int, completion_tokens: int) -> float:
    rates = PRICING_PER_MTOK.get(model, {"in": 0.0, "out": 0.0})
    return (prompt_tokens * rates["in"] + completion_tokens * rates["out"]) / 1_000_000


@dataclass
class CallRecord:
    ts: float
    experiment_id: str
    question_idx: Optional[int]
    db_id: Optional[str]
    model: str
    prompt_tokens: int
    completion_tokens: int
    cost_usd: float
    latency_ms: int
    retry_idx: int = 0
    escalated: bool = False
    note: str = ""


class CostLogger:
    """Append-only JSONL writer scoped to one experiment_id."""

    def __init__(self, experiment_id: str, runs_dir: Path = RUNS_DIR, cost_cap_usd: Optional[float] = None):
        self.experiment_id = experiment_id
        self.dir = Path(runs_dir) / experiment_id
        self.dir.mkdir(parents=True, exist_ok=True)
        self.path = self.dir / "calls.jsonl"
        self.cost_cap_usd = cost_cap_usd
        self.total_cost_usd = self._sum_existing_cost()

    def _sum_existing_cost(self) -> float:
        if not self.path.exists():
            return 0.0
        total = 0.0
        with open(self.path) as f:
            for line in f:
                line = line.strip()
                if not line:
                    continue
                try:
                    total += json.loads(line).get("cost_usd", 0.0)
                except json.JSONDecodeError:
                    continue
        return total

    def log(
        self,
        *,
        model: str,
        prompt_tokens: int,
        completion_tokens: int,
        latency_ms: int,
        question_idx: Optional[int] = None,
        db_id: Optional[str] = None,
        retry_idx: int = 0,
        escalated: bool = False,
        note: str = "",
    ) -> CallRecord:
        cost = estimate_cost_usd(model, prompt_tokens, completion_tokens)
        rec = CallRecord(
            ts=time.time(),
            experiment_id=self.experiment_id,
            question_idx=question_idx,
            db_id=db_id,
            model=model,
            prompt_tokens=prompt_tokens,
            completion_tokens=completion_tokens,
            cost_usd=cost,
            latency_ms=latency_ms,
            retry_idx=retry_idx,
            escalated=escalated,
            note=note,
        )
        with open(self.path, "a") as f:
            f.write(json.dumps(asdict(rec)) + "\n")
        self.total_cost_usd += cost
        if self.cost_cap_usd is not None and self.total_cost_usd > self.cost_cap_usd:
            raise CostCapExceeded(
                f"Cost cap ${self.cost_cap_usd:.2f} exceeded for experiment "
                f"{self.experiment_id}: now ${self.total_cost_usd:.4f}"
            )
        return rec


class CostCapExceeded(RuntimeError):
    pass
