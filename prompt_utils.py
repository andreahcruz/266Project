"""Load prompt templates from prompts/."""

from config import PROMPT_DIR


def load_prompt(template_name):
    path = PROMPT_DIR / template_name
    with open(path, encoding="utf-8") as f:
        return f.read()
