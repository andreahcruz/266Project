"""Build few-shot demonstration blocks from Spider train_spider.json."""

from __future__ import annotations

import json
import random
import re
from collections import defaultdict
from pathlib import Path
from typing import Any

_STOPWORDS = frozenset(
    "a an the is are was were be been being do does did have has had "
    "will would shall should can could may might must "
    "i me my we our you your he she it they them their its "
    "this that these those there here "
    "and or but not no nor so if then than too also "
    "of in on at to for with by from as into about between through "
    "how what which who whom whose where when why "
    "all any each every some many much more most other another "
    "find show list give get display return tell".split()
)


def load_train_spider(path: Path | str) -> list[dict[str, Any]]:
    with open(path, encoding="utf-8") as f:
        rows = json.load(f)
    for i, row in enumerate(rows):
        row.setdefault("_train_idx", i)
        row.setdefault("_question_terms", _question_terms(row.get("question", "")))
    return rows


def index_train_by_db(train_rows: list[dict]) -> dict[str, list[int]]:
    """Map db_id -> list of row indices in train_rows (order preserved)."""
    by_db: dict[str, list[int]] = defaultdict(list)
    for i, row in enumerate(train_rows):
        by_db[row["db_id"]].append(i)
    return dict(by_db)


def _question_terms(text: str) -> set[str]:
    tokens = re.findall(r"[a-z0-9]+", text.lower())
    return {tok for tok in tokens if len(tok) > 1 and tok not in _STOPWORDS}


def _score_train_example(question_terms: set[str], row: dict) -> tuple[int, int, int]:
    row_terms = row.get("_question_terms")
    if row_terms is None:
        row_terms = _question_terms(row.get("question", ""))
        row["_question_terms"] = row_terms

    overlap = len(question_terms & row_terms)
    partial = 0
    if question_terms and row_terms:
        for qtok in question_terms:
            for rtok in row_terms:
                if qtok == rtok:
                    continue
                if len(qtok) >= 4 and len(rtok) >= 4 and (qtok in rtok or rtok in qtok):
                    partial += 1
                    break
    sql_shape = int(" join " in row.get("query", "").lower()) + int(" group by " in row.get("query", "").lower())
    return overlap, partial, sql_shape


def _has_nested_sql(sql: dict | None) -> bool:
    if not sql:
        return False
    for section in ("from", "where", "having"):
        conds = sql.get(section, {}).get("conds", []) if section == "from" else sql.get(section, [])
        for item in conds[::2]:
            if not isinstance(item, (list, tuple)) or len(item) < 5:
                continue
            if isinstance(item[3], dict) or isinstance(item[4], dict):
                return True
    for key in ("intersect", "except", "union"):
        if isinstance(sql.get(key), dict):
            return True
    return False


def extract_sql_features(row: dict) -> set[str]:
    lower = row.get("query", "").lower()
    sql = row.get("sql") or {}
    features: set[str] = set()
    if sql.get("groupBy"):
        features.add("group_by")
    if sql.get("having"):
        features.add("having")
    if sql.get("orderBy"):
        features.add("order_by")
    if sql.get("orderBy") and sql.get("limit") is not None:
        features.add("order_limit")
    if "count(" in lower and "order by" in lower and "limit" in lower:
        features.add("count_order_limit")
    if sql.get("intersect") is not None:
        features.add("set_intersect")
    if sql.get("except") is not None:
        features.add("set_except")
    if sql.get("union") is not None:
        features.add("set_union")
    if _has_nested_sql(sql):
        features.add("nested_subquery")
    if " not in " in lower or " not exists " in lower or " except " in lower:
        features.add("anti_join")
    if any(word in lower for word in ("avg(", "average", "sum(", "max(", "min(")):
        features.add("aggregate_compare")
    table_units = sql.get("from", {}).get("table_units", [])
    if len(table_units) >= 2:
        features.add("join")
    if len(table_units) >= 3:
        features.add("multi_join")
    return features


def annotate_train_sql_features(train_rows: list[dict]) -> None:
    for row in train_rows:
        if "_sql_features" not in row:
            row["_sql_features"] = extract_sql_features(row)


def _deterministic_fallback_indices(
    train_rows: list[dict],
    picked_set: set[int],
    need: int,
    *,
    question: str | None = None,
    target_sql_features: set[str] | None = None,
) -> list[int]:
    if need <= 0:
        return []

    if not question:
        pool = [i for i, _row in enumerate(train_rows) if i not in picked_set]
        return pool[:need]

    question_terms = _question_terms(question)
    scored: list[tuple[tuple[float, int, int, int], str, int, int]] = []
    for i, row in enumerate(train_rows):
        if i in picked_set:
            continue
        overlap, partial, sql_shape = _score_train_example(question_terms, row)
        feature_score = 0.0
        if target_sql_features:
            row_features = row.get("_sql_features")
            if row_features is None:
                row_features = extract_sql_features(row)
                row["_sql_features"] = row_features
            shared = set(target_sql_features) & set(row_features)
            for feat in shared:
                if feat in {"set_intersect", "set_except", "set_union"}:
                    feature_score += 3.0
                elif feat in {"count_order_limit", "multi_join", "anti_join", "nested_subquery"}:
                    feature_score += 2.0
                else:
                    feature_score += 1.0
        score = (feature_score, overlap, partial, sql_shape)
        scored.append((score, row["db_id"], len(row.get("query", "")), i))
    scored.sort(key=lambda item: (-item[0][0], -item[0][1], -item[0][2], -item[0][3], item[1], item[2], item[3]))

    picked: list[int] = []
    seen_dbs: set[str] = set()
    for score, db_id, _query_len, idx in scored:
        if len(picked) >= need:
            break
        if db_id in seen_dbs:
            continue
        if score[0] == 0 and picked:
            continue
        picked.append(idx)
        seen_dbs.add(db_id)

    if len(picked) < need:
        for _score, _db_id, _query_len, idx in scored:
            if len(picked) >= need:
                break
            if idx in picked:
                continue
            picked.append(idx)
    return picked[:need]


def format_examples_for_prompt(examples: list[dict]) -> str:
    """Format train rows (question + query) for the few_shot.txt template."""
    parts = []
    for i, ex in enumerate(examples, start=1):
        q = ex["question"].strip()
        sql = ex["query"].strip().rstrip(";")
        parts.append(f"Example {i} (database `{ex['db_id']}`):\nQuestion: {q}\nSQL: {sql}")
    return "\n\n".join(parts)


def build_few_shot_examples(
    train_rows: list[dict],
    by_db_indices: dict[str, list[int]],
    db_id: str,
    k: int,
    rng: random.Random,
    *,
    question: str | None = None,
    target_sql_features: set[str] | None = None,
) -> list[dict]:
    """Pick up to k train examples: same-db first, then deterministic fill."""
    if k <= 0:
        return []

    same_idx = list(by_db_indices.get(db_id, []))
    picked: list[int] = same_idx[:k]

    if len(picked) >= k:
        return [train_rows[i] for i in picked[:k]]

    need = k - len(picked)
    picked_set = set(picked)
    if len(picked_set) >= len(train_rows):
        return [train_rows[i] for i in picked]

    extra = _deterministic_fallback_indices(
        train_rows,
        picked_set,
        need,
        question=question,
        target_sql_features=target_sql_features,
    )
    picked.extend(extra)
    return [train_rows[i] for i in picked]
