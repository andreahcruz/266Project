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

# Test-set paths (reserved for final evaluation only)
TEST_DATABASE_DIR = BASE_DIR / "test_database"
TEST_TABLES_JSON = BASE_DIR / "test_tables.json"
TEST_JSON = BASE_DIR / "test.json"
TEST_GOLD = BASE_DIR / "test_gold.sql"

# ── API Keys ──────────────────────────────────────────────
GROQ_API_KEY = os.getenv("GROQ_API_KEY")
GEMINI_API_KEY = os.getenv("GEMINI_API_KEY")

# ── Model Settings ────────────────────────────────────────
GROQ_MODEL = "llama-3.3-70b-versatile"
GEMINI_MODEL = "gemini-2.0-flash"

# ── Experiment Settings ───────────────────────────────────
MAX_RETRIES = 3
API_DELAY = 0.5  # seconds between API calls to avoid rate limits
SQL_TIMEOUT = 30  # seconds for SQL execution timeout
