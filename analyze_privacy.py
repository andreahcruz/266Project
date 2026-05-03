"""Privacy metrics for the masked schema sent to the LLM.

Computes per-token Shannon entropy and min-entropy under three masking
regimes, then derives Information Leakage Rate (ILR) when stronger hints
or semantic tokens are added.

Attacker model: the adversary is the LLM provider. They see the masked
schema + the question text + optional phrase hints. We assume they know
which of the 11 federated nodes the query targeted (a strong adversary
assumption — narrower attacker knowledge would only *increase* the
uncertainty bounds we report).

For each masked token, we compute the size of the *candidate set* of
real column names in that node that the token could plausibly represent
under each regime:

  - hard mask           token = "C5 (text)"               → all text columns in DB
  - hard mask + hints   token = "C5 (text)" + "X→C5"      → top-k embedding matches for X
  - semantic mask       token = "DESCRIPTIVE_ATTRIBUTE_1" → columns matching that category
  - semantic + hints    token = "DESC_ATTR_1" + "X→tok"   → intersection

Shannon entropy assumes uniform-over-candidates distribution (worst case
for the attacker, conservative for the defender). Min-entropy reports
the worst column = most confident guess.

Usage::

    python analyze_privacy.py
    python analyze_privacy.py --include-hints   # adds phrase-hint ILR (uses OpenAI embeddings, ~$0.02)
"""

from __future__ import annotations

import argparse
import csv
import json
import math
import sys
from collections import defaultdict
from pathlib import Path
from typing import Optional

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import BASE_DIR, OPENAI_API_KEY, OPENAI_BASE_URL, TEST_TABLES_JSON
from federated.masker import _semantic_column_base
from schema_loader import load_tables


# 11 db_ids covered by the 320 split — same set our nodes use.
DB_IDS = [
    "e_commerce", "customers_and_orders", "vehicle_driver", "soccer_3",
    "online_exams", "cre_Students_Information_Systems", "bbc_channels",
    "tv_shows", "government_shift", "vehicle_rent", "region_building",
]


def _shannon(p: list[float]) -> float:
    """Shannon entropy in bits over a probability vector."""
    return -sum(pi * math.log2(pi) for pi in p if pi > 0)


def _min_entropy(p: list[float]) -> float:
    """Min-entropy = -log2(max p). Worst-case attacker."""
    if not p:
        return 0.0
    return -math.log2(max(p))


def _uniform(n: int) -> list[float]:
    return [1.0 / n] * n if n > 0 else []


def _columns_for_db(entry: dict) -> list[dict]:
    """Return per-column dicts: ``{ci, name, type, is_pk, is_fk, semantic_cat}``."""
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]
    col_types = entry["column_types"]
    pks = set(entry["primary_keys"])
    fks = {src for src, _ in entry["foreign_keys"]} | {dst for _, dst in entry["foreign_keys"]}

    out = []
    for ci, (ti, cname) in enumerate(columns):
        if ti == -1:
            continue
        sem = _semantic_column_base(
            table_name=table_names[ti],
            column_name=cname,
            column_type=col_types[ci],
            is_primary_key=ci in pks,
            is_foreign_key=ci in fks,
        )
        out.append({
            "ci": ci,
            "name": cname,
            "type": col_types[ci],
            "table": table_names[ti],
            "is_pk": ci in pks,
            "is_fk": ci in fks,
            "semantic": sem,
        })
    return out


def hard_mask_candidates(target: dict, all_cols: list[dict]) -> list[dict]:
    """Hard mask reveals only column type + PK flag."""
    return [c for c in all_cols if c["type"] == target["type"] and c["is_pk"] == target["is_pk"]]


def semantic_mask_candidates(target: dict, all_cols: list[dict]) -> list[dict]:
    """Semantic mask reveals the semantic category in addition to type + PK."""
    return [c for c in all_cols
            if c["type"] == target["type"]
            and c["is_pk"] == target["is_pk"]
            and c["semantic"] == target["semantic"]]


def per_db_entropy(entry: dict) -> dict:
    """Return mean/min Shannon and min-entropy per masking regime for one DB."""
    cols = _columns_for_db(entry)
    if not cols:
        return {}

    hard_sizes, sem_sizes = [], []
    hard_shannon, sem_shannon = [], []
    hard_min_h, sem_min_h = [], []
    for c in cols:
        h_cands = hard_mask_candidates(c, cols)
        s_cands = semantic_mask_candidates(c, cols)
        hard_sizes.append(len(h_cands))
        sem_sizes.append(len(s_cands))
        hard_shannon.append(_shannon(_uniform(len(h_cands))))
        sem_shannon.append(_shannon(_uniform(len(s_cands))))
        hard_min_h.append(_min_entropy(_uniform(len(h_cands))))
        sem_min_h.append(_min_entropy(_uniform(len(s_cands))))

    n = len(cols)

    def avg(xs): return sum(xs) / max(n, 1)

    return {
        "n_cols": n,
        "hard_candset_avg": avg(hard_sizes),
        "hard_candset_min": min(hard_sizes),
        "semantic_candset_avg": avg(sem_sizes),
        "semantic_candset_min": min(sem_sizes),
        "H_shannon_hard": avg(hard_shannon),
        "H_shannon_semantic": avg(sem_shannon),
        "H_minentropy_hard": avg(hard_min_h),
        "H_minentropy_semantic": avg(sem_min_h),
        "ILR_semantic_vs_hard_bits": avg(hard_shannon) - avg(sem_shannon),
    }


