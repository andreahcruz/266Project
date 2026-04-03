"""Run Spider official evaluation with aligned gold/pred line counts (test split).

Writes a gold slice file unless --skip-gold-write:
  - SPIDER_TEST_SPLIT=first_n (default): first N lines of test_gold.sql -> gold_test_{N}.sql
  - SPIDER_TEST_SPLIT=balanced_16x4: 64 lines -> gold_test_balanced_16x4.sql
  - SPIDER_TEST_SPLIT=balanced_80x4: 320 lines -> gold_test_balanced_80x4.sql

Asserts gold and pred have the same number of non-empty lines.

Usage (from repo root):
  python run_eval.py --pred baseline/results/cerebras_zero_shot.sql --etype exec
  python run_eval.py --pred baseline/results/cerebras_self_correction.sql --etype match
"""

import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent
if str(ROOT) not in sys.path:
    sys.path.insert(0, str(ROOT))

from config import (
    BASE_DIR,
    BALANCED_INDICES,
    GOLD_SLICE_PATH,
    NUM_QUESTIONS,
    RESULTS_DIR,
    SPIDER_TEST_SPLIT,
    TEST_GOLD,
    TEST_DATABASE_DIR,
    TEST_TABLES_JSON,
)


def gold_slice_path_for_n(n: int) -> Path:
    """Gold file for first-n split (same naming as config when SPIDER_TEST_SPLIT=first_n)."""
    return RESULTS_DIR / f"gold_test_{n}.sql"


def write_gold_slice_first_n(n: int) -> Path:
    """Write first n lines of test_gold.sql to baseline/results/gold_test_{n}.sql."""
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    path = gold_slice_path_for_n(n)
    with open(TEST_GOLD, encoding="utf-8") as f:
        lines = []
        for _ in range(n):
            line = f.readline()
            if not line:
                break
            lines.append(line)
    with open(path, "w", encoding="utf-8") as out:
        out.writelines(lines)
    print(f"Wrote {len(lines)} gold lines to {path}")
    return path


def write_gold_slice_balanced() -> Path:
    """Write gold lines at indices from balanced_test_indices_*.json (see config)."""
    RESULTS_DIR.mkdir(parents=True, exist_ok=True)
    with open(TEST_GOLD, encoding="utf-8") as f:
        all_lines = f.readlines()
    lines = [all_lines[i] for i in BALANCED_INDICES]
    with open(GOLD_SLICE_PATH, "w", encoding="utf-8") as out:
        out.writelines(lines)
    print(f"Wrote {len(lines)} gold lines to {GOLD_SLICE_PATH}")
    return GOLD_SLICE_PATH


def count_nonempty_lines(path):
    with open(path, encoding="utf-8") as f:
        return sum(1 for line in f if line.strip())


def main():
    parser = argparse.ArgumentParser(description="Run evaluation.py with test split alignment checks")
    parser.add_argument("--pred", required=True, type=Path, help="Prediction .sql file (one query per line)")
    parser.add_argument(
        "--etype",
        default="exec",
        choices=["exec", "match", "all"],
        help="Spider eval type (default: exec)",
    )
    parser.add_argument(
        "--skip-gold-write",
        action="store_true",
        help="Do not regenerate gold slice (use existing gold_test_*.sql)",
    )
    parser.add_argument(
        "-n",
        "--num-questions",
        type=int,
        default=None,
        help=f"Must match the N used in baseline runs (default: NUM_QUESTIONS={NUM_QUESTIONS})",
    )
    args = parser.parse_args()

    pred_path = args.pred
    if not pred_path.is_file():
        sys.exit(f"Prediction file not found: {pred_path}")

    if BALANCED_INDICES is not None:
        if args.num_questions is not None and args.num_questions != NUM_QUESTIONS:
            print(
                f"Note: -n {args.num_questions} ignored; {SPIDER_TEST_SPLIT} split uses {NUM_QUESTIONS} questions.",
            )
        n = NUM_QUESTIONS
        gold_path = GOLD_SLICE_PATH
        if not args.skip_gold_write:
            write_gold_slice_balanced()
        elif not gold_path.is_file():
            sys.exit(
                f"Gold slice missing: {gold_path}. "
                "Run without --skip-gold-write first.",
            )
    else:
        n = args.num_questions if args.num_questions is not None else NUM_QUESTIONS
        gold_path = gold_slice_path_for_n(n)
        if not args.skip_gold_write:
            write_gold_slice_first_n(n)
        elif not gold_path.is_file():
            sys.exit(
                f"Gold slice missing: {gold_path}. "
                "Run without --skip-gold-write or set -n to match an existing gold_test_*.sql.",
            )

    g_n = count_nonempty_lines(gold_path)
    p_n = count_nonempty_lines(pred_path)
    if g_n != p_n:
        sys.exit(
            f"Line count mismatch: gold has {g_n} non-empty lines, pred has {p_n}. "
            f"Use the same split (-n / NUM_QUESTIONS / SPIDER_TEST_SPLIT) for baseline and run_eval."
        )
    if g_n != n:
        sys.exit(f"Gold file has {g_n} lines but expected {n} (truncated test_gold.sql?).")

    cmd = [
        sys.executable,
        str(BASE_DIR / "evaluation.py"),
        "--gold",
        str(gold_path),
        "--pred",
        str(pred_path.resolve()),
        "--db",
        str(TEST_DATABASE_DIR.relative_to(BASE_DIR)),
        "--table",
        str(TEST_TABLES_JSON.relative_to(BASE_DIR)),
        "--etype",
        args.etype,
    ]
    print("Running:", " ".join(cmd))
    subprocess.run(cmd, cwd=BASE_DIR, check=True)


if __name__ == "__main__":
    main()
