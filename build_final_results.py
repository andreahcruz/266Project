"""Aggregate federated ``runs/*/summary.json`` and baseline ``baseline/results/*`` metrics.

Federated rows include merged ``summary.json`` + ``config.json`` plus aggregates
from ``per_question.csv`` when present:

  ``eval_split``, ``max_retries``, ``cost_cap_usd``, ``limit``,
  ``cascade_enabled`` (true when ``cascade_hard_model`` is set),
  ``self_correction_max_retries`` (same as run ``max_retries``: cap on correction
  attempts after a failed execution; initial generation is separate),
  ``pq_n_rows``, ``pq_avg_retries``, ``pq_frac_any_retry``, ``pq_frac_repick``,
  ``pq_broker_top1_acc``, ``pq_runtime_exec_acc``.

``spider_parse_failure_rate`` divides ``eval_err_num`` count by ``n_processed``.

Baseline: JSON (Dr.Spider, retrieval sweeps, extra decomposition/schema) and
``eval_*.log`` files that contain Spider execution tables.

Usage::

    python build_final_results.py
    python build_final_results.py --include-smoke --out-csv all_metrics.csv --no-markdown
    python build_final_results.py --no-baseline
"""

from __future__ import annotations

import argparse
import csv
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import BASE_DIR, RUNS_DIR

BASELINE_RESULTS_DIR = BASE_DIR / "baseline" / "results"

# Federated eval in this repo uses the 320-line balanced test slice unless --indices-from.
FEDERATED_EVAL_DEFAULT_N = 320


def parse_eval_err_rate(eval_log: Path, divisor: int = 320) -> float | None:
    """Count ``eval_err_num:`` lines in an evaluator log; divide by ``divisor``."""
    if not eval_log.exists():
        return None
    count = 0
    with open(eval_log, encoding="utf-8") as f:
        for line in f:
            if line.startswith("eval_err_num:"):
                count += 1
    if count == 0:
        return None
    return count / divisor


def parse_spider_execution_from_text(text: str) -> tuple[float | None, dict[str, float]]:
    """Parse the ``execution`` row from ``evaluation.py`` stdout (same as run_federated_eval)."""
    by_diff: dict[str, float] = {}
    overall: float | None = None
    lines = text.splitlines()
    for i, line in enumerate(lines):
        if "execution" in line.lower() and (
            "easy" in lines[max(i - 4, 0) : i].__str__().lower() or i > 0
        ):
            parts = line.split()
            if len(parts) >= 6 and parts[0].lower().startswith("execution"):
                try:
                    nums = [float(p) for p in parts[1:6]]
                    by_diff = {
                        "easy": nums[0],
                        "medium": nums[1],
                        "hard": nums[2],
                        "extra": nums[3],
                    }
                    overall = nums[4]
                    break
                except ValueError:
                    continue
    return overall, by_diff


