---
id: THR-04
title: Obstruction wall — 9 theorems + topological-sign diagnosis
category: THR
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [INS-10, MPC-1, MPC-2, MPC-3, MPC-4, MPC-5, MPC-6, OBS-01, OBS-02, OBS-03, OBS-04, OBS-05, OBS-06, OBS-07, OBS-08, OBS-09]
supports: []
cross_citations:
  - label: BRAID Movement V
    ref: turbulent_waters/canon/BRAID_1.md "Wall of Obstruction"
  - label: BRAID Movement VI
    ref: turbulent_waters/canon/BRAID_1.md "Shape of the Gap" — §VI.6 topological-not-metric
verification:
  method: canon-synthesis (9 independent negative theorems)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [thread, obstruction-wall, BRAID-Movement-V, topological-gap, signed-invariant, narrative]
---

# THR-04 · Obstruction wall

## Narrative — the 9 obstructions as a unified diagnostic

BRAID Movement V identifies **9 obstruction theorems** (OBS-01..09)
that together exhaust the "standard" tool classes for bounded
Liouville:

| # | Obstruction         | Tool class exhausted |
|:---|:---|:---|
| 1  | Closure             | Elementary algebra |
| 2  | Exchange-of-Limits  | Hull topology |
| 3  | Riesz               | Singular integral / pressure Poisson |
| 4  | USC                 | Upper semi-continuity circularity |
| 5  | Carleman            | UCP category mismatch (LEM-07/08 usable in Part II, not for Liouville) |
| 6  | Birman-Schwinger    | Linear integral / linear spectral |
| 7  | Resonance-Diagonal  | Φ-adic per-shell pressure |
| 8  | Helicity-Sector     | Scalar quadratic invariants |
| 9  | Twist-Writhe        | Pseudoscalar topological helicity — ℓ=2 irreducible |

## The structural diagnosis (BRAID §VI.6)

**The gap is topological, not metric** — in **sign**, not in
**size**.  Every obstruction identifies a signed quantity whose
magnitude is controlled ($O(C(M))$) but whose **sign** is
undetermined by the available integral bounds.  Liouville closure
requires a signed invariant or monotonicity formula
— a **topological** input (degree theory, index, or conserved
signed quantity) not captured by any of the 9 tool classes.

## Closure candidates

Three alternative routes remain open:

- **Icosahedral (THR-03)**: INS-04 closes OBS-07..09 via
  representation theory + $\varphi$-shell averaging.
- **Ancient-extension (INS-10)**: space-time hull unique
  ergodicity + Type II closure.
- **Direct Scaling-Liouville (INS-06, synthesis breakthrough)**:
  excludes $(-,-,-)$ helical equilibrium via function-space pivot
  (THR-05) — a different approach than the BRAID closure.

## Dependencies in context

Depends on all 9 obstruction entries OBS-01..09.

## History

Canon-frozen 2026-04-14..17.  "Topological gap" reading
articulated in BRAID Movement VI during session `277f7666`.
Live corpus 2026-04-22.
