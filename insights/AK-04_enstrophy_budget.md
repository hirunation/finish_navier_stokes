---
id: AK-04
title: Enstrophy / vortex-stretching budget
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [LEM-01]
cross_citations:
  - label: AK3 Item 4
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 4)
verification:
  method: refutation-by-signed-term-indeterminacy
  rounds: 4
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, enstrophy, budget-method, black-box, AK3-Item-4]
---

# AK-04 · Enstrophy / vortex-stretching budget

## Approach tried

Use time-integrated enstrophy identity $\Omega_R(0) = -2\nu\int |\nabla\omega|^2
+ 2\int S_R + \int_\text{boundary}$ to show $\Omega_R(0) < 0$,
contradicting $\omega(\cdot, 0) \neq 0$.

## Obstruction

All three terms (dissipation, stretching, boundary flux) are
$O(1)$ and vanish at comparable rates as $s \to -\infty$.
Stretching and boundary flux are **signed** — no definite sign
for the sum.  The method treats the solution as a black box; it
cannot access the ODE-level superlinear structure ($\beta > 1$,
$\alpha < 1$) that the Liouville theorem exploits.

## Dependencies in context

Standalone.  Supports LEM-01 (Caccioppoli ODE accesses structure
that budget methods miss).

## History

Classical (AK1 Item 4), Round 4 comprehensive analysis.  Live
corpus 2026-04-22.
