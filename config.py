"""Project configuration settings."""

import json
import os
from pathlib import Path
from typing import List, Optional

from dotenv import load_dotenv

load_dotenv()

# ── Paths ─────────────────────────────────────────────────
BASE_DIR = Path(__file__).resolve().parent
DATABASE_DIR = BASE_DIR / "database"
TABLES_JSON = BASE_DIR / "tables.json"
DEV_JSON = BASE_DIR / "dev.json"
DEV_GOLD = BASE_DIR / "dev_gold.sql"
PROMPT_DIR = BASE_DIR / "prompts"
RESULTS_DIR = BASE_DIR / "baseline" / "results"

# Test-set paths (Spider official test split)
TEST_DATABASE_DIR = BASE_DIR / "test_database"
TEST_TABLES_JSON = BASE_DIR / "test_tables.json"
TEST_JSON = BASE_DIR / "test.json"
TEST_GOLD = BASE_DIR / "test_gold.sql"

# Few-shot ICL (train examples; disjoint from test questions)
TRAIN_SPIDER_JSON = BASE_DIR / "train_spider.json"

# ── Test split for baselines (questions, schema, DBs, gold must stay aligned) ──
# SPIDER_TEST_SPLIT=first_n — use first NUM_QUESTIONS rows of test.json / test_gold.sql (default).
# SPIDER_TEST_SPLIT=balanced_16x4 — 16+16+16+16 = 64; preds: e.g. openai_zero_shot.sql
# SPIDER_TEST_SPLIT=balanced_80x4 — 80+80+80+80 = 320; preds: e.g. openai_zero_shot_balanced_80x4.sql (keeps 64-line files separate)
QUESTIONS_JSON = TEST_JSON
TABLES_FOR_RUN = TEST_TABLES_JSON
DATABASE_DIR_FOR_RUN = TEST_DATABASE_DIR
GOLD_FOR_RUN = TEST_GOLD

SPIDER_TEST_SPLIT = os.getenv("SPIDER_TEST_SPLIT", "first_n")
BALANCED_INDICES: Optional[List[int]] = None

if SPIDER_TEST_SPLIT == "balanced_16x4":
    with open(BASE_DIR / "balanced_test_indices_16x4.json", encoding="utf-8") as _bf:
        _balanced = json.load(_bf)
    BALANCED_INDICES = list(_balanced["indices"])
    NUM_QUESTIONS = len(BALANCED_INDICES)
    GOLD_SLICE_PATH = RESULTS_DIR / "gold_test_balanced_16x4.sql"
elif SPIDER_TEST_SPLIT == "balanced_80x4":
    with open(BASE_DIR / "balanced_test_indices_80x4.json", encoding="utf-8") as _bf:
        _balanced = json.load(_bf)
    BALANCED_INDICES = list(_balanced["indices"])
    NUM_QUESTIONS = len(BALANCED_INDICES)
    GOLD_SLICE_PATH = RESULTS_DIR / "gold_test_balanced_80x4.sql"
else:
    NUM_QUESTIONS = int(os.getenv("NUM_QUESTIONS", "50"))
    GOLD_SLICE_PATH = RESULTS_DIR / f"gold_test_{NUM_QUESTIONS}.sql"


def balanced_pred_filename(stem: str) -> str:
    """Prediction filename stem without .sql, e.g. 'openai_zero_shot' -> openai_zero_shot_balanced_80x4.sql when split is 320."""
    if SPIDER_TEST_SPLIT == "balanced_80x4":
        return f"{stem}_balanced_80x4.sql"
    return f"{stem}.sql"


def select_test_questions(all_questions: list, num_questions_override: Optional[int] = None) -> list:
    """Rows from test.json for baseline runs. Override applies only when SPIDER_TEST_SPLIT=first_n."""
    if BALANCED_INDICES is not None:
        return [all_questions[i] for i in BALANCED_INDICES]
    n = num_questions_override if num_questions_override is not None else NUM_QUESTIONS
    return all_questions[:n]

# ── API Keys ──────────────────────────────────────────────
GROQ_API_KEY = os.getenv("GROQ_API_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
CEREBRAS_API_KEY = os.getenv("CEREBRAS_API_KEY")
OPENAI_API_KEY = os.getenv("OPENAI_API_KEY")

# ── Model Settings ────────────────────────────────────────
GROQ_MODEL = "llama-3.3-70b-versatile"
GEMINI_MODEL = "gemini-2.0-flash"
# Cerebras OpenAI-compatible API — use a Model ID from https://inference-docs.cerebras.ai/models
# Public production IDs include llama3.1-8b and gpt-oss-120b; llama-3.3-70b often 404s on shared API.
CEREBRAS_BASE_URL = os.getenv("CEREBRAS_BASE_URL", "https://api.cerebras.ai/v1")
CEREBRAS_MODEL = os.getenv("CEREBRAS_MODEL", "llama3.1-8b")
CEREBRAS_MAX_TOKENS = int(os.getenv("CEREBRAS_MAX_TOKENS", "512"))
CEREBRAS_MAX_TOKENS_COT = int(os.getenv("CEREBRAS_MAX_TOKENS_COT", "1536"))

# OpenAI API — https://platform.openai.com/docs/models (override OPENAI_MODEL if the slug differs)
OPENAI_BASE_URL = os.getenv("OPENAI_BASE_URL", "https://api.openai.com/v1")
OPENAI_MODEL = os.getenv("OPENAI_MODEL", "gpt-5.4-mini")
OPENAI_MAX_TOKENS = int(os.getenv("OPENAI_MAX_TOKENS", "512"))
OPENAI_MAX_TOKENS_COT = int(os.getenv("OPENAI_MAX_TOKENS_COT", "1536"))

FEW_SHOT_K = int(os.getenv("FEW_SHOT_K", "3"))
FEW_SHOT_SEED = int(os.getenv("FEW_SHOT_SEED", "42"))

# ── Experiment Settings ───────────────────────────────────
MAX_RETRIES = 3
API_DELAY = 0.5  # seconds between API calls to avoid rate limits
SQL_TIMEOUT = 30  # seconds for SQL execution timeout
