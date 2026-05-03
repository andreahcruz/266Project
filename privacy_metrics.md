## Privacy metrics: candidate-set entropy per masked token

Higher entropy = more anonymous (more candidate columns the token could be).
Lower entropy = more leaky.

| DB | # cols | H(hard) | H(semantic) | ILR(sem−hard) bits | min-entropy hard | min-entropy semantic |
|---|---|---|---|---|---|---|
| `bbc_channels` | 16 | 2.19 | 1.39 | +0.80 | 2.19 | 1.39 |
| `cre_Students_Information_Systems` | 55 | 3.64 | 2.91 | +0.73 | 3.64 | 2.91 |
| `customers_and_orders` | 22 | 2.80 | 1.85 | +0.95 | 2.80 | 1.85 |
| `e_commerce` | 40 | 3.63 | 2.59 | +1.04 | 3.63 | 2.59 |
| `government_shift` | 23 | 2.97 | 2.47 | +0.50 | 2.97 | 2.47 |
| `online_exams` | 34 | 3.35 | 2.79 | +0.56 | 3.35 | 2.79 |
| `region_building` | 11 | 1.96 | 0.80 | +1.17 | 1.96 | 0.80 |
| `soccer_3` | 13 | 2.28 | 1.29 | +0.99 | 2.28 | 1.29 |
| `tv_shows` | 24 | 2.88 | 2.25 | +0.64 | 2.88 | 2.25 |
| `vehicle_driver` | 13 | 2.24 | 1.13 | +1.11 | 2.24 | 1.13 |
| `vehicle_rent` | 22 | 3.08 | 1.43 | +1.65 | 3.08 | 1.43 |

**System-level (weighted by column count, n=273)**

- Shannon H(hard mask) = **3.08 bits/token**
- Shannon H(semantic mask) = **2.21 bits/token**
- ILR(semantic vs hard) = **+0.87 bits/token leaked** by adding the semantic category
