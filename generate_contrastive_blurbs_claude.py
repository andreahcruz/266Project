"""Generate contrastive (routing) blurbs for MacroRAG using Claude Haiku.

Goal: produce *schema-free* blurbs that improve broker routing by describing
domain boundaries ("what this DB is" + "what this DB is not") without using
any evaluation questions.

Inputs:
  - Spider-style tables JSON (e.g. test_tables.json) for *internal* analysis.
    We DO NOT ask the model to copy table/column identifiers verbatim.

Outputs:
  - One Markdown file per db_id suitable for ``federated/broker.py`` blurbs.

Example:
  .\\.venv\\Scripts\\python.exe generate_contrastive_blurbs_claude.py --out-dir federated/blurbs_generated
"""

from __future__ import annotations

import argparse
import math
import re
from collections import Counter
from pathlib import Path

from config import ANTHROPIC_MODEL, BASE_DIR, TEST_TABLES_JSON
from federated.llm_clients import complete
from schema_loader import load_tables


def _tok(s: str) -> list[str]:
    return [t for t in re.findall(r"[a-z0-9]+", s.lower()) if len(t) > 1]


_GENERIC_TOKENS = frozenset(
    """
    id ids name names number numbers date dates time times year years
    created updated start end first last middle
    total count average maximum minimum max min
    """.split()
)


def _phrase(token: str) -> str:
    """Turn a schema token into a generic functional phrase."""
    token = token.strip().lower()
    token = token.replace("_", " ")
    token = re.sub(r"\s+", " ", token)
    if not token:
        return token
    # small humanization
    token = token.replace("qty", "quantity")
    token = token.replace("addr", "address")
    return token


def _name_phrases(name: str) -> list[str]:
    """Create meaningful phrases from a table/column name (schema-grounded)."""
    words = _tok(name.replace("_", " "))
    words = [w for w in words if w not in _GENERIC_TOKENS]
    if not words:
        return []
    phrases: list[str] = []
    # Full phrase (up to 4 words) is often best for routing.
    phrases.append(" ".join(words[:4]))
    # Bigrams add extra recall for partial mentions.
    for i in range(len(words) - 1):
        phrases.append(f"{words[i]} {words[i+1]}")
    # Trigrams when available (more specific).
    for i in range(len(words) - 2):
        phrases.append(f"{words[i]} {words[i+1]} {words[i+2]}")
    # De-dup preserve order
    seen = set()
    out: list[str] = []
    for p in phrases:
        if p in seen:
            continue
        seen.add(p)
        out.append(p)
    return out


def _tfidf_keywords(
    db_to_terms: dict[str, list[str]],
    *,
    top_k: int = 8,
    min_df: int = 1,
) -> dict[str, list[tuple[str, float]]]:
    """Compute simple TF-IDF keywords per db over tokenized schema terms."""
    db_ids = list(db_to_terms.keys())
    n = len(db_ids)
    df: Counter[str] = Counter()
    tf: dict[str, Counter[str]] = {}
    for db in db_ids:
        c = Counter([t for t in db_to_terms[db] if t and t not in _GENERIC_TOKENS])
        tf[db] = c
        for t in set(c.keys()):
            df[t] += 1

    out: dict[str, list[tuple[str, float]]] = {}
    for db in db_ids:
        scored: list[tuple[str, float]] = []
        for t, f in tf[db].items():
            if df[t] < min_df:
                continue
            idf = math.log((n + 1) / (df[t] + 1)) + 1.0
            # Prefer longer phrases (more discriminative for routing).
            words = max(1, len(str(t).split()))
            length_bonus = 1.0 + 0.35 * (words - 1)
            scored.append((t, float(f) * idf * length_bonus))
        scored.sort(key=lambda x: x[1], reverse=True)
        out[db] = scored[:top_k]
    return out


def _schema_terms(entry: dict, *, max_cols_per_table: int = 10) -> dict:
    """Extract simple terms to describe a DB (for analysis only)."""
    table_names = entry.get("table_names_original") or entry.get("table_names") or []
    col_names = entry.get("column_names_original") or entry.get("column_names") or []

    # Group columns by table index
    by_tbl: dict[int, list[str]] = {}
    for ti, col in col_names:
        if ti == -1:
            continue
        name = col if isinstance(col, str) else (col[1] if isinstance(col, list) and len(col) > 1 else "")
        if not name:
            continue
        by_tbl.setdefault(int(ti), []).append(str(name))

    tables: list[dict] = []
    all_terms: list[str] = []
    for i, tname in enumerate(table_names):
        cols = by_tbl.get(i, [])
        cols = cols[:max_cols_per_table]
        tables.append({"name": str(tname), "sample_cols": cols})
        all_terms.extend(_tok(str(tname)))
        for c in cols:
            all_terms.extend(_tok(c))

    return {"tables": tables, "terms": all_terms}


