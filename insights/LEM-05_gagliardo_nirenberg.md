---
id: LEM-05
title: Gagliardo-Nirenberg interpolation on reference annulus + rescaling
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: []
supports: [INS-02, INS-13, LEM-01]
cross_citations:
  - label: Draft 12 §2 Step 5
    ref: official/PROOF_FINAL_DRAFT12.tex lines 530–617
  - label: Gagliardo 1959
    ref: "Gagliardo, E., Ulteriori proprietà di alcune classi di funzioni in più variabili, Ricerche Mat. 8 (1959) 24–51"
  - label: Nirenberg 1959
    ref: "Nirenberg, L., On elliptic partial differential equations, Ann. Scuola Norm. Sup. Pisa 13 (1959) 115–162"
verification:
  method: classical (GN 1959, standard)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending (Tree A Infrastructure/GagliardoNirenberg.lean: gnConst_pos, sobolevConst_3d_pos)
lean_ref: GUNS.ClassicalPath.Inherit.{gnConst_pos_tree_a, sobolevConst_3d_pos_tree_a}
tags: [Gagliardo-Nirenberg, interpolation, Sobolev, reference-annulus, rescaling, scale-invariance]
---

# LEM-05 · Gagliardo-Nirenberg interpolation

## Statement

On the reference annulus $A_0 = A(\theta, 1) \subset \mathbb{R}^3$:

$$\|w\|_{L^3(A_0)}^3 \leq C(A_0)\left(\|w\|_{L^p(A_0)}^a \|\nabla_y w\|_{L^2(A_0)}^{2b} + \|w\|_{L^p(A_0)}^3\right)$$

with exponents

$$a = \frac{3p}{6 - p}, \quad b = \frac{3(6 - 2p)}{2(6 - p)}, \quad a + 2b = 3.$$

**Rescaling to general annulus $A = A(\theta\rho, \rho)$** via
$w(y) = v(\rho y)$, $y \in A_0$:

$$\|v\|_{L^3(A)}^3 \leq C\left(\|v\|_{L^p(A)}^a \|\nabla v\|_{L^2(A)}^{2b} + \rho^{3 - 9/p}\|v\|_{L^p(A)}^3\right).$$

Main term is **scale-invariant** ($3 - 3a/p - b = 0$ identically
for all $p$), so the rescaling factor is 1.  The remainder
carries $\rho^{3 - 9/p}$.

## Critical ρ-cancellation

Using LEM-03 (Lorentz embedding): $\|v\|_{L^p(A)} \leq CM\rho^{3/p
- 1}$.  Substitute into the remainder:

$$\rho^{3 - 9/p} \|v\|_{L^p(A)}^3 \leq \rho^{3 - 9/p} C^3 M^3 \rho^{3(3/p - 1)} = C^3 M^3$$

— the $\rho$-dependence cancels exactly, for every $p \in
(3/2, 3)$.  Divided by the convective $\rho^{-1}$ factor from the
Caccioppoli step, the remainder contributes $CM^3/\rho$.

## Status notes

**Speculative**.  GN is classical (1959); the rescaling bookkeeping
is elementary.  Tree A has 4 lemmas in
`Infrastructure/GagliardoNirenberg.lean`: `gnConst_pos`,
`sobolevConst_3d_pos`, and two placeholder statements.  Full
embedding formalization is tractable via Mathlib Sobolev
infrastructure (~500 lines estimated).

## Dependencies in context

Standalone (classical).  Supports LEM-01 (Caccioppoli), INS-02
(Liouville Step 5), INS-13 (dimensional discriminant uses
generalized GN).

## Citations

- **Draft 12 §2 Step 5**, lines 530–617.
- **Gagliardo 1959**.
- **Nirenberg 1959**.
- **Adams-Fournier** *Sobolev Spaces* 2003 — modern reference.

## History

Classical.  Applied in cc52d85c session (Draft 5+).  Tree A
formalization in the April 3–5 arc.  Live corpus 2026-04-22.
