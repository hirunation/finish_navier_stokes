---
id: AK-13
title: ε-regularity (CKN) at the origin
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 13
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 13)
  - label: Caffarelli-Kohn-Nirenberg 1982
    ref: "Caffarelli, L.; Kohn, R.; Nirenberg, L., Partial regularity of suitable weak solutions of the Navier-Stokes equations, Comm. Pure Appl. Math. 35 (1982) 771–831"
verification:
  method: refutation-by-scale-invariant-integral-non-decoupling
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Rounds 1C, 2
  machine_verification: n/a
tags: [anti-knowledge, CKN, epsilon-regularity, scale-invariant, AK3-Item-13]
---

# AK-13 · ε-regularity (CKN) at origin

## Approach tried

Use scale-invariant CKN integral over parabolic cylinder $Q_r$
to show smallness at $(0, 0)$, implying $|v(0, 0)|$ small.

## Obstruction

CKN integral over $Q_r$ includes times near $s = 0$ where $v =
O(1)$.  Large $r$: integral volume $\sim r^5$ but overall
$r^4 \cdot (1)$ = not small.  Small $r$: scale-invariance
fixes the value.  Neither regime gives smallness.  Scale-
invariant CKN integral does not decouple from amplitude.

## History

Classical (AK1 Item 13), Rounds 1C, 2.  Live corpus 2026-04-22.
