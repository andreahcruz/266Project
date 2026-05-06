"""MacroRAG broker diagnostics: embedding top-1 accuracy and confusion vs gold DB.

Reads the same stratified Spider test indices as federated eval, compares
Broker.route() top-1 against gold ``db_id``, and optionally simulates the
privacy-preserving lexical tie-break used by the Hub (top-2 only).

Examples::

    python broker_routing_report.py
    python broker_routing_report.py --with-tiebreak --broker-margin-delta 0.07
    python broker_routing_report.py --csv-out routing_confusion_pairs.csv
    python broker_routing_report.py --with-tiebreak --mistakes-tsv routing_mistakes.tsv
    python broker_routing_report.py --with-tiebreak --margin-sweep 0.03,0.05,0.07,0.09
    .\\.venv\\Scripts\\python.exe broker_routing_report.py --limit 5

No schema text leaves nodes; tie-break compares only lexical scores computed
inside each candidate node when margin < delta.
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from collections import defaultdict
from dataclasses import dataclass
from pathlib import Path

from openai import OpenAI

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import (
    BASE_DIR,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TEST_DATABASE_DIR,
    TEST_JSON,
    TEST_TABLES_JSON,
)
from federated.broker import Broker
from federated.node import Node

# Keep in sync with ``DB_IDS_IN_SPLIT`` in ``run_federated_eval.py`` — defined
# here so this script never imports ``run_federated_eval`` (which pulls Chroma).
DB_IDS_IN_SPLIT = [
    "e_commerce",
    "customers_and_orders",
    "vehicle_driver",
    "soccer_3",
    "online_exams",
    "cre_Students_Information_Systems",
    "bbc_channels",
    "tv_shows",
    "government_shift",
    "vehicle_rent",
    "region_building",
]


@dataclass
class _RouteRow:
    """One question's broker ranking + optional top-2 lexical scores (tie-break replay)."""

    test_idx: int
    gold_db: str
    question: str
    top1_db: str
    top2_db: str
    margin: float
    lex_pair: tuple[float, float] | None


def _resolve_with_delta(row: _RouteRow, delta: float, with_tiebreak: bool) -> str:
    """Same rule as ``Hub``: ``margin < delta`` then lexical pick among top-2."""
    if not with_tiebreak or delta <= 0 or not row.top2_db:
        return row.top1_db
    if row.margin >= delta:
        return row.top1_db
    if row.lex_pair is None:
        return row.top1_db
    ta, tb = row.lex_pair
    if tb > ta:
        return row.top2_db
    return row.top1_db


