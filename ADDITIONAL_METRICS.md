# Additional Metrics

This file consolidates the privacy and retrieval-side metrics that support the
final report.

## 1. Sovereign Masking & Privacy

These metrics are already computed in [privacy_metrics.md](./privacy_metrics.md).

### System-level privacy metrics (weighted by column count, n=273)

| Metric | Hard mask | Semantic mask | Interpretation |
|---|---:|---:|---|
| Shannon entropy / token | **3.08 bits** | **2.21 bits** | Higher is more anonymous |
| Min-entropy / token | **3.08 bits** | **2.21 bits** | Same as Shannon here under the uniform candidate-set assumption |
| Information Leakage Rate (ILR) | — | **+0.87 bits/token** | Extra leakage introduced by semantic typing relative to hard masking |

Interpretation:
- Hard masking leaves the attacker with about `2^3.08 ≈ 8.4` candidate columns per token.
- Semantic masking leaves about `2^2.21 ≈ 4.6` candidate columns per token.
- Semantic labels therefore make reverse-mapping materially easier while not improving the final hinted ablation enough to justify the leak.

## 2. Federated RAG Retrieval

Recall@K / Precision@K / SRR are already available from the existing retrieval
evaluation artifacts:

- [baseline/results/retrieval_eval_sweep_80_score_ratio.json](./baseline/results/retrieval_eval_sweep_80_score_ratio.json)
- [baseline/results/retrieval_eval_sweep_80_hybrid.json](./baseline/results/retrieval_eval_sweep_80_hybrid.json)

These runs are on the same 80-question Spider dev retrieval benchmark used in
the progress report (`20` per hardness bucket).

### Existing retrieval metrics (overall)

| Setup | Recall@K | Precision@K | SRR | Avg tables returned |
|---|---:|---:|---:|---:|
| Lexical, top-3, score-ratio pruning | **97.7%** | **61.6%** | **95.0%** | **2.61** |
| Hybrid, top-3 | **97.7%** | **59.8%** | **95.0%** | **2.79** |

### Generated NDCG@3

NDCG was not previously saved. The values below were generated from the saved
retrieval outputs by treating the retrieved table order as the order presented
to the LLM in the schema prompt.

| Setup | NDCG@3 |
|---|---:|
| Lexical, top-3, score-ratio pruning | **80.1%** |
| Hybrid, top-3 | **78.5%** |

Per-hardness NDCG@3:

| Setup | Easy | Medium | Hard | Extra | Overall |
|---|---:|---:|---:|---:|---:|
| Lexical, top-3, score-ratio pruning | 72.7% | 79.6% | 82.9% | 85.0% | **80.1%** |
| Hybrid, top-3 | 72.7% | 79.6% | 82.9% | 78.7% | **78.5%** |

Important caveat:
- The retriever scores tables lexically, but the final schema string is
  serialized from the selected table set rather than a separately persisted
  relevance-ranked list.
- Because of that, this NDCG@3 is best interpreted as **"how early the gold
  tables appear in the actual prompt context"**, not as a pure reranker metric.

## Recommended presentation usage

For the final presentation, the cleanest retrieval row is:

| Setup | Recall@K | Precision@K | SRR | NDCG@3 | Avg Tables |
|---|---:|---:|---:|---:|---:|
| Lexical, top-3, score-ratio pruning | **97.7%** | **61.6%** | **95.0%** | **80.1%** | **2.61** |
| Hybrid, top-3 | **97.7%** | **59.8%** | **95.0%** | **78.5%** | **2.79** |

This supports the same interpretation already visible in the progress report:
- lexical is slightly cleaner / more precise on this retrieval-only benchmark
- hybrid remains useful for robustness to schema synonym / name-shift cases
- the dominant losses in the final system come from masking and SQL generation,
  not from retrieval recall failure
