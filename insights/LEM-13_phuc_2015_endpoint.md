---
id: LEM-13
title: Phuc 2015 — L^{3,q} regularity criterion (q < ∞); q = ∞ endpoint OPEN
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [LEM-08, LEM-09]
supports: [CORR-07, INS-21, LEM-06, LEM-14, LEM-15]
cross_citations:
  - label: Phuc 2015
    ref: "Phuc, N. C., The Navier–Stokes equations in nonendpoint borderline Lorentz spaces, J. Math. Fluid Mech. 17 (2015) 741–760. arXiv:1407.5129."
  - label: Phuc open-problem quote
    ref: Phuc 2015 p. 4
    note: "To the best of our knowledge, a criterion of local regularity for the Navier-Stokes equations in L^∞(-1, 0; L^{3,∞}(B_1)) is still unknown."
verification:
  method: literature sweep (Phuc 2015 paper extracted verbatim via WebFetch)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: Phuc's argument is self-contained; closure at q = ∞ is conjectural and open
  machine_verification: n/a
tags: [Phuc-2015, Lorentz-endpoint, L3inf, regularity-criterion, OPEN-PROBLEM, Calderón-Zygmund, epsilon-regularity]
---

# LEM-13 · Phuc 2015 — L^{3,q} criterion and the q = ∞ open endpoint

## Statement (Phuc 2015 Theorem 1.5, local version)

Let $(u, p)$ satisfy the Navier–Stokes equations on
$Q_1(0, 0) = B_1(0) \times (-1, 0)$ in the sense of distributions
with

- $u \in L^\infty(-1, 0; L^2(B_1)) \cap L^2(-1, 0; W^{1,2}(B_1))$,
- $p \in L^2(-1, 0; L^1(B_1))$,
- $u \in L^\infty(-1, 0; L^{3,q}(B_1))$ for some $q \in (3, \infty)$.

Then $u$ is Hölder continuous on $Q_{1/2}(0, 0)$.

Global version (Theorem 1.7): if $u$ is a Leray–Hopf solution on
$\mathbb{R}^3 \times (0, T)$ with $u \in L^\infty(0, T;
L^{3,q}(\mathbb{R}^3))$ for some $q \in (3, \infty)$, then $u$ is
smooth on $\mathbb{R}^3 \times (0, T]$.

## The open endpoint

Phuc 2015 closes $q \in [3, \infty)$ but **explicitly notes** the
endpoint $q = \infty$ is open:

> "To the best of our knowledge, a criterion of local regularity
> for the Navier-Stokes equations in $L^\infty(-1, 0; L^{3,\infty}(B_1))$
> is still unknown.  See [14, 21] for some partial results, which
> require a smallness condition."

## Why the proof breaks at q = ∞

Phuc's proof has four pillars; two break at the endpoint:

1. **Local energy reverse-Hölder (Cor. 2.4)** — works for
   $q < \infty$; reduction requires $L^{3,q}$ absolute
   continuity.
2. **ε-regularity (Prop. 3.2)** — works for any $q$.
3. **Blow-up extraction (Prop. 4.2)** — at $q = \infty$, the
   exterior norm $\|u\|_{L^{3,\infty}(\mathbb{R}^3 \setminus B_R)}$
   **does not** tend to 0 as $R \to \infty$ (e.g.,
   $|x|^{-1} \in L^{3,\infty}$ has scale-invariant exterior
   norm).  Hence exterior ε-regularity step collapses.
4. **Backward uniqueness + Liouville** — works given (3).

The obstruction is **non-absolute-continuity** of the
$L^{3,\infty}$ quasi-norm: functions like $|x|^{-1}$ live at the
boundary of $L^{3,\infty}$ and prevent the Phuc-style compactness.

## Known closures at the endpoint

- **Axisymmetric (Ożański-Palasek 2022, arXiv:2210.10030)** —
  Nazarov-Ural'tseva Harnack on $r v_\theta$; see LEM-14.
- **Smallness (Luo-Tsai 2015, Kim-Kozono 2004)** — threshold
  version.
- **Partial regularity (Seregin 2019, arXiv:1906.06707)** —
  finite singular points; not full regularity.  See LEM-15.
- **Log-improvement** — $|u| \leq C|x|^{-1}|\log(|x|/2)|^{-\beta}$
  for $\beta > 0$ is strictly smaller than $L^{3,\infty}$ and
  Phuc's proof continues to work.

## Relevance to LEM-06 (Draft 12 audit)

Draft 12's Step 2 claim that the KNSS-rescaled ancient solution
inherits $L^{3,\infty}$ globally is **equivalent in scope** to
closing Phuc's open problem in the non-axisymmetric case.  If
Draft 12's argument were rigorously correct as stated, it would
be the first proof of Phuc's open conjecture and a major result
independently of the Clay target.

CORR-07 flags this as the critical submission blocker.

## Status notes

**Literature fact**, not a theorem of the NS corpus.  Catalogued
to frame the attack on LEM-06.

## Dependencies in context

Depends on LEM-08 (ESS03 backward uniqueness; used in Phuc's
Liouville step) and LEM-09 (ESS03 spatial continuation).

Supports LEM-06 (the Draft 12 inheritance gap), CORR-07 (audit
summary), INS-21 (the proposed weighted-moment rescue).

## Citations

- **Phuc 2015** JMFM 17, arXiv:1407.5129 (primary).
- **ESS 2003** RMS 58 §4.1, §5.1 (backward uniqueness +
  spatial continuation; Phuc's Liouville step uses these).
- **Seregin 2012** CMP 312, 833-845 (weak-L^{3,q} precursor).
- **Luo-Tsai 2015**, **Kim-Kozono 2004** (smallness endpoint).

## History

Catalogued 2026-04-22 during session-1 focused attack on LEM-06.
Subagent-verified via full text of Phuc 2015 (arXiv:1407.5129).
