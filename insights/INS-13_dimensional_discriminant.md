---
id: INS-13
title: Dimensional discriminant γ(n,p) — hat-function method boundary
category: INS
status: speculative
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [INS-02, LEM-05]
supports: [AK-07, INS-15, INS-16]
supersedes: [cc52d85c-era/INS-03]
cross_citations:
  - label: Draft 12 Remark 4.7
    ref: official/PROOF_FINAL_DRAFT12.tex lines 1310-1332
    note: 4D Liouville extension via the dimensional discriminant; n ≥ 5 impossibility.
verification:
  method: constructive proof + independent re-derivation (R2a round)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: R2a in cc52d85c
  machine_verification: pending
tags: [dimensional-discriminant, 4D, n-boundary, Liouville-method, exponent-analysis]
---

# INS-13 · Dimensional discriminant γ(n, p)

## Statement

The hat-function Liouville method's reach across dimensions $n$
is governed by the closed-form exponent

$$\gamma(n, p) = -\frac{(n - 4)(n - 2p)}{2n - p(n - 2)},$$

giving the $\rho$-dependence of the dominant Caccioppoli
remainder at Gagliardo-Nirenberg exponent $p$.  Consequences:

| $n$ | $\gamma$ at optimal $p$ | Liouville? |
|:---:|:---:|:---:|
| 3 | $\gamma(3, 2) = -1/4 < 0$ | **YES** — polynomial divergence of $\int \rho^{-\alpha}$, contradiction at β > 1 |
| 4 | $\gamma(4, 5/2) = 0$ | **YES (borderline)** — logarithmic divergence, still contradicts bounded LHS |
| ≥ 5 | — | **NO (AK-07)** — β > 1 needs p > n/2, α ≤ 1 needs p ≤ n/2, incompatible |

## Corollary (4D Liouville, new result)

Smooth stationary divergence-free NS on $\mathbb{R}^4$ with
$v \in L^{4,\infty}(\mathbb{R}^4)$ is identically zero.  At
$p = 5/2$: $\beta = 3/2$, $\alpha = 1$ (borderline).  The
logarithmic integral $\int \rho^{-1}\, d\rho$ diverges vs bounded
LHS (β > 1) — contradiction closes.  Genuinely novel result.
~15 lines as Remark 4.7 in Draft 12.

## Philosophical content

Dimension $n = 4$ is the **exact boundary** of the hat-function
method.  The factor $(n - 4)$ is the **dimensional discriminant**
— negative in 3D (room to spare), zero at 4D (borderline, just
closes), positive in 5D+ (method provably fails).

## Status notes

**Speculative** in the strict sense (not Lean-formalized), but
verified by an independent R2a re-derivation in the cc52d85c
session.  The formula $\gamma(n, p) = -(n-4)(n-2p)/(2n - p(n-2))$
is confirmed.  Genuinely novel.

## Dependencies in context

Depends on INS-02 (Liouville method) and LEM-05 (Gagliardo-
Nirenberg interpolation).

Supports INS-15 (specifically the 4D Liouville corollary) and
AK-07 (the n ≥ 5 impossibility).

**Supersedes** cc52d85c-era/INS-03 with the same content; the
formula is unchanged, but the context is updated (now positioned
as an extension of INS-02 with AK-07 as companion).

## Citations

- **Nahiru 2026**, Draft 12 Remark 4.7 (lines 1310-1332).
- **cc52d85c session R2a round** — independent re-derivation.

## History

Derived in cc52d85c session (Mar 29), R2a round.  Draft 10
integration; Draft 12 placement as Remark 4.7.  Live corpus
2026-04-22 supersedes the cc52d85c-era/INS-03 (same content,
better context).
