"""Extract executable SQL strings from LLM responses."""

import re


def _normalize_sql_line(text: str) -> str:
    """Collapse whitespace; strip semicolons."""
    if not text or not text.strip():
        return ""
    cleaned = text.rstrip(";").strip()
    return " ".join(cleaned.split()) if cleaned else ""


def parse_sql_after_chain_of_thought(text: str) -> str:
    """Extract SQL from CoT outputs: prefer last ```sql``` block, then last SELECT/WITH.

    Chain-of-thought replies may mention SQL in reasoning; the final answer should be
    in the last fenced block or the last statement starting with SELECT/WITH.
    """
    if not text or not text.strip():
        return "SELECT 1"

    raw = text.strip()

    # 1) Last ```sql ... ``` block (preferred)
    blocks = re.findall(r"```sql\s*\n?(.*?)```", raw, flags=re.DOTALL | re.IGNORECASE)
    for block in reversed(blocks):
        norm = _normalize_sql_line(block)
        if norm:
            return norm

    # 2) Last generic fenced block
    blocks = re.findall(r"```(?:sql)?\s*\n?(.*?)```", raw, flags=re.DOTALL | re.IGNORECASE)
    for block in reversed(blocks):
        norm = _normalize_sql_line(block)
        if norm and re.match(r"(?i)(SELECT|INSERT|UPDATE|DELETE|CREATE|ALTER|DROP|WITH)\b", norm):
            return norm

    # 3) Last line/span starting with SELECT or WITH (multiline-safe)
    matches = list(re.finditer(r"(?is)(?:^|\n)\s*((?:SELECT|WITH)\b.*?)(?=\n\n```|\Z)", raw))
    if matches:
        chunk = matches[-1].group(1).strip()
        norm = _normalize_sql_line(chunk.split("\n\n")[0])
        if norm:
            return norm

    # 4) Last occurrence of SELECT|WITH to end of string (single paragraph)
    last_kw = None
    for m in re.finditer(r"(?i)\b(SELECT|WITH)\b", raw):
        last_kw = m.start()
    if last_kw is not None:
        tail = raw[last_kw:]
        first_block = tail.split("\n\n")[0]
        norm = _normalize_sql_line(first_block)
        if norm:
            return norm

    return parse_sql_response(raw)


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
