---
id: THR-01
title: Two-mechanism irreducibility — stationary + parabolic legs
category: THR
status: verified
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [AK-22, AK-23, AK-29, AK-30, AK-31, AK-32, AK-33, INS-02, INS-05, INS-09, LEM-07, LEM-08, LEM-09, OBS-05]
supports: []
cross_citations:
  - label: Draft 12 Remark on geometric architecture
    ref: official/PROOF_FINAL_DRAFT12.tex
verification:
  method: synthesis of 5 independently-failing alternative routes
  rounds: n/a
  adversarial_vectors: 5
  independent_rederivation: via 5 distinct obstructions
  machine_verification: n/a
tags: [thread, two-mechanism, Part-I-plus-Part-II, polynomial-vs-exponential, irreducibility, narrative]
---

# THR-01 · Two-mechanism irreducibility

## Narrative

Nahiru's NS regularity program decomposes into **two
complementary mechanisms**:

| Leg        | Function space | Weight class       | Tool                               |
|:---|:---|:---|:---|
| Stationary | $L^{3,\infty}$ (critical) | Polynomial (hat function φ) | **Part I Liouville theorem** (INS-02) |
| Parabolic  | Parabolic diff. inequality | Exponential (Gaussian Carleman) | **Part II backward uniqueness** (LEM-08 / ESS03) |

The composition (INS-05 Part II) applies Part I to the backward-
time limit $v_\infty$ of the ancient solution, then ESS03
backward uniqueness to the bounded ancient solution itself,
extracting a contradiction.

## Why irreducible (5 alternative routes all fail)

- **AK-29** Almost-stationary ODE (time-dependent Caccioppoli)
  — correction grows $\sim |s|$ at parabolic front; ODE
  destroyed.
- **AK-30** Direct Ancient Liouville in $L^{3,\infty}$ — no
  temporal superlinear ODE available from bounded
  $L^{3,\infty}$ alone; KNSS 2009 p. 83 explicitly notes
  conjecture open for general 3D.
- **AK-31** Backward Morrey propagation — Gronwall exponential
  amplifies smallness, not transmits it.
- **AK-32** $E_s(\rho)$ spatial monotonicity — geometric, not
  temporal; no temporal information.
- **AK-33** Unique continuation from spatial decay — reduces
  to backward uniqueness (Carleman-based); no bypass.

Plus: **AK-22** (almost-stationary Caccioppoli on parabolic
front) and **AK-23** (rescaled Stokes Liouville on front) show
the front itself is high-Reynolds, not Stokes-dominated —
further confirming no single-mechanism closure.

## Structural reading

Stationary and parabolic are **complementary**: the hat function
is the "stationary shadow" of the Carleman weight.  Freezing
$\exp(-|x|^2/(4\nu|s|))$ on the parabolic front $s = -\rho^2/\nu$
gives a Gaussian cutoff whose qualitative role matches the
hat function.  Polynomial weight handles elliptic
(stationary) impossibility; exponential handles parabolic
(temporal) impossibility.  Interface at $s \sim -\rho^2/\nu$.

## Dependencies in context

Depends on the two leg theorems (INS-02 stationary, INS-05 +
LEM-08 + LEM-09 parabolic) and the 5 irreducibility AKs
(AK-22, AK-23, AK-29, AK-30, AK-31, AK-32, AK-33).  Also INS-09
(three-incompatible-constraints synthesis).

Standalone macro-narrative; no downstream supports (threads are
leaves).

## Citations

Internal to the project (Draft 12 Remark on geometric
architecture; ACCUMULATED_ANTIKNOWLEDGE_3.md items 22, 23,
29–33).

## History

Structural observation present since Draft 9 (cc52d85c session).
Full formalization as "irreducibility" established in session
`298d0965` (Apr 9-12) after the 5 routes were each tested and
refuted.  Live corpus 2026-04-22.
