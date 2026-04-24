---
id: CORR-02
title: Backward uniqueness belongs to ESS03 (not KNSS)
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cc52d85c-7323-4878-b7a4-1a03d6567b1a
author: Airo Nahiru
date: 2026-03-30
dependencies: [CORR-01]
supports: [INS-09, LEM-08]
supersedes: [cc52d85c-era/CORR-02]
cross_citations:
  - label: ESS03 ARMA + RMS
    ref: "ARMA 169 (2003) 147–157 (Carleman core); Russian Math. Surveys 58 (2003) 211–250 (Theorems 4.1, 5.1)"
    note: See CORR-05 for the further precision on which paper contains which theorem.
verification:
  method: literature sweep consequent of CORR-01
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, ESS03, backward-uniqueness, source-correction]
---

# CORR-02 · Backward uniqueness belongs to ESS03

## Statement

The backward-uniqueness theorem used in Part II Step 5 (the
three-incompatible-constraints geometry, INS-09) is **ESS03**,
**not KNSS**.  Two different tools, two different jobs:

| Tool    | Purpose in Part II                                        |
|:---     |:---                                                        |
| KNSS §4 | Regularity of the bounded ancient solution                |
| ESS03   | Backward uniqueness: vanish at one time ⇒ vanish everywhere |

## Dependencies in context

Depends on CORR-01 (once KNSS §4 is correctly identified as
regularity-only, the backward-uniqueness attribution must be
routed).

Supports INS-09, LEM-08.

## History

Paired with CORR-01.  Live corpus 2026-04-22 supersedes
cc52d85c-era version.
