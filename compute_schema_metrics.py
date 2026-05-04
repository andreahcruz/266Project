"""Compute schema/privacy-side metrics for the federated masking project.

Metrics produced:
  1. Schema Retrieval Recall@k (table recall over the balanced 320 split)
  2. Schema Reconstruction F1 (attacker-side expected per-token F1 under
     candidate-set guessing)
  3. Blast Radius (fraction of schema exposed to the LLM per query)

The script keeps the definitions explicit in the markdown output so the
report can cite the assumptions directly.
"""

from __future__ import annotations

import csv
import json
from pathlib import Path

from config import BASE_DIR, TEST_JSON, TEST_TABLES_JSON
from evaluation import Evaluator
from retrieval_eval import _extract_gold_items
from retriever import retrieve_schema_details
from schema_loader import load_tables
from federated.masker import _semantic_column_base


LEVELS = ["easy", "medium", "hard", "extra"]


def _avg(xs: list[float]) -> float:
    return sum(xs) / max(len(xs), 1)


def _fmt_pct(x: float) -> str:
    return f"{x * 100:.1f}%"


def load_balanced_test_rows():
    questions = json.load(open(TEST_JSON))
    indices = json.load(open(BASE_DIR / "balanced_test_indices_80x4.json"))["indices"]
    difficulty = {int(k): v for k, v in json.load(open(BASE_DIR / "balanced_difficulty.json")).items()}
    rows = []
    for idx in indices:
        q = questions[idx]
        rows.append(
            {
                "index": idx,
                "db_id": q["db_id"],
                "question": q["question"],
                "query": q["query"],
                "sql": q["sql"],
                "difficulty": difficulty[idx],
            }
        )
    return rows


def compute_retrieval_and_blast(
    rows: list[dict],
    tables_data: dict,
    *,
    retrieval_policy: str,
    top_k_tables: int = 4,
    top_n_columns: int = 6,
) -> dict:
    """Compute retrieval recall and blast radius for a local retrieval policy.

    retrieval_policy:
      - "lexical_top4_top6" means use lexical retrieval only to approximate the
        local retrieval stage without external embedding calls.
      - "fullschema_hardextra" means lexical/hybrid-like for easy/medium and
        full schema for hard/extra, mirroring the current mixed final system's
        retrieval breadth.
    """
    per_level = {lvl: {"table_recall": [], "column_recall": [], "table_blast": [], "column_blast": [], "element_blast": []} for lvl in LEVELS}
    per_level["all"] = {"table_recall": [], "column_recall": [], "table_blast": [], "column_blast": [], "element_blast": []}

    for row in rows:
        entry = tables_data[row["db_id"]]
        gold_tables, gold_columns = _extract_gold_items(row["sql"], entry)

        use_full = retrieval_policy == "fullschema_hardextra" and row["difficulty"] in {"hard", "extra"}
        if use_full:
            selected_tables = set(range(len(entry["table_names_original"])))
            selected_cols = {
                ci
                for ci, (ti, _name) in enumerate(entry["column_names_original"])
                if ti != -1
            }
        else:
            details = retrieve_schema_details(
                question=row["question"],
                db_id=row["db_id"],
                tables_data=tables_data,
                top_k_tables=top_k_tables,
                top_n_columns=top_n_columns,
                mode="lexical",
            )
            selected_tables = set(details["selected_tables"])
            selected_cols = set(details["selected_column_indices"])

        total_tables = len(entry["table_names_original"])
        total_cols = sum(1 for ti, _ in entry["column_names_original"] if ti != -1)
        table_recall = 0.0 if not gold_tables else len(gold_tables & selected_tables) / len(gold_tables)
        column_recall = 0.0 if not gold_columns else len(gold_columns & selected_cols) / len(gold_columns)
        table_blast = len(selected_tables) / max(total_tables, 1)
        column_blast = len(selected_cols) / max(total_cols, 1)
        element_blast = (len(selected_tables) + len(selected_cols)) / max(total_tables + total_cols, 1)

        bucket = per_level[row["difficulty"]]
        for target in (bucket, per_level["all"]):
            target["table_recall"].append(table_recall)
            target["column_recall"].append(column_recall)
            target["table_blast"].append(table_blast)
            target["column_blast"].append(column_blast)
            target["element_blast"].append(element_blast)

    summary = {}
    for lvl, vals in per_level.items():
        summary[lvl] = {k: _avg(v) for k, v in vals.items()}
    return summary


