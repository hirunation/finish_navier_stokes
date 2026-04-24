---
id: CORR-08
title: KNSS §3 "Proposition 3.1" is a phantom citation (does not exist)
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: []
supports: [CORR-07, LEM-06]
cross_citations:
  - label: KNSS 2009
    ref: "arXiv:0709.3599 — table of contents verified section-by-section"
    note: KNSS §3 contains only Lemma 3.1.  KNSS §4 contains Proposition 4.1.  **No Proposition 3.1 exists anywhere in the paper.**
  - label: Tree A KNSS.lean line 66
    ref: "companion Lean formalization, NSProof/Infrastructure/KNSS.lean line 66"
    note: Still references the non-existent KNSS Proposition 3.1 as of 2026-04-22.
verification:
  method: literature fact — KNSS arXiv:0709.3599 extracted verbatim and checked
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, KNSS, phantom-citation, Draft-11, Draft-12, literature-error]
---

# CORR-08 · KNSS §3 "Proposition 3.1" is a phantom

## Statement

`PROOF_FINAL_DRAFT11.tex` and earlier drafts attribute the
spatial-decay claim $|u(x, t)| \leq C_1/(1 + |x - x_0|)$ (for
Step 2 of Part II) to **"KNSS Section 3, proof of Proposition
3.1"**.

**This citation is wrong — KNSS §3 has no Proposition 3.1.**

## Verification (KNSS arXiv:0709.3599 section-by-section)

- **§3** "Preliminary results and notation" contains **Lemma 3.1**
  (decomposition of bounded weak into mild solution + heat
  extension + $b(t)$).  Nothing else numbered.
- **§4** "Liouville theorems for parabolic equations" contains
  **Proposition 4.1** (higher-derivative smoothing for mild
  solutions: $\|t^{k/2 + l} \nabla^k_x \partial^l_t u\|_{L^\infty}
  \leq C(k, l) \|u_0\|_{L^\infty}$).
- **§5** contains Theorems 5.1, 5.2, 5.3 (axi-symmetric
  Liouville).
- **§6** contains Proposition 6.1 + Theorems 6.1, 6.2.

**No Proposition 3.1.**  The closest matches are Lemma 3.1
(different content) and Proposition 4.1 (different section).

## Residue in the Lean tree

Tree A `NSProof/Infrastructure/KNSS.lean` line 66 still contains
a comment referencing "KNSS Section 3, Proposition 3.1" as of
2026-04-22.  This is a leftover from Draft 11.

## Significance

**Narrow implication.**  The phantom citation is a LaTeX-level
error.  Fix: replace with the correct source.

**Broader implication.**  The spatial-decay claim **has no
source** — not KNSS §3 Proposition 3.1 (phantom), not Galdi
15.3.1 (local existence, not decay), not KNSS §6 (postulates
decay as hypothesis).  See LEM-06 for the full assessment.
Fixing this citation reveals that the claim needs an **original
proof**, not a literature import.

## Dependencies in context

Standalone.  Supports CORR-07 (Draft 12 audit; Issue 1) and
LEM-06 (the underlying open gap).

## History

Error first introduced in Draft 9 or earlier; present in
Drafts 11, 12.  Caught during 2026-04-22 session-1 deep read
of KNSS by subagent.

Fix: in any future submission, either remove the phantom
citation or replace with the actual source — which, in the case
of the spatial-decay claim, **does not exist** and the claim
must be justified independently (see LEM-06, INS-21).
