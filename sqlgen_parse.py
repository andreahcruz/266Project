"""Extract executable SQL strings from LLM responses."""

import re


def parse_sql_response(text):
    """Extract a clean SQL query from an LLM response.

    Handles markdown code fences, trailing semicolons, and
    explanatory text that models sometimes add.
    """
    if not text or not text.strip():
        return "SELECT 1"

    cleaned = text.strip()

    fence_pattern = r"```(?:sql)?\s*\n?(.*?)```"
    match = re.search(fence_pattern, cleaned, re.DOTALL | re.IGNORECASE)
    if match:
        cleaned = match.group(1).strip()

    sql_start = re.search(
        r"(?i)^(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP|WITH)\b",
        cleaned,
        re.MULTILINE,
    )
    if sql_start:
        cleaned = cleaned[sql_start.start():]

    parts = re.split(r"\n\s*\n", cleaned)
    if parts:
        cleaned = parts[0]

    cleaned = cleaned.rstrip(";").strip()
    cleaned = " ".join(cleaned.split())

    return cleaned if cleaned else "SELECT 1"
