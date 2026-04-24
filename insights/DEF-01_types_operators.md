---
id: DEF-01
title: Core types and differential operators
category: DEF
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: []
supports: [DEF-02, DEF-03, INS-01, INS-02, INS-05, LEM-02]
cross_citations:
  - label: GUNS Basic.lean
    ref: grand_unified_ns_proof/GUNS/Basic.lean
    note: All definitions here are noncomputable `def`s in Lean 4 + Mathlib; zero axioms.
verification:
  method: Lean-proved from Mathlib primitives
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: GUNS.Basic (6 proven sanity checks confirm coherence with zero field)
lean_ref: GUNS.{R3, VectorField, ScalarField, gradScalar, divergence, laplacianVec, convective, timeDeriv, DivergenceFree, Schwartz, GloballySmooth, ClassicalSolution, IsGlobalSolution}
tags: [types, operators, PDE-primitives, Mathlib, Lean-proved, foundational, GUNS]
---

# DEF-01 · Core types and differential operators

## Types

```lean
abbrev R3 : Type := EuclideanSpace ℝ (Fin 3)
abbrev VectorField : Type := ℝ → R3 → R3
abbrev ScalarField : Type := ℝ → R3 → ℝ
```

## Differential operators (noncomputable)

```lean
noncomputable def gradScalar (p : R3 → ℝ) (x : R3) : R3 :=
  (EuclideanSpace.equiv (Fin 3) ℝ).symm
    (fun i => fderiv ℝ p x (EuclideanSpace.single i 1))

noncomputable def divergence (v : R3 → R3) (x : R3) : ℝ :=
  ∑ i : Fin 3, fderiv ℝ v x (EuclideanSpace.single i 1) i

noncomputable def laplacianVec (u : R3 → R3) (x : R3) : R3 :=
  ∑ i : Fin 3, iteratedFDeriv ℝ 2 u x ![EuclideanSpace.single i 1, EuclideanSpace.single i 1]

noncomputable def convective (u : R3 → R3) (x : R3) : R3 :=
  fderiv ℝ u x (u x)

noncomputable def timeDeriv (u : VectorField) (t : ℝ) (x : R3) : R3 :=
  fderiv ℝ (fun s => u s x) t 1
```

## Predicates

```lean
def DivergenceFree (v : R3 → R3) : Prop :=
  ContDiff ℝ 1 v ∧ ∀ x : R3, divergence v x = 0

def Schwartz (v : R3 → R3) : Prop :=
  ContDiff ℝ ⊤ v ∧
    ∀ k N : ℕ, ∃ C : ℝ, ∀ x : R3,
      ‖iteratedFDeriv ℝ k v x‖ * (1 + ‖x‖) ^ N ≤ C

def GloballySmooth (u : VectorField) : Prop :=
  ContDiff ℝ ⊤ (Function.uncurry u)
```

## The NS PDE and global solution predicate

```lean
noncomputable def ClassicalSolution
    (ν : ℝ) (u : VectorField) (p : ScalarField) : Prop :=
  ContDiff ℝ ⊤ (Function.uncurry u) ∧
  ContDiff ℝ ⊤ (Function.uncurry p) ∧
  ∀ t : ℝ, 0 < t → ∀ x : R3,
    (timeDeriv u t x + convective (u t) x + gradScalar (p t) x
       = ν • laplacianVec (u t) x) ∧
    divergence (u t) x = 0

def IsGlobalSolution
    (ν : ℝ) (u₀ : R3 → R3) (u : VectorField) : Prop :=
  (∃ p : ScalarField, ClassicalSolution ν u p) ∧
  u 0 = u₀ ∧
  GloballySmooth u
```

## Status

**Verified** — all definitions are non-axiomatic Mathlib-derived
defs.  Six sanity checks in `GUNS/SanityChecks.lean` confirm
coherence (every operator vanishes on the zero field; the zero
field is a classical solution).

## Dependencies in context

Standalone (Mathlib foundations only).

Supports INS-01 (Clay target statement), INS-02 (Liouville
statement), INS-05 (Part II composition), LEM-02 (Bogovskii
tests the stationary NS PDE via `divergence`).

## Citations

- **GUNS Basic.lean**, `grand_unified_ns_proof/GUNS/Basic.lean`.
- **Mathlib** `Mathlib.Analysis.Calculus.FDeriv.*`,
  `Mathlib.Analysis.InnerProductSpace.EuclideanDist`,
  `Mathlib.Analysis.Calculus.ContDiff.Basic`.

## History

GUNS Step 1–2 (2026-04-17).  Live corpus 2026-04-22.
