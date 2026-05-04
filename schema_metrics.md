## Schema Metrics

Definitions:
- **Schema Retrieval Recall@k**: mean fraction of gold tables recovered by the local retriever on the balanced 320-question split.
- **Schema Reconstruction F1**: expected per-token attacker F1 when guessing the real column behind a masked token from its candidate set.
- **Blast Radius**: mean fraction of a database schema exposed to the central LLM for one query.

### 1. Schema Retrieval Recall@k

Balanced 320 split, local retrieval width `top_k_tables=4`, `top_n_columns=6`.
These balanced-320 values are computed offline from the lexical retrieval stage because the embedding-backed hybrid reranker is not reproducible without live API calls.

| Bucket | Table Recall@k | Column Recall |
|---|---:|---:|
| easy | 97.5% | 78.8% |
| medium | 98.8% | 97.7% |
| hard | 92.5% | 94.0% |
| extra | 93.5% | 94.8% |
| all | 95.6% | 91.3% |

### 2. Schema Reconstruction F1

Strong-attacker interpretation: the LLM provider sees a token and guesses one real column identity uniformly from the compatible candidate set.

| Masking style | Expected reconstruction F1 |
|---|---:|
| Hard mask | 15.0% |
| Semantic mask | 28.9% |

Higher reconstruction F1 means weaker privacy because the attacker can recover the true schema token more accurately.

### 3. Blast Radius

Two schema-exposure views are useful:
- `lexical_top4_top6`: offline approximation of the local retrieval stage alone
- `mixed_v5_breadth`: your current best full-system retrieval breadth, i.e. hybrid for easy/medium and full schema for hard/extra

| Setting | Bucket | Table Blast Radius | Column Blast Radius | Overall Schema Blast Radius |
|---|---|---:|---:|---:|
| lexical_top4_top6 | easy | 55.6% | 54.4% | 54.6% |
| lexical_top4_top6 | medium | 63.3% | 61.8% | 62.1% |
| lexical_top4_top6 | hard | 57.8% | 56.2% | 56.5% |
| lexical_top4_top6 | extra | 48.3% | 49.0% | 48.8% |
| lexical_top4_top6 | all | 56.3% | 55.4% | 55.5% |
| mixed_v5_breadth | easy | 55.6% | 54.4% | 54.6% |
| mixed_v5_breadth | medium | 63.3% | 61.8% | 62.1% |
| mixed_v5_breadth | hard | 100.0% | 100.0% | 100.0% |
| mixed_v5_breadth | extra | 100.0% | 100.0% | 100.0% |
| mixed_v5_breadth | all | 79.7% | 79.0% | 79.2% |

Interpretation:
- Lower blast radius is better for privacy because less schema structure reaches the central LLM.
- Higher retrieval recall is better for accuracy because the node sends back more of the gold schema.
- Reconstruction F1 and blast radius should be read together: one measures attacker identifiability per token, the other measures how much schema surface area is exposed at all.
