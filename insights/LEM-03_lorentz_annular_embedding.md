---
id: LEM-03
title: Lorentz-annular embedding (layer-cake application)
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [AX-01]
supports: [INS-02, INS-14, LEM-01]
cross_citations:
  - label: Draft 12 §2 Step 4 Lemma 2.2
    ref: official/PROOF_FINAL_DRAFT12.tex lines 483–510
verification:
  method: direct application of AX-01 to the annulus with explicit volume
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard Lorentz-space analysis
  machine_verification: pending (Tree A Infrastructure/Lorentz.lean: one lemma distribFun_antitone proved)
lean_ref: GUNS.ClassicalPath.Inherit.distribFun_antitone_tree_a (partial)
tags: [Lorentz, annulus, layer-cake, weak-Lp, scaling, critical-space]
---

# LEM-03 · Lorentz-annular embedding

## Statement

For $v \in L^{3,\infty}(\mathbb{R}^3)$ with $\|v\|_{L^{3,\infty}}
\leq M$, and fixed-ratio annulus $A = A(\theta\rho, \rho)
\subset \mathbb{R}^3$ (volume $|A| = C(\theta) \rho^3$):

$$\|v\|_{L^r(A)} \leq C(r, \theta)\, M\, \rho^{3/r - 1} \quad \text{for every } r \in (0, 3).$$

Specializations used in the Caccioppoli chain:

- $r = 2$: $\|v\|_{L^2(A)}^2 \leq C M^2 \rho$.
- $r = 12/5$: $\|v\|_{L^{12/5}(A)} \leq C M \rho^{-1/4}$.
- $r = 3^-$: $\|v\|_{L^r(A)} \leq C M \rho^{3/r - 1}$ with
  exponent $\to 0$ as $r \to 3$.

## Method — direct layer-cake (AX-01)

Apply AX-01 (layer-cake embedding) with $q = 3$ and
$E = A(\theta\rho, \rho)$:

$$\|v\|_{L^r(A)} \leq \left(\frac{3}{3 - r}\right)^{1/r} \|v\|_{L^{3,\infty}} |A|^{1/r - 1/3}.$$

Substitute $|A| = C(\theta)\rho^3$ to get
$|A|^{1/r - 1/3} = C^{1/r - 1/3} \rho^{3(1/r - 1/3)} = C' \rho^{3/r - 1}$.

$r < 3$ is required (the Marcinkiewicz coefficient blows up at
$r = 3$).

## Critical insight — L^{3,∞} vs L^3

For $v \in L^3(\mathbb{R}^3)$ (not just $L^{3,\infty}$), the
same embedding would give the same $\rho$-scaling but with a
non-universal prefactor.  **The gap between $L^3$ and
$L^{3,\infty}$** — a factor of $(3/(3-r))^{1/r}$ blowing up at
$r = 3$ — is exactly wide enough to **power the Caccioppoli
iteration** without being wide enough to admit Landau solutions
$v \sim c/|x|$ (which lie in $L^{3,\infty} \setminus L^3$).

This duality makes $L^{3,\infty}$ the **critical scaling-
invariant function space** for the Liouville theorem.

## Status notes

**Speculative** in the strict sense (awaiting full Lean formal-
ization).  Tree A has `distribFun_antitone_tree_a` proved (a
foundational distribution-function monotonicity lemma); the
full annular embedding needs AX-01 + measure-theoretic
scaffolding, ~1000 Lean lines estimated.

## Dependencies in context

Depends on AX-01 (layer-cake embedding).

Supports LEM-01 (Caccioppoli) and INS-02 (Part I Liouville —
Step 4 of the 8-step chain).

## Citations

- **Draft 12 §2 Step 4 Lemma 2.2**, lines 483–510.
- **AX-01** (Stein V.3.2).
- **Grafakos** *Classical Fourier Analysis* §1.4.

## History

Applied throughout the synthesis arc (Feb–Mar); specific
annular form locked in cc52d85c session.  Live corpus
2026-04-22.
