---
id: CORR-05
title: ESS03 citation — Russian Math. Surveys, not ARMA
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: []
supports: [INS-09, LEM-08, LEM-09]
cross_citations:
  - label: ESS03 ARMA
    ref: "Escauriaza, L.; Seregin, G.; Šverák, V., Backward uniqueness for parabolic equations, Arch. Rational Mech. Anal. 169 (2003) 147–157"
    note: Contains the Carleman core; has ONE main theorem (on exterior of ball).  Draft 12's use of "Theorem 1.1 / 1.2" does NOT match this paper.
  - label: ESS03 Russian Math. Surveys
    ref: "Escauriaza, L.; Seregin, G.; Šverák, V., Russian Math. Surveys 58 (2003) 211–250"
    note: Contains Theorem 4.1 (spatial continuation) and Theorem 5.1 (backward uniqueness on half-space).  These are the theorems Draft 12 intends.
verification:
  method: DRAFT_12_NOTE audit + source-reading of both ESS03 papers
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: Draft 12 audit team
  machine_verification: n/a
tags: [attribution, ESS03, citation-correction, ARMA-vs-RMS, DRAFT-12-audit-Issue-2]
---

# CORR-05 · ESS03 citation — Russian Math. Surveys, not ARMA

## Statement

Drafts 9–12 cite **"ESS03, Theorem 1.2"** (backward uniqueness)
and **"ESS03, Theorem 1.1"** (spatial continuation), referring
to the ARMA 169 (2003) paper.  **This citation is wrong** — the
ARMA paper contains only one main theorem (on the exterior of
a ball), not the 1.1 / 1.2 numbering used in Draft 12.

The intended theorems are in the **companion expository paper**:

- **Russian Math. Surveys 58 (2003), Theorem 4.1** — spatial
  continuation.
- **Russian Math. Surveys 58 (2003), Theorem 5.1** — backward
  uniqueness on half-space.

## Draft 12 audit Issue 2

Identified by DRAFT_12_NOTE.md during the 2026-04-22 session-1
audit.  Fix: update all citations in Draft 12 § 3 (Part II,
Step 5) from "ESS03 Thm 1.1/1.2" to "ESS03 RMS 58 §4.1 / §5.1".

## Dependencies in context

Standalone.  Supports INS-09 (three incompatible constraints —
now cites RMS correctly), LEM-08 (ESS03 backward uniqueness),
LEM-09 (ESS03 spatial continuation).

## History

Error propagated across Drafts 9-12.  DRAFT_12_NOTE audit
2026-04-22 caught it.  Live corpus 2026-04-22 records the
correction.

**This is a pure attribution / numbering correction.**  The
mathematical content is unchanged — both papers are by the same
three authors in the same year; only the cited theorem
identifier changes.
