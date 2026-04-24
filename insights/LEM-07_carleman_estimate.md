---
id: LEM-07
title: Carleman estimate for parabolic differential inequalities
category: LEM
status: speculative
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-07
dependencies: [AK-02, AK-15, AK-31, AX-05]
supports: [LEM-08, LEM-09, THR-01]
cross_citations:
  - label: ESS03 §§3-5
    ref: "Escauriaza-Seregin-Šverák, ARMA 169 (2003) 147–157"
    note: Carleman estimates for parabolic operators with Gaussian growth; foundational for backward uniqueness.
verification:
  method: weighted-energy Gronwall (AX-05) + explicit constant tracking
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Tree A Infrastructure/Carleman.lean — 23 supporting lemmas
  machine_verification: pending (Tree A has carlemanEstimate modulo Axiom 5)
lean_ref: GUNS.ClassicalPath.Inherit.carlemanEstimate_tree_a
tags: [Carleman, parabolic, Gaussian-weight, weighted-energy, ESS03, Gronwall]
---

# LEM-07 · Carleman estimate for parabolic differential inequalities

## Statement

For a function $u : \mathbb{R}^3 \times [-T, 0] \to \mathbb{R}$
(vector-valued in applications) satisfying the parabolic
differential inequality

$$|\partial_t u + \nu \Delta u| \leq c(|u| + |\nabla u|),$$

with Gaussian growth $|u(x, t)| \leq C \exp(C|x|^2)$, the
Carleman-weighted energy

$$\mathcal{F}[u](s) := \int_{\mathbb{R}^3} |u(x, s)|^2 \, \exp\!\left(-\frac{|x|^2}{4a(s)}\right) dx, \qquad a(s) \sim |s|,$$

satisfies a weighted-energy Gronwall inequality (AX-05 / Tree A
`truncatedEnergy_gronwall`):

$$\mathcal{F}[u](s) \geq C_0 \exp\!\left(-\frac{C^*}{|s|}\right) \cdot \mathcal{F}[u](s_0) \quad \text{for } s_0 < s < 0.$$

In particular, if $u(\cdot, s_0) = 0$ for some $s_0 < 0$, then
$u(\cdot, s) = 0$ for all $s \in [s_0, 0]$ — backward uniqueness
(LEM-08).

## Method

Weighted-energy differentiation:

1. $\frac{d}{ds} \mathcal{F}[u](s) = \int 2 u \partial_s u \, e^{-|x|^2/(4a)} + \int |u|^2 \frac{|x|^2}{4a^2} \dot a \, e^{-|x|^2/(4a)}$.
2. Substitute $\partial_s u + \nu\Delta u$ from the differential
   inequality; integrate by parts twice (one per coordinate,
   three coordinates → six applications).
3. Apply Cauchy-Schwarz + Young's inequality with absorption
   (6-fold cycle); absorb the gradient term into $-\nu|\nabla u|^2
   e^{-|x|^2/(4a)}$.
4. Result: effective Gronwall with constant $C^*$ depending on
   $c, \nu, a(s)$.  AX-05 provides the explicit form.

Tree A `Infrastructure/Carleman.lean` has 23 supporting lemmas
implementing this chain.

## Status notes

**Speculative.**  Tree A has `carlemanEstimate_tree_a` proved
*modulo Axiom 5* (AX-05); the estimate is considered rigorous
once the truncated-energy Gronwall is established.  ~150-line
argument.

## Dependencies in context

Depends on AX-05 (truncated-energy Gronwall).

Supports LEM-08 (ESS03 backward uniqueness) and LEM-09 (ESS03
spatial continuation).  Core parabolic-uniqueness infrastructure.

## Citations

- **ESS 2003**, *ARMA* 169 (Carleman estimates, full paper).
- **ESS 2003**, *Russian Math. Surveys* 58 (expository; Theorems
  4.1 and 5.1 live here, per CORR-05).
- **Saut-Scheurer** and **Carleman 1939** for the classical
  Carleman framework.

## History

ESS 2003.  Tree A formalization in session `4afbf6c4` (Apr 7).
GUNS Inherit 2026-04-17.  Live corpus 2026-04-22.
