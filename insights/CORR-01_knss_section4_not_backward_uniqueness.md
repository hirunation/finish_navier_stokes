---
id: CORR-01
title: KNSS §4 ≠ backward uniqueness (regularity/compactness only)
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cc52d85c-7323-4878-b7a4-1a03d6567b1a
author: Airo Nahiru
date: 2026-03-30
dependencies: []
supports: [CORR-02, INS-09, LEM-08, LEM-09]
supersedes: [cc52d85c-era/CORR-01]
cross_citations:
  - label: KNSS 2009
    ref: "arXiv:0709.3599; Acta Math. 203 (2009) 83–105"
    note: §4 "Bounded solutions of Navier-Stokes" — regularity / compactness only.  No backward uniqueness.
  - label: ESS03 (the correct source for backward uniqueness)
    ref: "Russian Math. Surveys 58 (2003), §§4.1 + 5.1; ARMA 169 (2003) 147–157 for Carleman core"
    note: See CORR-05 for the citation correction distinguishing RMS 58 (where Theorems 1.1/1.2 — now §4.1 / §5.1 — live) from ARMA 169 (Carleman machinery only).
verification:
  method: literature sweep + source-reading verification (cc52d85c session)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, KNSS, backward-uniqueness, literature-correction, epistemic-hygiene]
---

# CORR-01 · KNSS §4 ≠ backward uniqueness

## Statement

Drafts 7–9 of the Part II argument wrote:

> "Koch–Nadirashvili–Seregin–Šverák [Theorem 1.2, Section 4] prove
> that a bounded ancient solution … must be identically zero."

**This attribution is incorrect.**  KNSS §4 ("Bounded solutions
of Navier-Stokes") contains **regularity/compactness** results
for bounded ancient solutions — specifically Lemma 4.1 (interior
smoothing) and sequence compactness — **not** a backward-
uniqueness theorem.  KNSS §4 supplies *regularity*; the vanishing
step uses ESS03 (see CORR-02 and LEM-08).

## Method — source-reading verification

arXiv:0709.3599 read section-by-section:

- §3: Stokes kernel estimates, representation formulas.
- §4: **Bounded-solution regularity and compactness** (Lemma 4.1
  interior smoothing, sequence compactness).  **No backward
  uniqueness.**
- §5: Liouville theorems — Thm 5.1, 5.2, 5.3.  **All three are
  axi-symmetric.**
- §6: Blow-up extraction procedure (AX-04); application to
  axi-symmetric regularity = published Thms 1.1, 1.2 in Acta
  Math.

## Supersession

Updates the cc52d85c-era/CORR-01.  Same core content, now linked
into the live corpus with additional context (CORR-02, CORR-05
for the full chain of ESS03 corrections).

## Dependencies in context

Standalone.  Supports INS-09 (three-incompatible-constraints
correctly attributes backward uniqueness to ESS03), LEM-08 (ESS03
backward uniqueness proper), LEM-09 (ESS03 spatial continuation).

## History

Literature sweep in cc52d85c session (Mar 29–30) caught the
error; Draft 10 fix.  Supersedes the cc52d85c-era entry
2026-04-22.
