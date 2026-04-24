---
id: INS-18
title: Fibonacci triad identity φ^{k+2} = φ^{k+1} + φ^k (4 proven in Lean)
category: INS
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-03]
supports: [INS-04, MPC-4, OBS-07, THR-03]
cross_citations:
  - label: GUNS IcosahedralPath
    ref: grand_unified_ns_proof/GUNS/IcosahedralPath/Hypothesis.lean
    note: Four golden-ratio theorems proved from Mathlib primitives — the first verified entries in the GUNS tree.
verification:
  method: classical algebra (Lean-proved from Mathlib primitives)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: GUNS.IcosahedralPath.golden_fibonacci_triad
lean_ref: GUNS.IcosahedralPath.{golden_pos, golden_gt_one, golden_sq_eq_golden_add_one, golden_fibonacci_triad}
tags: [golden-ratio, Fibonacci, phi, verified-Lean, classical, GUNS-proved, IcosahedralPath]
---

# INS-18 · Fibonacci triad identity

## Statement

Let $\varphi = (1 + \sqrt 5)/2$ be the golden ratio.  Four basic
properties, all **proved in Lean 4** in GUNS:

1. **`golden_pos`**: $0 < \varphi$.
2. **`golden_gt_one`**: $1 < \varphi$.
3. **`golden_sq_eq_golden_add_one`**: $\varphi^2 = \varphi + 1$
   (the defining equation).
4. **`golden_fibonacci_triad`** (for every integer $k$):

   $$\varphi^{k+2} = \varphi^{k+1} + \varphi^k.$$

This is the **Fibonacci recurrence** for golden-ratio powers.

## Canonical Lean form

```lean
noncomputable def golden : ℝ := (1 + Real.sqrt 5) / 2

theorem golden_pos : 0 < golden := by
  unfold golden
  have h1 : 0 ≤ Real.sqrt 5 := Real.sqrt_nonneg 5
  linarith

theorem golden_gt_one : 1 < golden := by
  unfold golden
  have h : (2 : ℝ) < Real.sqrt 5 := by
    have h_sq : Real.sqrt 4 < Real.sqrt 5 :=
      Real.sqrt_lt_sqrt (by norm_num) (by norm_num)
    have h4 : Real.sqrt 4 = 2 := by
      rw [show (4:ℝ) = 2^2 by norm_num]
      exact Real.sqrt_sq (by norm_num)
    linarith
  linarith

theorem golden_sq_eq_golden_add_one : golden ^ 2 = golden + 1 := by
  unfold golden
  have h : Real.sqrt 5 ^ 2 = 5 := Real.sq_sqrt (by norm_num : (5:ℝ) ≥ 0)
  have h2 : ((1 + Real.sqrt 5) / 2) ^ 2 =
    (1 + 2 * Real.sqrt 5 + Real.sqrt 5 ^ 2) / 4 := by ring
  rw [h2, h]
  ring

theorem golden_fibonacci_triad (k : ℤ) :
    golden ^ (k + 2) = golden ^ (k + 1) + golden ^ k := by
  have h_ne : golden ≠ 0 := ne_of_gt golden_pos
  have h_sq := golden_sq_eq_golden_add_one
  have step1 : (k + 2 : ℤ) = (k + 1) + 1 := by ring
  rw [step1, zpow_add_one₀ h_ne, zpow_add_one₀ h_ne]
  linear_combination golden ^ k * h_sq
```

## Why golden, not dyadic

The Fibonacci triad identity is the **only self-similar triad
scale** compatible with the Waleffe helical-triad decomposition
(INS-17) under the constraint $k + p + q = 0$.  Dyadic shells
($2^k$) bleed — nearest-neighbor resonances $\Delta_k \cdot
\Delta_{k+1}$ land in shell $k+2$ **plus** residual noise in
adjacent shells.  Golden shells align — the Fibonacci identity
ensures nearest-neighbor resonances land **exactly** in shell
$k+2$.

This is the algebraic backbone of OBS-07 (Resonance-Diagonal
Obstruction) and the motivation for INS-04 (Icosahedral
Hypothesis on $\varphi$-shells).

## Status notes

**Verified**.  First strict-methodology `verified` entries in the
live corpus — four Lean-proved theorems from Mathlib primitives,
zero axioms, zero sorry.  They are also the only entries (alongside
GUNS's 6 sanity-check lemmas) for which the `machine_verification`
field points at a real Lean reference, not `pending`.

## Dependencies in context

Standalone (foundational; depends only on Mathlib algebra).

Supports INS-04 (Icosahedral Hypothesis), OBS-07 (Resonance-
Diagonal), THR-03 (icosahedral thread).

## Citations

- **GUNS IcosahedralPath/Hypothesis.lean** lines 77–110
  (Step-4 formalization).
- **Classical**: every number-theory / real-analysis reference.
- **Sternberg**, *Group Theory and Physics* (for the
  golden-ratio / icosahedron / binary-icosahedral connection).

## History

GUNS Step 4 (2026-04-17) — four theorems proved in four HIRA
round-trips.  The Fibonacci-triad proof required 4 iterations.
Live corpus 2026-04-22.
