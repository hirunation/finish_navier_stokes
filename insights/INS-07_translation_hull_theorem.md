---
id: INS-07
title: Translation Hull Theorem (bounded smooth stationary NS)
category: INS
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-02, INS-02, LEM-10, LEM-11]
supports: [INS-03, INS-08, MPC-1, THR-02]
cross_citations:
  - label: GUNS HullErgodicPath
    ref: grand_unified_ns_proof/GUNS/HullErgodicPath/TranslationHull.lean
  - label: BRAID §III.A
    ref: turbulent_waters/canon/BRAID_1.md Movement III §A
  - label: MPC-1 §31
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_1.md §31
    note: Translation hull compactness via Krylov-Bogolyubov; contains constant field in Cᴼ.
  - label: MPC-2 §2.6
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md §2.6
verification:
  method: canon-synthesis (Krylov-Bogolyubov + Wiener ergodic + center-L² vanishing + bounded harmonic Liouville)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: cross-strand synthesis (A+B+C)
  machine_verification: pending
lean_ref: GUNS.HullErgodicPath.translation_hull_theorem
tags: [translation-hull, Krein-Rutman, Krylov-Bogolyubov, Wiener-ergodic, MPC-1, MPC-2, BRAID-Movement-III]
---

# INS-07 · Translation Hull Theorem

## Statement

Let $v$ be a bounded smooth stationary divergence-free NS
solution on $\mathbb{R}^3$.  The **translation hull**

$$\mathcal{O} := \overline{\{v(\cdot + x) : x \in \mathbb{R}^3\}}^{C^\infty_{\mathrm{loc}}}$$

is non-empty, compact, and contains at least one **constant**
vector field:

$$\mathcal{C}_\mathcal{O} := \mathcal{O} \cap \{\text{constants}\} \neq \emptyset.$$

## Canonical Lean form

```lean
theorem translation_hull_theorem
    (ν : ℝ) (v : R3 → R3) (h : IsBoundedSmoothStationary ν v) :
    ∃ c : R3, InTranslationHull v (fun _ : R3 => c) := by
  sorry
```

## Method (three-strand synthesis)

1. **Krylov-Bogolyubov** (Strand A).  The translation semigroup
   $T_x : v \mapsto v(\cdot + x)$ acts on the bounded smooth
   stationary class by isometries in $C^\infty_{\mathrm{loc}}$.
   By boundedness + smoothness, the orbit closure is compact;
   by Krylov-Bogolyubov, there exists a translation-invariant
   probability measure $\mu$ on $\mathcal{O}$.
2. **Wiener ergodic theorem** (Strand B).  Applied to $\mu$ and
   test functions, yields asymptotic averages equal to
   $\mu$-integrals.
3. **Center-averaged $L^2$ smallness** (Strand A): production-
   dissipation identity on expanding balls $\fint_{B_L}
   |\alpha \rho^2| = O(L^{-1})$ (MPC-1 §35).
4. **Curl–divergence cancellation** (Strand A): $\nabla \cdot (g e_3) =
   -\Delta Q$.
5. **Bounded harmonic Liouville**: the $\mu$-averaged velocity is
   harmonic, hence constant (Liouville theorem for bounded
   harmonic functions on $\mathbb{R}^3$).

Combined: the hull contains the $\mu$-average — a constant
field.

## Status notes

**Speculative.**  Proof architecture is canon-synthesis; the
individual strands are classical (Krylov-Bogolyubov, Wiener,
harmonic Liouville); the composition is the BRAID Movement III
content.  Lean body `sorry`'d — a formalization is a reasonable
first-target session goal.

**Dichotomy.**  Either $|\mathcal{C}_\mathcal{O}| = 1$ (uniquely
ergodic; closes bounded Liouville) or $\mathcal{C}_\mathcal{O}$ is
a **perfect set** (nontrivial Cantor-like hull).  Unique-
ergodicity is the positive route (INS-03 Grand Unification
Conjecture).

## Dependencies in context

Depends on LEM-10 (Krylov-Bogolyubov on smooth-function orbit
closures in $C^\infty_{\mathrm{loc}}$) and DEF-02
(`IsBoundedSmoothStationary`).

Supports INS-03 (Grand Unification Conjecture is an equivalence
chain rooted in this theorem) and THR-02 (hull-ergodic thread).

## Citations

- **BRAID Movement III §A**, turbulent_waters canon.
- **MPC-1 §31**, MPC-2 §2.6.
- **Krylov-Bogolyubov 1937**, classical.
- **Wiener 1939**, ergodic theorem.
- **Aronson** (semigroup compactness).
- **Proven bounded-harmonic Liouville** (Euclid-geometry
  textbook).

## History

Canon synthesis 2026-04-14..17 in session `277f7666`.  GUNS
Lean statement 2026-04-17.  Live corpus 2026-04-22.