def _per_question_aggregates(run_dir: Path) -> dict[str, object]:
    """Summarize ``per_question.csv`` when present (broker, retries, re-picks)."""
    pq = run_dir / "per_question.csv"
    out: dict[str, object] = {
        "pq_n_rows": None,
        "pq_avg_retries": None,
        "pq_frac_any_retry": None,
        "pq_frac_repick": None,
        "pq_broker_top1_acc": None,
        "pq_db_routing_accuracy": None,
        "pq_frac_routing_tiebreak": None,
        "pq_avg_embedding_margin": None,
        "pq_avg_masked_token_count": None,
        "pq_runtime_exec_acc": None,
    }
    if not pq.exists():
        return out
    with open(pq, encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    if not rows:
        return out
    n = len(rows)
    out["pq_n_rows"] = n

    retries: list[int] = []
    for row in rows:
        try:
            retries.append(int(row.get("retries") or 0))
        except ValueError:
            retries.append(0)
    out["pq_avg_retries"] = sum(retries) / n if n else None
    out["pq_frac_any_retry"] = sum(1 for r in retries if r > 0) / n if n else None

    rep = [str(row.get("re_picked", "")).strip().lower() in ("true", "1", "yes") for row in rows]
    if any(rep):
        out["pq_frac_repick"] = sum(rep) / n if n else None

    bc_raw = [(row.get("broker_correct") or "").strip().lower() for row in rows]
    if bc_raw and bc_raw[0] != "":
        out["pq_broker_top1_acc"] = sum(1 for x in bc_raw if x == "true") / n
    elif any((row.get("broker_pick") or "").strip() for row in rows):
        bp = [(row.get("broker_pick") or "").strip() for row in rows]
        gold = [(row.get("db_id_gold") or "").strip() for row in rows]
        hits = sum(1 for i in range(n) if bp[i] and bp[i] == gold[i])
        denom = sum(1 for i in range(n) if bp[i])
        if denom:
            out["pq_broker_top1_acc"] = hits / denom

    ex = [str(row.get("exec_success", "")).lower() == "true" for row in rows]
    out["pq_runtime_exec_acc"] = sum(ex) / n if n else None

    def _truthy(v: object) -> bool:
        return str(v).strip().lower() in ("true", "1", "yes")

    drc = [(row.get("db_routing_correct") or "").strip() for row in rows]
    if drc and drc[0] != "":
        out["pq_db_routing_accuracy"] = sum(_truthy(x) for x in drc) / n

    tb = [(row.get("routing_tiebreak_used") or "").strip() for row in rows]
    if tb and tb[0] != "":
        out["pq_frac_routing_tiebreak"] = sum(_truthy(x) for x in tb) / n

    margins: list[float] = []
    for row in rows:
        m = (row.get("embedding_top1_margin") or "").strip()
        if not m:
            continue
        try:
            margins.append(float(m))
        except ValueError:
            continue
    if margins:
        out["pq_avg_embedding_margin"] = sum(margins) / len(margins)

    mtoks: list[int] = []
    for row in rows:
        ms = (row.get("masked_sql") or "").strip()
        if not ms:
            continue
        mtoks.append(len(ms.split()))
    if mtoks:
        out["pq_avg_masked_token_count"] = sum(mtoks) / len(mtoks)

    return out


def _blank_baseline_cols() -> dict:
    return {
        "dr_variant": None,
        "dr_pre_accuracy": None,
        "dr_post_accuracy": None,
        "dr_drop": None,
        "dr_count": None,
        "retrieval_run_id": None,
        "retrieval_config_mode": None,
        "ret_all_recall": None,
        "ret_all_precision": None,
        "ret_all_srr": None,
        "ret_all_column_recall": None,
        "ret_all_avg_tables": None,
        "baseline_exec_accuracy": None,
        "decomposition_exec_accuracy": None,
        "decomposition_delta": None,
        "rag_current_acc": None,
        "rag_broader_acc": None,
        "rag_full_schema_acc": None,
        "eval_log_parse_errors": None,
        "detail_json": None,
    }


def collect_federated_rows(
    ids: list[str],
) -> list[dict]:
    rows: list[dict] = []
    blank = _blank_baseline_cols()
    for eid in ids:
        sp = RUNS_DIR / eid / "summary.json"
        if not sp.exists():
            print(f"[skip] {eid} (no summary.json)")
            continue
        s = json.loads(sp.read_text(encoding="utf-8"))
        cfg_path = RUNS_DIR / eid / "config.json"
        cfg = json.loads(cfg_path.read_text(encoding="utf-8")) if cfg_path.exists() else {}

        def pick(key: str):
            if key in s and s[key] is not None:
                return s[key]
            return cfg.get(key)

        bd = s.get("spider_exec_by_difficulty", {}) or {}
        n_done = s.get("n_processed") or FEDERATED_EVAL_DEFAULT_N
        try:
            n_div = int(n_done)
        except (TypeError, ValueError):
            n_div = FEDERATED_EVAL_DEFAULT_N
        eval_err_rate = parse_eval_err_rate(
            RUNS_DIR / eid / "evaluation_stdout.txt", max(n_div, 1)
        )
        phrase_hints = cfg.get("phrase_hints")
        if phrase_hints is None:
            phrase_hints = s.get("phrase_hints")
        cascade_hard_model = pick("cascade_hard_model")
        cascade_enabled = bool(cascade_hard_model)
        pq_stats = _per_question_aggregates(RUNS_DIR / eid)
        row = {
            "source": "federated",
            "artifact_relpath": f"runs/{eid}/",
            "baseline_kind": "",
            "experiment_id": eid,
            "eval_split": "balanced_80x4",
            "routing": pick("routing"),
            "retrieval": pick("retrieval"),
            "retrieval_easy_medium": cfg.get("retrieval_easy_medium") or pick("retrieval"),
            "retrieval_hard_extra": cfg.get("retrieval_hard_extra") or pick("retrieval"),
            "top_k_tables": cfg.get("top_k_tables"),
            "top_n_columns": cfg.get("top_n_columns"),
            "masking": pick("masking"),
            "mask_style": pick("mask_style"),
            "phrase_hints": phrase_hints,
            "prompt": pick("prompt"),
            "model": pick("model"),
            "cascade_hard_model": cascade_hard_model,
            "cascade_enabled": cascade_enabled,
            "max_retries": pick("max_retries"),
            "self_correction_max_retries": pick("max_retries"),
            "cost_cap_usd": pick("cost_cap_usd"),
            "limit": pick("limit"),
            "easy": bd.get("easy"),
            "medium": bd.get("medium"),
            "hard": bd.get("hard"),
            "extra": bd.get("extra"),
            "overall": s.get("spider_exec_accuracy_overall"),
            "exec_runtime_success": s.get("exec_success_rate_runtime"),
            "spider_parse_failure_rate": eval_err_rate,
            "n_processed": s.get("n_processed"),
            "total_cost_usd": s.get("total_cost_usd"),
            "wall_time_s": s.get("wall_time_seconds"),
            "note": s.get("note"),
            **pq_stats,
        }
        row.update(blank)
        # Rows without per_question.csv leave pq stats as None inside row already
        rows.append(row)
    return rows


def _is_dr_spider_json(data: dict) -> bool:
    r = data.get("results")
    if not isinstance(r, list) or not r:
        return False
    return all(isinstance(x, dict) and "pre_accuracy" in x and "post_accuracy" in x for x in r)


def _is_retrieval_sweep_json(data: dict) -> bool:
    return isinstance(data.get("runs"), dict) and "config" in data


def _is_extra_decomposition_json(data: dict) -> bool:
    sm = data.get("summary")
    return isinstance(sm, dict) and "baseline_exec_accuracy" in sm and "decomposition_exec_accuracy" in sm


def _is_extra_schema_json(data: dict) -> bool:
    sm = data.get("summary")
    return isinstance(sm, dict) and "current_rag" in sm and "broader_rag" in sm


def collect_baseline_rows() -> list[dict]:
    rows: list[dict] = []
    if not BASELINE_RESULTS_DIR.is_dir():
        return rows

    blank_fed = {
        "eval_split": None,
        "routing": None,
        "retrieval": None,
        "retrieval_easy_medium": None,
        "retrieval_hard_extra": None,
        "top_k_tables": None,
        "top_n_columns": None,
        "masking": None,
        "mask_style": None,
        "phrase_hints": None,
        "prompt": None,
        "model": None,
        "cascade_hard_model": None,
        "cascade_enabled": None,
        "max_retries": None,
        "self_correction_max_retries": None,
        "cost_cap_usd": None,
        "limit": None,
        "easy": None,
        "medium": None,
        "hard": None,
        "extra": None,
        "overall": None,
        "exec_runtime_success": None,
        "spider_parse_failure_rate": None,
        "n_processed": None,
        "total_cost_usd": None,
        "wall_time_s": None,
        "note": None,
        "pq_n_rows": None,
        "pq_avg_retries": None,
        "pq_frac_any_retry": None,
        "pq_frac_repick": None,
        "pq_broker_top1_acc": None,
        "pq_runtime_exec_acc": None,
    }

    for path in sorted(BASELINE_RESULTS_DIR.glob("*.json")):
        rel = path.relative_to(BASE_DIR).as_posix()
        try:
            data = json.loads(path.read_text(encoding="utf-8"))
        except json.JSONDecodeError as e:
            rows.append(
                {
                    "source": "baseline_json",
                    "artifact_relpath": rel,
                    "baseline_kind": "json_invalid",
                    "experiment_id": path.stem,
                    **blank_fed,
                    **_blank_baseline_cols(),
                    "note": f"JSON decode error: {e}",
                }
            )
            continue

        if _is_dr_spider_json(data):
            for item in data["results"]:
                b = _blank_baseline_cols()
                b.update(
                    {
                        "dr_variant": item.get("name"),
                        "dr_pre_accuracy": item.get("pre_accuracy"),
                        "dr_post_accuracy": item.get("post_accuracy"),
                        "dr_drop": item.get("drop"),
                        "dr_count": item.get("count"),
                        "detail_json": json.dumps(
                            {"config": data.get("config"), "row": item}, separators=(",", ":")
                        )[:8000],
                    }
                )
                rows.append(
                    {
                        "source": "baseline_json",
                        "artifact_relpath": rel,
                        "baseline_kind": "dr_spider_variant",
                        "experiment_id": f"{path.stem}::{item.get('name', '?')}",
                        **blank_fed,
                        **b,
                    }
                )
            continue

        if _is_retrieval_sweep_json(data):
            cfg = data.get("config") or {}
            for run_id, run in sorted(data["runs"].items(), key=lambda t: str(t[0])):
                summ = (run or {}).get("summary") or {}
                all_b = summ.get("all") or {}
                b = _blank_baseline_cols()
                b.update(
                    {
                        "retrieval_run_id": str(run_id),
                        "retrieval_config_mode": cfg.get("mode"),
                        "ret_all_recall": all_b.get("recall"),
                        "ret_all_precision": all_b.get("precision"),
                        "ret_all_srr": all_b.get("srr"),
                        "ret_all_column_recall": all_b.get("column_recall"),
                        "ret_all_avg_tables": all_b.get("avg_tables_returned"),
                        "detail_json": json.dumps(
                            {"config": cfg, "run_id": run_id, "summary": summ},
                            separators=(",", ":"),
                        )[:8000],
                    }
                )
                rows.append(
                    {
                        "source": "baseline_json",
                        "artifact_relpath": rel,
                        "baseline_kind": "retrieval_sweep_run",
                        "experiment_id": f"{path.stem}#run={run_id}",
                        **blank_fed,
                        **b,
                    }
                )
            continue

        if _is_extra_decomposition_json(data):
            sm = data["summary"]
            b = _blank_baseline_cols()
            b.update(
                {
                    "baseline_exec_accuracy": sm.get("baseline_exec_accuracy"),
                    "decomposition_exec_accuracy": sm.get("decomposition_exec_accuracy"),
                    "decomposition_delta": sm.get("delta"),
                    "detail_json": json.dumps(
                        {"config": data.get("config"), "summary": sm}, separators=(",", ":")
                    )[:8000],
                }
            )
            rows.append(
                {
                    "source": "baseline_json",
                    "artifact_relpath": rel,
                    "baseline_kind": "extra_decomposition",
                    "experiment_id": path.stem,
                    **blank_fed,
                    **b,
                }
            )
            continue

        if _is_extra_schema_json(data):
            sm = data["summary"]
            b = _blank_baseline_cols()
            b.update(
                {
                    "rag_current_acc": sm.get("current_rag"),
                    "rag_broader_acc": sm.get("broader_rag"),
                    "rag_full_schema_acc": sm.get("full_schema"),
                    "detail_json": json.dumps(
                        {"config": data.get("config"), "summary": sm}, separators=(",", ":")
                    )[:8000],
                }
            )
            rows.append(
                {
                    "source": "baseline_json",
                    "artifact_relpath": rel,
                    "baseline_kind": "extra_schema_context",
                    "experiment_id": path.stem,
                    **blank_fed,
                    **b,
                }
            )
            continue

        rows.append(
            {
                "source": "baseline_json",
                "artifact_relpath": rel,
                "baseline_kind": "json_other",
                "experiment_id": path.stem,
                **blank_fed,
                **_blank_baseline_cols()
                | {
                    "detail_json": json.dumps(data, separators=(",", ":"))[:12000],
                },
            }
        )

    for path in sorted(BASELINE_RESULTS_DIR.glob("*.log")):
        rel = path.relative_to(BASE_DIR).as_posix()
        text = path.read_text(encoding="utf-8", errors="replace")
        overall, by_diff = parse_spider_execution_from_text(text)
        err_lines = sum(1 for line in text.splitlines() if line.startswith("eval_err_num:"))
        divisor = 50 if "_50" in path.name or "50" in path.name else 320
        err_rate = err_lines / divisor if err_lines else None
        rows.append(
            {
                "source": "baseline_eval_log",
                "artifact_relpath": rel,
                "baseline_kind": "spider_eval_log",
                "experiment_id": path.stem,
                **{
                    "routing": None,
                    "retrieval": None,
                    "retrieval_easy_medium": None,
                    "retrieval_hard_extra": None,
                    "top_k_tables": None,
                    "top_n_columns": None,
                    "masking": None,
                    "mask_style": None,
                    "phrase_hints": None,
                    "prompt": None,
                    "model": None,
                    "cascade_hard_model": None,
                    "cascade_enabled": None,
                    "max_retries": None,
                    "self_correction_max_retries": None,
                    "easy": by_diff.get("easy"),
                    "medium": by_diff.get("medium"),
                    "hard": by_diff.get("hard"),
                    "extra": by_diff.get("extra"),
                    "overall": overall,
                    "exec_runtime_success": None,
                    "spider_parse_failure_rate": err_rate,
                    "n_processed": divisor if overall is not None else None,
                    "total_cost_usd": None,
                    "wall_time_s": None,
                    "note": None,
                },
                **_blank_baseline_cols()
                | {"eval_log_parse_errors": err_lines},
            }
        )

    return rows


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--experiment-ids", nargs="*", default=None,
                   help="Restrict to these IDs; default = all named runs/*/summary.json")
    p.add_argument("--out-csv", default="final_results.csv")
    p.add_argument("--out-md", default="final_results.md")
    p.add_argument(
        "--include-smoke",
        action="store_true",
        help="Include runs whose directory name starts with '_' (smoke tests).",
    )
    p.add_argument(
        "--no-markdown",
        action="store_true",
        help="Only write CSV (skip final_results.md).",
    )
    p.add_argument(
        "--no-baseline",
        action="store_true",
        help="Do not scan baseline/results for JSON and eval logs.",
    )
    args = p.parse_args()

    if args.experiment_ids:
        ids = args.experiment_ids
    else:
        paths = sorted(RUNS_DIR.glob("*/summary.json"), key=lambda p: p.parent.name.lower())
        ids = [
            p.parent.name for p in paths
            if args.include_smoke or not p.parent.name.startswith("_")
        ]

    rows = collect_federated_rows(ids)
    if not args.no_baseline:
        rows.extend(collect_baseline_rows())

    if not rows:
        print("No rows to write.")
        return

    fieldnames: list[str] = []
    for r in rows:
        for k in r:
            if k not in fieldnames:
                fieldnames.append(k)

    out_csv = BASE_DIR / args.out_csv
    try:
        with open(out_csv, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
            w.writeheader()
            w.writerows(rows)
    except PermissionError:
        alt = BASE_DIR / (out_csv.stem + "_new.csv")
        print(
            f"Permission denied writing {out_csv} (file is likely open in the editor or Excel).\n"
            f"  Close it, or write to a different path, e.g. --out-csv {alt.name}\n"
            f"  Writing to {alt} instead.",
            file=sys.stderr,
        )
        with open(alt, "w", newline="", encoding="utf-8") as f:
            w = csv.DictWriter(f, fieldnames=fieldnames, extrasaction="ignore")
            w.writeheader()
            w.writerows(rows)
        out_csv = alt
    print(f"Wrote {len(rows)} rows to {out_csv}")

    if not args.no_markdown:
        md_lines = []
        md_lines.append(
            "| Source | Experiment | Cascade | Max SC retries | Mask | Hints | Prompt | Retrieval | Easy | Medium | Hard | Extra | **Overall** | Cost | Wall (s) |"
        )
        md_lines.append("|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|")

        def fmt(x):
            return f"{x*100:.1f}" if isinstance(x, (int, float)) and x is not None else "—"

        for r in rows:
            if r.get("source") != "federated":
                continue
            if r.get("cascade_enabled"):
                cm = r.get("cascade_hard_model") or "?"
                casc = f"yes (`{cm}`)"
            else:
                casc = "no"
            scap = r.get("self_correction_max_retries")
            if scap is None:
                scap = r.get("max_retries")
            sc_s = str(scap) if scap is not None else "—"
            mask = "off" if not r.get("masking") else (r.get("mask_style") or "hard")
            ph = r.get("phrase_hints")
            hints = "yes" if ph else ("no" if ph is False else "—")
            cost = "$0" if (r.get("total_cost_usd") or 0) == 0 else f"${r['total_cost_usd']:.3f}"
            md_lines.append(
                f"| federated | `{r['experiment_id']}` | {casc} | {sc_s} | {mask} | {hints} | {r.get('prompt','—')} | {r.get('retrieval','—')} | "
                f"{fmt(r.get('easy'))} | {fmt(r.get('medium'))} | {fmt(r.get('hard'))} | {fmt(r.get('extra'))} | "
                f"**{fmt(r.get('overall'))}** | {cost} | {r.get('wall_time_s', '—')} |"
            )
        out_md = BASE_DIR / args.out_md
        out_md.write_text("\n".join(md_lines) + "\n", encoding="utf-8")
        print(f"Wrote markdown table to {out_md}")


if __name__ == "__main__":
    main()
