"""Run an ablation matrix of federated eval cells, then aggregate results.

Reads ``ablation_configs.json`` (or any JSON with the same shape), runs each
cell sequentially via ``run_federated_eval.py`` as a subprocess, and at the
end writes ``ablation_results.csv`` with one row per cell.

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
        "--routing", cell.get("routing", "broker"),
        "--retrieval", cell.get("retrieval", "hybrid"),
        "--prompt", cell.get("prompt", "few_shot"),
        "--model", cell.get("model", defaults.get("_default_model", "llama3.1-8b")),
        "--max-retries", str(cell.get("max_retries", defaults.get("_default_max_retries", 3))),
        "--cost-cap-usd", str(cell.get("cost_cap_usd", defaults.get("_default_cost_cap_usd", 1.0))),
    ]
    if not cell.get("masking", True):
        cmd.append("--no-mask")
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

    # Aggregate
    fields = [
        "experiment_id", "routing", "retrieval", "masking", "prompt", "model",
        "n_processed", "exec_success_rate_runtime",
        "spider_exec_accuracy_overall",
        "easy_acc", "medium_acc", "hard_acc", "extra_acc",
        "total_cost_usd", "wall_time_seconds",
    ]
    out_path = BASE_DIR / args.out
    rows: list[dict] = []
    for c in manifest["cells"]:  # always aggregate all cells in manifest, not just those run this time
        s = load_summary(c["experiment_id"])
        if not s:
            continue
        bd = s.get("spider_exec_by_difficulty", {}) or {}
        rows.append({
            "experiment_id": s.get("experiment_id"),
            "routing": s.get("routing"),
            "retrieval": s.get("retrieval"),
            "masking": s.get("masking"),
            "prompt": s.get("prompt"),
            "model": s.get("model"),
            "n_processed": s.get("n_processed"),
            "exec_success_rate_runtime": s.get("exec_success_rate_runtime"),
            "spider_exec_accuracy_overall": s.get("spider_exec_accuracy_overall"),
            "easy_acc": bd.get("easy"),
            "medium_acc": bd.get("medium"),
            "hard_acc": bd.get("hard"),
            "extra_acc": bd.get("extra"),
            "total_cost_usd": s.get("total_cost_usd"),
            "wall_time_seconds": s.get("wall_time_seconds"),
        })
    with open(out_path, "w", newline="") as f:
        w = csv.DictWriter(f, fieldnames=fields)
        w.writeheader()
        for r in rows:
            w.writerow(r)
    print(f"\nWrote {len(rows)} rows to {out_path}")


if __name__ == "__main__":
    main()