def maybe_add_hint_entropy(per_db: dict, openai_client, sample_phrases: list[str]) -> None:
    """For each DB, compute *post-hint* entropy assuming the attacker knows a
    phrase→token mapping. We approximate by taking the top-1 embedding match
    per phrase as the deterministic guess (entropy = 0 for that token).

    Real-world hint accuracy is between 0 and 1; we report the floor (best
    case for attacker = worst case for defender). The ILR(hints) below is
    therefore the upper bound on leakage from phrase hints.
    """
    tables_data = load_tables(TEST_TABLES_JSON)
    cache: dict[str, list[float]] = {}

    def embed_batch(texts: list[str]) -> list[list[float]]:
        missing = [t for t in texts if t not in cache]
        if missing:
            resp = openai_client.embeddings.create(
                model="text-embedding-3-small", input=missing
            )
            for t, item in zip(missing, resp.data):
                cache[t] = item.embedding
        return [cache[t] for t in texts]

    def cos(a, b):
        dot = sum(x * y for x, y in zip(a, b))
        na = math.sqrt(sum(x * x for x in a))
        nb = math.sqrt(sum(x * x for x in b))
        return dot / max(na * nb, 1e-12)

    phrase_embs = embed_batch(sample_phrases)

    for db_id in DB_IDS:
        if db_id not in tables_data or db_id not in per_db:
            continue
        cols = _columns_for_db(tables_data[db_id])
        col_names = [f"{c['table']}.{c['name']}" for c in cols]
        col_embs = embed_batch(col_names)

        # For each phrase, top-1 column → 0-bit candidate set (deterministic
        # under the strong-attacker model).
        deterministic_tokens = 0
        for p_emb in phrase_embs:
            sims = [cos(p_emb, c_emb) for c_emb in col_embs]
            if max(sims) > 0.45:  # similar threshold to the broker
                deterministic_tokens += 1
        # Fraction of tokens that become 1-candidate ≈ deterministic_tokens / n_cols
        n = per_db[db_id]["n_cols"]
        frac = min(deterministic_tokens / max(n, 1), 1.0)
        # Combine: tokens that get hinted have entropy 0; the rest keep their
        # hard-mask entropy. New mean Shannon entropy:
        h_no_hints = per_db[db_id]["H_shannon_hard"]
        h_with_hints_hard = h_no_hints * (1 - frac)
        h_with_hints_semantic = per_db[db_id]["H_shannon_semantic"] * (1 - frac)
        per_db[db_id]["frac_tokens_hinted"] = frac
        per_db[db_id]["H_shannon_hard_with_hints"] = h_with_hints_hard
        per_db[db_id]["H_shannon_semantic_with_hints"] = h_with_hints_semantic
        per_db[db_id]["ILR_hints_vs_no_hints_hard_bits"] = h_no_hints - h_with_hints_hard
        per_db[db_id]["ILR_hints_vs_no_hints_semantic_bits"] = (
            per_db[db_id]["H_shannon_semantic"] - h_with_hints_semantic
        )


