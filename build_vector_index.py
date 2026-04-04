"""Build the persistent ChromaDB schema embedding index.

Loads Spider schemas from tables.json and test_tables.json, embeds table
descriptions with OpenAI, and writes them into the ChromaDB directory used
by hybrid retrieval.

Usage:
  python build_vector_index.py
"""

import json
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

from openai import OpenAI

from config import (
    OPENAI_API_KEY,
    OPENAI_BASE_URL,
    TABLES_JSON,
    TEST_TABLES_JSON,
    VECTOR_INDEX_PATH,
)
from schema_loader import load_tables
from vector_store import build_table_description, get_chroma_client, reset_collection


def main():
    if not OPENAI_API_KEY:
        sys.exit("Set OPENAI_API_KEY in .env")

    # Load and merge both schema files (test takes precedence)
    print("Loading schemas...")
    dev_tables = load_tables(TABLES_JSON)
    test_tables = load_tables(TEST_TABLES_JSON)

    # Merge: test_tables entries override dev_tables for same db_id
    merged = {**dev_tables, **test_tables}
    print(f"  dev/train: {len(dev_tables)} DBs, test: {len(test_tables)} DBs")
    print(f"  merged (deduplicated): {len(merged)} DBs")

    # Build descriptions for all tables
    all_descriptions = []  # (db_id, tbl_idx, table_name, description)
    for db_id, entry in sorted(merged.items()):
        table_names = entry["table_names_original"]
        for tbl_idx in range(len(table_names)):
            desc = build_table_description(entry, tbl_idx)
            all_descriptions.append((db_id, tbl_idx, table_names[tbl_idx], desc))

    total_tables = len(all_descriptions)
    print(f"  total tables to embed: {total_tables}")

    # Batch embed (OpenAI supports up to 2048 inputs per call)
    client = OpenAI(api_key=OPENAI_API_KEY, base_url=OPENAI_BASE_URL)
    model = "text-embedding-3-small"
    chroma_client = get_chroma_client(VECTOR_INDEX_PATH, create=True)
    collection = reset_collection(chroma_client)

    print(f"\nEmbedding {total_tables} table descriptions with {model}...")
    print(f"Writing persistent ChromaDB store to {VECTOR_INDEX_PATH}...")
    batch_size = 2048
    total_written = 0

    for start in range(0, total_tables, batch_size):
        end = min(start + batch_size, total_tables)
        batch = all_descriptions[start:end]
        batch_texts = [desc for _, _, _, desc in batch]

        response = client.embeddings.create(model=model, input=batch_texts)
        batch_embeddings = [item.embedding for item in response.data]
        collection.upsert(
            ids=[f"{db_id}:{tbl_idx}" for db_id, tbl_idx, _, _ in batch],
            documents=batch_texts,
            metadatas=[
                {
                    "db_id": db_id,
                    "tbl_idx": int(tbl_idx),
                    "table_name": table_name,
                }
                for db_id, tbl_idx, table_name, _ in batch
            ],
            embeddings=batch_embeddings,
        )
        total_written += len(batch)

        print(f"  embedded {end}/{total_tables}")
        if end < total_tables:
            time.sleep(1)  # rate limit courtesy

    count = collection.count()
    if count != total_tables or total_written != total_tables:
        raise RuntimeError(
            f"Vector store count mismatch: wrote {total_written}, collection reports {count}, "
            f"expected {total_tables}",
        )

    meta = {
        "model": model,
        "created": datetime.now(timezone.utc).isoformat(),
        "num_databases": len(merged),
        "num_tables": total_tables,
        "path": str(VECTOR_INDEX_PATH),
    }
    meta_path = VECTOR_INDEX_PATH / "index_metadata.json"
    with open(meta_path, "w", encoding="utf-8") as f:
        json.dump(meta, f, indent=2)

    print(
        f"Done! Stored {count} table embeddings for {len(merged)} databases in {VECTOR_INDEX_PATH}.",
    )
    print(f"Index metadata written to {meta_path}")


if __name__ == "__main__":
    main()
