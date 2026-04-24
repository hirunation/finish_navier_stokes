---
id: AX-05
title: Truncated-energy Gronwall constant (ESS03 Carleman core)
category: AX
status: axiom-quarantined
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: []
supports: [LEM-07]
cross_citations:
  - label: ESS03 §§3-5
    ref: "Escauriaza, L.; Seregin, G.; Šverák, V., Backward uniqueness for parabolic equations, Arch. Rational Mech. Anal. 169 (2003) 147–157"
    note: Carleman-weighted energy Gronwall bound for parabolic differential inequalities.
verification:
  method: classical (Carleman estimates, explicit calculation)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard in the UCP / backward-uniqueness literature
  machine_verification: axiom
lean_ref: GUNS.ClassicalPath.TruncatedEnergyGronwallConstantExistsStatement
tags: [axiom, ESS03, Carleman, backward-uniqueness, parabolic, quarantined, Tree-A]
---

# AX-05 · Truncated-energy Gronwall constant (ESS03 core)

## Statement

For solutions $u$ of the parabolic differential inequality

$$|\partial_t u + \nu \Delta u| \leq c(|u| + |\nabla u|)$$

on $\mathbb{R}^3 \times [-T, 0]$ satisfying Gaussian growth
$|u(x, t)| \leq C\exp(C|x|^2)$, there exists an effective
constant $C^*$ such that the truncated Carleman-weighted energy
$\psi(s) = \int |u|^2 w_a(x, s)\chi_R(x)\, dx$ (with
$w_a(x, s) = \exp(-|x|^2/(4a(s)))$, $a(s) \sim |s|$, and
$\chi_R$ a smooth cutoff at radius $R$) satisfies

$$\psi'(s) \leq C^* \psi(s) \quad \text{on } [-T, 0] \text{ backward}.$$

## Canonical Lean form

```lean
axiom TruncatedEnergyGronwallConstantExistsStatement : Prop
```

Tree A: `NSProof/Infrastructure/Carleman.lean:901` (private).  GUNS
quarantines.

## Classical source

**ESS03** (Escauriaza-Seregin-Šverák, *Arch. Rational Mech. Anal.*
169 (2003) 147–157), §§3-5.

Proof sketch: differentiate $\psi(s)$ in $s$, use the parabolic
differential inequality, integrate by parts twice (once per
coordinate → 6 applications), apply Cauchy-Schwarz + Young's
inequality with absorption.  Explicit effective constant in
terms of $c$ (the inequality constant) and the Carleman-weight
scaling.

Technical length: ~150–200 lines of Lean expected.  Tractable but
non-trivial.

## Usage in NS program

Core Carleman machinery.  Supplies the Gronwall constant that
powers LEM-07 (full Carleman estimate) and then LEM-08 (backward
uniqueness theorem, ESS03).  Applied to vorticity in Part II
Step 5 to forbid $\omega \equiv 0$ at any time $s < 0$ given
$\omega(\cdot, 0) \neq 0$.

## Dependencies in context

Standalone.  Supports LEM-07 (Carleman estimate), LEM-08 (ESS03
backward uniqueness theorem), INS-09 (Part II Step 5
three-incompatible-constraints geometry).

## Citations

- **ESS03**, *ARMA* 169 (2003), §§3-5.
- **Escauriaza-Seregin-Šverák 2003**, *Russian Math. Surveys* 58
  (2003), expository version with Theorems 4.1 (spatial
  continuation) and 5.1 (backward uniqueness) — **this is the
  companion paper** cited in Draft 12 under the "Theorems 1.1
  and 1.2" nomenclature that CORR-05 corrects.

## History

ESS 2003.  Tree A axiomatized in `Carleman.lean` (session
`4afbf6c4`, Apr 7).  GUNS quarantined 2026-04-17.  Live corpus
2026-04-22.
