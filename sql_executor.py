"""Run generated SQL queries against Spider databases."""

import sqlite3
import time
from pathlib import Path

from config import SQL_TIMEOUT


def execute_sql(db_id, sql_string, db_dir):
    """Execute a SQL query against the SQLite database for db_id.

    Returns (success, result_or_error):
        - (True, list_of_rows) on success
        - (False, error_message) on failure

    Uses SQL_TIMEOUT from config for both the SQLite busy-handler wait and a
    best-effort query deadline via set_progress_handler.
    """
    db_path = Path(db_dir) / db_id / f"{db_id}.sqlite"
    if not db_path.exists():
        return False, f"Database file not found: {db_path}"

    conn = None
    try:
        conn = sqlite3.connect(str(db_path), timeout=SQL_TIMEOUT)
        deadline = time.monotonic() + SQL_TIMEOUT

        def progress():
            if time.monotonic() > deadline:
                return 1
            return 0

        conn.set_progress_handler(progress, 100_000)
        cursor = conn.cursor()
        cursor.execute(sql_string)
        results = cursor.fetchall()
        conn.set_progress_handler(None, 0)
        return True, results
    except sqlite3.OperationalError as e:
        err = str(e).lower()
        if "interrupted" in err or "abort" in err:
            return False, f"Query exceeded {SQL_TIMEOUT}s timeout"
        return False, str(e)
    except Exception as e:
        return False, str(e)
    finally:
        if conn is not None:
            try:
                conn.set_progress_handler(None, 0)
                conn.close()
            except Exception:
                pass


if __name__ == "__main__":
    from config import DATABASE_DIR

    ok, result = execute_sql("perpetrator", "SELECT * FROM perpetrator LIMIT 3", DATABASE_DIR)
    print(f"Success: {ok}")
    print(f"Result: {result}")
