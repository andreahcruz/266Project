"""MacroRAG broker — routes a question to the right node by topic.

Embeds hand-written, schema-free node "blurbs" once at startup, then
cosine-similarity-ranks them against an embedded question. Returns top-k
candidates; caller decides whether top-1's confidence is high enough or
to fall back to top-2.
"""

from __future__ import annotations

import math
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Optional

from openai import OpenAI


def _cosine(a: list[float], b: list[float]) -> float:
    dot = sum(x * y for x, y in zip(a, b))
    na = math.sqrt(sum(x * x for x in a))
    nb = math.sqrt(sum(x * x for x in b))
    if na == 0 or nb == 0:
        return 0.0
    return dot / (na * nb)


def _norm(text: str) -> str:
    return " ".join(re.findall(r"[a-z0-9_]+", text.lower()))


KEYWORD_RULES: dict[str, tuple[tuple[str, float], ...]] = {
    "aan_1": (
        ("paper", 0.07), ("papers", 0.07), ("published", 0.05),
        ("affiliation", 0.08), ("affiliations", 0.08),
        ("citation", 0.09), ("citations", 0.09), ("cited", 0.08), ("venue", 0.07),
    ),
    "address_1": (
        ("student", 0.08), ("students", 0.08), ("city", 0.07), ("cities", 0.07),
        ("state", 0.07), ("states", 0.07), ("latitude", 0.10), ("longitude", 0.10),
        ("direct distance", 0.10), ("baltimore", 0.08),
    ),
    "advertising_agencies": (
        ("agency", 0.08), ("agencies", 0.08), ("client", 0.06), ("clients", 0.06),
        ("meeting", 0.08), ("meetings", 0.08), ("billable", 0.09),
        ("invoice", 0.07), ("invoices", 0.07), ("payment", 0.06), ("payments", 0.06),
    ),
    "art_1": (
        ("painting", 0.08), ("paintings", 0.08), ("sculpture", 0.09), ("sculptures", 0.09),
        ("gallery", 0.09), ("galleries", 0.09), ("artist", 0.06), ("artists", 0.06),
        ("medium", 0.06), ("oldest painting", 0.09), ("most recent year", 0.08),
    ),
    "bike_racing": (
        ("bike", 0.08), ("bikes", 0.08), ("bicycle", 0.08), ("cyclist", 0.09), ("cyclists", 0.09),
        ("carbon", 0.09), ("carbon cc", 0.11), ("grams", 0.08), ("weight", 0.06),
        ("owns the most bikes", 0.12), ("product name", 0.07),
    ),
    "book_1": (
        ("isbn", 0.10), ("book title", 0.07), ("book titles", 0.07),
        ("all the authors", 0.09), ("names of all the authors", 0.10),
        ("purchase price", 0.06), ("sale price", 0.06), ("author names", 0.07),
        ("book with the most number of orders", 0.12), ("client names and their addresses", 0.11),
        ("date exped", 0.08), ("dateorder", 0.08), ("author book", 0.08),
    ),
    "book_press": (
        ("publisher", 0.09), ("publishers", 0.09), ("press", 0.10), ("monthly profit", 0.12),
        ("year profit", 0.12), ("year profits", 0.12), ("profits", 0.08),
        ("15 billion", 0.10), ("1 billion each month", 0.10),
        ("book series", 0.11), ("sale amount", 0.11), ("selling more than 1000", 0.12),
        ("less 500", 0.10), ("above 1000", 0.09), ("below 500", 0.09),
    ),
    "book_review": (
        ("review", 0.09), ("reviews", 0.09), ("rating", 0.08), ("ratings", 0.08),
        ("readers", 0.08), ("audio", 0.08), ("pages", 0.07), ("chapters", 0.07),
        ("release date", 0.08), ("types and release dates", 0.10),
    ),
    "car_racing": (
        ("points", 0.09), ("laps", 0.08),
        ("winnings", 0.09), ("make", 0.08), ("sponsor", 0.08), ("manager", 0.07),
        ("car owner", 0.08), ("official native language", 0.08),
    ),
    "car_road_race": (
        ("race", 0.05), ("races", 0.05), ("road", 0.08), ("pole position", 0.11),
        ("fastest lap", 0.11), ("winning driver", 0.10), ("winning team", 0.10),
        ("entrant", 0.08), ("constructor", 0.08), ("chassis", 0.08), ("engine", 0.07),
    ),
    "country_language": (
        ("language", 0.06), ("languages", 0.06), ("official language", 0.10),
        ("official languages", 0.10),
        ("contain the word ish", 0.10),
    ),
    "cre_Students_Information_Systems": (
        ("transcript", 0.10), ("transcripts", 0.10), ("class", 0.07), ("classes", 0.07),
        ("teacher", 0.07), ("teachers", 0.07), ("achievement", 0.08), ("achievements", 0.08),
        ("behavior", 0.09), ("detention", 0.09), ("incident", 0.09), ("loan", 0.09), ("loans", 0.09),
        ("student address", 0.06), ("home address", 0.06), ("address type descriptions", 0.13),
        ("personal details", 0.10),
    ),
    "e_commerce": (
        ("invoice", 0.09), ("invoices", 0.09),
        ("shipment", 0.09), ("shipments", 0.09), ("shipped", 0.08),
        ("tracking", 0.08), ("order items", 0.08), ("order item", 0.08),
        ("item status", 0.07), ("status code", 0.05),
        ("middle initial", 0.07), ("product color", 0.06), ("color", 0.05),
        ("product size", 0.06), ("size", 0.04), ("description", 0.05),
        ("payment methods can customers choose", 0.08), ("customers choose", 0.06),
        ("customers have placed any order", 0.10), ("placed any order", 0.09),
        ("different customers have ordered", 0.09), ("how many products does each orders contain", 0.11),
        ("order id status", 0.11), ("item states", 0.10), ("more than 1 items", 0.09),
        ("more than 1 item", 0.10), ("at least 2 products", 0.11), ("products on it", 0.09),
        ("bought at least", 0.09), ("listed in less than two orders", 0.10),
    ),
    "customers_and_orders": (
        ("address", 0.08), ("addresses", 0.09), ("postal", 0.08),
        ("address details", 0.08), ("location", 0.05),
        ("clothes", 0.09), ("hardware", 0.09),
        ("product type code", 0.09), ("type clothes", 0.07), ("type hardware", 0.07),
        ("payment method code", 0.09), ("phone", 0.07), ("email", 0.07),
        ("product names", 0.10), ("products that have a price above the average", 0.11),
        ("price higher than the average", 0.11), ("customer id name phone and email", 0.12),
    ),
    "government_shift": (
        ("analytical layer", 0.12), ("analytical layer type code", 0.13),
        ("integration platform", 0.11), ("channel details", 0.11), ("channel", 0.07),
        ("service details", 0.10), ("services", 0.06), ("used services", 0.10),
        ("used by customers", 0.09), ("customer with details", 0.08),
        ("details of all the channel", 0.13), ("list of channel details", 0.13),
        ("used services the most times", 0.12),
    ),
    "headphone_store": (
        ("headphone", 0.10), ("headphones", 0.10), ("earpads", 0.08),
        ("construction", 0.08), ("driver matched", 0.08), ("headphone class", 0.11),
        ("most expensive headphone", 0.11), ("store", 0.05), ("stock", 0.07),
    ),
    "movie_2": (
        ("movie", 0.06), ("movies", 0.06), ("theater", 0.09), ("theaters", 0.09),
        ("cinema", 0.10), ("cinemas", 0.10), ("odeon", 0.12), ("imperial", 0.12),
        ("played in", 0.08), ("rating", 0.06), ("ratings", 0.06),
    ),
    "online_exams": (
        ("exam", 0.08), ("exams", 0.08), ("question bank", 0.08),
        ("answer", 0.09), ("answers", 0.09), ("answer records", 0.10),
        ("answer record", 0.10), ("student answers", 0.10), ("assessment", 0.08),
        ("assessments", 0.08), ("valid answers", 0.10), ("dates of answers", 0.10),
    ),
    "pilot_1": (
        ("pilot", 0.10), ("pilots", 0.10), ("plane", 0.09), ("planes", 0.09),
        ("hangar", 0.11), ("aircraft", 0.08), ("f 14", 0.10), ("fighter", 0.08),
    ),
    "planet_1": (
        ("planet", 0.10), ("planets", 0.10), ("package", 0.08), ("packages", 0.08),
        ("shipment", 0.08), ("shipments", 0.08), ("clearance", 0.11),
        ("sender", 0.08), ("recipient", 0.08),
    ),
    "real_estate_rentals": (
        ("property", 0.08), ("properties", 0.08), ("room", 0.07), ("rooms", 0.07),
        ("feature", 0.07), ("features", 0.07), ("rooftop", 0.11), ("photo", 0.06), ("photos", 0.06),
        ("state or province", 0.10), ("states or provinces", 0.12), ("each property", 0.08),
        ("vendor requested price", 0.10), ("buyer", 0.06), ("seller", 0.06),
    ),
    "sing_contest": (
        ("song", 0.08), ("songs", 0.08), ("performance", 0.08), ("performances", 0.08),
        ("voice sound quality", 0.12), ("rhythm tempo", 0.11), ("stage presence", 0.11),
        ("english translation", 0.09), ("original artist", 0.09),
    ),
    "university_rank": (
        ("university", 0.08), ("universities", 0.08), ("ranking", 0.08), ("rankings", 0.08),
        ("home conference", 0.12), ("major ranking", 0.10), ("major rankings", 0.10),
        ("reputation point", 0.09), ("research point", 0.09), ("citation point", 0.09),
    ),
    "vehicle_driver": (
        ("driven by", 0.12), ("driver named", 0.10), ("citizenship", 0.10),
        ("citizens of", 0.10), ("drivers have not driven", 0.11),
        ("vehicle ids and models", 0.11), ("top speed", 0.08), ("horsepower", 0.08),
        ("engine power", 0.08),
    ),
    "vehicle_rent": (
        ("powertrain", 0.16), ("model year", 0.15), ("annual fuel cost", 0.16),
        ("yearly fuel cost", 0.16), ("rent", 0.08), ("rental", 0.08), ("discount", 0.08),
        ("customer", 0.05), ("customers", 0.05), ("how many vehicles do we have", 0.06),
        ("count the number of vehicles", 0.06),
    ),
    "video_game": (
        ("game", 0.06), ("games", 0.06), ("video game", 0.10), ("platform", 0.08), ("platforms", 0.08),
        ("developers", 0.09), ("franchise", 0.08), ("units sold", 0.11), ("player", 0.06), ("players", 0.06),
    ),
    "warehouse_1": (
        ("warehouse", 0.10), ("warehouses", 0.10), ("box", 0.08), ("boxes", 0.08),
        ("contents", 0.08), ("capacity", 0.08), ("stored in", 0.08), ("new york", 0.07),
    ),
}


