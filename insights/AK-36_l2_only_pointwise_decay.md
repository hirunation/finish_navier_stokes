---
id: AK-36
title: L^2-only constant in pointwise spatial decay is provably impossible
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [LEM-16]
supports: [CORR-07, INS-21, LEM-06]
cross_citations:
  - label: Brandolese-Meyer 2002
    ref: "ESAIM COCV 8, 273-285, §3"
    note: Explicit counterexample construction.
verification:
  method: refutation-by-counterexample (Brandolese-Meyer §3 explicit construction)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: translation-invariance argument is elementary
  machine_verification: n/a
tags: [anti-knowledge, L2-norm, pointwise-decay, translation-invariance, Brandolese-Meyer, Draft-12-audit]
---

# AK-36 · L^2-only constant in pointwise decay is impossible

## Approach tried

Draft 12 Step 2 asserts

$$|u(x, t)| \leq \frac{C_1}{1 + |x - x_0|} \quad \text{for } |x - x_0| \geq \sqrt{T^* - t},$$

with $C_1$ depending only on $\|u_0\|_{L^2}$ and $\nu$.

## Obstruction

**Elementary translation-invariance counterexample.**  The $L^2$
norm is translation-invariant: $\|u_0\|_{L^2} = \|u_0(\cdot -
N\hat e_1)\|_{L^2}$ for every $N$.  Given a smooth $u_0$ with
$\|u_0\|_{L^2} = 1$ supported in $B_1(0)$, the translated $u_0^N
= u_0(\cdot - N \hat e_1)$ has the same $L^2$ norm but
concentrates mass at $|x| = N$.  Any $C_1$ depending only on
$\|u_0\|_{L^2}$ must hold for all translates.  But for $t$ small,
the solution with initial data $u_0^N$ is supported near
$|x| = N$, so $|u(x, t)|$ at $|x| = N$ is $O(1)$ while $|x - 0|
= N$.  The bound $|u| \leq C_1/(1 + N)$ requires $C_1 \gtrsim N$,
growing without bound.

**Brandolese-Meyer 2002 §3 explicit construction.**  Smooth
compactly-supported $u_0$ whose moment orthogonality
$\int u_h u_k = c \delta_{hk}$ fails instantly.  Under such data,
the generic pointwise decay rate $|u| \lesssim |x|^{-(n+1)}$ is
lost; the constant requires weighted initial data, not $L^2$.

## Quantitative form

For any $C_1 > 0$, there exists a smooth divergence-free
Schwartz $u_0$ with $\|u_0\|_{L^2} = 1$ and
$|u(x, t)| > C_1/(1 + |x - x_0|)$ at some point $(x, t)$ within
the local-existence interval, for any choice of $x_0$.

Simplest explicit witness: $u_0^N(x) = \phi(x - N\hat e_1)$ for
a smooth bump $\phi$ with $\|\phi\|_{L^2} = 1$.  As $N \to
\infty$, the solution concentrates at $|x| = N$ while
$\|u_0^N\|_{L^2} = 1$ remains bounded.

## Dependencies in context

Depends on LEM-16 (Brandolese-Meyer's generic decay theorem +
explicit counterexample).

Supports LEM-06 (identifies the $L^2$-only-constant step as
provably impossible).

Supports CORR-07 (audit's Issue 1 diagnosis that $L^2$
dependence is wrong).

## History

**The single biggest concrete flaw in Draft 12 Step 2's
formulation.**  Identified via the subagent literature review of
Brandolese-Meyer during 2026-04-22 session-1 focused attack on
LEM-06.

**Fix** (INS-21): replace "$C_1$ depending only on $\|u_0\|_{L^2}$
and $\nu$" with "$C_1$ depending on $\|u_0\|_{L^2}, \nu$, and a
weighted moment like $\|(1+|x|) u_0\|_{L^\infty}$ or
$\|(1+|x|)^\gamma u_0\|_{L^p}$".  This is the scope Brandolese-
Meyer covers.
