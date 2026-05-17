"""Heuristics for semantic guidance on masked text-to-SQL questions."""

from __future__ import annotations

import re
from dataclasses import dataclass, field


DESCRIPTIVE_WORDS = {
    "name", "names", "title", "titles", "description", "descriptions",
    "details", "detail", "status", "country", "city", "state",
    "email", "phone", "address", "manufacturer", "captain", "manager",
    "type", "types", "category", "categories",
}
IDENTIFIER_WORDS = {"id", "ids", "code", "codes", "number", "numbers"}
COUNT_RANK_WORDS = {
    "most", "least", "fewest", "highest", "lowest", "largest", "smallest", "top",
}
AGGREGATE_WORDS = {
    "average", "avg", "sum", "total", "maximum", "minimum", "max", "min",
    "highest", "lowest", "largest", "smallest",
}
SET_INTERSECT_PATTERNS = (
    "both", "in both", "common to", "shared by", "also in",
)
SET_UNION_PATTERNS = (
    "either", "combined", "together from", "as well as",
)
SET_EXCEPT_PATTERNS = (
    "without", "not in", "do not", "does not", "never", "except", "not have", "no ",
)
MULTI_HOP_PATTERNS = (
    "through", "across", "via", "whose", "who have", "that have",
    "with their", "together with", "along with", "for customers who",
    "for products that", "for each", "per ",
)


@dataclass
class QuestionFocus:
    query_family: str
    return_field: str
    aggregation: str
    set_op_signal: str
    needs_multi_hop: bool
    target_sql_features: set[str] = field(default_factory=set)
    cues: list[str] = field(default_factory=list)


def _norm(text: str) -> str:
    return " ".join(re.findall(r"[a-z0-9_]+", text.lower()))


def _tokens(text: str) -> set[str]:
    return set(re.findall(r"[a-z0-9_]+", text.lower()))


def _contains_any(text: str, patterns: tuple[str, ...]) -> bool:
    return any(pattern in text for pattern in patterns)


def tag_question(question: str, difficulty: str | None = None) -> QuestionFocus:
    """Infer a compact semantic profile from the NL question only."""
    q = _norm(question)
    toks = _tokens(question)
    cues: list[str] = []

    set_op_signal = "none"
    if _contains_any(q, SET_EXCEPT_PATTERNS):
        set_op_signal = "except_or_anti"
        cues.append("exclusion")
    elif _contains_any(q, SET_INTERSECT_PATTERNS):
        set_op_signal = "intersect"
        cues.append("overlap")
    elif _contains_any(q, SET_UNION_PATTERNS):
        set_op_signal = "union"
        cues.append("combine")

    aggregation = "none"
    if ("how many" in q and "each" in q) or any(word in toks for word in COUNT_RANK_WORDS):
        aggregation = "count_rank"
        cues.append("count-rank")
    elif "more than" in q or "less than" in q or "at least" in q or "at most" in q:
        aggregation = "group_having"
        cues.append("threshold")
    elif toks & AGGREGATE_WORDS:
        aggregation = "aggregate_compare"
        cues.append("aggregate")

    return_field = "general"
    if toks & DESCRIPTIVE_WORDS or any(q.startswith(prefix) for prefix in ("what ", "which ", "list ", "show ", "give ", "return ")):
        return_field = "descriptive"
        cues.append("descriptive-return")
    if toks & IDENTIFIER_WORDS and return_field == "general":
        return_field = "identifier"
        cues.append("identifier-return")
    if aggregation in {"count_rank", "aggregate_compare"} and return_field == "general":
        return_field = "measure"
        cues.append("measure-return")

    needs_multi_hop = False
    if _contains_any(q, MULTI_HOP_PATTERNS):
        needs_multi_hop = True
        cues.append("multi-hop")
    elif difficulty in {"hard", "extra"} and len(toks) >= 8 and (
        " who " in f" {q} "
        or " whose " in f" {q} "
        or " through " in f" {q} "
        or " across " in f" {q} "
        or " via " in f" {q} "
        or " with their " in f" {q} "
    ):
        needs_multi_hop = True
        cues.append("complex-join")

    if set_op_signal != "none":
        query_family = "set_op"
    elif aggregation in {"count_rank", "group_having"}:
        query_family = "group_rank"
    elif needs_multi_hop:
        query_family = "multi_hop"
    elif return_field == "descriptive":
        query_family = "projection"
    else:
        query_family = "general"

    target_sql_features: set[str] = set()
    if aggregation in {"count_rank", "group_having"}:
        target_sql_features |= {"group_by", "having"}
    if aggregation == "count_rank":
        target_sql_features |= {"order_limit", "count_order_limit"}
    if aggregation == "aggregate_compare":
        target_sql_features |= {"nested_subquery", "aggregate_compare"}
    if set_op_signal == "intersect":
        target_sql_features.add("set_intersect")
    elif set_op_signal == "union":
        target_sql_features.add("set_union")
    elif set_op_signal == "except_or_anti":
        target_sql_features |= {"set_except", "anti_join"}
    if needs_multi_hop:
        target_sql_features.add("multi_join")
    if difficulty == "extra":
        target_sql_features.add("nested_subquery")

    return QuestionFocus(
        query_family=query_family,
        return_field=return_field,
        aggregation=aggregation,
        set_op_signal=set_op_signal,
        needs_multi_hop=needs_multi_hop,
        target_sql_features=target_sql_features,
        cues=cues,
    )
