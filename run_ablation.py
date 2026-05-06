"""Run an ablation matrix of federated eval cells, then aggregate results.

Reads ``ablation_configs.json`` (or any JSON with the same shape), runs each
cell sequentially via ``run_federated_eval.py`` as a subprocess, and at the
end writes ``ablation_results.csv`` with one row per cell.

Cells may also set ``retrieval_easy_medium``, ``retrieval_hard_extra``,
``top_k_tables``, ``top_n_columns``, ``broker_margin_delta``, and ``blurbs_dir``
(relative to repo root, passed to ``run_federated_eval --blurbs-dir`` for broker
routing). Manifest-level ``_default_blurbs_dir`` fills in when a cell omits it.

Usage::

    python run_ablation.py --manifest ablation_configs.json
    python run_ablation.py --manifest ablation_configs.json --only masked-oracle masked-broker
    python run_ablation.py --manifest ablation_configs.json --skip-existing
"""

from __future__ import annotations

import argparse
import csv
import json
import os
import subprocess
import sys
from pathlib import Path

from config import BASE_DIR, RUNS_DIR

from build_final_results import parse_eval_err_rate
from build_final_results import _per_question_aggregates

# Reference privacy metrics (Spider 11-DB weighted column privacy; see ADDITIONAL_METRICS.md).
_REF_PRIVACY_HARD = {"ref_shannon_bits": 3.08, "ref_min_entropy_bits": 3.08, "ref_ilr_vs_hard_bits": 0.0}
_REF_PRIVACY_SEM = {"ref_shannon_bits": 2.21, "ref_min_entropy_bits": 2.21, "ref_ilr_vs_hard_bits": 0.87}


def parse_args():
    p = argparse.ArgumentParser()
    p.add_argument("--manifest", default="ablation_configs.json")
    p.add_argument("--only", nargs="*", default=None,
                   help="Only run cells whose experiment_id is in this list")
    p.add_argument(
        "--skip-existing", action="store_true",
        help="Skip cells whose runs/<id>/summary.json already exists"
    )
    p.add_argument("--out", default="ablation_results.csv")
    return p.parse_args()


def cell_to_cli(cell: dict, defaults: dict) -> list[str]:
    """Build the argv for run_federated_eval.py."""
    cmd = [
        sys.executable,
        str(BASE_DIR / "run_federated_eval.py"),
        "--experiment-id", cell["experiment_id"],
        "--routing", cell.get("routing", defaults.get("_default_routing", "broker")),
        "--retrieval", cell.get("retrieval", "hybrid"),
        "--prompt", cell.get("prompt", "few_shot"),
        "--model", cell.get("model", defaults.get("_default_model", "llama3.1-8b")),
        "--max-retries", str(cell.get("max_retries", defaults.get("_default_max_retries", 3))),
        "--cost-cap-usd", str(cell.get("cost_cap_usd", defaults.get("_default_cost_cap_usd", 1.0))),
    ]
    if not cell.get("masking", True):
        cmd.append("--no-mask")
    else:
        cmd += ["--mask-style", cell.get("mask_style", "hard")]
    if cell.get("phrase_hints", False):
        cmd.append("--phrase-hints")
    if cell.get("cascade_hard_model"):
        cmd += ["--cascade-hard-model", cell["cascade_hard_model"]]
    bmd = cell.get("broker_margin_delta", defaults.get("_default_broker_margin_delta"))
    if bmd is not None:
        cmd += ["--broker-margin-delta", str(bmd)]
    routing = cell.get("routing", defaults.get("_default_routing", "broker"))
    blurbs = cell.get("blurbs_dir", defaults.get("_default_blurbs_dir"))
    if routing == "broker" and blurbs:
        cmd += ["--blurbs-dir", str(blurbs)]
    if cell.get("retrieval_easy_medium"):
        cmd += ["--retrieval-easy-medium", cell["retrieval_easy_medium"]]
    if cell.get("retrieval_hard_extra"):
        cmd += ["--retrieval-hard-extra", cell["retrieval_hard_extra"]]
    if cell.get("top_k_tables") is not None:
        cmd += ["--top-k-tables", str(cell["top_k_tables"])]
    if cell.get("top_n_columns") is not None:
        cmd += ["--top-n-columns", str(cell["top_n_columns"])]
    if cell.get("resume", False):
        cmd.append("--resume")
    return cmd


def load_summary(experiment_id: str) -> dict | None:
    p = RUNS_DIR / experiment_id / "summary.json"
    if not p.exists():
        return None
    return json.loads(p.read_text())


