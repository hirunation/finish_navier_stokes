---
id: LEM-08
title: ESS03 backward uniqueness (RMS 58 §5.1)
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-07
dependencies: [AK-02, AK-14, AK-29, AK-33, CORR-01, CORR-02, CORR-05, LEM-07]
supports: [INS-05, INS-09, INS-12, LEM-13, THR-01]
cross_citations:
  - label: ESS RMS 58 §5.1
    ref: "Escauriaza-Seregin-Šverák, Backward uniqueness for the heat equation in half-space, Russian Math. Surveys 58 (2003) 211–250, Theorem 5.1"
    note: The CORRECT citation — not ARMA 169 Theorem 1.2 (which Draft 12 previously used; fixed in CORR-05).
verification:
  method: Carleman-estimate consequence (LEM-07)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: classical ESS result
  machine_verification: pending (Tree A backwardUniqueness proved, NSProof.ESS03.backwardUniqueness:46)
lean_ref: GUNS.ClassicalPath.Inherit.backwardUniqueness_tree_a
tags: [ESS03, backward-uniqueness, parabolic, Carleman-consequence, RMS-58, citation-correction]
---

# LEM-08 · ESS03 backward uniqueness

## Statement (ESS RMS 58 §5.1)

Let $u : \mathbb{R}^3 \times [0, T] \to \mathbb{R}^N$ satisfy the
parabolic differential inequality

$$|\partial_t u + \nu \Delta u| \leq c(|u| + |\nabla u|)$$

and the Gaussian growth bound $|u(x, t)| \leq C \exp(C|x|^2)$.
If $u(\cdot, T) \equiv 0$ on $\mathbb{R}^3$, then $u \equiv 0$ on
$\mathbb{R}^3 \times [0, T]$.

## Method

Direct consequence of LEM-07 (Carleman estimate).  Weighted-
energy Gronwall: vanishing at $t = T$ propagates backward
through the exponential-weight inequality.

## Application to NS Part II Step 5 (INS-09)

For the vorticity $\omega$ of the KNSS-extracted ancient
solution, the inequality $|\partial_s \omega + \nu\Delta\omega| \leq
c(|\omega| + |\nabla\omega|)$ holds with $c$ bounded (since
$\|v\|_{L^\infty}, \|\nabla v\|_{L^\infty}$ bounded uniformly
for the bounded ancient solution).  Gaussian growth is trivially
satisfied ($\omega$ bounded).

**Contrapositive form used in Part II:** if $\omega(\cdot, 0)
\neq 0$ then $\omega(\cdot, s) \neq 0$ for all $s \leq 0$.

## Citation correction (CORR-05)

Draft 12 cites this theorem as **"ESS03 Theorem 1.2"**,
referring to ARMA 169.  This is **wrong**: ARMA 169 has only one
main theorem (on exterior of ball).  The correct reference is
**ESS03 Russian Math. Surveys 58 (2003), Theorem 5.1**.  CORR-05
documents the correction.

## Status notes

**Speculative** in the live corpus sense; classical in the NS
literature.  Tree A has `backwardUniqueness_tree_a` proved in
`Infrastructure/ESS03.lean:46` modulo AX-05 (truncated-energy
Gronwall).  GUNS catalogues.

## Dependencies in context

Depends on LEM-07 (Carleman estimate).

Supports INS-05 (Part II composition) and INS-09 (three
incompatible constraints at Step 5).

## Citations

- **ESS03** Russian Math. Surveys 58 (2003), §5.1.
- **ESS03** ARMA 169 (2003) — Carleman machinery only.  Do not
  cite as Theorem 1.2 (CORR-05).
- **Saut-Scheurer 1987**, backward uniqueness earlier framework.

## History

ESS 2003.  Tree A formalization `4afbf6c4` (Apr 7).  GUNS
catalogued 2026-04-17.  Citation corrected 2026-04-22 in CORR-05
audit.  Live corpus 2026-04-22.
