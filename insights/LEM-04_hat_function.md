---
id: LEM-04
title: Hat function φ(|x|/ρ) — properties for annular energy
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: []
supports: [INS-02, LEM-01]
cross_citations:
  - label: Draft 12 §2 Step 1
    ref: official/PROOF_FINAL_DRAFT12.tex lines 238–296
  - label: Draft 12 Remark 4.1
    ref: official/PROOF_FINAL_DRAFT12.tex lines 1176–1188
    note: Hat function's triple purpose — monotonicity, explicit derivative, uniform Bogovskii constants.
verification:
  method: elementary direct calculation
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending (Tree A Infrastructure/HatFunction.lean: phi_contDiff_two, phi_nonneg, phi_hasCompactSupport, phi_norm_fderiv_bound — 11 lemmas catalogued)
lean_ref: GUNS.ClassicalPath.Inherit.{phi_contDiff_two_tree_a, phi_norm_fderiv_bound_tree_a, phi_hasCompactSupport_tree_a, phi_nonneg_tree_a}
tags: [hat-function, cutoff, annular-weight, monotonicity, Caccioppoli, explicit-derivative]
---

# LEM-04 · Hat function $\varphi(|x|/\rho)$

## Definition

$$\varphi(t) := \begin{cases} 1 & 0 \leq t < \theta \\ (1 - t)/(1 - \theta) & \theta \leq t < 1 \\ 0 & t \geq 1 \end{cases}$$

for fixed $\theta \in (0, 1)$ (e.g., $\theta = 1/2$).

## Properties

1. **$C^2$** on $[0, \infty)$ (after standard mollification in a
   small neighborhood of $t = \theta, 1$; or treated as
   piecewise-linear with distributional derivatives).
2. **Compact support** on $[0, 1]$.
3. **Non-negative**: $0 \leq \varphi \leq 1$.
4. **Explicit gradient bound**: $|\nabla_x (\varphi(|x|/\rho))|
   \leq 1/((1 - \theta)\rho)$ for $|x| \in (\theta\rho, \rho)$,
   zero elsewhere.
5. **Annular support for the gradient**:
   $\mathrm{supp}(\nabla_x \varphi(|x|/\rho)) = A(\theta\rho, \rho)$.

## Three-purpose design (Draft 12 Remark 4.1)

(a) **Makes $\mathcal{E}(\rho) = \int |\nabla v|^2 \varphi(|x|/\rho)\, dx$
monotone in $\rho$** — since $\varphi$ is monotone in $\rho$ for
fixed $x$.

(b) **Derivative controls $D(\rho)$ via explicit formula**:

$$\mathcal{E}'(\rho) = \frac{1}{(1 - \theta)\rho^2} \int_{A(\theta\rho, \rho)} |\nabla v|^2 |x|\, dx \geq \frac{\theta}{(1 - \theta)\rho} D(\rho),$$

where $D(\rho) = \|\nabla v\|_{L^2(A(\theta\rho, \rho))}^2$.

(c) **Gradient lives on a fixed-ratio annulus $A(\theta\rho, \rho)$**,
ensuring the Bogovskii constants in LEM-02 are **uniform in $\rho$**
(scale-independent).

## Status notes

**Speculative** in the strict sense (pending full Lean).  Tree A
has 11 lemmas formalized in `Infrastructure/HatFunction.lean`
including `phi_contDiff_two`, `phi_nonneg`,
`phi_hasCompactSupport`, `phi_norm_fderiv_bound`.  Four are
catalogued in GUNS `Inherit.lean` as trivially-proved GUNS-side
stubs pointing back to Tree A.

## Dependencies in context

Standalone (elementary calculus).  Supports LEM-01 (Caccioppoli)
and INS-02 (Liouville — Step 1 of the chain).

## Citations

- **Draft 12 §2 Step 1 (eq. 244–251)**, Remark 4.1.
- **Tree A** `Infrastructure/HatFunction.lean` — 11 formalized
  lemmas.

## History

Piecewise-linear design chosen in cc52d85c session (Draft 5–9).
Draft 12 remark 4.1 articulates the triple-purpose rationale.
Tree A formalization Apr 3–5 session.  Live corpus 2026-04-22.
