---
id: AK-22
title: Almost-stationary Caccioppoli on the parabolic front
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [INS-05, THR-01]
cross_citations:
  - label: AK3 Item 22
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 22)
verification:
  method: refutation-by-correction-growth-on-front
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Round 12
  machine_verification: n/a
tags: [anti-knowledge, parabolic-front, almost-stationary, irreducibility, two-mechanism, AK3-Item-22]
---

# AK-22 · Almost-stationary Caccioppoli on parabolic front

## Approach tried

At time $s$, apply hat-function Caccioppoli at scale
$\rho \sim \sqrt{|s|}$ (parabolic front).  Treat $\partial_s v$
as small correction.

## Obstruction

Correction $|\eta(s, c\sqrt{|s|})| \cdot |s|$ where
$\eta(s, \rho) = \|\partial_s v(\cdot, s)\|_{C^0(B_\rho)}$.
Since $\|\partial_s v\|_{L^\infty} \leq C$ globally, correction
grows $\sim |s|$ on the front — swamps Caccioppoli entirely.
Energy above threshold $E_s(\rho) \sim C_1 M^2/\rho$ lives
where stationary approximation fails; stationary approximation
good where energy below threshold.  **Conditions are
complementary, not overlapping.**

## Dependencies in context

Standalone.  Supports INS-05 (two-mechanism irreducibility,
thread THR-01): no single mechanism covers both legs.

## History

Draft 8-11 era (AK3 Item 22), Round 12.  Live corpus 2026-04-22.
