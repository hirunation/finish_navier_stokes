---
id: LEM-06
title: L^{3,∞} inheritance — ancient solution from KNSS rescaling [OPEN GAP]
category: LEM
status: conjectured
confidence: 0.50
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [AK-36, AX-04, CORR-04, CORR-06, CORR-08, CORR-09, LEM-13, LEM-14, LEM-15, LEM-16]
supports: [CORR-07, INS-05, INS-21]
cross_citations:
  - label: Draft 12 §3 Step 2
    ref: official/PROOF_FINAL_DRAFT12.tex lines 909–976
  - label: DRAFT_12_NOTE audit Issue 1
    ref: official/DRAFT_12_NOTE.md
  - label: Phuc 2015
    ref: "Phuc, N. C., J. Math. Fluid Mech. 17 (2015) 741–760"
    note: Open problem at q = ∞ — see LEM-13 for framing.
  - label: Ożański-Palasek 2022
    ref: "arXiv:2210.10030, Annals of PDE (2023)"
    note: Axisymmetric closure — see LEM-14.
  - label: Seregin 2019
    ref: arXiv:1906.06707
    note: Partial regularity (finite singular points) — see LEM-15.
  - label: Brandolese-Meyer 2002
    ref: "ESAIM COCV 8, 273-285"
    note: Spatial-decay framework — see LEM-16 and AK-36.
verification:
  method: literature-deep-read (3 parallel Explore subagents) + DRAFT_12_NOTE audit
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a — claim overlaps Phuc 2015's open problem
  machine_verification: pending (Tree A Infrastructure/KNSS.lean: lw_inheritance placeholder + phantom §3 Prop 3.1 citation, see CORR-08)
tags: [OPEN-GAP, L3inf, KNSS-rescaling, ancient-solution, Phuc-2015-open, DRAFT-12-audit-Issue-1, critical-submission-blocker]
---

# LEM-06 · L^{3,∞} inheritance [OPEN GAP]

## Statement (as claimed in Draft 12)

Let $u$ be the smooth NS solution on $[0, T^*)$ with Type II
blow-up at $T^*$, rescaled by KNSS (AX-04) via

$$v_n(y, s) = \lambda_n\, u(x_n + \lambda_n y, t_n + \lambda_n^2 s).$$

**Claim (Draft 12 §3 Step 2, eq. 938–976):** The ancient-solution
limit $v$ inherits a uniform $L^{3,\infty}$ bound:

$$\|v(\cdot, s)\|_{L^{3,\infty}(\mathbb{R}^3)} \leq M \quad \text{for all } s \leq 0,$$

where $M$ depends only on $\|u_0\|_{L^2}$ and $\nu$.

## Why this is the one step blocking Clay-target submission

The chain INS-01 (Clay target) → INS-05 (Part II composition) →
LEM-06 is load-bearing.  If LEM-06 is not established, the
composition Step 2 fails, the stationary limit $v_\infty$ may
not be in $L^{3,\infty}$, and Part I's Liouville theorem (INS-02)
cannot be invoked to kill $v_\infty$.

The other 5 steps of Part II (AX-03 Type I exclusion, Step 3
stationary-limit extraction via Arzelà-Ascoli, Step 4 Liouville
application to $v_\infty$, Step 5 three-incompatible-constraints
via LEM-08 + LEM-09) are each rigorous; the composition is
sound conditional on Step 2b = LEM-06.

## Draft 12's argument (sub-steps)

1. **Scale invariance of L^{3,∞} norm** under rescaling — ✓
   algebraic, correct.
2. **Spatial decay claim**: $|u(x, t)| \leq C_1/(1 + |x - x_0|)$
   for $|x - x_0| \geq \sqrt{T^* - t}$, with $C_1$ depending only
   on $\|u_0\|_{L^2}$ and $\nu$ — ✗ **UNPROVEN and provably
   impossible** as stated (AK-36).
3. **Interior scaling**: rescaled velocity $\sim \nu/|y|$ by
   dimensional balance — ✗ heuristic, not a theorem.
4. **Distribution-function uniform bound**: relies on 2, 3.
5. **Fatou limit**: ✓ algebraic, correct given 2-4.

## Three independent reasons the claim as stated fails

### (a) L^2-only constant is provably impossible — AK-36

Translation-invariance of $\|\cdot\|_{L^2}$ + explicit
Brandolese-Meyer counterexample show no $C_1$ depending only on
$\|u_0\|_{L^2}$ can bound $|u(x, t)|$ pointwise.  Constant must
depend on a weighted norm like $\|(1+|x|) u_0\|_{L^\infty}$.

