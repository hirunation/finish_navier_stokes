---
id: AX-04
title: KNSS blow-up extraction (Acta Math. 203 §6)
category: AX
status: axiom-quarantined
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [AX-03]
supports: [INS-03, INS-05, INS-10, INS-12, INS-21, LEM-06]
cross_citations:
  - label: KNSS 2009
    ref: "Koch, G.; Nadirashvili, N.; Seregin, G.; Šverák, V., Liouville theorems for the Navier–Stokes equations and applications, Acta Math. 203 (2009) 83–105 (arXiv:0709.3599)"
    note: §6 of the paper — blow-up extraction procedure yielding bounded ancient solution from Type II singularity.
verification:
  method: classical (PDE theory, smooth compactness)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: axiom
lean_ref: GUNS.ClassicalPath.ExtractionStatement
tags: [axiom, KNSS, ancient-solution, blow-up-extraction, Type-II, quarantined, Tree-A]
---

# AX-04 · KNSS blow-up extraction

## Statement

Given a smooth NS solution $u$ with Type II finite-time singularity
at $T^*$, there exist sequences $\lambda_n \to 0$, $x_n \to x_0$,
$t_n \to T^*$ such that the rescaled family

$$v_n(y, s) = \lambda_n\, u(x_n + \lambda_n y, t_n + \lambda_n^2 s)$$

converges (along a subsequence, in $C^m_{\mathrm{loc}}$ for every
$m \geq 0$) to a smooth bounded ancient NS solution

$$v : \mathbb{R}^3 \times (-\infty, 0] \to \mathbb{R}^3$$

with $\|v\|_{L^\infty} \leq C_0$ and the normalization
$|v(0, 0)| = 1$.

## Canonical Lean form

```lean
axiom ExtractionStatement : Prop
```

Tree A: `NSProof/Infrastructure/KNSS.lean:78`.  GUNS quarantined.

## Classical source

**KNSS 2009** (Acta Math. 203, §6).  The construction uses:

1. **Scale selection.**  Choose $\lambda_n$ so that
   $\|\nabla v_n(\cdot, 0)\|_{L^\infty} = \|\nabla v_n\|_{L^\infty}$
   normalizing the velocity-gradient sup (exists by Type II
   blow-up rate).
2. **Uniform interior $C^m$ bounds.**  Parabolic interior
   regularity (Campanato / Galdi) gives uniform $C^m_{\mathrm{loc}}$
   bounds on $v_n$.
3. **Arzelà–Ascoli compactness** on expanding balls + diagonal
   subsequence extraction → $C^m_{\mathrm{loc}}$ convergence to a
   smooth limit $v$ on $\mathbb{R}^3 \times (-\infty, 0]$.
4. **Normalization preserved** under the limit (scale-invariance +
   Fatou).

Extraction procedure uses that the solution is smooth up to the
singularity (requires Schwartz initial data; AX-02 establishes
the smooth maximal interval $[0, T^*)$).

## Usage in NS program

Part II Step 2.  Supplies the bounded ancient solution whose
backward-time limit will be the target of Part I's Liouville
theorem (INS-02).

**Critical note:** AX-04 provides $\|v\|_{L^\infty} \leq C_0$ only.
The $L^{3,\infty}$ inheritance required for Part I's application
is a **separate argument** that is flagged as a structural gap
in Draft 12 (see CORR-07).  KNSS's original program completes
the ancient-solution contradiction only under axi-symmetry (via
their §5 Liouville theorems).  Extending to general 3D is the
contribution of Part I + ESS03 backward uniqueness.

## Dependencies in context

Depends on AX-03 (Type I exclusion, so the singularity is Type
II).  Supports INS-03, INS-05 (Part II composition), LEM-06
(L^{3,∞} inheritance argument — see CORR-07 for its open
status).

## Citations

- **KNSS 2009**, *Acta Math.* 203, §6.  arXiv:0709.3599.
- **Seregin 2012 lecture notes** on NS (detailed exposition of
  the extraction).

## History

KNSS 2009 (seven authors' Acta paper).  Tree A axiomatized
Apr 3–5 session.  GUNS quarantined 2026-04-17.  Live corpus
2026-04-22.
