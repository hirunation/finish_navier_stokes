---
id: LEM-09
title: ESS03 spatial continuation (RMS 58 §4.1)
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-07
dependencies: [AK-33, CORR-01, CORR-05, LEM-07]
supports: [INS-05, INS-09, INS-12, LEM-13, THR-01]
cross_citations:
  - label: ESS RMS 58 §4.1
    ref: "Escauriaza-Seregin-Šverák, Russian Math. Surveys 58 (2003) 211–250, Theorem 4.1"
    note: The correct citation — not ARMA Theorem 1.1.  CORR-05.
verification:
  method: Carleman-estimate consequence (LEM-07)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: classical ESS result
  machine_verification: pending (Tree A spatialContinuation proved, NSProof.ESS03.spatialContinuation:270)
lean_ref: GUNS.ClassicalPath.Inherit.spatialContinuation_tree_a
tags: [ESS03, spatial-continuation, UCP, parabolic, Carleman-consequence, RMS-58]
---

# LEM-09 · ESS03 spatial continuation

## Statement (ESS RMS 58 §4.1)

Let $u : \mathbb{R}^3 \times [0, T] \to \mathbb{R}^N$ satisfy the
parabolic differential inequality

$$|\partial_t u + \nu \Delta u| \leq c(|u| + |\nabla u|)$$

with Gaussian growth $|u(x, t)| \leq C \exp(C|x|^2)$.  If
$u(\cdot, t) \equiv 0$ on some ball $B_R$ for all $t \in (0, T)$,
then $u \equiv 0$ on $\mathbb{R}^3 \times (0, T)$.

## Application to NS Part II Step 5 (INS-09)

Combined with LEM-08 (backward uniqueness), this forbids a
bounded vorticity from "retreating to spatial infinity" while
vanishing on compact sets.  More precisely: if $\omega(\cdot, s)
\to 0$ in $C^m_{\mathrm{loc}}$ as $s \to -\infty$ (which follows
from Part I / INS-02 applied to every backward subsequential
limit via Arzelà-Ascoli + INS-05 Step 4), then by LEM-09 the
$\omega$ cannot "survive at spatial infinity" — if it were zero
on compact sets and nonzero "at infinity," spatial continuation
kills it.

Combined with LEM-08 forbidding temporal vanishing
($\omega(\cdot, 0) \neq 0$), this gives the third of the three
incompatible constraints in INS-09.

## Citation correction (CORR-05)

Draft 12 cites this theorem as **"ESS03 Theorem 1.1"**,
referring to ARMA 169.  This is **wrong**.  The correct
reference is **ESS03 Russian Math. Surveys 58 (2003),
Theorem 4.1**.  CORR-05 documents.

## Status notes

**Speculative** in the live-corpus sense; classical in the NS
literature.  Tree A has `spatialContinuation_tree_a` proved in
`Infrastructure/ESS03.lean:270` modulo AX-05.  GUNS catalogues.

## Dependencies in context

Depends on LEM-07 (Carleman estimate).

Supports INS-05, INS-09.

## Citations

- **ESS03 RMS 58 (2003), §4.1**.
- **ESS03 ARMA 169 (2003)** — backbone Carleman machinery only.

## History

ESS 2003.  Tree A formalization Apr 7.  GUNS 2026-04-17.
Citation correction 2026-04-22 (CORR-05).  Live corpus
2026-04-22.
