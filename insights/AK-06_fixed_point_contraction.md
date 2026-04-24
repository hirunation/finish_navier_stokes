---
id: AK-06
title: Fixed-point / contraction mapping (Koch-Tataru regime)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 6
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 6)
  - label: Koch-Tataru 2001
    ref: "Koch, H.; Tataru, D., Well-posedness for the Navier-Stokes equations, Adv. Math. 157 (2001) 22–35"
verification:
  method: refutation-by-large-data-regime
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: n/a
tags: [anti-knowledge, fixed-point, contraction, Koch-Tataru, large-data, AK3-Item-6]
---

# AK-06 · Fixed-point / contraction mapping

## Approach tried

Show $v = 0$ is the only fixed point of the bilinear map
$v \mapsto B(v, v)$ in a suitable Banach norm.

## Obstruction

Koch-Tataru contraction threshold is $M^* = 1/(2 C_{KT})$.  The
KNSS ancient solution has $\|v\|_{L^{3,\infty}} \geq M^*$ (if
$\|v\| < M^*$, direct contraction gives $v = 0$, contradicting
$|v(0, 0)| = 1$).  Solution lies in **large-data regime**, outside
the contraction basin.  Moreover $DF(0) = 0$ (bilinear), so no
perturbative bifurcation from $v = 0$.

## Dependencies in context

Standalone.  No in-corpus supports.

## History

Classical (AK1 Item 6), Round 1B.  Live corpus 2026-04-22.
