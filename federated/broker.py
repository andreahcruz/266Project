"""MacroRAG broker — routes a question to the right node by topic.

Embeds hand-written, schema-free node "blurbs" once at startup, then
cosine-similarity-ranks them against an embedded question. Returns top-k
candidates; caller decides whether top-1's confidence is high enough or
to fall back to top-2.
"""

from __future__ import annotations

import math
from pathlib import Path
from typing import Optional

from openai import OpenAI


def _cosine(a: list[float], b: list[float]) -> float:
    dot = sum(x * y for x, y in zip(a, b))
    na = math.sqrt(sum(x * x for x in a))
    nb = math.sqrt(sum(x * x for x in b))
    if na == 0 or nb == 0:
        return 0.0
    return dot / (na * nb)


class Broker:
    """Embeds blurbs at construction; routes by cosine on question embedding."""

    def __init__(
        self,
        blurbs_dir: Path,
        openai_client: OpenAI,
        embedding_model: str = "text-embedding-3-small",
        confidence_threshold: float = 0.30,
    ):
        self.openai_client = openai_client
        self.embedding_model = embedding_model
        self.confidence_threshold = confidence_threshold
        self.blurbs_dir = Path(blurbs_dir)
        self.db_ids: list[str] = []
        self.blurbs: dict[str, str] = {}
        self.embeddings: dict[str, list[float]] = {}
        self._load_and_embed()

    def _load_and_embed(self) -> None:
        files = sorted(self.blurbs_dir.glob("*.md"))
        if not files:
            raise FileNotFoundError(f"No .md blurbs in {self.blurbs_dir}")
        for f in files:
            db_id = f.stem
            self.db_ids.append(db_id)
            self.blurbs[db_id] = f.read_text(encoding="utf-8").strip()
        # Single batch call.
        texts = [self.blurbs[d] for d in self.db_ids]
        resp = self.openai_client.embeddings.create(model=self.embedding_model, input=texts)
        for db_id, item in zip(self.db_ids, resp.data):
            self.embeddings[db_id] = item.embedding

    def route(self, question: str) -> list[tuple[str, float]]:
        """Return list of ``(db_id, score)`` sorted by descending score."""
        q_emb = self.openai_client.embeddings.create(
            model=self.embedding_model, input=[question]
        ).data[0].embedding
        scored = [(db_id, _cosine(q_emb, self.embeddings[db_id])) for db_id in self.db_ids]
        scored.sort(key=lambda t: t[1], reverse=True)
        return scored

    def pick(self, question: str) -> tuple[str, float, list[tuple[str, float]]]:
        """Top-1 with confidence + full ranking. Caller decides on re-pick."""
        ranking = self.route(question)
        top_db, top_score = ranking[0]
        return top_db, top_score, ranking