### (b) Literature citations don't support the claim — CORR-08, CORR-09

- **CORR-08**: Draft 12's "KNSS §3 Proposition 3.1" is a phantom
  — no such proposition exists in KNSS 2009.
- **CORR-09**: Brandolese 2004 and Brandolese's thesis (the
  references KNSS §6 uses for spatial decay) apply only under
  symmetric / compactly-supported data, not general Schwartz.
- Galdi 15.3.1 is about local existence, not pointwise decay.

### (c) The L^{3,∞} regularity criterion is genuinely open — LEM-13

Phuc 2015 closes $L^\infty_t L^{3,q}_x$ for $q < \infty$ but
**explicitly notes** the $q = \infty$ case is open.  The
non-absolute-continuity of $\|\cdot\|_{L^{3,\infty}}$ breaks
Phuc's exterior-tail-vanishing argument.

Partial known closures:
- **Axisymmetric** (Ożański-Palasek 2022, LEM-14) via
  Nazarov-Ural'tseva Harnack on $r v_\theta$.  Doesn't generalize
  to non-axisymmetric.
- **Smallness** (Luo-Tsai 2015, Kim-Kozono 2004).
- **Partial regularity — finite singular points** (Seregin 2019,
  LEM-15).  Not full regularity.
- **Log-improvement** (Phuc 2015 Theorem 1.5 extension).

General-3D $L^{3,\infty}$ endpoint is open.  Draft 12's Step 2,
if rigorously correct, would close Phuc's open problem — making
it novel mathematics in its own right.

## Rescue paths enumerated

See **`desk/03_lem_06_attack.md`** for the full analysis.  Five
routes:

- **Route A** — strengthen hypothesis to axisymmetric / weighted
  (loses generality; gains closure via Brandolese + Ożański-
  Palasek).
- **Route B** — log-improvement rescue (speculative; Phuc 2015
  Thm 1.5 extends under log-refined pointwise bound).
- **Route C** — Nazarov-Ural'tseva Harnack on a non-axisymmetric
  scalar (research program, years).
- **Route D** — excise the $|x|^{-1}$ profile via Part I (this
  IS Draft 12's strategy, conditional on LEM-06 closing).
- **Route E** — submit Part I standalone, defer Clay target
  (recommended; 1-2 weeks polish + review cycle).

**INS-21 (weighted-moment rescue)** articulates a specific
concrete proposal: prove the inheritance under the weighted
hypothesis $(1+|x|) u_0 \in L^\infty$ (automatic for Schwartz
data).  The crux is whether the weighted $L^\infty$ norm
propagates globally up to $T^*$ via a Gronwall-type argument
on the weighted quantity $w = (1+|x|) u$.  If true, closes the
chain under a hypothesis strictly weaker than Brandolese's
symmetry restriction.

## Status

**Conjectured — DRAFT_12_NOTE Issue 1 / the critical submission
blocker.**

Confidence 0.50 = "literature review complete, rescue paths
identified, but no proof yet."  Consistent with Phuc's open
status.  Upgrade to higher confidence only after Step 2 of
INS-21's proof strategy (global weighted $L^\infty$ propagation
up to $T^*$) is rigorously established.

## Dependencies in context

Depends on:
- AX-04 (KNSS extraction supplies the ancient solution)
- CORR-04 (L^{3,∞} framing is Draft-originated, not inherited)
- CORR-06 (Tao 2011 Schwartz destruction)
- CORR-08 (phantom KNSS Proposition 3.1 citation)
- CORR-09 (Brandolese citation scope)
- LEM-13 (Phuc 2015 open-problem framing)
- LEM-14 (Ożański-Palasek axisymmetric closure)
- LEM-15 (Seregin 2019 partial regularity)
- LEM-16 (Brandolese-Meyer decay theorem)
- AK-36 (L^2-only constant impossibility)

Supports:
- CORR-07 (Draft 12 audit summary — Issue 1)
- INS-05 (Part II composition — blocked by this gap)
- INS-21 (proposed rescue path via weighted moment)

## Citations

All primary references are in the dependency entries.  See
`desk/03_lem_06_attack.md` §3 for the consolidated literature
table.

## History

Claim present across Drafts 1–12.  Audit DRAFT_12_NOTE.md
produced 2026-04-22 during session-1 deep distillation.  Deep
literature review + attack strategy completed 2026-04-22 via
parallel Explore subagents.  Live corpus 2026-04-22.

**This is the single most important entry in the live corpus.**
It names the one mathematical step blocking submission, and
INS-21 / Route E in `desk/03_lem_06_attack.md` provide concrete
paths forward.
