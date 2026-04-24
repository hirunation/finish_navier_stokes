---
id: CORR-04
title: L^{3,∞} framing is draft-originated (not KNSS)
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cc52d85c-7323-4878-b7a4-1a03d6567b1a
author: Airo Nahiru
date: 2026-03-30
dependencies: []
supports: [INS-02, LEM-06]
supersedes: [cc52d85c-era/CORR-04]
cross_citations:
  - label: KNSS 2009
    ref: arXiv:0709.3599
    note: Paper works entirely in L^∞; does not mention L^{3,∞}.
  - label: Phuc 2015
    ref: "Phuc, N. C., J. Math. Fluid Mech. 17 (2015)"
    note: L^{3,q} regularity criterion for q < ∞; explicitly notes q = ∞ case OPEN (see LEM-06).
verification:
  method: literature sweep (grep on arXiv:0709.3599 for "Lorentz", "weak L3", "L^{3,∞}" — all absent)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, L3inf, Lorentz, KNSS, scale-invariance, authorship]
---

# CORR-04 · L^{3,∞} framing is draft-originated

## Statement

KNSS 2009 works entirely in $L^\infty$.  The paper never
mentions $L^{3,\infty}$ (weak $L^3$, Lorentz).  The draft's
use of $L^{3,\infty}$ is **the draft's own framing**, not
inherited from KNSS.  The scale-invariance + Fatou derivation
of the ancient-solution $L^{3,\infty}$ bound (in Draft 12 §3
Step 2) is also draft-originated — **but unproven**; see LEM-06
and CORR-07.

## Dependencies in context

Standalone.  Supports INS-02 (Part I's $L^{3,\infty}$ hypothesis
is not inherited) and LEM-06 (the inheritance argument is
flagged as an open structural gap).

## History

cc52d85c literature sweep confirmed absence.  Live corpus
2026-04-22 supersedes cc52d85c-era version with the additional
link to CORR-07 / LEM-06.
