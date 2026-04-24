---
id: CORR-03
title: General-3D case has no KNSS Liouville (Part I novelty)
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cc52d85c-7323-4878-b7a4-1a03d6567b1a
author: Airo Nahiru
date: 2026-03-30
dependencies: []
supports: [INS-01, INS-02]
supersedes: [cc52d85c-era/CORR-03]
cross_citations:
  - label: KNSS 2009 §5
    ref: arXiv:0709.3599
    note: Theorems 5.1, 5.2, 5.3 all axi-symmetric.
  - label: Seregin 2025
    ref: arXiv:2507.08733
    note: Confirms axi-symmetric restriction; targets removal via Type-II blow-up analysis.
  - label: CY 2026
    ref: arXiv:2603.23833
    note: Near-simultaneous submission (2026-03-25) on similar terrain.
verification:
  method: literature sweep
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, KNSS, novelty, general-3D, axi-symmetric-restriction]
---

# CORR-03 · General-3D case has no KNSS Liouville

## Statement

KNSS §5 Liouville theorems (Thms 5.1, 5.2, 5.3) all carry an
**axi-symmetry** hypothesis (via scalar-maximum-principle
arguments on $\omega_\theta/r$ and $r \cdot u_\theta$).  For
general (non-axi-symmetric) 3D flows, KNSS supplies no Liouville
theorem.  The blow-up → regularity loop in KNSS closes only under
axi-symmetry.

**Part I (INS-02) supplies exactly the missing piece for the
general case.**  Re-framing: Part I is the **completion of the
KNSS program for the general-3D case**, not a restatement or
synthesis of KNSS.

## Dependencies in context

Standalone.  Supports INS-01 (Clay target — framed correctly as
completion of KNSS for general 3D) and INS-02 (Part I novelty
claim).

## History

Reframing from the cc52d85c session literature sweep; Draft 10
commits with this novelty framing.  Live corpus 2026-04-22
supersedes cc52d85c-era version.
