"""Load prompt templates from prompts/."""

from config import PROMPT_DIR


def load_prompt(template_name):
    path = PROMPT_DIR / template_name
    with open(path, encoding="utf-8") as f:
        return f.read()


def sql_chat_system_prompt(*, masking: bool = False, correction: bool = False) -> str:
    """Stable system prompts for text-to-SQL and self-correction across providers."""
    if correction:
        return load_prompt("system_sql_self_correction.txt")
    return load_prompt("system_text_to_sql_masked.txt" if masking else "system_text_to_sql.txt")
