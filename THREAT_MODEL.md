# Threat model

This document specifies what each actor can observe, alter, or learn under each architectural variant we evaluate. It is the precise privacy claim we are making — and *not* making — for the federated text-to-SQL pipeline.

## Actors

| Actor | Description |
|---|---|
| **User** | Submits a natural-language question; sees the final query result |
| **Hub operator** | Runs the central orchestrator process; controls broker, prompt assembly, LLM dispatch |
| **Node operator** | Runs one logical Node; owns one database's DDL, mask dictionary, retriever, and sqlite file |
| **LLM provider** | Third-party inference service (Cerebras / Anthropic / OpenAI) reachable over the public internet |
| **Cross-node attacker** | Holds (or compromises) one node and tries to learn another node's schema or data |
| **Network observer** | Sees network traffic between Hub and LLM provider (TLS-protected in practice but worst-case included) |

## Trust assumptions

| Variant | Trust boundary |
|---|---|
| **Hub-LLM, no masking** | Hub + nodes trusted; LLM provider semi-trusted (the question and full schema cross to it) |
| **Hub-LLM, sovereign masking** *(our default)* | Hub + nodes trusted; LLM provider untrusted for schema metadata |
| **Node-LLM** | Hub + nodes trusted; LLM runs inside the node, no LLM provider involved |

## What each actor sees per variant

### Variant A — Hub-LLM, no masking (baseline / control config)

| Actor | Sees |
|---|---|
| User | NL question (sent), final result rows |
| Hub operator | NL question, all selected schemas (real names), generated SQL (real names), executed result rows |
| Node operator | own DDL, own NL question, own SQL, own rows |
| LLM provider | NL question, real schema (selected portion), generated SQL |
| Cross-node attacker | nothing about other nodes (federation isolation holds) |
| Network observer | encrypted requests; size/timing patterns; TLS metadata |

**What leaks**: real table and column names cross to the LLM provider on every query. The provider can build a profile of every customer's data over time. Subpoena/breach surface includes full schema vocabulary.

### Variant B — Hub-LLM with sovereign masking (semantic + phrase hints, our headline)

| Actor | Sees |
|---|---|
| User | NL question (sent), final result rows |
| Hub operator | NL question, *masked* schema, masked SQL, real result rows |
| Node operator | own DDL, own NL question, own real SQL, own rows, own mask dict |
| LLM provider | NL question, **masked schema only** (`T1, C1` style or semantic proxy `IDENTIFIER_PRIMARY_1`), masked SQL, **opaque token-level phrase hints** |
| Cross-node attacker | nothing about other nodes |
| Network observer | encrypted requests; size/timing patterns; TLS metadata |

**Privacy claim**: real schema names never reach the LLM provider. Phrase hints expose only `phrase → token` pairs where `phrase` is already in the user's question and `token` is opaque. The mask dictionary is per-session (not persistent) and lives on the node.

**What still leaks**: the **NL question itself** crosses to the LLM provider. We do not attempt to hide question intent — the user's wording is by-design visible because the LLM needs it. Long-term LLM-provider profiling can correlate questions to observe usage patterns even without schema names.

**What we explicitly do not claim**:
- We do not hide query *result values*. Results return through the Hub to the user; the Hub sees them.
- We do not provide cryptographic privacy (no homomorphic / MPC protocol). The protection is logical, not provable.
- We do not claim breach-resistance against a compromised Hub. A malicious Hub could log everything it sees (including masked schemas + the question + result rows + the mask dict it received from the node, if it ever did — but in our design it never receives mask dicts).

### Variant C — Node-LLM (alternative architecture, not our default)

| Actor | Sees |
|---|---|
| User | NL question (sent), final result rows |
| Hub operator | NL question (for routing), final result rows |
| Node operator | own DDL, own NL question, own real SQL, own rows, **own LLM weights/inference logs** |
| LLM provider | (no third-party LLM exists) |
| Cross-node attacker | nothing about other nodes |
| Network observer | encrypted Hub↔Node traffic only |

**Privacy claim**: nothing schema-related leaves the node. Strictly stronger than Variant B because the LLM-provider attack surface is eliminated.

**Tradeoff**: requires open-weight model that fits node hardware. Closed-source frontier models (GPT-4o, Claude Opus) cannot be deployed at the node by definition — they run only on the provider's servers, so calling them from inside the node still routes traffic out.

## Adversary capabilities considered

| Adversary | Variant A (no mask) | Variant B (mask) | Variant C (Node-LLM) |
|---|---|---|---|
| LLM provider (curious / subpoenaed / breached) | learns full schemas + questions + SQL | learns masked tokens + questions + masked SQL | learns nothing |
| Cross-node attacker (one node compromised) | other nodes' schemas safe | other nodes' schemas safe | other nodes' schemas safe |
| Hub operator (curious) | sees everything (schemas, SQL, rows) | sees masked schemas + real rows | sees only routing decision + final rows |
| Network observer (passive TLS metadata) | request sizes hint at schema complexity | same | encrypted intra-deployment only |

## What "sovereign" means in our writeup

We use **sovereign** to mean *"data sovereignty on the schema-metadata axis between Hub and LLM provider"* — equivalently: real table and column names are never disclosed to a third-party inference service. We do **not** mean "homomorphically secure," "differentially private," or "zero-knowledge." Reviewers should read our claims at this precision.

## Cross-architecture summary

| Property | A: Hub-LLM no-mask | B: Hub-LLM + masking | C: Node-LLM |
|---|---|---|---|
| Data isolation between nodes | ✅ | ✅ | ✅ |
| No bulk schema discovery at hub | ✅ | ✅ | ✅ |
| Real schemas hidden from LLM provider | ❌ | ✅ | ✅ (no provider) |
| Frontier-model accessibility (GPT-4o etc) | ✅ | ✅ | ❌ |
| Operational simplicity | high | high | low (N inference servers) |
| Accuracy ceiling | best available | best available with masking cost | best open-weight model |

Our experiments instantiate variant B and measure the masking-cost penalty, then propose phrase hints + semantic mask + difficulty-based cascade as mitigations. Variant C is acknowledged as future work.
