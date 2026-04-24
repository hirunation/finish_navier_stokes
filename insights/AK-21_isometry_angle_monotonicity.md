---
id: AK-21
title: Isometry angle monotonicity
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 21
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 21)
verification:
  method: refutation-by-sign-indeterminate-derivative
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Rounds 9-11
  machine_verification: n/a
tags: [anti-knowledge, angle-monotonicity, indefinite-sign, AK3-Item-21]
---

# AK-21 · Isometry angle monotonicity

## Approach tried

Show $\theta = \arccos(v \cdot \omega / (|v||\omega|))$ is
monotone in time.

## Obstruction

$d_s \cos(\theta)$ involves $\nabla^2 \xi$ (where $\xi =
\omega/|\omega|$), strain-vorticity coupling $(\omega \cdot
\nabla) S$, pressure Hessian.  No definite sign.  Angle-based
functionals lack sign structure needed for monotonicity.

## History

Classical (AK2 Item 21), Rounds 9-11.  Live corpus 2026-04-22.
