---
id: AK-12
title: Serrin-type integral conditions
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 12
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 12)
verification:
  method: refutation-by-integrability-mismatch
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: n/a
tags: [anti-knowledge, Serrin, L3inf-weaker, AK3-Item-12]
---

# AK-12 · Serrin-type integral conditions

## Approach tried

Apply Serrin regularity: $\int \|v\|_{L^q}^p\, ds < \infty$ with
$2/p + 3/q = 1$, $q > 3$.

## Obstruction

For $v \in L^{3,\infty}$: $\|v\|_{L^q(\mathbb{R}^3)} = \infty$
for $q > 3$ (weak-$L^3$ does not embed into $L^q$ strong).
Locally $\|v\|_{L^q(B_R)}$ finite but $R$-dependent.  No global
Serrin condition available from $L^{3,\infty}$.

## History

Classical (AK1 Item 12), Round 4.  Live corpus 2026-04-22.