def load_eval_pairs(indices_path: Path | None) -> list[tuple[int, str, str]]:
    questions = json.loads(Path(TEST_JSON).read_text(encoding="utf-8"))
    if indices_path and indices_path.exists():
        raw = json.loads(indices_path.read_text(encoding="utf-8"))
        idxs = raw if isinstance(raw, list) else raw["indices"]
    else:
        idxs = json.loads(
            (BASE_DIR / "balanced_test_indices_80x4.json").read_text(encoding="utf-8")
        )["indices"]
    out = []
    for i in idxs:
        q = questions[int(i)]
        out.append((int(i), q["db_id"], q["question"]))
    return out


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--indices-from", default=None, help="JSON list or {indices:[...]}")
    p.add_argument("--with-tiebreak", action="store_true", help="Simulate lexical top-2 tie-break")
    p.add_argument(
        "--blurbs-dir",
        default=None,
        help="Directory containing per-db_id .md blurbs (default: BASE_DIR/federated/blurbs).",
    )
    p.add_argument(
        "--broker-margin-delta",
        type=float,
        default=0.07,
        help="Trigger tie-break when (sim_top1 - sim_top2) < delta (embedding cosine).",
    )
    p.add_argument("--csv-out", default=None, help="Write (gold,predicted,count) confusion pairs")
    p.add_argument("--json-out", default=None, help="Write full numeric summary JSON")
    p.add_argument(
        "--limit",
        type=int,
        default=None,
        help="Only route the first N questions (smoke test).",
    )
    p.add_argument(
        "--progress-every",
        type=int,
        default=20,
        help="Print a progress line every N questions (default: 20).",
    )
    p.add_argument(
        "--mistakes-tsv",
        default=None,
        help="Write one row per wrong resolved prediction (gold, pred, margin, tie-break, question).",
    )
    p.add_argument(
        "--margin-sweep",
        default=None,
        help="Comma-separated deltas to evaluate after a single embedding pass (requires --with-tiebreak). "
        "Prints a table and does not change Hub; use the best --broker-margin-delta for real runs.",
    )
    args = p.parse_args()
    sweep_deltas: list[float] = []
    if args.margin_sweep:
        for part in args.margin_sweep.split(","):
            part = part.strip()
            if not part:
                continue
            sweep_deltas.append(float(part))
        sweep_deltas = sorted(set(sweep_deltas))
        if sweep_deltas and not args.with_tiebreak:
            p.error("--margin-sweep requires --with-tiebreak")

    indices_path = Path(args.indices_from) if args.indices_from else None
    pairs = load_eval_pairs(indices_path)
    if args.limit is not None:
        pairs = pairs[: max(0, args.limit)]
    n = len(pairs)

    print(
        "[broker_routing_report] Starting: this script calls the OpenAI embeddings API "
        f"once per question ({n} calls) — it can take several minutes with no output unless "
        f"--progress-every is used.",
        flush=True,
    )

    client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    blurbs_dir = Path(args.blurbs_dir) if args.blurbs_dir else (BASE_DIR / "federated" / "blurbs")
    print("[broker_routing_report] Loading blurbs and embedding node descriptions ...", flush=True)
    broker = Broker(blurbs_dir, client)
    print("[broker_routing_report] Broker ready. Routing questions ...", flush=True)

    from schema_loader import load_tables

    tables_data = load_tables(TEST_TABLES_JSON)
    nodes = {
        db: Node(db, tables_data, TEST_DATABASE_DIR, client, vector_index=None)
        for db in DB_IDS_IN_SPLIT
    }

    correct_embed = 0
    correct_resolved = 0
    confusion: dict[tuple[str, str], int] = defaultdict(int)
    tiebreak_triggers = 0
    tb_fixes = 0
    mistake_rows: list[dict] = []
    cached_rows: list[_RouteRow] = []

    max_lex_margin = 0.0
    if args.with_tiebreak:
        max_lex_margin = max(args.broker_margin_delta, max(sweep_deltas) if sweep_deltas else 0.0)

    pe = max(1, int(args.progress_every))
    for i, (test_idx, gold_db, question) in enumerate(pairs, start=1):
        ranking = broker.route(question)
        top1_db = ranking[0][0]
        top2_db = ranking[1][0] if len(ranking) > 1 else ""
        embed_ok = top1_db == gold_db
        correct_embed += int(embed_ok)

        margin = ranking[0][1] - ranking[1][1] if len(ranking) > 1 else 1.0
        lex_pair: tuple[float, float] | None = None
        if (
            args.with_tiebreak
            and max_lex_margin > 0
            and len(ranking) >= 2
            and margin < max_lex_margin
        ):
            a, b = ranking[0][0], ranking[1][0]
            na, nb = nodes.get(a), nodes.get(b)
            if na and nb:
                ta = na.routing_tiebreaker_score(question)
                tb = nb.routing_tiebreaker_score(question)
                lex_pair = (ta, tb)

        cached_rows.append(
            _RouteRow(
                test_idx=test_idx,
                gold_db=gold_db,
                question=question,
                top1_db=top1_db,
                top2_db=top2_db,
                margin=margin,
                lex_pair=lex_pair,
            )
        )

        resolved = _resolve_with_delta(cached_rows[-1], args.broker_margin_delta, args.with_tiebreak)
        tie_used = int(
            args.with_tiebreak
            and args.broker_margin_delta > 0
            and bool(top2_db)
            and margin < args.broker_margin_delta
        )
        lex_a, lex_b = ("", "")
        if tie_used and lex_pair is not None:
            lex_a, lex_b = f"{lex_pair[0]:.4f}", f"{lex_pair[1]:.4f}"

        if tie_used:
            tiebreak_triggers += 1

        res_ok = resolved == gold_db
        if args.with_tiebreak and res_ok and not embed_ok:
            tb_fixes += 1

        correct_resolved += int(res_ok)
        confusion[(gold_db, resolved)] += 1

        if args.mistakes_tsv and not res_ok:
            mistake_rows.append(
                {
                    "test_idx": test_idx,
                    "gold_db": gold_db,
                    "predicted_db": resolved,
                    "embed_top1": top1_db,
                    "embed_top1_ok": int(embed_ok),
                    "top2_db": top2_db,
                    "margin": f"{margin:.6f}",
                    "tiebreak": tie_used,
                    "lex_scores": f"{lex_a}|{lex_b}" if tie_used else "",
                    "question": question,
                }
            )

        if i % pe == 0 or i == n:
            print(f"  [broker_routing_report] {i}/{n} questions routed", flush=True)

    if args.with_tiebreak and sweep_deltas:
        print("\n[broker_routing_report] Margin sweep (same embeddings; privacy unchanged — no new schema exit):")
        print(f"{'delta':>8}  {'accuracy':>10}  {'correct':>8}  {'tiebreaks':>10}  {'tb_fixes':>8}")
        rows_n = len(cached_rows)
        best_ok = -1
        best_mistakes = rows_n + 1
        best_delta = sweep_deltas[0]
        for d in sweep_deltas:
            ok = 0
            tb_cnt = 0
            fixes = 0
            for row in cached_rows:
                pred = _resolve_with_delta(row, d, True)
                gold = row.gold_db
                if pred == gold:
                    ok += 1
                if d > 0 and row.top2_db and row.margin < d:
                    tb_cnt += 1
                if row.top1_db != gold and pred == gold and d > 0 and row.top2_db and row.margin < d:
                    fixes += 1
            frac = ok / rows_n if rows_n else 0.0
            mistakes = rows_n - ok
            print(f"{d:8g}  {frac:10.4f}  {ok:8d}  {tb_cnt:10d}  {fixes:8d}")
            if ok > best_ok or (ok == best_ok and mistakes < best_mistakes):
                best_ok = ok
                best_mistakes = mistakes
                best_delta = d
        print(
            f"[broker_routing_report] Best in sweep: broker_margin_delta={best_delta:g} "
            f"({best_ok}/{rows_n} correct, {best_mistakes} mistakes)"
        )

    frac = lambda c: round(c / n, 4) if n else 0.0
    summary = {
        "n_questions": n,
        "embedding_top1_accuracy": frac(correct_embed),
        "embedding_top1_correct": correct_embed,
        "resolved_accuracy_with_tiebreak": frac(correct_resolved)
        if args.with_tiebreak
        else None,
        "resolved_correct_with_tiebreak": correct_resolved if args.with_tiebreak else None,
        "tiebreak_triggers": tiebreak_triggers if args.with_tiebreak else 0,
        "tiebreak_corrected_wrong_top1": tb_fixes if args.with_tiebreak else 0,
        "broker_margin_delta": args.broker_margin_delta,
    }

    print(f"Questions evaluated: {n}")
    print(f"Embedding MacroRAG top-1 accuracy: {summary['embedding_top1_accuracy']} ({correct_embed}/{n})")
    if args.with_tiebreak:
        print(
            f"After lexical tie-break (margin<{args.broker_margin_delta}): "
            f"{summary['resolved_accuracy_with_tiebreak']} ({correct_resolved}/{n})"
        )
        print(f"Tie-break triggers: {tiebreak_triggers}; fixed wrong-top1 cases: {tb_fixes}")

    off_diag = [(g, pred, cnt) for (g, pred), cnt in confusion.items() if g != pred]
    off_diag.sort(key=lambda t: -t[2])
    print("\nTop gold -> predicted confusion (mistakes only):")
    for g, pred, cnt in off_diag[:25]:
        print(f"  {g:42} -> {pred:42}  ({cnt}x)")

    if args.csv_out:
        outp = ROOT / args.csv_out
        with open(outp, "w", newline="", encoding="utf-8") as f:
            w = csv.writer(f)
            w.writerow(["gold_db", "predicted_db", "count"])
            for (g, pred), cnt in sorted(confusion.items(), key=lambda x: -x[1]):
                w.writerow([g, pred, cnt])
        print(f"\nWrote {outp}")

    if args.json_out:
        outp = ROOT / args.json_out
        pairs_json = [{"gold": g, "pred": pred, "n": c} for (g, pred), c in confusion.items()]
        full = {**summary, "confusion_pairs": pairs_json}
        outp.write_text(json.dumps(full, indent=2), encoding="utf-8")
        print(f"Wrote {outp}")

    if args.mistakes_tsv:
        outp = ROOT / args.mistakes_tsv
        fieldnames = [
            "test_idx",
            "gold_db",
            "predicted_db",
            "embed_top1",
            "embed_top1_ok",
            "top2_db",
            "margin",
            "tiebreak",
            "lex_scores",
            "question",
        ]
        with open(outp, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore", delimiter="\t")
            w.writeheader()
            for row in mistake_rows:
                w.writerow(row)
        print(f"\nWrote {len(mistake_rows)} mistake rows to {outp}")


if __name__ == "__main__":
    main()
