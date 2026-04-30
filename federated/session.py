"""Per-question session state for the federated pipeline."""

from __future__ import annotations

import uuid
from dataclasses import dataclass, field
from typing import Any, Optional


@dataclass
class SessionState:
    """One session per question. Holds the mask dict and chat history.

    Mask dicts are session-scoped so retries within the same question see
    the same token meanings; this keeps self-correction chat history coherent.
    """
    session_id: str = field(default_factory=lambda: uuid.uuid4().hex[:8])
    db_id: Optional[str] = None
    mask_dict: Optional[dict] = None
    chat_history: list = field(default_factory=list)
    retry_count: int = 0
    masked_schema: Optional[str] = None
    extra: dict = field(default_factory=dict)
