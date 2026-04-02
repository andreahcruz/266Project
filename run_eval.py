"""Run Spider official evaluation with aligned gold/pred line counts (test split).

Writes the gold slice file (first NUM_QUESTIONS lines of test_gold.sql) unless --skip-gold-write.
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
    NUM_QUESTIONS,
    RESULTS_DIR,
    TEST_GOLD,
    TEST_DATABASE_DIR,
    TEST_TABLES_JSON,
)


def gold_slice_path_for_n(n: int) -> Path:
    """Same naming as config.GOLD_SLICE_PATH when n == NUM_QUESTIONS."""
    return RESULTS_DIR / f"gold_test_{n}.sql"


def write_gold_slice(n: int) -> Path:
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
        help="Do not regenerate gold slice (use existing gold_test_{n}.sql)",
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

    n = args.num_questions if args.num_questions is not None else NUM_QUESTIONS
    gold_path = gold_slice_path_for_n(n)

    if not args.skip_gold_write:
        write_gold_slice(n)
    elif not gold_path.is_file():
        sys.exit(
            f"Gold slice missing: {gold_path}. "
            "Run without --skip-gold-write or set -n to match an existing gold_test_*.sql."
        )

    g_n = count_nonempty_lines(gold_path)
    p_n = count_nonempty_lines(pred_path)
    if g_n != p_n:
        sys.exit(
            f"Line count mismatch: gold has {g_n} non-empty lines, pred has {p_n}. "
            f"Use the same N for baseline and run_eval (-n / NUM_QUESTIONS)."
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
