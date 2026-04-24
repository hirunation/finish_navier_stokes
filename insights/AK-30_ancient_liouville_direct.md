---
id: AK-30
title: Ancient Liouville in L^{3,∞} (direct superlinear ODE attempt)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [INS-05, THR-01]
cross_citations:
  - label: AK3 Item 30
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 30)
  - label: KNSS 2009 p. 83
    ref: arXiv:0709.3599
    note: Explicitly marks bounded-ancient-solution Liouville conjecture for general 3D as OPEN.
verification:
  method: refutation-by-absence-of-temporal-superlinearity
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, ancient-Liouville, L3inf, open-conjecture, two-mechanism, irreducibility, AK3-Item-30]
---

# AK-30 · Ancient Liouville in L^{3,∞}

## Approach tried

Prove a general ancient Liouville theorem directly: any bounded
ancient NS solution on $\mathbb{R}^3 \times (-\infty, 0]$ in
$L^{3,\infty}$ is zero.  Would eliminate both stationary
Liouville and backward uniqueness from Part II.

## Obstruction

The hat-function ODE requires superlinear growth $\beta > 1$.
Time-dependent analog $d_s F \geq c F^\sigma$ with $\sigma > 1$:
(a) enstrophy equation has signed stretching (no definite sign).
(b) $L^{3,\infty}$ bound constrains spatial norms uniformly in
$s$ but produces **no temporal monotonicity**.  (c) Bounded
ancient solution has $\|v\|_{L^{3,\infty}} \leq M$ uniformly in
$s$ — no temporal decay/growth mechanism available.

Explicitly marked as **open** by KNSS 2009 p. 83 for general 3D
(only axi-symmetric version in KNSS §5).

## Dependencies in context

Supports INS-05 (Part II architecture requires stationary
Liouville + ESS03), THR-01 (two-mechanism irreducibility).

## History

Draft 8-11 era (AK3 Item 30).  Live corpus 2026-04-22.
