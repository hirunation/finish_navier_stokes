---
id: AX-02
title: Local existence of maximal smooth NS solution (Galdi / Kato / Fujita-Kato)
category: AX
status: axiom-quarantined
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: []
supports: [INS-01, INS-03, INS-05]
cross_citations:
  - label: Galdi 15.3.1
    ref: "Galdi, G. P., An Introduction to the Mathematical Theory of the Navier–Stokes Equations (Springer Monographs, 2011), Theorem 15.3.1"
    note: Local smooth existence on maximal interval [0, T*).
  - label: Kato 1984
    ref: "Kato, T., Strong L^p solutions of the Navier–Stokes equation in ℝ^m, Math. Z. 187 (1984) 471–480"
    note: Mild-solution local well-posedness at critical L^3 regularity.
  - label: Fujita-Kato 1964
    ref: "Fujita, H.; Kato, T., On the Navier–Stokes initial value problem I, Arch. Rational Mech. Anal. 16 (1964) 269–315"
    note: Classical local existence theorem.
verification:
  method: classical (PDE theory)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard fixed-point argument
  machine_verification: axiom
lean_ref: GUNS.ClassicalPath.LocalExistenceStatement
tags: [axiom, local-existence, Schwartz, maximal-interval, quarantined, Tree-A]
---

# AX-02 · Local existence of maximal smooth NS solution

## Statement

Let $u_0 \in \mathcal{S}(\mathbb{R}^3)$ be divergence-free Schwartz
data.  There exists a maximal time $T^* \in (0, \infty]$ and a
unique $u \in C^\infty(\mathbb{R}^3 \times [0, T^*))$ solving

$$\partial_t u - \nu \Delta u + (u \cdot \nabla)u + \nabla p = 0, \quad \nabla \cdot u = 0, \quad u(\cdot, 0) = u_0.$$

## Canonical Lean form

```lean
axiom LocalExistenceStatement : Prop
```

Tree A: `NSProof/Infrastructure/ParabolicReg.lean:44` (axiom with
full typing).  GUNS quarantines it in `ClassicalPath/ClassicalAxioms.lean`.

## Classical source

- **Galdi 2011** Theorem 15.3.1: maximal-interval local
  existence in the smooth / Schwartz class.
- **Kato 1984** / **Fujita-Kato 1964**: mild-solution local
  well-posedness in critical Sobolev / Lebesgue classes.

Standard fixed-point argument on $u = e^{\nu t \Delta} u_0 +
\int_0^t e^{\nu(t-s)\Delta} \mathbb{P}[(u \cdot \nabla)u]\, ds$ in
suitable Banach space.  Non-trivial PDE theory but classical and
textbook.

## Usage in NS program

Foundational: establishes the existence of the maximal interval
$[0, T^*)$ that Part II's blow-up argument then reaches a
contradiction with (showing $T^* < \infty$ impossible, hence
$T^* = \infty$ — the regularity conclusion).

Note: **the Schwartz hypothesis is required** by the KNSS
extraction (AX-04).  Remark 4.5(iv) in Draft 12 notes extension
to $L^3$ data likely via Kato but not proven in the current
paper.

## Dependencies in context

Standalone; foundational.  Supports INS-03 (Main Regularity
Theorem) via Part II's blow-up extraction.

## Citations

- **Galdi 2011**, §15.3.
- **Kato 1984**.
- **Fujita-Kato 1964**.
- See also: **Leray 1934** (original NS existence).

## History

Standard result; axiomatized for efficiency.  Tractable to
formalize (estimated 1–3 days of Lean work, per GUNS
`ClassicalPath/README.md`).
