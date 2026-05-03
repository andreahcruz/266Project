| Experiment | Mask | Hints | Prompt | Retrieval | Easy | Medium | Hard | Extra | **Overall** | Cost | Wall (s) |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `control` | off | — | few_shot | hybrid | 71.3 | 80.0 | 62.5 | 47.5 | **65.3** | $0 | 710 |
| `masked-broker` | hard | — | few_shot | hybrid | 17.5 | 3.7 | 12.5 | 6.2 | **10.0** | $0 | 790 |
| `masked-broker-lexical` | hard | — | few_shot | lexical | 17.5 | 3.7 | 12.5 | 6.2 | **10.0** | $0 | 720 |
| `masked-oracle` | hard | — | few_shot | hybrid | 23.7 | 3.7 | 16.3 | 7.5 | **12.8** | $0 | 702 |
| `masked-oracle-hints-320` | hard | — | few_shot | hybrid | 33.8 | 20.0 | 20.0 | 7.5 | **20.3** | $0 | 803 |
| `masked-oracle-hints-40` | hard | — | few_shot | hybrid | 50.0 | 10.0 | 30.0 | 0.0 | **22.5** | $0 | 150 |
| `masked-oracle-nohints-40` | hard | — | few_shot | hybrid | 20.0 | 20.0 | 10.0 | 0.0 | **12.5** | $0 | 131 |
| `semantic-oracle-hints-320` | semantic | — | few_shot | hybrid | 30.0 | 21.2 | 22.5 | 7.5 | **20.3** | $0 | 1029 |
| `semantic-oracle-hints-40` | semantic | — | few_shot | hybrid | 60.0 | 30.0 | 30.0 | 0.0 | **30.0** | $0 | 215 |
| `semantic-oracle-nohints-320` | semantic | — | few_shot | hybrid | 26.3 | 6.2 | 11.3 | 13.8 | **14.4** | $0 | 835 |
| `semantic-oracle-nohints-40` | semantic | — | few_shot | hybrid | 30.0 | 0.0 | 10.0 | 0.0 | **10.0** | $0 | 135 |
| `test_hints_40` | hard | — | few_shot | hybrid | 12.5 | 0.0 | 0.0 | 0.0 | **12.5** | $0 | 100 |
