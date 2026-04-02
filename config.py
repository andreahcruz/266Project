"""Project configuration settings."""

import os
from pathlib import Path
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

# ── Cerebras test-50 run (aligned: same split for questions, schema, DBs, gold) ──
QUESTIONS_JSON = TEST_JSON
TABLES_FOR_RUN = TEST_TABLES_JSON
DATABASE_DIR_FOR_RUN = TEST_DATABASE_DIR
GOLD_FOR_RUN = TEST_GOLD
NUM_QUESTIONS = int(os.getenv("NUM_QUESTIONS", "50"))
GOLD_SLICE_PATH = RESULTS_DIR / f"gold_test_{NUM_QUESTIONS}.sql"

# ── API Keys ──────────────────────────────────────────────
GROQ_API_KEY = os.getenv("GROQ_API_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")
CEREBRAS_API_KEY = os.getenv("CEREBRAS_API_KEY")

# ── Model Settings ────────────────────────────────────────
GROQ_MODEL = "llama-3.3-70b-versatile"
GEMINI_MODEL = "gemini-2.0-flash"
# Cerebras OpenAI-compatible API — use a Model ID from https://inference-docs.cerebras.ai/models
# Public production IDs include llama3.1-8b and gpt-oss-120b; llama-3.3-70b often 404s on shared API.
CEREBRAS_BASE_URL = os.getenv("CEREBRAS_BASE_URL", "https://api.cerebras.ai/v1")
CEREBRAS_MODEL = os.getenv("CEREBRAS_MODEL", "llama3.1-8b")

# ── Experiment Settings ───────────────────────────────────
MAX_RETRIES = 3
API_DELAY = 0.5  # seconds between API calls to avoid rate limits
SQL_TIMEOUT = 30  # seconds for SQL execution timeout
