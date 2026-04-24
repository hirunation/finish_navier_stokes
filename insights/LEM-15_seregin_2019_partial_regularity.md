---
id: LEM-15
title: Seregin 2019 — L^{3,∞}-bounded solutions have finite singular set (partial regularity)
category: LEM
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [LEM-13]
supports: [LEM-06]
cross_citations:
  - label: Seregin 2019
    ref: arXiv:1906.06707
    note: "A note on weak solutions to the Navier-Stokes equations that are locally in L^∞(L^{3,∞})."
  - label: Choe-Wolf-Yang
    ref: "Global Cauchy L^{3,∞} partial regularity predecessor"
verification:
  method: literature fact
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [Seregin-2019, L3inf, partial-regularity, finite-singular-points, exterior-tail]
---

# LEM-15 · Seregin 2019 — finite singular set at L^{3,∞}

## Statement (Theorem 1.2 of Seregin 2019)

Let $(v, q)$ be a suitable weak solution in $Q_T = \Omega \times
(0, T)$ with $\|v\|_{L^\infty(0, T; L^{3,\infty}(\Omega))} \leq M$.
For any $\Omega_1 \Subset \Omega$, the number of singular points
in $\{(x, T) : x \in \Omega_1\}$ is at most

$$\frac{M^3}{\varepsilon(M, N)^4} < \infty,$$

where $\varepsilon(M, N)$ is Seregin's one-scale ε∗ constant.

## Method

Two-stage rescaling:
1. Around each candidate singularity, extract an ancient
   suitable weak solution $w$ with $\|w\|_{L^\infty(-\infty, 0;
   L^{3,\infty}(\mathbb{R}^3))} \leq M$ and $w(\cdot, 0) = 0$ on
   $\mathbb{R}^3$.
2. For exterior decay of the ancient solution: measure-theoretic
   control via weak-L^3 bound.  For any $\gamma > 0$:
   $$|\{(x, t) : |w| > \gamma\}| \leq \frac{3}{\gamma^3} M^3.$$
   Choose $R(\gamma)$ large so measure of $\{|w| > \gamma\} \cap
   (\mathbb{R}^3 \setminus B_R)$ is small.  Cube-by-cube control
   gives $C(w, z_0, 1) \leq c\gamma^3 + K^{3/4} \eta^{1/4}$.
   Select $\gamma, \eta$ small to drop below ε∗.
3. Exterior pointwise $|u| + |\nabla u| \leq c(M)$, so vorticity
   bounded on exterior.  Backward uniqueness (LEM-08) gives
   $\omega \equiv 0$ on the exterior region.
4. Count singular points bounded by area / $\varepsilon^4$.

## Why this is partial, not full, regularity

The measure-based exterior argument gives a bound on the
**number** of singular points but **not** their elimination.
Full regularity requires the smallness condition

$$r^{-3} |\{x \in B(r) : |v(x, 0)| > \varepsilon/r\}| \leq \varepsilon$$

at the candidate point — which is NOT guaranteed from the
$L^\infty_t L^{3,\infty}_x$ hypothesis alone.

Related: **Choe-Wolf-Yang** (global Cauchy problem) — same
partial-regularity statement for $L^{3,\infty}$ solutions.

## Relevance to LEM-06

Seregin 2019's partial-regularity conclusion is **not sufficient
to close Draft 12's Clay target** (which requires full
regularity, not finite singularity count).  But it illustrates
how far the $L^{3,\infty}$ endpoint can be pushed with existing
tools — and where it stops.

If Route E (submit Part I standalone) is pursued, Seregin 2019
can be cited as motivation in the Remarks section explaining
why the Clay target is beyond the paper's scope.

## Dependencies in context

Depends on LEM-13 (Phuc 2015's endpoint framing).

Supports LEM-06 (establishes what's known up to but not
including full regularity).

## Citations

- **Seregin 2019**, arXiv:1906.06707.
- **Choe-Wolf-Yang** (referenced as [1] in Seregin 2019).
- **LEM-08** ESS03 backward uniqueness (used in Seregin 2019's
  exterior closure).
- **Lin 1998** (CPAM 51, 241-257) partial regularity predecessor.

## History

Published 2019; catalogued 2026-04-22 during session-1 attack
on LEM-06.
