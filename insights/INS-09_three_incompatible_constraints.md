---
id: INS-09
title: Three incompatible constraints (Part II Step 5 geometry)
category: INS
status: speculative
confidence: 0.85
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [CORR-01, CORR-02, CORR-05, INS-02, LEM-08, LEM-09]
supports: [INS-05, THR-01]
supersedes: [cc52d85c-era/INS-09]
cross_citations:
  - label: Draft 12 §3 Step 5
    ref: official/PROOF_FINAL_DRAFT12.tex, lines 1076-1161
  - label: ESS03 Russian Math. Surveys 58 (2003) §§4.1 (spatial), 5.1 (backward uniqueness)
    ref: "Escauriaza-Seregin-Šverák, Russian Math. Surveys 58 (2003) 211–250"
    note: Companion expository paper to the ARMA paper; the 1.1/1.2 numbering that Draft 12 previously used (pre-audit) comes from this paper, not ARMA.  CORR-05.
verification:
  method: composition argument (established tool applications)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: none (Tree A's Part II mainTheorem + ancientSolution_contradiction covers this composition)
tags: [Part-II-Step-5, geometry, three-constraints, backward-uniqueness, spatial-continuation, ancient-solution, Carleman]
---

# INS-09 · Three incompatible constraints (Part II Step 5 geometry)

## Statement

At the ancient-solution closure step of Part II (INS-05 Step 5),
the vorticity $\omega$ of the KNSS-extracted ancient solution
satisfies **three mutually incompatible constraints**:

1. **$\omega$ cannot survive at the origin.**  Part I (INS-02)
   killed the stationary anchor: every backward-in-time
   subsequential limit is stationary $L^{3,\infty}$, hence zero.
   Full convergence gives $v(\cdot, s) \to 0$ in $C^m_{\mathrm{loc}}$
   as $s \to -\infty$.

2. **$\omega$ cannot retreat to infinity.**  The Carleman weight
   $\exp(-|x|^2/(4a(s)))$ with $a(s) \sim |s|$ creates a Gaussian
   aperture of width $\sqrt{|s|}$ — **exactly matching the
   diffusive retreat rate** (parabolic scaling).  ESS03 spatial
   continuation (LEM-09) forbids $L^2$ mass from concentrating at
   infinity while vanishing locally.

3. **$\omega$ cannot cease to exist.**  ESS03 backward uniqueness
   (LEM-08) applied to the parabolic differential inequality
   $|\partial_s \omega + \nu\Delta\omega| \leq c(|\omega| + |\nabla\omega|)$
   with $\omega(\cdot, 0) \neq 0$: $\omega(\cdot, s) \neq 0$ for
   all $s \leq 0$.

The three constraints are mutually incompatible, forcing
$v \equiv 0$ on $\mathbb{R}^3 \times (-\infty, 0]$.  This
contradicts $|v(0, 0)| = 1$ (the KNSS normalization).

## Proof of non-vanishing vorticity at $s = 0$

If $\omega(\cdot, 0) = 0$, then $v(\cdot, 0)$ is both divergence-
free and curl-free, hence harmonic on $\mathbb{R}^3$.  Layer-cake
bound $\|v\|_{L^1(B_R)} \leq CMR^2$ combined with mean-value
property: $|v(x, 0)| \leq CM/R \to 0$ as $R \to \infty$.
Therefore $v(\cdot, 0) \equiv 0$, contradicting $|v(0, 0)| = 1$.
Hence $\omega(\cdot, 0) \neq 0$.

## Status notes

**Speculative** — each constraint is rigorous under its
hypothesis (Part I via INS-02, spatial continuation via LEM-09,
backward uniqueness via LEM-08), but the composition depends on
Step 2b of Part II (the $L^{3,\infty}$ inheritance; CORR-07
flags structural gap).

## Dependencies in context

Depends on INS-02 (Part I), LEM-08 (ESS03 backward uniqueness),
LEM-09 (ESS03 spatial continuation), CORR-01 (KNSS §4 ≠ backward
uniqueness), CORR-02 (backward uniqueness belongs to ESS03),
CORR-05 (ESS03 citation is RMS 58, not ARMA 169).

Supports INS-05 (Part II composition) and THR-01 (two-mechanism
structure thread).

**Supersedes** cc52d85c-era/INS-09 which captured the same
geometric content but used the wrong ESS03 citation (ARMA 1.1/1.2
instead of RMS 4.1/5.1; corrected in CORR-05).

## Citations

- **Nahiru 2026**, Draft 12 §3 Step 5.
- **ESS03 Russian Math. Surveys 58 (2003)**, §4.1 (spatial
  continuation), §5.1 (backward uniqueness on half-space).
- **ESS03 ARMA 169 (2003)**, Carleman estimates core.

## History

Geometric content of Step 5 authored across Drafts 1–12.
cc52d85c-era corpus had this as INS-09 but cited the wrong
ESS03 paper.  Live corpus 2026-04-22 supersedes with corrected
citations and the Draft-12 audit-state framing.
