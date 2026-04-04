"""Persistent vector store helpers for Spider schema embeddings via ChromaDB."""

from __future__ import annotations

from pathlib import Path
from typing import Optional

import chromadb


# Default path for the ChromaDB persistent store
CHROMA_DB_DIR = Path(__file__).resolve().parent / "chroma_db"
COLLECTION_NAME = "schema_tables"


def build_table_description(entry: dict, tbl_idx: int) -> str:
    """Build a natural-language description of one table for embedding.

    Format: "Table: Player. Columns: player id, name, position, team"
    Uses human-readable names when available.
    """
    table_names = entry.get("table_names", entry["table_names_original"])
    columns = entry.get("column_names", entry["column_names_original"])

    human_name = table_names[tbl_idx]
    col_names = []
    for col_idx, col_entry in enumerate(columns):
        if isinstance(col_entry, list):
            ci_tbl, col_name = col_entry
        else:
            continue
        if ci_tbl == tbl_idx:
            col_names.append(col_name)

    return f"Table: {human_name}. Columns: {', '.join(col_names)}"


def _normalize_db_dir(db_dir: str | Path) -> Path:
    path = Path(db_dir)
    if path.suffix == ".json" or path.is_file():
        raise ValueError(
            f"Vector index path must be a ChromaDB directory, not a file: {path}. "
            "The old schema_embeddings.json format is legacy and no longer used at runtime.",
        )
    return path


def get_chroma_client(
    db_dir: str | Path = CHROMA_DB_DIR,
    *,
    create: bool = False,
) -> chromadb.ClientAPI:
    """Get a persistent ChromaDB client for a directory-backed store."""
    path = _normalize_db_dir(db_dir)
    if create:
        path.mkdir(parents=True, exist_ok=True)
    elif not path.exists():
        raise FileNotFoundError(
            f"Vector store directory not found: {path}. "
            "Build it first with `python build_vector_index.py`.",
        )
    return chromadb.PersistentClient(path=str(path))


def get_collection(
    client: chromadb.ClientAPI,
    name: str = COLLECTION_NAME,
) -> chromadb.Collection:
    """Get or create the schema tables collection."""
    return client.get_or_create_collection(
        name=name,
        metadata={"hnsw:space": "cosine"},
    )


def load_index(index_path: str | Path = CHROMA_DB_DIR) -> dict:
    """Load the ChromaDB vector store and return a dict interface.

    Returns a dict-like wrapper that the retriever can query. The returned
    object maps db_id -> list of {tbl_idx, table_name, description, embedding}.

    This maintains backward compatibility with the retriever's vector_index
    parameter while using ChromaDB under the hood.
    """
    client = get_chroma_client(index_path, create=False)
    collection = get_collection(client)
    count = collection.count()
    if count == 0:
        raise RuntimeError(
            f"Vector store at {Path(index_path)} is empty. "
            "Rebuild it with `python build_vector_index.py` before using hybrid mode.",
        )

    # Build the dict structure the retriever expects
    all_data = collection.get(include=["embeddings", "metadatas", "documents"])

    index: dict[str, list] = {}
    if all_data["ids"]:
        for i, doc_id in enumerate(all_data["ids"]):
            meta = all_data["metadatas"][i]
            db_id = meta["db_id"]
            if db_id not in index:
                index[db_id] = []
            index[db_id].append({
                "tbl_idx": int(meta["tbl_idx"]),
                "table_name": meta["table_name"],
                "description": all_data["documents"][i],
                "embedding": all_data["embeddings"][i],
            })

    return index


def reset_collection(
    client: chromadb.ClientAPI,
    name: str = COLLECTION_NAME,
) -> chromadb.Collection:
    """Drop and recreate the schema collection for a clean rebuild."""
    try:
        client.delete_collection(name)
    except Exception:
        pass
    return get_collection(client, name)


def query_similar_tables(
    collection: chromadb.Collection,
    question_embedding: list[float],
    db_id: str,
    n_results: int = 10,
) -> list[tuple[int, float]]:
    """Query ChromaDB for tables similar to the question within a database.

    Uses ChromaDB's native similarity search with metadata filtering.

    Returns:
        List of (tbl_idx, similarity_score) sorted descending by score.
    """
    results = collection.query(
        query_embeddings=[question_embedding],
        n_results=n_results,
        where={"db_id": db_id},
        include=["metadatas", "distances"],
    )

    if not results["ids"] or not results["ids"][0]:
        return []

    scored = []
    for i, doc_id in enumerate(results["ids"][0]):
        # ChromaDB returns cosine distance; convert to similarity
        distance = results["distances"][0][i]
        similarity = 1.0 - distance
        tbl_idx = int(results["metadatas"][0][i]["tbl_idx"])
        scored.append((tbl_idx, similarity))

    scored.sort(key=lambda x: x[1], reverse=True)
    return scored


if __name__ == "__main__":
    import sys

    db_dir = sys.argv[1] if len(sys.argv) > 1 else str(CHROMA_DB_DIR)
    print(f"Loading ChromaDB from {db_dir}...")

    client = get_chroma_client(db_dir, create=False)
    collection = get_collection(client)
    count = collection.count()
    print(f"Collection has {count} table entries")

    # Also test the dict interface
    index = load_index(db_dir)
    print(f"Loaded index with {len(index)} databases")
    total_tables = sum(len(tables) for tables in index.values())
    print(f"Total tables: {total_tables}")

    # Show a sample
    for db_id in list(index.keys())[:3]:
        print(f"\n  {db_id}: {len(index[db_id])} tables")
        for t in index[db_id][:2]:
            print(f"    [{t['tbl_idx']}] {t['table_name']}: {t['description'][:60]}...")