def _top_overlaps(db_terms: dict[str, set[str]], db_id: str, *, k: int = 4) -> list[tuple[str, int]]:
    mine = db_terms[db_id]
    overlaps = []
    for other, terms in db_terms.items():
        if other == db_id:
            continue
        overlaps.append((other, len(mine & terms)))
    overlaps.sort(key=lambda t: t[1], reverse=True)
    return overlaps[:k]


_SALIENT_NEG_CUES = (
    "invoice",
    "shipment",
    "tracking",
    "login",
    "password",
    "payment method",
    "exam",
    "student",
    "transcript",
    "course",
    "driver",
    "vehicle",
    "rental",
    "tv",
    "channel",
    "episode",
    "match",
    "soccer",
    "government",
    "service",
    "region",
    "building",
)


def _filter_salient_phrases(phrases: list[str], *, limit: int = 6) -> list[str]:
    out: list[str] = []
    for p in phrases:
        pl = p.lower()
        if any(cue in pl for cue in _SALIENT_NEG_CUES):
            out.append(p)
        if len(out) >= limit:
            break
    return out


SYSTEM = """You write "contrastive metadata" blurbs for a MacroRAG router.

Hard constraints:
- Do NOT use any evaluation questions or "test set" knowledge.
- Do NOT paste raw table/column identifiers verbatim; you may use generic phrases instead.
- Keep it short: 6-10 lines, Markdown, no headings.
- Must include:
  1) An identity tag line starting with: **Identity tag:**
  2) A "Route here when" sentence listing 3-6 functional keywords (generic).
  3) A "Hard negatives" sentence listing 3-6 things this DB is NOT about (contrastive boundaries).
- The blurb should be useful for embedding-based nearest-neighbor routing between multiple similar databases.

Style:
- Prefer clear domain boundaries: business function, entity types, workflows.
- Use negative constraints to separate confusable neighbors.
- Avoid anything that looks like private PII or internal naming.
"""


def build_user_prompt(db_id: str, *, tables: list[dict], overlap_neighbors: list[tuple[str, int]]) -> str:
    # We include schema *structure* as context but ask the model not to copy identifiers.
    # The neighbor list helps the model write negatives against likely collisions.
    neighbor_str = ", ".join([f"{n} (overlap={c})" for n, c in overlap_neighbors]) or "(none)"
    table_outline = "\n".join([f"- {t['name']} ({len(t['sample_cols'])} cols sampled)" for t in tables])
    return f"""Target database id: {db_id}

Likely confusable neighbors (from schema term overlap): {neighbor_str}

Schema outline (for your understanding only; do not copy identifiers verbatim):
{table_outline}

Write the contrastive routing blurb now.
"""


