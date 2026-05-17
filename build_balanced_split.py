"""Build a deterministic balanced Spider test split over a chosen number of DBs.

Example::

    python build_balanced_split.py \
        --difficulty-json test_difficulty_all.json \
        --target-dbs 32 \
        --per-difficulty 80 \
        --output balanced_test_indices_32db_80x4.json
"""

from __future__ import annotations

import argparse
import json
import math
from collections import Counter, defaultdict
from pathlib import Path

from config import BASE_DIR, TEST_JSON


def parse_args() -> argparse.Namespace:
    p = argparse.ArgumentParser()
    p.add_argument("--difficulty-json", required=True)
    p.add_argument("--target-dbs", type=int, default=32)
    p.add_argument("--per-difficulty", type=int, default=80)
    p.add_argument("--output", required=True)
    return p.parse_args()


def _pick_target_dbs(
    questions: list[dict],
    difficulty_by_idx: dict[int, str],
    target_dbs: int,
) -> list[str]:
    stats: dict[str, Counter] = defaultdict(Counter)
    for idx, q in enumerate(questions):
        diff = difficulty_by_idx.get(idx)
        if diff is None:
            continue
        stats[q["db_id"]][diff] += 1
        stats[q["db_id"]]["total"] += 1

    ranked = sorted(
        stats.items(),
        key=lambda item: (
            -sum(1 for diff in ("easy", "medium", "hard", "extra") if item[1].get(diff, 0) > 0),
            -item[1]["total"],
            item[0],
        ),
    )
    chosen = [db_id for db_id, _counts in ranked[:target_dbs]]
    if len(chosen) < target_dbs:
        raise SystemExit(f"Only found {len(chosen)} DBs with difficulty labels; need {target_dbs}.")
    return chosen


def _seed_one_per_db(
    selected_dbs: list[str],
    by_diff_db: dict[str, dict[str, list[int]]],
    remaining: Counter,
    picked: set[int],
) -> list[int]:
    seed: list[int] = []
    for db_id in selected_dbs:
        best_diff = None
        best_key = None
        for diff in ("easy", "medium", "hard", "extra"):
            candidates = [idx for idx in by_diff_db[diff].get(db_id, []) if idx not in picked]
            if not candidates or remaining[diff] <= 0:
                continue
            key = (remaining[diff], len(candidates), -candidates[0])
            if best_key is None or key > best_key:
                best_key = key
                best_diff = diff
        if best_diff is None:
            raise SystemExit(f"Could not seed db {db_id}; not enough remaining quota.")
        idx = next(i for i in by_diff_db[best_diff][db_id] if i not in picked)
        picked.add(idx)
        remaining[best_diff] -= 1
        seed.append(idx)
    return seed


def _fill_remaining(
    selected_dbs: list[str],
    by_diff_db: dict[str, dict[str, list[int]]],
    remaining: Counter,
    picked: set[int],
) -> list[int]:
    chosen: list[int] = []
    for diff in ("easy", "medium", "hard", "extra"):
        while remaining[diff] > 0:
            progressed = False
            for db_id in selected_dbs:
                candidates = by_diff_db[diff].get(db_id, [])
                idx = next((i for i in candidates if i not in picked), None)
                if idx is None:
                    continue
                picked.add(idx)
                chosen.append(idx)
                remaining[diff] -= 1
                progressed = True
                if remaining[diff] <= 0:
                    break
            if not progressed:
                raise SystemExit(f"Not enough {diff} questions to satisfy requested quota.")
    return chosen


def main() -> None:
    args = parse_args()
    questions = json.loads(Path(TEST_JSON).read_text())
    raw = json.loads(Path(args.difficulty_json).read_text())
    difficulty_by_idx = {int(k): v for k, v in raw.items()}

    selected_dbs = _pick_target_dbs(questions, difficulty_by_idx, args.target_dbs)
    by_diff_db: dict[str, dict[str, list[int]]] = {
        diff: defaultdict(list) for diff in ("easy", "medium", "hard", "extra")
    }
    for idx, q in enumerate(questions):
        db_id = q["db_id"]
        diff = difficulty_by_idx.get(idx)
        if db_id in selected_dbs and diff in by_diff_db:
            by_diff_db[diff][db_id].append(idx)

    remaining = Counter({diff: args.per_difficulty for diff in ("easy", "medium", "hard", "extra")})
    picked: set[int] = set()
    indices = []
    indices.extend(_seed_one_per_db(selected_dbs, by_diff_db, remaining, picked))
    indices.extend(_fill_remaining(selected_dbs, by_diff_db, remaining, picked))

    counts = Counter(difficulty_by_idx[idx] for idx in indices)
    db_counts = Counter(questions[idx]["db_id"] for idx in indices)
    out = {
        "indices": indices,
        "db_ids": selected_dbs,
        "difficulty_counts": dict(counts),
        "db_count": len(db_counts),
        "questions_per_db": dict(sorted(db_counts.items())),
    }
    out_path = Path(args.output)
    out_path.write_text(json.dumps(out, indent=2))

    print(f"Wrote {len(indices)} indices to {out_path}")
    print(f"DB count: {len(db_counts)}")
    print(f"Difficulty counts: {dict(counts)}")
    print(f"Selected DBs: {selected_dbs}")


if __name__ == "__main__":
    main()
