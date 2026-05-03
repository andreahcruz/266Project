"""Aggregate every cell's summary.json into one final_results.csv + a markdown
table snippet ready to drop into the writeup.

Discovers experiments by globbing ``runs/*/summary.json``. Skips smoke-test
directories that start with an underscore.

Usage::

    python build_final_results.py
    python build_final_results.py --experiment-ids control masked-oracle ...   # subset
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


def parse_eval_err_rate(eval_log: Path) -> float | None:
    """Read eval_err_num count from evaluation_stdout.txt and divide by 320."""
    if not eval_log.exists():
        return None
    count = 0
    with open(eval_log) as f:
        for line in f:
            if line.startswith("eval_err_num:"):
                count += 1
    return count / 320.0


def main():
    p = argparse.ArgumentParser()
    p.add_argument("--experiment-ids", nargs="*", default=None,
                   help="Restrict to these IDs; default = all named runs/*/summary.json")
    p.add_argument("--out-csv", default="final_results.csv")
    p.add_argument("--out-md", default="final_results.md")
    args = p.parse_args()

    if args.experiment_ids:
        ids = args.experiment_ids
    else:
        ids = sorted(p.parent.name for p in RUNS_DIR.glob("*/summary.json")
                     if not p.parent.name.startswith("_"))

    rows: list[dict] = []
    for eid in ids:
        sp = RUNS_DIR / eid / "summary.json"
        if not sp.exists():
            print(f"[skip] {eid} (no summary.json)")
            continue
        s = json.loads(sp.read_text())
        bd = s.get("spider_exec_by_difficulty", {}) or {}
        eval_err_rate = parse_eval_err_rate(RUNS_DIR / eid / "evaluation_stdout.txt")
        rows.append({
            "experiment_id": eid,
            "routing": s.get("routing"),
            "retrieval": s.get("retrieval"),
            "masking": s.get("masking"),
            "mask_style": s.get("mask_style"),
            "prompt": s.get("prompt"),
            "model": s.get("model"),
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
            "cascade_hard_model": s.get("cascade_hard_model"),
        })

    # CSV
    out_csv = BASE_DIR / args.out_csv
    if rows:
        with open(out_csv, "w", newline="") as f:
            w = csv.DictWriter(f, fieldnames=list(rows[0].keys()))
            w.writeheader()
            w.writerows(rows)
        print(f"Wrote {len(rows)} rows to {out_csv}")

    # Markdown table — easy to paste into the writeup.
    md_lines = []
    md_lines.append("| Experiment | Mask | Hints | Prompt | Retrieval | Easy | Medium | Hard | Extra | **Overall** | Cost | Wall (s) |")
    md_lines.append("|---|---|---|---|---|---|---|---|---|---|---|---|")
    for r in rows:
        mask = "off" if not r["masking"] else (r.get("mask_style") or "hard")
        hints = "—"  # we don't currently persist phrase_hints in summary; could add
        cost = "$0" if (r.get("total_cost_usd") or 0) == 0 else f"${r['total_cost_usd']:.3f}"
        def fmt(x):
            return f"{x*100:.1f}" if isinstance(x, (int, float)) and x is not None else "—"
        md_lines.append(
            f"| `{r['experiment_id']}` | {mask} | {hints} | {r.get('prompt','—')} | {r.get('retrieval','—')} | "
            f"{fmt(r['easy'])} | {fmt(r['medium'])} | {fmt(r['hard'])} | {fmt(r['extra'])} | "
            f"**{fmt(r['overall'])}** | {cost} | {r.get('wall_time_s', '—')} |"
        )
    out_md = BASE_DIR / args.out_md
    out_md.write_text("\n".join(md_lines) + "\n")
    print(f"Wrote markdown table to {out_md}")


if __name__ == "__main__":
    main()