def main():
    args = parse_args()
    manifest = json.loads(Path(args.manifest).read_text())
    cells = manifest["cells"]
    if args.only:
        wanted = set(args.only)
        cells = [c for c in cells if c["experiment_id"] in wanted]

    print(f"Running {len(cells)} cells:")
    for c in cells:
        print(f"  - {c['experiment_id']}: {c.get('purpose','')[:80]}")

    for c in cells:
        eid = c["experiment_id"]
        if args.skip_existing and load_summary(eid) is not None:
            print(f"\n>>> [skip] {eid} already has summary.json")
            continue
        print(f"\n>>> [run] {eid}")
        cmd = cell_to_cli(c, manifest)
        print("    " + " ".join(cmd))
        env = dict(os.environ)
        rc = subprocess.run(cmd, cwd=BASE_DIR, env=env).returncode
        if rc != 0:
            print(f"    !! cell {eid} exited rc={rc}; continuing")

    fields = [
        "experiment_id",
        "blurb_source",
        "blurbs_dir",
        "routing",
        "retrieval",
        "mask_style",
        "phrase_hints",
        "masking",
        "prompt",
        "model",
        "cascade_hard_model",
        "broker_margin_delta",
        "n_processed",
        "exec_success_rate_runtime",
        "spider_exec_accuracy_overall",
        "easy_acc",
        "medium_acc",
        "hard_acc",
        "extra_acc",
        "total_cost_usd",
        "wall_time_seconds",
        "spider_parse_failure_rate",
        # Reference masking privacy (static benchmarks from privacy_metrics write-up).
        "ref_shannon_bits",
        "ref_min_entropy_bits",
        "ref_ilr_vs_hard_bits",
        # From per_question.csv (federated run artifacts).
        "pq_n_rows",
        "pq_avg_retries",
        "pq_frac_any_retry",
        "pq_frac_repick",
        "pq_broker_top1_acc",
        "pq_db_routing_accuracy",
        "pq_frac_routing_tiebreak",
        "pq_avg_embedding_margin",
        "pq_avg_masked_token_count",
        "pq_runtime_exec_acc",
    ]
    out_path = BASE_DIR / args.out
    rows: list[dict] = []
    for c in cells:
        eid = c["experiment_id"]
        s = load_summary(eid)
        if not s:
            continue
        bd_exec = s.get("spider_exec_by_difficulty", {}) or {}
        if not isinstance(bd_exec, dict):
            bd_exec = {}
        cfg_path = RUNS_DIR / eid / "config.json"
        cfg = json.loads(cfg_path.read_text(encoding="utf-8")) if cfg_path.exists() else {}

        def cfg_pick(key: str):
            return cfg.get(key, s.get(key))

        n_done = s.get("n_processed") or 320
        try:
            n_div = max(1, int(n_done))
        except (TypeError, ValueError):
            n_div = 320
        parse_fail = parse_eval_err_rate(RUNS_DIR / eid / "evaluation_stdout.txt", n_div)

        pq = dict(_per_question_aggregates(RUNS_DIR / eid))

        ms = str(cfg_pick("mask_style") or "").lower()
        hints = bool(cfg_pick("phrase_hints"))
        ref_priv = {}
        if ms == "semantic":
            ref_priv = dict(_REF_PRIVACY_SEM)
        elif ms == "hard":
            ref_priv = dict(_REF_PRIVACY_HARD)
        elif ms == "none" or not cfg_pick("masking"):
            ref_priv = {"ref_shannon_bits": "", "ref_min_entropy_bits": "", "ref_ilr_vs_hard_bits": ""}

        rows.append({
            "experiment_id": s.get("experiment_id"),
            "blurb_source": c.get("blurb_source", ""),
            "blurbs_dir": (
                str(Path(_bd).relative_to(BASE_DIR))
                if (_bd := cfg.get("blurbs_dir"))
                else ""
            ),
            "routing": cfg_pick("routing"),
            "retrieval": cfg_pick("retrieval"),
            "mask_style": cfg_pick("mask_style"),
            "phrase_hints": hints,
            "masking": cfg_pick("masking"),
            "prompt": cfg_pick("prompt"),
            "model": cfg_pick("model"),
            "cascade_hard_model": cfg_pick("cascade_hard_model"),
            "broker_margin_delta": cfg_pick("broker_margin_delta"),
            "n_processed": s.get("n_processed"),
            "exec_success_rate_runtime": s.get("exec_success_rate_runtime"),
            "spider_exec_accuracy_overall": s.get("spider_exec_accuracy_overall"),
            "easy_acc": bd_exec.get("easy"),
            "medium_acc": bd_exec.get("medium"),
            "hard_acc": bd_exec.get("hard"),
            "extra_acc": bd_exec.get("extra"),
            "total_cost_usd": s.get("total_cost_usd"),
            "wall_time_seconds": s.get("wall_time_seconds"),
            "spider_parse_failure_rate": parse_fail,
            "ref_shannon_bits": ref_priv.get("ref_shannon_bits", ""),
            "ref_min_entropy_bits": ref_priv.get("ref_min_entropy_bits", ""),
            "ref_ilr_vs_hard_bits": ref_priv.get("ref_ilr_vs_hard_bits", ""),
            **{k: pq.get(k) for k in (
                "pq_n_rows",
                "pq_avg_retries",
                "pq_frac_any_retry",
                "pq_frac_repick",
                "pq_broker_top1_acc",
                "pq_db_routing_accuracy",
                "pq_frac_routing_tiebreak",
                "pq_avg_embedding_margin",
                "pq_avg_masked_token_count",
                "pq_runtime_exec_acc",
            )},
        })
    with open(out_path, "w", newline="", encoding="utf-8") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in rows:
            w.writerow(r)
    print(f"\nWrote {len(rows)} rows to {out_path}")


if __name__ == "__main__":
    main()
