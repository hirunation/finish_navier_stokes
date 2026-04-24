---
id: OBS-02
title: Exchange-of-Limits Obstruction — hull topology
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-2]
supports: [OBS-04, THR-04]
cross_citations:
  - label: MPC-2 §2.38–2.39
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md §2.38–§2.39
    note: Non-commutation of n-limit (hull convergence) and R-limit (far-field Rayleigh) along translation-hull sequences.
  - label: GUNS Obstruction 2
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction2_ExchangeOfLimits.lean
    note: Lean formalization; body sorry.
verification:
  method: canon-derivation + spectral analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.exchangeOfLimits_obstruction
tags: [obstruction, hull-topology, MPC-2, Strand-B, braid-V.3, usc]
---

# OBS-02 · Exchange-of-Limits Obstruction (hull topology)

## Statement

Along a hull-convergent sequence `w_n → c` (constant) in the
translation hull $\mathcal{O}$ of a bounded smooth stationary NS
solution, the finite-scale Rayleigh quotient

$$\gamma_R(w) := \frac{\int_{B_R} \alpha |\omega|^2 \, dx}{\int_{B_R} |\omega|^2 \, dx}$$

fails to commute its `n → ∞` and `R → ∞` limits:

$$\limsup_n \limsup_R \gamma_R(w_n) \;\neq\; \limsup_R \limsup_n \gamma_R(w_n).$$

Equivalently: upper semi-continuity of the asymptotic coupling
constant $\gamma_\infty$ at constant configurations is
**equivalent** to bounded Liouville, not an independent input.

## Canonical Lean form

```lean
def ExchangeOfLimitsObstructionStatement : Prop :=
  ∃ v : R3 → R3, DivergenceFree v ∧ ContDiff ℝ ⊤ v ∧
    (∃ M : ℝ, 0 < M ∧ ∀ x : R3, ‖v x‖ ≤ M) ∧ True

theorem exchangeOfLimits_obstruction : ExchangeOfLimitsObstructionStatement := by sorry
```

## Canon source

**MPC-2 §2.38–§2.39.**  Within Strand B (spectral-dynamical), the
Rayleigh quotient $\gamma_\infty(v)$ is the natural coupling
constant that Krein-Rutman extracts as an eigenvalue on the
translation hull.  §2.38 establishes that for a translation-
convergent sequence $w_n \to c$, the limit along $n$ first, then
$R$, gives $\gamma_R(c) = 0$ (since constants have $\omega \equiv
0$), yielding `limsup = 0`.  §2.39 shows the other order
produces `limsup ≥ γ_∞(v) > 0` generically.  Non-commutation
closed.

## Semantic role

Rules out using upper semi-continuity of $\gamma_\infty$ at
constants as an independent hypothesis: USC is *equivalent to*
the conclusion, not a premise.  Circular.

Combined with OBS-04 (USC obstruction, the same observation in
MPC-3 Vector C terms), this forecloses attacks that try to
extract bounded Liouville from semi-continuity properties of
asymptotic functionals alone.

## Dependencies in context

Standalone.  Supports THR-04 (obstruction wall) and the
hull-ergodic thread (unique ergodicity as the structural bypass).

## Citations

- **MPC-2 §2.38–§2.39**, turbulent_waters canon.
- **BRAID_1 §V.3**, turbulent_waters canon.
- **GUNS ObstructionLibrary Obstruction2_ExchangeOfLimits**.

## History

Canon-stated 2026-04-14..17 in MPC-2 refinement round.  Lean
2026-04-17.  Live corpus 2026-04-22.
