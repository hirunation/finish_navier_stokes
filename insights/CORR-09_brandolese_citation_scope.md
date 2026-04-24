---
id: CORR-09
title: Brandolese citation in KNSS §6 / Draft 12 applies only to symmetric + weighted data
category: CORR
status: attribution-correction
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [LEM-16]
supports: [CORR-07, LEM-06]
cross_citations:
  - label: Brandolese 2004
    ref: "Math. Ann. 329, 685-706 — KNSS §6 ref [2]"
    note: Spatial decay for rotation-invariant NS flows.  Requires symmetry.
  - label: Brandolese thesis 2001
    ref: "Thèse de doctorat, ENS Cachan — KNSS §6 ref [1]"
    note: Spatial decay for fast-decaying / compactly-supported data.
  - label: KNSS 2009 §6
    ref: arXiv:0709.3599, p. 21
    note: "KNSS cite Brandolese [1, 2] for the fact that (6.6) is satisfied when u_0 decays sufficiently fast at infinity (e.g. compactly supported)."
verification:
  method: literature sweep — Brandolese papers surveyed by subagent
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, Brandolese, KNSS, scope-error, symmetric, fast-decaying, Schwartz]
---

# CORR-09 · Brandolese citation scope

## Statement

Draft 12 (implicitly, via the KNSS §6 chain) attributes the
spatial decay $|u(x, t)| \leq C_1/(1 + |x - x_0|)$ for smooth
NS solutions with Schwartz initial data to **Brandolese's work
as cited in KNSS §6 refs [1], [2]**.

**This is wrong in scope.**  Brandolese's papers establish
spatial decay under **stronger hypotheses** than Schwartz
initial data with $L^2$ control:

- **Brandolese thesis 2001** (KNSS ref [1]): requires
  **compactly-supported** initial data or equivalently
  fast-decaying data.
- **Brandolese 2004** (KNSS ref [2]): requires **rotation-
  invariant** (discrete $O(d)$-subgroup symmetric) initial data.

**Neither applies to general Schwartz $u_0 \in \mathcal{S}(\mathbb{R}^3)$**.
Generic Schwartz data does NOT produce the decay Brandolese
proves.

## What KNSS §6 actually cites

On p. 21 (between eq. (6.6) and Proof of Thm 6.2), KNSS write:

> "The fact that (6.6) is satisfied when $u_0$ decays sufficiently
> fast at $\infty$ (e.g. when it is compactly supported) follows
> for example from [1, 2]."

KNSS **know** the scope is restricted.  They cite Brandolese as
a **sufficient condition** supply, not as a universal decay
theorem.  Their (6.6) is itself a hypothesis in Theorem 6.2, not
derived.

## What Draft 12 needs

Draft 12 works with **Schwartz divergence-free $u_0$**.  Schwartz
data is:
- Smooth (✓)
- Rapidly decaying ($o(|x|^{-N})$ for every $N$)  (✓)
- Divergence-free (✓)
- Finite $L^2$ norm (✓)
- **Not symmetric in general**  (✗ for Brandolese 2004)
- **Not compactly supported in general**  (✗ for Brandolese 2001
  — though rapid decay is a close substitute)

The relevant Brandolese result for Draft 12 is **Brandolese-Meyer
2002** (LEM-16) — but that only gives $|u| \lesssim |x|^{-4}$
under weighted moment conditions, not the $|x|^{-1}$ uniform
bound Draft 12 claims.  And Brandolese-Meyer's constant depends
on the WEIGHTED norm, not $\|u_0\|_{L^2}$ alone.

## Fix for Draft 12 (and any future draft)

Replace "spatial decay follows from [Brandolese]" with one of:

(a) **If Route A** (strengthen hypothesis): "For axisymmetric
Schwartz initial data, the spatial decay $|u| \leq C/(1 + r)$
(where $r = \sqrt{x_1^2 + x_2^2}$) follows from [Brandolese 2004]."

(b) **If Route E** (submit Part I only): omit the claim
entirely.  Part I doesn't need it.

(c) **Under the INS-21 weighted-moment rescue**: "We assume
$(1+|x|) u_0 \in L^\infty$ in addition to $u_0 \in \mathcal{S}$;
under this weighted hypothesis, the decay $|u| \leq C(\|u_0\|_{L^2}
+ \|(1+|x|) u_0\|_{L^\infty}, \nu)/(1 + |x - x_0|)$ follows from
mild-solution theory [Kato 1984] + Brandolese-Meyer propagation
[B-M 2002] + a Gronwall-type estimate up to $T^*$."  The last
component (Gronwall up to $T^*$) is the novel result that would
need to be proven.

## Dependencies in context

Depends on LEM-16 (Brandolese-Meyer's precise scope).

Supports CORR-07 (audit summary), LEM-06 (the underlying open
gap).

## History

Scope error caught during 2026-04-22 session-1 deep read of
Brandolese's papers + KNSS §6 via subagents.