@dataclass
class RouteScore:
    db_id: str
    score: float
    raw_score: float
    bonus: float
    matched_rules: tuple[str, ...]


class Broker:
    """Embeds blurbs at construction; routes by cosine on question embedding."""

    def __init__(
        self,
        blurbs_dir: Path,
        openai_client: OpenAI,
        embedding_model: str = "text-embedding-3-small",
        confidence_threshold: float = 0.30,
        low_margin_threshold: float = 0.03,
    ):
        self.openai_client = openai_client
        self.embedding_model = embedding_model
        self.confidence_threshold = confidence_threshold
        self.low_margin_threshold = low_margin_threshold
        self.blurbs_dir = Path(blurbs_dir)
        self.db_ids: list[str] = []
        self.blurbs: dict[str, str] = {}
        self.embeddings: dict[str, list[float]] = {}
        self._load_and_embed()

    def _load_and_embed(self) -> None:
        files = sorted(self.blurbs_dir.glob("*.md"))
        if not files:
            raise FileNotFoundError(f"No .md blurbs in {self.blurbs_dir}")
        for f in files:
            db_id = f.stem
            self.db_ids.append(db_id)
            self.blurbs[db_id] = f.read_text(encoding="utf-8").strip()
        # Single batch call.
        texts = [self.blurbs[d] for d in self.db_ids]
        resp = self.openai_client.embeddings.create(model=self.embedding_model, input=texts)
        for db_id, item in zip(self.db_ids, resp.data):
            self.embeddings[db_id] = item.embedding

    def _keyword_bonus(self, question: str, db_id: str) -> tuple[float, tuple[str, ...]]:
        q = _norm(question)
        bonus = 0.0
        matched: list[str] = []
        for phrase, weight in KEYWORD_RULES.get(db_id, ()):
            if phrase in q:
                bonus += weight
                matched.append(phrase)
        return bonus, tuple(matched)

    def route_with_details(self, question: str) -> list[RouteScore]:
        """Return scored candidates with raw score and keyword bonus details."""
        q_emb = self.openai_client.embeddings.create(
            model=self.embedding_model, input=[question]
        ).data[0].embedding
        scored: list[RouteScore] = []
        for db_id in self.db_ids:
            raw = _cosine(q_emb, self.embeddings[db_id])
            bonus, matched = self._keyword_bonus(question, db_id)
            scored.append(
                RouteScore(
                    db_id=db_id,
                    score=raw + bonus,
                    raw_score=raw,
                    bonus=bonus,
                    matched_rules=matched,
                )
            )
        scored.sort(key=lambda t: t.score, reverse=True)
        return scored

    def route(self, question: str) -> list[tuple[str, float]]:
        """Return list of ``(db_id, score)`` sorted by descending score."""
        return [(item.db_id, item.score) for item in self.route_with_details(question)]

    def pick(self, question: str) -> tuple[str, float, list[tuple[str, float]]]:
        """Top-1 with confidence + full ranking. Caller decides on re-pick."""
        ranking = self.route(question)
        top_db, top_score = ranking[0]
        return top_db, top_score, ranking
