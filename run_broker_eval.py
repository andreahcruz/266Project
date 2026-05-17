"""Phase 2 deliverable: broker routing accuracy on the 320 split.

No LLM calls — only one OpenAI embedding call per question. Reports top-1
and top-2 accuracy and prints the most-confused DB pairs.
"""

from __future__ import annotations

import argparse
import json
from collections import Counter
from pathlib import Path

from openai import OpenAI

from config import (
    BASE_DIR,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_JSON,
)
from federated.broker import Broker


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--smart-routing", action="store_true",
                   help="Enable broker keyword biasing and low-margin override.")
    return p.parse_args()


def main():
    args = parse_args()
    questions = json.load(open(TEST_JSON))
    indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    eval_qs = [questions[i] for i in indices]

    client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    broker = Broker(
        blurbs_dir=BASE_DIR / "federated" / "blurbs",
        openai_client=client,
    )

    # Sanity: blurbs cover every db_id we'll see
    db_ids_in_eval = {q["db_id"] for q in eval_qs}
    missing = db_ids_in_eval - set(broker.db_ids)
    if missing:
        raise SystemExit(f"Missing blurbs for: {missing}")

    top1_hits = 0
    top2_hits = 0
    confusions: Counter = Counter()  # (gold, predicted) when predicted != gold
    by_difficulty: dict[str, dict] = {}
    score_records = []

    for q in eval_qs:
        gold_db = q["db_id"]
        question = q["question"]
        ranking_details = broker.route_with_details(question)
        top1 = ranking_details[0].db_id
        top2_detail = ranking_details[1] if len(ranking_details) > 1 else None
        if (
            args.smart_routing
            and top2_detail is not None
            and (ranking_details[0].score - top2_detail.score) <= broker.low_margin_threshold
            and top2_detail.bonus > ranking_details[0].bonus
        ):
            top1 = top2_detail.db_id
        top2 = {r.db_id for r in ranking_details[:2]}
        top2_score = top2_detail.score if top2_detail is not None else 0.0
        score_records.append((gold_db, top1, ranking_details[0].score, top2_score))
        if top1 == gold_db:
            top1_hits += 1
        else:
            confusions[(gold_db, top1)] += 1
        if gold_db in top2:
            top2_hits += 1

    n = len(eval_qs)
    print(f"\n=== Broker routing accuracy on {n} questions ===")
    print(f"top-1: {top1_hits}/{n} = {top1_hits/n:.1%}")
    print(f"top-2: {top2_hits}/{n} = {top2_hits/n:.1%}")
    print()
    print("Most-confused (gold → predicted):")
    for (g, p), c in confusions.most_common(10):
        print(f"  {g}  →  {p}  ({c}×)")

    # Per-DB recall
    print("\nPer-DB top-1 accuracy:")
    by_db_correct: Counter = Counter()
    by_db_total: Counter = Counter()
    for q, rec in zip(eval_qs, score_records):
        by_db_total[q["db_id"]] += 1
        if rec[1] == q["db_id"]:
            by_db_correct[q["db_id"]] += 1
    for db in sorted(by_db_total):
        c = by_db_correct[db]
        t = by_db_total[db]
        print(f"  {db}: {c}/{t} = {c/t:.0%}")

    # Save CSV
    out_path = BASE_DIR / "runs" / "_broker" / "routing.csv"
    out_path.parent.mkdir(parents=True, exist_ok=True)
    with open(out_path, "w") as f:
        f.write("gold_db,pred_db,top1_score,top2_score,correct\n")
        for gold, pred, s1, s2 in score_records:
            f.write(f"{gold},{pred},{s1:.4f},{s2:.4f},{int(gold==pred)}\n")
    print(f"\nWrote per-question routing to {out_path}")


if __name__ == "__main__":
    main()
