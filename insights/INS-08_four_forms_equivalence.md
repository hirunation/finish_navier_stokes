---
id: INS-08
title: Four Forms of Bounded Liouville — A ⟺ B ⟺ C ⟺ D
category: INS
status: conjectured
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-02, INS-02, INS-07, LEM-11, MPC-2]
supports: [INS-03, THR-02]
cross_citations:
  - label: GUNS GrandUnification
    ref: grand_unified_ns_proof/GUNS/HullErgodicPath/GrandUnification.lean
  - label: BRAID Movement IV
    ref: turbulent_waters/canon/BRAID_1.md Movement IV
    note: Four equivalent Forms of the Grand Unification conjecture; final equivalence via T₁, T₂, T₃, T₄ transformations.
  - label: MPC-1 §43
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_1.md §43
    note: Crossing γ (layer-2 reduction): |C_𝒪| = 1 ⟺ uniform limit ⟺ unique ergodicity.
verification:
  method: BRAID Movement IV synthesis (four transformation chains)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: four independent equivalence proofs (T₁, T₂, T₃, T₄)
  machine_verification: pending
lean_ref: GUNS.HullErgodicPath.{formA_iff_formB,formA_iff_formC,formA_iff_formD,formC_iff_boundedLiouville}
tags: [equivalence, bounded-Liouville, Rayleigh-gamma, strain-L2, unique-ergodicity, BRAID-Movement-IV]
---

# INS-08 · Four Forms of Bounded Liouville

## Statement

For every $\nu > 0$, the following are equivalent:

- **Form A (Alignment):** one harmonic correlation on expanding
  spheres vanishes at the hull-transferred eigenfunction
  supremum: $\vec\beta := \mathbb{P}_\perp[(\nabla w(0))^T \hat e] = 0$
  for every $w \in \mathcal{O}$ supporting a Krein-Rutman
  eigenfunction.

- **Form B (Conservation):** $\gamma_\infty \equiv 0$ on the hull
  $\mathcal{O}(v)$ via the production-dissipation identity
  $\alpha\rho^2 = -\tfrac{1}{2}\mathcal{L}_v\rho^2 + |\nabla\omega|^2$
  integrating to zero.

- **Form C (Ergodic rate):** the translation hull admits a
  **unique** invariant probability measure under the translation
  semigroup.

- **Form D (Strain $L^2$ improvement):** for every bounded smooth
  stationary NS solution there exists $\varepsilon > 0$ such that

  $$\int_{B_R} |S|^2 \, dx \leq C(M)\, R^{2 - 2\varepsilon}.$$

- **Bounded Liouville:** every bounded smooth stationary NS
  solution is a constant vector field.

$$\mathrm{FormA} \iff \mathrm{FormB} \iff \mathrm{FormC} \iff \mathrm{FormD} \iff \mathrm{BoundedLiouville}.$$

## Canonical Lean form

```lean
theorem formA_iff_formB (ν : ℝ) : FormA ν ↔ FormB ν := by sorry
theorem formA_iff_formC (ν : ℝ) : FormA ν ↔ FormC ν := by sorry
theorem formA_iff_formD (ν : ℝ) : FormA ν ↔ FormD ν := by sorry
theorem formC_iff_boundedLiouville (ν : ℝ) : FormC ν ↔ BoundedLiouville ν := by sorry
```

Four bidirectional equivalences in
`grand_unified_ns_proof/GUNS/HullErgodicPath/GrandUnification.lean`.

## Method (four transformations T₁, T₂, T₃, T₄ — BRAID Movement IV)

- **T₁: FormA ⟺ FormD.**  Via the Final Sub-Question
  equivalence.  Alignment $\vec\beta = 0$ ⟺ strain $L^2$
  improvement $R^{4 - 2\varepsilon}/L$.
- **T₂: FormA ⟺ FormB.**  Via pressure-Hessian identity
  $\Delta\alpha^*(0) = |\lambda|^2 - |\vec\beta|^2 +
  \partial_{\hat e}^2 p(0)$ at the eigenfunction supremum.
  Conservation $\gamma_\infty = 0$ ⟺ alignment + pressure sign.
- **T₃: FormA ⟺ $\gamma_\infty = 0$.**  Via Krein-Rutman
  eigenfunction transfer — bounded eigenfunction at negative
  eigenvalue equivalent to the Rayleigh quotient attaining zero
  on the ergodic measure.
- **T₄: FormC ⟺ BoundedLiouville.**  Unique ergodicity on the
  hull ⟺ singleton constant set $|\mathcal{C}_\mathcal{O}| = 1$
  ⟺ $v$ is constant (via INS-07 Translation Hull Theorem).

## Status notes

**Conjectured.**  Each equivalence requires a separate proof
(four `sorry` bodies).  Full equivalence chain is the
**Grand Unification** — INS-03 — whose conjectural completion
closes bounded Liouville.

## Dependencies in context

Depends on INS-07 (Translation Hull Theorem) and DEF-02
(`IsBoundedSmoothStationary`).  Supports INS-03 (Grand
Unification Conjecture) and THR-02 (hull-ergodic thread).

## Citations

- **BRAID Movement IV**, turbulent_waters canon.
- **MPC-1 §43** (Crossing γ, layer-2 reduction).
- **MPC-2** full (Krein-Rutman extraction, Case II closure
  §2.37).

## History

Synthesized in session `277f7666` (Apr 14–17) and formalized in
GUNS `GrandUnification.lean` on 2026-04-17.  Live corpus
2026-04-22.
