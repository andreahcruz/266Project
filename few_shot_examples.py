"""Build few-shot demonstration blocks from Spider train_spider.json."""

from __future__ import annotations

import json
import random
from collections import defaultdict
from pathlib import Path
from typing import Any


def load_train_spider(path: Path | str) -> list[dict[str, Any]]:
    with open(path, encoding="utf-8") as f:
        return json.load(f)


def index_train_by_db(train_rows: list[dict]) -> dict[str, list[int]]:
    """Map db_id -> list of row indices in train_rows (order preserved)."""
    by_db: dict[str, list[int]] = defaultdict(list)
    for i, row in enumerate(train_rows):
        by_db[row["db_id"]].append(i)
    return dict(by_db)


def format_examples_for_prompt(examples: list[dict]) -> str:
    """Format train rows (question + query) for the few_shot.txt template."""
    parts = []
    for i, ex in enumerate(examples, start=1):
        q = ex["question"].strip()
        sql = ex["query"].strip().rstrip(";")
        parts.append(f"Example {i} (database `{ex['db_id']}`):\nQuestion: {q}\nSQL: {sql}")
    return "\n\n".join(parts)


def build_few_shot_examples(
    train_rows: list[dict],
    by_db_indices: dict[str, list[int]],
    db_id: str,
    k: int,
    rng: random.Random,
) -> list[dict]:
    """Pick up to k train examples: same-db first, then random fill from the rest."""
    if k <= 0:
        return []

    same_idx = list(by_db_indices.get(db_id, []))
    picked: list[int] = same_idx[:k]

    if len(picked) >= k:
        return [train_rows[i] for i in picked[:k]]

    need = k - len(picked)
    picked_set = set(picked)
    pool = [i for i in range(len(train_rows)) if i not in picked_set]
    if not pool:
        return [train_rows[i] for i in picked]

    take = min(need, len(pool))
    extra = rng.sample(pool, take)
    picked.extend(extra)
    return [train_rows[i] for i in picked]
