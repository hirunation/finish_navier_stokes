---
id: CORR-06
title: Schwartz property instantly destroyed by NS flow (Tao 2011)
category: CORR
status: attribution-correction
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: []
supports: [CORR-07, LEM-06]
cross_citations:
  - label: Tao 2011 blog
    ref: "Tao, T., 'Bertozzi-Brenner's instantaneous non-analyticity for a smooth Euler / NS solution', What's New blog (2011)"
    note: Classical observation — for NS, Schwartz-class initial data produces a flow for which the Schwartz rapid-decay property is instantly destroyed; only finite-order polynomial decay (roughly |x|^{-4}) survives.
  - label: Brandolese
    ref: "Brandolese, L., Concentration-diffusion effects in viscous incompressible flows, Indiana Univ. Math. J. 58 (2009)"
    note: Spatial-decay / moment-condition literature for NS.
verification:
  method: literature attribution (Tao 2011 / Brandolese; standard in the field)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [attribution, Schwartz, spatial-decay, moment-obstruction, Tao, Brandolese]
---

# CORR-06 · Schwartz property instantly destroyed by NS flow

## Statement

For the 3D Navier–Stokes equations on $\mathbb{R}^3$ with
Schwartz-class initial data $u_0 \in \mathcal{S}(\mathbb{R}^3)$,
**the Schwartz rapid-decay property is instantly destroyed
under NS flow**.  Only finite-order polynomial spatial decay
survives — roughly $|u(x, t)| \leq C(t)/|x|^4$ for $|x|$ large,
by the Bertozzi vorticity-moment obstruction.

This is standard in the analytical NS literature (Tao 2011 blog
and earlier work by Brandolese and others).

## Significance for Draft 12 audit

Relevant for CORR-07 / LEM-06 (the $L^{3,\infty}$ inheritance
gap in Draft 12 Step 2).  Draft 12 claims a pointwise decay
$|u(x, t)| \leq C_1/(1 + |x - x_0|)$ uniform in $t$.  Tao's
observation says at best $|u| \leq C/|x|^4$ for large $|x|$,
**but** the constant depends on $t$ in a way that Draft 12's
claim does not allow.

Constraining $C_1$ to depend only on $\|u_0\|_{L^2}$ and $\nu$
(as Draft 12 wants) requires **weighted initial-data
hypotheses** like $\|(1 + |x|) u_0\|_{L^\infty}$, which is
**strictly stronger than Schwartz after any $t > 0$**.  Draft
12's framing conflates "Schwartz-class forever" with "decays
uniformly forever" — the latter does not follow from the
former.

## Dependencies in context

Standalone.  Supports LEM-06 (which explicitly flags this as
part of the Draft-12 audit analysis) and CORR-07 (the summary
of Draft 12 structural issues).

## Citations

- **Tao 2011 blog** — `https://terrytao.wordpress.com/` article
  on Bertozzi-Brenner NS moment obstruction.
- **Brandolese**, *Indiana Univ. Math. J.* 58 (2009).
- **Bertozzi** — original vorticity-moment destruction paper.

## History

DRAFT_12_NOTE audit 2026-04-22 cited this observation.  Live
corpus 2026-04-22 formalizes as a CORR for the corpus's
attribution hygiene.
