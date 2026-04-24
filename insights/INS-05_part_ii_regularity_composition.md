---
id: INS-05
title: Part II composition — KNSS + Liouville + backward uniqueness
category: INS
status: speculative
confidence: 0.75
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [AK-01, AK-22, AK-29, AK-30, AX-02, AX-03, AX-04, CORR-07, DEF-01, INS-02, INS-09, INS-21, LEM-06, LEM-08, LEM-09]
supports: [INS-01, INS-12, THR-01]
supersedes: [cc52d85c-era/INS-09]
cross_citations:
  - label: Draft 12 §3
    ref: official/PROOF_FINAL_DRAFT12.tex, lines 868-1161
  - label: DRAFT_12_NOTE audit Issue 1
    ref: official/DRAFT_12_NOTE.md
    note: Structural gap in Step 2 — the L^{3,∞} inheritance argument is unproven and overlaps Phuc 2015's open L^{3,∞} regularity criterion.  CORR-07.
  - label: Tree A main theorem
    ref: lean_formalization/NSProof/PartII/Regularity.lean mainTheorem (sorry modulo axioms + ancient_solution_contradiction)
verification:
  method: informal council verification (partial); the L^{3,∞} inheritance substep is UNPROVEN
  rounds: 3
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ClassicalPath.Inherit.mainTheorem_tree_a
tags: [Part-II, regularity, KNSS, ancient-solution, ESS03, backward-uniqueness, composition]
---

# INS-05 · Part II composition — KNSS + Liouville + backward uniqueness

## Statement

**Theorem (Main Regularity).**  Let $u_0 \in \mathcal{S}(\mathbb{R}^3)$
be divergence-free Schwartz data.  If the maximal smooth solution
$u$ (existing on $[0, T^*)$ by AX-02) has $T^* < \infty$, then a
contradiction arises from the Part I Liouville theorem (INS-02)
applied to the KNSS-extracted ancient solution.  Therefore
$T^* = \infty$.

## Proof composition (5 steps, Draft 12 §3)

1. **Type I excluded** (Step 1, AX-03).  Any finite-time
   singularity must be Type II.
2. **KNSS extraction** (Step 2, AX-04 + LEM-06).  The rescaled
   sequence $v_n(y, s) = \lambda_n u(x_n + \lambda_n y, t_n +
   \lambda_n^2 s)$ converges in $C^m_{\mathrm{loc}}$ to a bounded
   smooth ancient solution $v$ with $|v(0, 0)| = 1$.
   **[Step 2b: $L^{3,\infty}$ inheritance — currently unproven;
   see CORR-07.]**
3. **Backward limit is stationary $L^{3,∞}$** (Step 3).
   Arzelà-Ascoli + diagonal subsequence extracts
   $v(\cdot, s_n) \to v_\infty$ in $C^m_{\mathrm{loc}}$; equicontinuity
   of $\partial_s v$ forces $v_\infty$ stationary; Fatou preserves
   $L^{3,\infty}$.
4. **Liouville kills $v_\infty$** (Step 4, INS-02).  $v_\infty$
   satisfies the hypotheses of Part I, hence $v_\infty = 0$.
   Applies to every subsequential backward limit; full
   convergence $v(\cdot, s) \to 0$ in $C^m_{\mathrm{loc}}$ as
   $s \to -\infty$.
5. **Backward uniqueness + spatial continuation → contradiction**
   (Step 5, INS-09).  If $\omega(\cdot, 0) = 0$, harmonic-function
   argument forces $v(\cdot, 0) = 0$, contradicting $|v(0, 0)| = 1$;
   so $\omega(\cdot, 0) \neq 0$.  ESS03 backward uniqueness
   (LEM-08) forces $\omega(\cdot, s) \neq 0$ for all $s \leq 0$.
   ESS03 spatial continuation (LEM-09) prevents the bounded
   vorticity from "retreating to infinity" while vanishing
   locally.  Three incompatible constraints (INS-09) ⇒ $v \equiv 0$,
   contradicting $|v(0, 0)| = 1$.

## Status notes

**Speculative.**  The composition architecture is sound in every
step except Step 2b (the $L^{3,\infty}$ inheritance of the ancient
solution under KNSS rescaling).  The DRAFT_12_NOTE audit
(CORR-07) identifies this as a structural gap overlapping Phuc
2015's open L^{3,∞} regularity criterion.

Tree A has `mainTheorem_tree_a` proved modulo AX-02, AX-03,
AX-04 + one sorried obligation (`ancientSolution_contradiction`
at `NSProof/Infrastructure/KNSS.lean:107`).  GUNS catalogues.

## Dependencies in context

Depends on INS-02 (Part I Liouville), INS-09 (three-incompatible-
constraints at Step 5), AX-02 (local existence), AX-03 (Type I
excluded), AX-04 (KNSS extraction), LEM-06 ($L^{3,\infty}$
inheritance — flagged as unproven), LEM-08 (ESS03 backward
uniqueness), LEM-09 (ESS03 spatial continuation).

Supports INS-01 (Clay target).

**Supersedes** cc52d85c-era INS-09 (three-incompatible-
constraints), which captured the geometric content of Step 5 but
did not flag the Step 2b gap.

## Citations

- **Nahiru 2026**, Draft 12 §3 (audit state).
- **KNSS 2009**, *Acta Math.* 203, §6 (extraction, AX-04).
- **ESS 2003**, *Russian Math. Surveys* 58, §§4.1, 5.1 (backward
  uniqueness + spatial continuation — cf. CORR-05 for citation
  correction).
- **Phuc 2015** (paper on $L^{3,q}$ regularity for $q < \infty$;
  explicitly notes $q = \infty$ case is open — this is the
  open problem INS-05's Step 2b would solve if completed).

## History

Informal structure stable across Drafts 1–12.  Step 2b
$L^{3,\infty}$-inheritance gap identified during session
`298d0965` (Apr 9–12) audit rounds.  DRAFT_12_NOTE.md formalized
2026-04-22.  Live corpus 2026-04-22.