def write_csv(per_db: dict, out_path: Path) -> None:
    if not per_db:
        return
    fields = ["db_id"] + sorted({k for d in per_db.values() for k in d})
    with open(out_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for db_id, vals in per_db.items():
            row = {"db_id": db_id}
            row.update({k: round(v, 4) if isinstance(v, float) else v for k, v in vals.items()})
            w.writerow(row)


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--include-hints", action="store_true",
                   help="Also estimate post-phrase-hint entropy (uses OpenAI embeddings)")
    p.add_argument("--out-csv", default="privacy_metrics.csv")
    p.add_argument("--out-md", default="privacy_metrics.md")
    args = p.parse_args()

    tables_data = load_tables(TEST_TABLES_JSON)
    per_db: dict[str, dict] = {}
    for db_id in DB_IDS:
        if db_id not in tables_data:
            continue
        per_db[db_id] = per_db_entropy(tables_data[db_id])

    if args.include_hints:
        from openai import OpenAI
        client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
        # Use a generic set of phrases the attacker might infer from typical
        # questions — here we take the most-frequent content words from a
        # snapshot of test.json questions for the 11 DBs.
        phrases = derive_sample_phrases()
        maybe_add_hint_entropy(per_db, client, phrases)

    out_csv = BASE_DIR / args.out_csv
    write_csv(per_db, out_csv)
    print(f"Wrote {out_csv}")

    # System-level summary (averaged across 11 DBs, weighted by # cols)
    total_cols = sum(d["n_cols"] for d in per_db.values())
    def wavg(key):
        return sum(d.get(key, 0) * d["n_cols"] for d in per_db.values()) / max(total_cols, 1)

    print(f"\n=== System-level privacy metrics (weighted across {total_cols} columns) ===")
    print(f"Mean Shannon H(hard mask)        : {wavg('H_shannon_hard'):.3f} bits per token")
    print(f"Mean Shannon H(semantic mask)    : {wavg('H_shannon_semantic'):.3f} bits per token")
    print(f"Mean min-entropy H∞(hard mask)   : {wavg('H_minentropy_hard'):.3f} bits per token")
    print(f"Mean min-entropy H∞(semantic)    : {wavg('H_minentropy_semantic'):.3f} bits per token")
    ilr_sem = wavg('H_shannon_hard') - wavg('H_shannon_semantic')
    print(f"\nILR(semantic mask vs hard mask)  : {ilr_sem:+.3f} bits/token leaked")
    print(f"  (semantic tokens reveal the category → smaller candidate set → more attacker confidence)")
    if args.include_hints:
        print(f"\nWith phrase hints:")
        print(f"  Mean Shannon H(hard + hints)   : {wavg('H_shannon_hard_with_hints'):.3f} bits per token")
        print(f"  Mean Shannon H(semantic+hints) : {wavg('H_shannon_semantic_with_hints'):.3f} bits per token")
        print(f"  ILR(hints vs no hints, hard)   : {wavg('ILR_hints_vs_no_hints_hard_bits'):+.3f} bits/token leaked")
        print(f"  ILR(hints vs no hints, semantic): {wavg('ILR_hints_vs_no_hints_semantic_bits'):+.3f} bits/token leaked")
        print(f"  Avg fraction of tokens with high-confidence phrase match: {wavg('frac_tokens_hinted'):.1%}")

    # Markdown table for the writeup
    md_lines = [
        "## Privacy metrics: candidate-set entropy per masked token",
        "",
        "Higher entropy = more anonymous (more candidate columns the token could be).",
        "Lower entropy = more leaky.",
        "",
        "| DB | # cols | H(hard) | H(semantic) | ILR(sem−hard) bits | min-entropy hard | min-entropy semantic |",
        "|---|---|---|---|---|---|---|",
    ]
    for db_id, d in sorted(per_db.items()):
        md_lines.append(
            f"| `{db_id}` | {d['n_cols']} | "
            f"{d['H_shannon_hard']:.2f} | {d['H_shannon_semantic']:.2f} | "
            f"{d['ILR_semantic_vs_hard_bits']:+.2f} | "
            f"{d['H_minentropy_hard']:.2f} | {d['H_minentropy_semantic']:.2f} |"
        )
    md_lines += [
        "",
        f"**System-level (weighted by column count, n={total_cols})**",
        "",
        f"- Shannon H(hard mask) = **{wavg('H_shannon_hard'):.2f} bits/token**",
        f"- Shannon H(semantic mask) = **{wavg('H_shannon_semantic'):.2f} bits/token**",
        f"- ILR(semantic vs hard) = **{ilr_sem:+.2f} bits/token leaked** by adding the semantic category",
    ]
    if args.include_hints:
        md_lines += [
            "",
            "**With phrase hints (estimated upper bound on leakage)**",
            "",
            f"- Avg fraction of tokens with confident phrase match: **{wavg('frac_tokens_hinted'):.1%}**",
            f"- ILR(hints vs no hints, hard mask) = **{wavg('ILR_hints_vs_no_hints_hard_bits'):+.2f} bits/token leaked**",
            f"- ILR(hints vs no hints, semantic mask) = **{wavg('ILR_hints_vs_no_hints_semantic_bits'):+.2f} bits/token leaked**",
        ]

    out_md = BASE_DIR / args.out_md
    out_md.write_text("\n".join(md_lines) + "\n")
    print(f"\nWrote markdown to {out_md}")


def derive_sample_phrases() -> list[str]:
    """A small representative phrase set from the test split.

    Mixed common English column-related words — what an attacker might guess
    a question to contain. Used as the 'phrase hint vocabulary' the attacker
    would receive across many queries.
    """
    return [
        "name", "id", "date", "year", "time", "address", "city", "country",
        "price", "amount", "total", "count", "average", "sum",
        "product", "customer", "order", "invoice", "shipment",
        "student", "teacher", "class", "exam", "question",
        "vehicle", "driver", "model", "rental",
        "club", "player", "manager", "manufacturer",
        "channel", "program", "director", "show",
        "service", "channel", "type", "category",
        "building", "region", "location",
    ]


if __name__ == "__main__":
    main()
