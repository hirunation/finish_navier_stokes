---
id: CORR-07
title: Draft 12 audit summary — three issues blocking submission
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [AK-36, CORR-06, CORR-08, CORR-09, LEM-06, LEM-13]
supports: [INS-01, INS-05]
cross_citations:
  - label: DRAFT_12_NOTE
    ref: official/DRAFT_12_NOTE.md
    note: Full audit text.
verification:
  method: DRAFT_12_NOTE audit
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: independent audit team
  machine_verification: n/a
tags: [attribution, Draft-12, audit, submission-block, Issue-1, Issue-2, Issue-3]
---

# CORR-07 · Draft 12 audit summary

## Statement

Three issues in `PROOF_FINAL_DRAFT12.tex` block submission as
currently written:

### Issue 1 (Structural gap) — Part II Step 2 L^{3,∞} inheritance

The L^{3,∞} inheritance claim on the KNSS-rescaled ancient
solution is **unproven**.  See LEM-06 for details.  Specifically:

- Spatial-decay claim $|u(x, t)| \leq C_1/(1 + |x - x_0|)$ for
  $|x - x_0| \geq \sqrt{T^* - t}$ is **not** in Galdi or KNSS;
  Tao 2011 blog (CORR-06) contradicts the uniform-in-$t$ form.
- Constant $C_1$ depending only on $\|u_0\|_{L^2}$ is wrong;
  weighted initial-data hypothesis required.
- Dimensional-balance interior step is heuristic.
- **Phuc 2015 explicitly notes the $L^{3,\infty}$ regularity
  criterion is open** — Draft 12's inheritance argument, if
  correct, would be novel mathematics that resolves Phuc's
  open problem.  It does not present itself that way; hence
  either the argument is incorrect, or Draft 12 is under-
  crediting itself.

**Recommendation:** Either prove LEM-06 rigorously (which
would be a publishable result in its own right), or re-frame
Draft 12 to state the inheritance as a hypothesis to be
discharged separately.

### Issue 2 (Citation correction) — ESS03 RMS vs ARMA

Draft 12's "ESS03 Theorem 1.1 / 1.2" citations refer to the
ARMA 169 paper, but that paper has only one main theorem.  The
intended theorems (spatial continuation, backward uniqueness)
are in ESS03 Russian Math. Surveys 58 (2003) §4.1 and §5.1.
Fix: update citations.  See CORR-05.

### Issue 3 (Lean status outdated) — 9-10 sorries + 6 axioms

Draft 12 README claims "34 theorems proved from CIC foundations,
zero axioms."  Actual Lean state:

- **102 theorem/lemma statements** across Tree A.
- **9–10 open sorries** (Caccioppoli, ODE contradiction,
  Dirichlet integral zero, ancient solution contradiction,
  plus 5–6 infrastructure).
- **6 classical axioms**.

Fix: update the README to accurately describe "34 verified
exponent identities + 68 infrastructure theorems proved modulo
6 classical axioms and 9–10 open obligations, under active
reduction."  Or update the formalization (GUNS Step 5+) to
close outstanding sorries.

## Dependencies in context

Standalone.  Supports INS-01 (Clay target — currently blocked
by Issue 1), INS-05 (Part II composition depends on LEM-06),
LEM-06 (the specific structural-gap entry).

## Citations

- **DRAFT_12_NOTE.md**, full audit text.
- **LEM-06**, **CORR-05**, **CORR-06**.

## History

Audit compiled during session-1 deep distillation 2026-04-22.
Live corpus 2026-04-22.

**Submission status.**  Draft 12 cannot be deposited as
currently written.  Options:
1. Prove LEM-06 (novel result, publishable on its own).
2. Re-frame: Part I (INS-02 Liouville) is standalone-submittable
   as a novel stationary-Liouville theorem in $L^{3,\infty}$ —
   no dependence on the Part II inheritance gap.  Submit Part
   I to a PDE journal; defer the Clay-target claim.
3. Pursue the alternative closure routes (INS-03 / INS-04 /
   INS-10 Ancient Extension) for the full Clay target.
