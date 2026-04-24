---
id: INS-16
title: 4D L^{4,∞} stationary NS Liouville (corollary of INS-13)
category: INS
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [INS-02, INS-13]
supports: []
supersedes: []
cross_citations:
  - label: Draft 12 Remark 4.7
    ref: official/PROOF_FINAL_DRAFT12.tex lines 1310-1332
verification:
  method: constructive proof (specialization of INS-13 at n = 4)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: R2a round
  machine_verification: pending
tags: [4D, L4inf, corollary, new-result, borderline-logarithmic, dimensional-discriminant]
---

# INS-16 · 4D L^{4,∞} stationary NS Liouville

## Statement

A smooth stationary divergence-free solution of the
Navier–Stokes equations on $\mathbb{R}^4$ with $v \in L^{4,\infty}
(\mathbb{R}^4)$ is identically zero.

## Method

Specialize INS-13 at $n = 4$, $p = 5/2$.  The dimensional
discriminant $\gamma(4, 5/2) = 0$ exactly (the factor $(n - 4)$
vanishes).  Exponents: $\beta = 3/2$, $\alpha = 1$ (borderline).

The ODE $\mathcal{E}'(\rho) \geq c \rho^{-1} \mathcal{E}(\rho)^{3/2}$
integrates:

- LHS: $\int \mathcal{E}'/\mathcal{E}^{3/2}$ bounded ($\beta = 3/2 > 1$
  gives $[\mathcal{E}^{-1/2}]$, bounded as $R \to \infty$).
- RHS: $\int_{\rho_0}^R \rho^{-1}\, d\rho = \log(R/\rho_0) \to \infty$
  (logarithmic divergence).

LHS bounded vs RHS divergent ⇒ contradiction ⇒ finite
Dirichlet energy ⇒ $v \equiv 0$ by testing (the 8-step chain of
INS-02 carries over to $n = 4$ with the specialized exponents).

## Status notes

**Speculative.**  Verified by independent re-derivation (R2a
round in the cc52d85c session).  Genuinely novel result in the
classical stationary-NS-regularity literature.  Presented as
Remark 4.7 in Draft 12 (~15 lines).

Dimension 4 is the **exact boundary** of the hat-function
method.  $n \geq 5$ provably fails (AK-07).

## Dependencies in context

Depends on INS-02 (the base Liouville theorem in 3D) and INS-13
(dimensional discriminant supplies the $n = 4$ specialization).

No in-corpus supports.

## Citations

- **Draft 12 Remark 4.7**, lines 1310-1332.
- **cc52d85c session R2a round**.

## History

Derived 2026-03-30 in cc52d85c.  Live corpus 2026-04-22.