def _columns_for_db(entry: dict) -> list[dict]:
    table_names = entry["table_names_original"]
    columns = entry["column_names_original"]
    col_types = entry["column_types"]
    pks = set(entry["primary_keys"])
    fks = {src for src, _ in entry["foreign_keys"]} | {dst for _, dst in entry["foreign_keys"]}

    out = []
    for ci, (ti, cname) in enumerate(columns):
        if ti == -1:
            continue
        out.append(
            {
                "ci": ci,
                "table": table_names[ti],
                "name": cname,
                "type": col_types[ci],
                "is_pk": ci in pks,
                "is_fk": ci in fks,
                "semantic": _semantic_column_base(
                    table_name=table_names[ti],
                    column_name=cname,
                    column_type=col_types[ci],
                    is_primary_key=ci in pks,
                    is_foreign_key=ci in fks,
                ),
            }
        )
    return out


def expected_reconstruction_f1(cols: list[dict], mode: str) -> float:
    """Expected one-token reconstruction F1 under a strong attacker.

    The attacker sees a masked token and must guess one real column identity.
    Under a uniform-over-candidate-set assumption, expected precision = recall
    = F1 = 1 / |candidate set| for that token.
    """
    vals: list[float] = []
    for c in cols:
        if mode == "hard":
            cands = [
                x for x in cols
                if x["type"] == c["type"] and x["is_pk"] == c["is_pk"]
            ]
        elif mode == "semantic":
            cands = [
                x for x in cols
                if x["type"] == c["type"]
                and x["is_pk"] == c["is_pk"]
                and x["semantic"] == c["semantic"]
            ]
        else:
            raise ValueError(mode)
        vals.append(1.0 / max(len(cands), 1))
    return _avg(vals)


def compute_reconstruction_metrics(tables_data: dict) -> dict:
    db_ids = [
        "e_commerce", "customers_and_orders", "vehicle_driver", "soccer_3",
        "online_exams", "cre_Students_Information_Systems", "bbc_channels",
        "tv_shows", "government_shift", "vehicle_rent", "region_building",
    ]
    per_db = {}
    weighted = {"hard": 0.0, "semantic": 0.0}
    total_cols = 0
    for db_id in db_ids:
        cols = _columns_for_db(tables_data[db_id])
        hard_f1 = expected_reconstruction_f1(cols, "hard")
        sem_f1 = expected_reconstruction_f1(cols, "semantic")
        per_db[db_id] = {
            "n_cols": len(cols),
            "hard_reconstruction_f1": hard_f1,
            "semantic_reconstruction_f1": sem_f1,
        }
        weighted["hard"] += hard_f1 * len(cols)
        weighted["semantic"] += sem_f1 * len(cols)
        total_cols += len(cols)
    weighted = {k: v / max(total_cols, 1) for k, v in weighted.items()}
    return {"per_db": per_db, "weighted": weighted, "total_cols": total_cols}


