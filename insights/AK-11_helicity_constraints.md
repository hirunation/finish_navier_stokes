---
id: AK-11
title: Helicity as conserved / monotone quantity
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [AK-17]
cross_citations:
  - label: AK3 Item 11
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 11)
verification:
  method: refutation-by-non-conservation + L1-divergence
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard NS texts
  machine_verification: n/a
tags: [anti-knowledge, helicity, viscous-dissipation, reconnection, L1-divergence, AK3-Item-11]
---

# AK-11 · Helicity constraints

## Approach tried

Use helicity $H = \int v \cdot \omega\, dx$ as conserved or
monotone quantity under NS.

## Obstruction

(a) For $v \in L^{3,\infty}$, product $v \cdot \omega \sim
1/|x|^3$ at far field → not in $L^1(\mathbb{R}^3)$.  Globally
undefined.  (b) Locally non-monotone (boundary terms either
sign).  (c) Viscous dissipation $dH/ds = -2\nu \int \omega \cdot
\mathrm{curl}(\omega)$ has no definite sign; NS destroys
topological invariants via reconnection.

## Dependencies in context

Standalone.  Supports AK-17 (same observation at topological
level).

## History

Classical (AK1 Item 11; AK2 Item 17).  Live corpus 2026-04-22.
