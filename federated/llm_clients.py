"""Unified LLM client with cost logging + rate-limit backoff.

Single entry point ``complete(messages, model, ...)`` dispatches to:
  - Anthropic for ``claude-*`` models
  - OpenAI for ``gpt-*``
  - Cerebras (OpenAI-compatible) for ``llama*`` / ``gpt-oss*``

Mirrors the exponential-backoff pattern from baseline_groq.call_groq.
"""

from __future__ import annotations

import time
from typing import Optional, Tuple

from config import (
    ANTHROPIC_API_KEY,
    ANTHROPIC_MAX_TOKENS,
    CEREBRAS_API_KEY,
    CEREBRAS_BASE_URL,
    CEREBRAS_MAX_TOKENS,
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    OPENAI_MAX_TOKENS,
)
from federated.cost_logger import CostLogger


_anthropic_client = None
_openai_client = None
_cerebras_client = None


def _get_anthropic():
    global _anthropic_client
    if _anthropic_client is None:
        from anthropic import Anthropic

        _anthropic_client = Anthropic(api_key=ANTHROPIC_API_KEY)
    return _anthropic_client


def _get_openai():
    global _openai_client
    if _openai_client is None:
        from openai import OpenAI

        _openai_client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    return _openai_client


def _get_cerebras():
    global _cerebras_client
    if _cerebras_client is None:
        from openai import OpenAI

        _cerebras_client = OpenAI(api_key=CEREBRAS_API_KEY, base_url=CEREBRAS_BASE_URL)
    return _cerebras_client


def _provider_for(model: str) -> str:
    if model.startswith("claude"):
        return "anthropic"
    if model.startswith("gpt-") and not model.startswith("gpt-oss"):
        return "openai"
    return "cerebras"


def _is_rate_limit(exc: Exception) -> bool:
    s = str(exc).lower()
    return "429" in s or "rate" in s or "overloaded" in s


def complete(
    messages: list,
    model: str,
    *,
    max_tokens: Optional[int] = None,
    temperature: float = 0.0,
    system: Optional[str] = None,
    cost_logger: Optional[CostLogger] = None,
    question_idx: Optional[int] = None,
    db_id: Optional[str] = None,
    retry_idx: int = 0,
    escalated: bool = False,
    note: str = "",
    max_attempts: int = 5,
) -> Tuple[str, dict]:
    """Send a chat completion. Returns ``(text, usage_dict)``.

    ``messages`` is a list of ``{"role": "user"|"assistant", "content": str}``.
    ``system`` is the optional system prompt (separated for Anthropic).
    """
    provider = _provider_for(model)
    last_exc = None
    for attempt in range(max_attempts):
        start = time.time()
        try:
            if provider == "anthropic":
                client = _get_anthropic()
                kwargs = dict(
                    model=model,
                    max_tokens=max_tokens or ANTHROPIC_MAX_TOKENS,
                    temperature=temperature,
                    messages=messages,
                )
                if system:
                    kwargs["system"] = system
                resp = client.messages.create(**kwargs)
                text = "".join(b.text for b in resp.content if hasattr(b, "text"))
                usage = {
                    "prompt_tokens": resp.usage.input_tokens,
                    "completion_tokens": resp.usage.output_tokens,
                }
            else:
                client = _get_openai() if provider == "openai" else _get_cerebras()
                openai_messages = list(messages)
                if system:
                    openai_messages = [{"role": "system", "content": system}] + openai_messages
                default_max = OPENAI_MAX_TOKENS if provider == "openai" else CEREBRAS_MAX_TOKENS
                resp = client.chat.completions.create(
                    model=model,
                    messages=openai_messages,
                    temperature=temperature,
                    max_tokens=max_tokens or default_max,
                )
                text = resp.choices[0].message.content
                u = resp.usage
                usage = {
                    "prompt_tokens": getattr(u, "prompt_tokens", 0),
                    "completion_tokens": getattr(u, "completion_tokens", 0),
                }

            latency_ms = int((time.time() - start) * 1000)
            if cost_logger is not None:
                cost_logger.log(
                    model=model,
                    prompt_tokens=usage["prompt_tokens"],
                    completion_tokens=usage["completion_tokens"],
                    latency_ms=latency_ms,
                    question_idx=question_idx,
                    db_id=db_id,
                    retry_idx=retry_idx,
                    escalated=escalated,
                    note=note,
                )
            return text, usage

        except Exception as exc:  # noqa: BLE001
            last_exc = exc
            if _is_rate_limit(exc) and attempt + 1 < max_attempts:
                wait = min(2**attempt * 10, 120)
                print(f"  [llm] rate-limited on {model}; waiting {wait}s (attempt {attempt + 1}/{max_attempts})")
                time.sleep(wait)
                continue
            raise

    raise RuntimeError(f"Rate limit exceeded after {max_attempts} attempts: {last_exc}")