def write_outputs(out_md: Path, out_csv: Path, hybrid_summary: dict, mixed_summary: dict, recon: dict) -> None:
    fields = [
        "setting", "bucket", "table_recall", "column_recall",
        "table_blast", "column_blast", "element_blast",
    ]
    with open(out_csv, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for setting, summary in [("lexical_top4_top6", hybrid_summary), ("mixed_v5_breadth", mixed_summary)]:
            for bucket, vals in summary.items():
                w.writerow(
                    {
                        "setting": setting,
                        "bucket": bucket,
                        **{k: round(v, 6) for k, v in vals.items()},
                    }
                )

    md = []
    md.append("## Schema Metrics")
    md.append("")
    md.append("Definitions:")
    md.append("- **Schema Retrieval Recall@k**: mean fraction of gold tables recovered by the local retriever on the balanced 320-question split.")
    md.append("- **Schema Reconstruction F1**: expected per-token attacker F1 when guessing the real column behind a masked token from its candidate set.")
    md.append("- **Blast Radius**: mean fraction of a database schema exposed to the central LLM for one query.")
    md.append("")

    md.append("### 1. Schema Retrieval Recall@k")
    md.append("")
    md.append("Balanced 320 split, local retrieval width `top_k_tables=4`, `top_n_columns=6`.")
    md.append("These balanced-320 values are computed offline from the lexical retrieval stage because the embedding-backed hybrid reranker is not reproducible without live API calls.")
    md.append("")
    md.append("| Bucket | Table Recall@k | Column Recall |")
    md.append("|---|---:|---:|")
    for bucket in LEVELS + ["all"]:
        vals = hybrid_summary[bucket]
        md.append(f"| {bucket} | {_fmt_pct(vals['table_recall'])} | {_fmt_pct(vals['column_recall'])} |")

    md.append("")
    md.append("### 2. Schema Reconstruction F1")
    md.append("")
    md.append("Strong-attacker interpretation: the LLM provider sees a token and guesses one real column identity uniformly from the compatible candidate set.")
    md.append("")
    md.append("| Masking style | Expected reconstruction F1 |")
    md.append("|---|---:|")
    md.append(f"| Hard mask | {_fmt_pct(recon['weighted']['hard'])} |")
    md.append(f"| Semantic mask | {_fmt_pct(recon['weighted']['semantic'])} |")
    md.append("")
    md.append("Higher reconstruction F1 means weaker privacy because the attacker can recover the true schema token more accurately.")

    md.append("")
    md.append("### 3. Blast Radius")
    md.append("")
    md.append("Two schema-exposure views are useful:")
    md.append("- `lexical_top4_top6`: offline approximation of the local retrieval stage alone")
    md.append("- `mixed_v5_breadth`: your current best full-system retrieval breadth, i.e. hybrid for easy/medium and full schema for hard/extra")
    md.append("")
    md.append("| Setting | Bucket | Table Blast Radius | Column Blast Radius | Overall Schema Blast Radius |")
    md.append("|---|---|---:|---:|---:|")
    for setting, summary in [("lexical_top4_top6", hybrid_summary), ("mixed_v5_breadth", mixed_summary)]:
        for bucket in LEVELS + ["all"]:
            vals = summary[bucket]
            md.append(
                f"| {setting} | {bucket} | {_fmt_pct(vals['table_blast'])} | {_fmt_pct(vals['column_blast'])} | {_fmt_pct(vals['element_blast'])} |"
            )

    md.append("")
    md.append("Interpretation:")
    md.append("- Lower blast radius is better for privacy because less schema structure reaches the central LLM.")
    md.append("- Higher retrieval recall is better for accuracy because the node sends back more of the gold schema.")
    md.append("- Reconstruction F1 and blast radius should be read together: one measures attacker identifiability per token, the other measures how much schema surface area is exposed at all.")
    out_md.write_text("\n".join(md) + "\n")


def main():
    tables_data = load_tables(TEST_TABLES_JSON)
    rows = load_balanced_test_rows()
    hybrid_summary = compute_retrieval_and_blast(rows, tables_data, retrieval_policy="lexical_top4_top6")
    mixed_summary = compute_retrieval_and_blast(rows, tables_data, retrieval_policy="fullschema_hardextra")
    recon = compute_reconstruction_metrics(tables_data)
    write_outputs(
        BASE_DIR / "schema_metrics.md",
        BASE_DIR / "schema_metrics.csv",
        hybrid_summary,
        mixed_summary,
        recon,
    )
    print("Wrote", BASE_DIR / "schema_metrics.md")
    print("Wrote", BASE_DIR / "schema_metrics.csv")


if __name__ == "__main__":
    main()
