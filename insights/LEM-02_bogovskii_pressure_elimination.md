---
id: LEM-02
title: Bogovskii pressure elimination (exact, algebraic, div-free test function)
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [AK-10, DEF-01]
supports: [INS-02, LEM-01]
cross_citations:
  - label: Bogovskii 1979
    ref: "Bogovskii, M. E., Soviet Math. Dokl. 20 (1979) 1094–1098"
    note: Original divergence-equation solver with compact-support + bounded-norm properties.
  - label: Borchers-Sohr 1990
    ref: "Borchers, W.; Sohr, H., Hokkaido Math. J. 19 (1990) 67–87"
    note: Refined Bogovskii operator with explicit scaling bounds.
  - label: Galdi 2011
    ref: "Galdi, An Introduction to the Math. Theory of the NS Eqns, §III.3"
verification:
  method: classical (Bogovskii 1979, standard NS auxiliary tool)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Borchers-Sohr; Galdi standard reference
  machine_verification: pending (Tree A Infrastructure/Bogovskii.lean: bogConst_pos proved, gradient_Lq_bound and scale_independence placeholders)
lean_ref: GUNS.ClassicalPath.Inherit.{bogConst_pos_tree_a, bogConst_scale_independence_tree_a}
tags: [Bogovskii, pressure, divergence-equation, test-function, Leray-Helmholtz, annulus]
---

# LEM-02 · Bogovskii pressure elimination

## Statement

For a smooth radial cutoff $\psi$ supported on $B_\rho$ with
$\psi \equiv 1$ on $B_{\theta\rho}$ and $|\nabla\psi| \leq
C(\theta)/\rho$, and a smooth divergence-free vector field $v$,
there exists a smooth compactly-supported vector field

$$w = v\psi - \mathcal{B}[v \cdot \nabla\psi]$$

satisfying:

- $\nabla \cdot w \equiv 0$ (divergence-free by Bogovskii
  construction).
- $\mathrm{supp}(w) \subset B_\rho$.
- $\|w\|_{L^q(A)} \leq C(\theta, q)\, \|v\|_{L^q(A)}$ for every
  $q \in (1, \infty)$.
- Scale-invariant: Bogovskii constant $C(\theta, q)$ depends only
  on the ratio $\theta$, not on $\rho$.

Consequently, for any smooth NS solution with
$\nabla \cdot v = 0$:

$$\int \nabla p \cdot w\, dx = 0,$$

so pressure is **eliminated exactly** from the NS equation tested
against $w$.

## Why this is essential

Pressure is the Lagrange multiplier for the incompressibility
constraint; in the stationary NS equation $-\nu\Delta v +
(v \cdot \nabla)v + \nabla p = 0$, it is the non-local Calderón-
Zygmund singular-integral extension of $|S|^2 - |\omega|^2/2$
via the Poisson equation $-\Delta p = |S|^2 - |\omega|^2/2$.

Direct Calderón-Zygmund estimates on pressure would introduce
non-local control that breaks the annulus-local Caccioppoli
bookkeeping.  Bogovskii's div-free test function avoids this
entirely: **pressure integrates to zero against $w$ by Leray-
Helmholtz orthogonality**.  Algebraic, exact, not an estimate.

## Status notes

**Speculative** in the live-corpus strict sense (awaiting Lean
completion).  Tree A `Infrastructure/Bogovskii.lean` has
`bogConst_pos` **proved**, and `gradient_Lq_bound` +
`scale_independence` as placeholder theorems with trivial
bodies (scale-independence proved `rfl`).  Full Lean
formalization is tractable but not yet done.

Classical in the NS literature (Bogovskii 1979, Borchers-Sohr
1990, Galdi 2011 §III.3 standard exposition).

## Dependencies in context

Depends on DEF-01 (the $\mathcal{B}$ Bogovskii-operator
definition).

Supports LEM-01 (Caccioppoli — Bogovskii is the Step 2 of the
8-step chain; LEM-01 uses the resulting test function) and
INS-02.

## Citations

- **Bogovskii 1979**, *Soviet Math. Dokl.* 20.
- **Borchers-Sohr 1990**, *Hokkaido Math. J.* 19.
- **Galdi 2011**, §III.3.

## History

Classical tool; applied to NS-regularity proof in
`navier_stokes/synthesis_5–9` (mid-March) and formalized in
Tree A (`0872111a`, Apr 3–5).  Live corpus 2026-04-22.
