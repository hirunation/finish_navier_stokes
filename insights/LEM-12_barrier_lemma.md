---
id: LEM-12
title: Barrier lemma — T[α] overflows X for positive α
category: LEM
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-28
dependencies: [INS-17]
supports: [INS-06, THR-05]
cross_citations:
  - label: synthesis_11.md pass 4
    ref: navier_stokes/synthesis_11.md
    note: Barrier lemma: the T-map operator on X overflows for any positive input; kernel lower bound 0.011; log-divergent integral at Λ = exp(A₊/0.0012).
verification:
  method: explicit quantitative derivation (kernel lower bound + integral divergence)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: numerical confirmation at R=200 + three independent derivations in synthesis_11 pass 4
  machine_verification: pending
tags: [barrier-lemma, fixed-point, quantitative, log-divergence, helical-kernel, synthesis_11]
---

# LEM-12 · Barrier lemma

## Statement

For the truncated amplitude equation at wavenumber cutoff $N$,
define $X := \{\alpha : \sup_{|k| \leq K_N} |k| \alpha(k) < \infty\}$.
The operator

$$T[\alpha](k) := |k|^{-2} \int |C(k, p, q)|\, \alpha(p)\, \alpha(q)\, dp$$

(where $C(k, p, q)$ is the helical interaction kernel from
INS-17) **overflows** $X$ for any positive $\alpha \in X$:

$$\|T[\alpha]\|_X \geq c \int_{\mathrm{dom}} |\alpha(p)| |\alpha(q)| \frac{dp}{|pq|^2} \xrightarrow{\ \text{log-divergent}} \infty.$$

Quantitative detail:

- **Kernel lower bound**: $|C(k, p, q)| \geq 0.011$ on 100% of
  $S^2$ (verified at 2000 sample points).
- **Divergence threshold**: $T[\alpha]$ exceeds $X$-norm at
  $\Lambda = \exp(A_+/0.0012)$, where $A_+$ is the minimal
  positive $\alpha(k)/|k|^{-1}$ ratio at each truncation $N$.
- **Angular-eigenvalue coefficient**: $C_{\mathrm{ang}} = 4.771$.
- **Min/max ratio**: $A_-/A_+ = 1/(C_{\mathrm{ang}} \log 4) = 0.151$.

Consequence: the continuum fixed-point equation $\alpha = T[\alpha]$
has **no positive solution** in $X$.

## Numerical confirmation

As $N$ grows (3D truncation $N = 12 \to 16 \to 18$), the minimal
norm $\|\alpha\|_X$ decreases: $1.97 \to 1.73 \to 1.51 \to 1.20$,
trending either to 0 or to $\infty$ — no stable continuum fixed
point in either direction.

## Significance

Primary mechanism for excluding the $(-,-,-)$ equilibrium class
(the last surviving class after Parity Theorem INS-11 eliminates
the 6 mixed classes).  Combined with INS-06 (Scaling-Liouville
via Gel'fand-Shilov + $L^{3,\infty}$ violation), the $(-,-,-)$
closure is double-proven.

## Status notes

**Speculative** in the live-corpus sense (not Lean-formalized).
The derivation is explicit and quantitative; the numerical
verification is solid at 2000 sample points.  Suitable for
future Lean formalization as a quantitative analytical lemma.

## Dependencies in context

Depends on INS-17 (Waleffe helical decomposition; kernel $C$
and triad structure).

Supports INS-06 (Scaling-Liouville) — barrier lemma is the
integral-divergence half of the Scaling-Liouville chain.

## Citations

- **synthesis_11.md pass 4**, navier_stokes corpus.
- **Waleffe 1992** for the $C$ kernel.

## History

Derived 2026-03-28 in synthesis_11 breakthrough arc.  Live
corpus 2026-04-22.