def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--model", default=ANTHROPIC_MODEL)
    p.add_argument("--tables-json", default=str(TEST_TABLES_JSON))
    p.add_argument("--out-dir", default=str(BASE_DIR / "federated" / "blurbs_generated"))
    p.add_argument(
        "--only-eval-dbs",
        action="store_true",
        help="Restrict generation to the 11 db_ids used by federated eval (DB_IDS_IN_SPLIT).",
    )
    p.add_argument("--max-cols-per-table", type=int, default=10)
    p.add_argument("--temperature", type=float, default=0.2)
    p.add_argument("--limit", type=int, default=None)
    p.add_argument(
        "--mode",
        default="llm",
        choices=["llm", "schema"],
        help="llm: ask Claude Haiku to write blurbs; schema: deterministic TF-IDF keywords + overlap negatives.",
    )
    p.add_argument("--overwrite", action="store_true")
    p.add_argument("--dry-run", action="store_true")
    args = p.parse_args()

    tables_json = Path(args.tables_json)
    out_dir = Path(args.out_dir)
    out_dir.mkdir(parents=True, exist_ok=True)

    tables_data = load_tables(tables_json)
    db_ids = sorted(tables_data.keys())
    if args.only_eval_dbs:
        # Importing run_federated_eval is safe here; it does not pull Chroma.
        from run_federated_eval import DB_IDS_IN_SPLIT  # noqa: WPS433

        db_ids = [d for d in DB_IDS_IN_SPLIT if d in tables_data]
    if args.limit is not None:
        db_ids = db_ids[: max(0, args.limit)]

    # Build term sets for "confusable neighbor" hints (analysis-only; no eval questions).
    schema_summaries = {
        db: _schema_terms(tables_data[db], max_cols_per_table=int(args.max_cols_per_table))
        for db in tables_data.keys()
    }
    db_terms = {db: set(s["terms"]) for db, s in schema_summaries.items()}
    # For schema mode: build phrase features (not single tokens) so blurbs stay specific.
    phrase_features: dict[str, list[str]] = {}
    for db, summ in schema_summaries.items():
        feats: list[str] = []
        for t in summ["tables"]:
            feats.extend(_name_phrases(t["name"]))
            for c in t["sample_cols"]:
                feats.extend(_name_phrases(c))
        phrase_features[db] = feats
    tfidf = _tfidf_keywords(phrase_features, top_k=18, min_df=1)
    phrase_sets = {db: set(phrase_features[db]) for db in phrase_features}

    print(f"[blurbgen] mode={args.mode} model={args.model} dbs={len(db_ids)} out_dir={out_dir}")

    for i, db_id in enumerate(db_ids, start=1):
        entry = schema_summaries[db_id]
        # Neighbor selection:
        # - llm mode uses token overlap to give Claude broad hints
        # - schema mode uses phrase overlap (more discriminative)
        if args.mode == "schema":
            neighbors = _top_overlaps(phrase_sets, db_id, k=4)
        else:
            neighbors = _top_overlaps(db_terms, db_id, k=4)

        if args.mode == "schema":
            # Positive keywords: top TF-IDF tokens for this DB (schema-grounded)
            ranked = [_phrase(t) for t, _ in tfidf.get(db_id, [])]
            ranked = [r for r in ranked if r]
            pos = [r for r in ranked if len(r.split()) >= 2][:6]
            if len(pos) < 6:
                pos.extend([r for r in ranked if r not in pos][: 6 - len(pos)])

            # Contrastive negatives: pull distinctive tokens from most-overlapping neighbors
            my_set = set(ranked)
            neg_terms: list[str] = []
            for nb, _cnt in neighbors[:2]:
                nb_ranked = [_phrase(t) for t, _ in tfidf.get(nb, [])]
                # Prefer salient phrases from neighbor that we don't have.
                candidates = [p for p in nb_ranked if p and p not in my_set]
                # Strong bias: if any salient cues exist, use them first.
                salient = _filter_salient_phrases(candidates, limit=12)
                candidates = salient or candidates
                for p in candidates:
                    if p in my_set:
                        continue
                    neg_terms.append(p)
                    if len(neg_terms) >= 6:
                        break
                if len(neg_terms) >= 6:
                    break

            # Safety: never claim "not X" if schema contains X token
            neg_terms = [t for t in neg_terms if t and t not in my_set]
            neg_terms = _filter_salient_phrases(neg_terms, limit=6) or neg_terms[:6]

            # Build compact markdown with required anchors
            blurb_lines = [
                f"**Identity tag:** {db_id}",
                f"Route here when: {', '.join(pos) if pos else '(schema signals unclear)'}",
                f"Hard negatives: not about {', '.join(neg_terms) if neg_terms else '(no strong contrasts found)'}",
            ]
            blurb = "\n".join(blurb_lines)
        else:
            user = build_user_prompt(db_id, tables=entry["tables"], overlap_neighbors=neighbors)
            text, _usage = complete(
                messages=[{"role": "user", "content": user}],
                model=str(args.model),
                system=SYSTEM,
                temperature=float(args.temperature),
                max_tokens=500,
                note="contrastive_blurbgen",
                db_id=db_id,
            )

            # Lightweight sanitation: collapse excessive whitespace.
            blurb = "\n".join([ln.rstrip() for ln in text.strip().splitlines() if ln.strip()])

            # Ensure minimal required anchors exist (best-effort).
            if "**Identity tag:**" not in blurb:
                blurb = f"**Identity tag:** {db_id}\n\n" + blurb
            if "Route here when" not in blurb:
                blurb += "\n\nRoute here when: (add functional keywords)."
            if "Hard negatives" not in blurb:
                blurb += "\n\nHard negatives: (add contrasts)."

        out_path = out_dir / f"{db_id}.md"
        if out_path.exists() and not args.overwrite:
            print(f"  [{i}/{len(db_ids)}] skip {db_id} (exists; pass --overwrite)")
            continue

        if args.dry_run:
            print(f"\n--- {db_id} ---\n{blurb}\n")
        else:
            out_path.write_text(blurb + "\n", encoding="utf-8")
            print(f"  [{i}/{len(db_ids)}] wrote {out_path}")

    return 0


if __name__ == "__main__":
    raise SystemExit(main())

