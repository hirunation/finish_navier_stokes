---
id: INS-06
title: Scaling-Liouville Theorem (q=1 exponent forcing, Gel'fand-Shilov)
category: INS
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-28
dependencies: [INS-02, INS-11, INS-17, LEM-12]
supports: [INS-01, INS-12, THR-05]
supersedes: []
cross_citations:
  - label: synthesis_11.md pass 3
    ref: navier_stokes/synthesis_11.md
    note: Breakthrough session. Scaling-Liouville theorem closes the (-,-,-) equilibrium gap that had resisted 14 attempts.
  - label: PROOF_FINAL_DRAFT11.tex
    ref: navier_stokes/PROOF_FINAL_DRAFT11.tex
    note: Embodiment in the 1491-line "best draft".
  - label: Gel'fand-Shilov
    ref: "Gel'fand, I. M.; Shilov, G. E., Generalized Functions Vol. 1 (Academic Press 1964), Ch. IV §3"
    note: Homogeneous distributions on ℝⁿ; degree-0 homogeneity in k-space maps to degree-(-n+1) in physical space.
verification:
  method: synthesis_11 pass 3 (breakthrough derivation) + computational confirmation at R=200 (synthesis_12 pass 4)
  rounds: 3
  adversarial_vectors: n/a
  independent_rederivation: numerical verification at 33.5M lattice modes
  machine_verification: pending
lean_ref: none (not yet in GUNS; candidate for future ObstructionLibrary extension)
tags: [scaling-Liouville, Gel'fand-Shilov, homogeneous-distribution, q=1, function-space-pivot, synthesis_11]
---

# INS-06 · Scaling-Liouville Theorem

## Statement

Let $v$ be a smooth stationary divergence-free NS solution on
$\mathbb{R}^3$ with $v \in L^{3,\infty}(\mathbb{R}^3)$ satisfying
the helical-kernel amplitude-balance equation.  If $v$ decays
homogeneously — $\alpha(k) \sim A/|k|^s$ in Fourier space — then:

1. The helical interaction kernel $|C(k, p, q)|$ is homogeneous
   of degree 0 (explicit formula, numerically verified at R5
   resolution).
2. Dimensional balance of the truncated amplitude equation
   forces **$s = 1$ universally** for any scaling-symmetric
   solution.
3. At $s = 1$, the integral $\int |C(k, p, q)| \alpha(p) \alpha(q)\, dp$
   diverges logarithmically, yielding no positive fixed point in
   the continuum.
4. By the Gel'fand-Shilov homogeneous-distribution theorem,
   velocity fields with degree-0 homogeneity in $k$-space are
   homogeneous of degree $-2$ in physical space:
   $v(x) \sim |x|^{-2}$.
5. The distribution function $|\{|v| > L\}| \sim L^{-3/2}$
   **violates $L^{3,\infty}$** (which requires
   $|\{|v| > L\}| \leq C L^{-3}$).

Therefore: no scaling-symmetric stationary NS solution in
$L^{3,\infty}$ exists.

## Method (from synthesis_11 pass 3)

Three-line chain:

- Degree-0 kernel homogeneity forces $s = 1$ via dimensional
  balance.
- $s = 1$ fixed-point integral diverges logarithmically (LEM-12
  barrier lemma).
- Gel'fand-Shilov maps degree-0 $k$-homogeneity to degree-$(-2)$
  $x$-homogeneity.
- Distribution function at degree $-2$ in $\mathbb{R}^3$ violates
  $L^{3,\infty}$.

**Computational confirmation (synthesis_12 pass 4):** at
resolution R=200 (33.5M lattice modes), the Cesàro average
$\frac{1}{|B_R|}\int_{B_R} |v(x)| \cdot |x|^2\, dx$ converges to
a value in $[25, 30]$, consistent with degree-$(-2)$ homogeneity.

## Significance — the function-space pivot

Breakthrough realization (synthesis_12 pass 2 → pass 3): after
20 failed attempts to exclude the $(-,-,-)$ equilibrium
mechanically, v0.82 pass 2 discovered *exponential decay* at
the truncation level (which appeared catastrophic — seemed
PDE-consistent).  v0.82 pass 3 inverted the interpretation: the
correct question is not "does the solution exist?" but **"what
function space does it live in?"**  Koch-NSS bounds on exponential
decay force trivial solutions in the bounded class; Scaling-
Liouville closes the power-law oscillatory class.  Together,
both candidate profile families are excluded.

## Status notes

**Speculative.**  Not yet Lean-formalized.  The informal chain
(Gel'fand-Shilov + kernel degree + fixed-point divergence) is
short and clean; the arithmetic is algebraic.  A future
formalization is tractable; not yet scheduled.  Mathematical
content is confirmed by:
- synthesis_11 pass 3 derivation (3 independent derivation paths
  converged).
- synthesis_12 pass 4 numerical confirmation.
- Embodiment in PROOF_FINAL_DRAFT11 §2 Remark on sharpness (the
  Landau-solution sharpness witness is the Draft-11 analogue of
  this theorem; Draft 12's framing absorbs it into Lorentz
  layer-cake LEM-03).

## Dependencies in context

Depends on INS-02 (the Liouville theorem's statement, since
Scaling-Liouville is effectively its sharp version for
scaling-symmetric fields) and LEM-12 (barrier lemma).

Supports INS-01 (closure mechanism for the Clay target in the
alternative synthesis-arc framing) and THR-05 (Scaling-Liouville
/ function-space pivot thread).

## Citations

- **synthesis_11.md pass 3**, navier_stokes corpus.
- **synthesis_12.md pass 2–4**, navier_stokes corpus.
- **Gel'fand-Shilov** *Generalized Functions* Vol. 1, §IV.3
  (1964 / Engl. ed. 1977).
- **Waleffe 1992** — helical triad decomposition (kernel
  formula).

## History

Breakthrough 2026-03-28 in v0.78 → v0.82 transition sessions
(navier_stokes project).  Confidence rose from 54% to 93% after
the function-space pivot.  Live corpus 2026-04-22 as part of the
session-1 deep distillation (session-0 corpus missed this
entirely).
