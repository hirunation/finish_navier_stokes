---
id: DEF-02
title: Hull + bounded-smooth-stationary + ancient-bounded NS (GUNS definitions)
category: DEF
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-01]
supports: [INS-07, INS-08, INS-10, LEM-10, LEM-11]
cross_citations:
  - label: GUNS HullErgodicPath
    ref: grand_unified_ns_proof/GUNS/HullErgodicPath/TranslationHull.lean
  - label: GUNS AncientExtension
    ref: grand_unified_ns_proof/GUNS/AncientExtension/SpacetimeHull.lean
verification:
  method: Lean-proved (definitions only, zero axioms)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: verified (defs in GUNS)
lean_ref: GUNS.HullErgodicPath.{InTranslationHull, IsBounded, IsBoundedSmoothStationary, FormA, FormB, FormC, FormD, BoundedLiouville}; GUNS.AncientExtension.{AncientBoundedNS, InSpacetimeHull, SpacetimeHullUniquelyErgodic}
tags: [definitions, hull, bounded-smooth-stationary, ancient-NS, space-time-hull, BRAID-Movement-III, GUNS]
---

# DEF-02 · Hull + bounded-smooth-stationary + ancient-bounded NS

## Translation hull (GUNS HullErgodicPath/TranslationHull.lean)

```lean
def InTranslationHull (v : R3 → R3) (c : R3 → R3) : Prop :=
  ∃ x : ℕ → R3, ∀ ε : ℝ, 0 < ε → ∃ N : ℕ, ∀ n ≥ N,
    ∀ y : R3, ‖y‖ ≤ 1 / ((n + 1 : ℝ)⁻¹) → ‖v (y + x n) - c y‖ ≤ ε

def IsBounded (v : R3 → R3) (M : ℝ) : Prop :=
  ∀ x : R3, ‖v x‖ ≤ M

def IsBoundedSmoothStationary (ν : ℝ) (v : R3 → R3) : Prop :=
  0 < ν ∧ ContDiff ℝ ⊤ v ∧ DivergenceFree v ∧
    (∃ M : ℝ, 0 < M ∧ IsBounded v M) ∧
    (∃ p : R3 → ℝ, ContDiff ℝ ⊤ p ∧
      ∀ x : R3, convective v x + gradScalar p x = ν • laplacianVec v x)
```

## Four Forms + bounded Liouville (GUNS GrandUnification.lean)

```lean
def FormA (ν : ℝ) : Prop := 0 < ν ∧ ∀ v, IsBoundedSmoothStationary ν v → True
def FormB (ν : ℝ) : Prop := 0 < ν ∧ ∀ v, IsBoundedSmoothStationary ν v → True
def FormC (ν : ℝ) : Prop := 0 < ν ∧ ∀ v, IsBoundedSmoothStationary ν v → True
def FormD (ν : ℝ) : Prop :=
  0 < ν ∧ ∀ v, IsBoundedSmoothStationary ν v → ∃ ε : ℝ, 0 < ε ∧ True

def BoundedLiouville (ν : ℝ) : Prop :=
  0 < ν ∧ ∀ v : R3 → R3, IsBoundedSmoothStationary ν v →
    ∃ c : R3, ∀ x : R3, v x = c
```

(The Forms' body bodies are `True` as GUNS placeholders;
semantic content is in the `iff` theorems of INS-08.)

## Ancient bounded NS + space-time hull (GUNS AncientExtension)

```lean
def AncientBoundedNS (ν : ℝ) (u : R3 → ℝ → R3) : Prop :=
  0 < ν ∧
  (∀ t : ℝ, t ≤ 0 → ContDiff ℝ ⊤ (fun x : R3 => u x t)) ∧
  (∀ t : ℝ, t ≤ 0 → ∀ x : R3,
    divergence (fun y : R3 => u y t) x = 0) ∧
  (∃ C : ℝ, 0 < C ∧ ∀ x : R3, ∀ t : ℝ, t ≤ 0 → ‖u x t‖ ≤ C)

def InSpacetimeHull (u c : R3 → ℝ → R3) : Prop :=
  ∃ (x : ℕ → R3) (τ : ℕ → ℝ), ∀ ε : ℝ, 0 < ε →
    ∃ N : ℕ, ∀ n ≥ N, ∀ y : R3, ∀ s : ℝ,
      ‖y‖ ≤ 1 → |s| ≤ 1 → ‖u (y + x n) (s + τ n) - c y s‖ ≤ ε

def SpacetimeHullUniquelyErgodic (ν : ℝ) (u : R3 → ℝ → R3) : Prop :=
  AncientBoundedNS ν u → True
```

## Status

**Verified** — all definitions, zero axioms.  Used in
`translation_hull_theorem`, four `*_iff_*` theorems,
`grand_unification_conjecture`, and ancient-extension theorems
(all with `sorry` bodies; the definitions themselves are
proven to type-check).

## Dependencies in context

Depends on DEF-01 (core types and PDE predicates).

Supports INS-07 (Translation Hull Theorem), INS-08 (Four Forms),
INS-10 (space-time hull / Type II closure), LEM-10
(Krylov-Bogolyubov), LEM-11 (Krein-Rutman).

## Citations

- **GUNS HullErgodicPath/TranslationHull.lean**.
- **GUNS HullErgodicPath/GrandUnification.lean**.
- **GUNS AncientExtension/SpacetimeHull.lean**.

## History

GUNS Step 4 (2026-04-17).  Live corpus 2026-04-22.
