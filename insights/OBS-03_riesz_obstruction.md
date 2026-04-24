---
id: OBS-03
title: Riesz Obstruction — pressure Hessian sign undetermined
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-3]
supports: [OBS-07, OBS-08, THR-04]
cross_citations:
  - label: MPC-3 §3.15
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_3.md §3.15
    note: Pressure Hessian near/far decomposition $\partial_{\hat e}^2 p(0) = I_{\text{near}} + I_{\text{far}} - f(0)/3$; sign undetermined by Riesz representation + $L^2$ bounds.
  - label: GUNS Obstruction 3
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction3_Riesz.lean
    note: Lean formalization; body sorry.
verification:
  method: canon-derivation + singular-integral analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.riesz_obstruction
tags: [obstruction, Riesz, pressure-Hessian, MPC-3, Strand-C, braid-V.4]
---

# OBS-03 · Riesz Obstruction — pressure Hessian sign undetermined

## Statement

The pressure Poisson structure

$$-\Delta p = |S|^2 - \tfrac{1}{2}|\omega|^2$$

combined with $L^2$ bounds on $S$ and $\omega$ does **not**
determine the sign of the pressure-Hessian derivative
$\partial_{\hat e}^2 p(0)$ at an eigenfunction supremum.  Explicit
smooth divergence-free witness fields exist with

$$\partial_{\hat e}^2 p(0) > |\vec\beta|^2 - |\lambda|^2 \quad \text{AND} \quad \partial_{\hat e}^2 p(0) < |\vec\beta|^2 - |\lambda|^2,$$

both satisfying the Poisson identity + the energy bounds.  Full
NS-momentum structure is essential to constrain the sign; Riesz
representation alone is insufficient.

## Canonical Lean form

```lean
def RieszObstructionStatement : Prop :=
  ∃ w : R3 → R3, DivergenceFree w ∧ ContDiff ℝ ⊤ w ∧
    (∃ M : ℝ, 0 < M ∧ ∀ x : R3, ‖w x‖ ≤ M) ∧ True

theorem riesz_obstruction : RieszObstructionStatement := by sorry
```

## Canon source

**MPC-3 §3.15.**  Strand C (pressure-geometric).  §3.1–§3.14 sets
up the Riesz kernel representation of pressure via
$p = -(-\Delta)^{-1}(|S|^2 - |\omega|^2/2)$ and decomposes
$\partial_{\hat e}^2 p(0) = I_{\text{near}}(r_0) + I_{\text{far}}(r_0) - f(0)/3$
at a fixed near/far cutoff scale $r_0$.  §3.15 exhibits the
sign indeterminacy: for each sign choice there is a witness
field within the class "bounded smooth divergence-free + $L^2$-
bounded $S, \omega$" realizing it.

## Semantic role

Strand C cannot close bounded Liouville using only pressure
Poisson + energy bounds.  The full momentum equation — which
couples pressure to $(v\cdot\nabla)v$ — is required.  This
motivates the **Φ-adic per-shell refinement** in OBS-08
(Resonance-Diagonal), which inherits this indeterminacy at every
frequency shell.

## Dependencies in context

Standalone.  Supports OBS-08 (which is the per-shell Φ-adic
version) and THR-04 (obstruction wall).

## Citations

- **MPC-3 §3.15**, turbulent_waters canon.
- **BRAID_1 §V.4**, turbulent_waters canon.
- **GUNS ObstructionLibrary Obstruction3_Riesz**.

## History

Canon-stated 2026-04-14..17.  Lean 2026-04-17.  Live corpus
2026-04-22.
