---
id: INS-15
title: Quantitative regularity bound — single-exponential
category: INS
status: speculative
confidence: 0.75
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [INS-02, INS-13]
supports: []
supersedes: [cc52d85c-era/INS-12]
cross_citations:
  - label: Draft 12 Remark 4.4
    ref: official/PROOF_FINAL_DRAFT12.tex
    note: Single-exponential quantitative bound, stretching transience corollary.
  - label: Tao 2020
    ref: "Tao, T., Quantitative bounds for critically bounded solutions to the Navier-Stokes equations, Contemp. Math. 740 (2020)"
    note: Triple-exponential bound from critically-bounded NS machinery.  Single-exponential via constructivized KNSS would be a quantitative improvement.
  - label: Schonbek 1985
    ref: "Schonbek, M. E., L² decay for weak solutions of the Navier–Stokes equations, Arch. Rational Mech. Anal. 88 (1985) 209–222"
  - label: Wiegner 1987
    ref: "Wiegner, M., Decay results for weak solutions of the Navier-Stokes equations on ℝⁿ, J. London Math. Soc. 35 (1987) 303–313"
verification:
  method: derivation-sketch + comparison to Tao 2020
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [quantitative, Dirichlet-bound, single-exponential, Tao-triple, Schonbek-Wiegner]
---

# INS-15 · Quantitative regularity bound — single-exponential

## Statement

From the Liouville ODE $\mathcal{E}'(\rho) \geq c \rho^{-\alpha}
\mathcal{E}(\rho)^\beta$ with $\beta = 4/3, \alpha = 2/3$ at
$p = 2$, integrating gives a polynomial Dirichlet-energy bound

$$E(\rho_0) \leq O(M^6 \rho_0^{-1})$$

where $M = \|v\|_{L^{3,\infty}}$.  Combined with one Gronwall
step from the enstrophy equation, this yields a
**single-exponential** regularity bound for critically bounded
NS solutions.

**Comparison:** Tao (2020, Contemp. Math. 740) derives a
**triple-exponential** bound via a different architecture.  The
Liouville-based approach is structurally simpler and produces
tighter dependence.

## Remark (stretching transience corollary)

For smooth Schwartz-class NS solutions on $[0, \infty)$:

$$\int_0^\infty \int_{\mathbb{R}^3} |\omega \cdot (S\omega)|\, dx\, dt < \infty,$$

with unsigned integrand $\int_{\mathbb{R}^3} |\omega \cdot S\omega|\, dx
= O(t^{-9/2})$ (possibly $O(t^{-15/4})$ under tighter Schonbek-
Wiegner; Draft 12 Remark 4.4 states $O(t^{-15/4})$).  The
time-average $T^{-1}\int_0^T S[u](t)\, dt \to 0$ as $T \to \infty$.

## Status notes

**Speculative.**  The single-exponential vs triple-exponential
comparison is a heuristic claim in Draft 12 Remark 4.4; a
rigorous quantitative form would require its own paper.

## Dependencies in context

Depends on INS-02 (the Liouville theorem supplies the polynomial
$O(M^6 \rho_0^{-1})$ bound via the superlinear ODE's
integration).

Does not currently support other entries; a forward-looking
remark for quantitative-regularity paper follow-up.

**Supersedes** cc52d85c-era/INS-12; same content, updated with
Draft 12 Remark 4.4 framing and Schonbek-Wiegner reference.

## Citations

- **Nahiru 2026**, Draft 12 Remark 4.4.
- **Tao 2020**, *Contemp. Math.* 740.
- **Schonbek 1985**, *ARMA* 88.
- **Wiegner 1987**, *J. London Math. Soc.* 35.

## History

Derived in cc52d85c session Mar 29–30.  Integration in Drafts
10–12.  Live corpus 2026-04-22 supersedes cc52d85c-era version.
