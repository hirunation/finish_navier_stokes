---
id: AK-23
title: Rescaled Stokes Liouville on parabolic front
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [THR-01]
cross_citations:
  - label: AK3 Item 23
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 23)
verification:
  method: refutation-by-Reynolds-number-growth
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Round 12
  machine_verification: n/a
tags: [anti-knowledge, Stokes-Liouville, parabolic-front, Reynolds, Type-II, AK3-Item-23]
---

# AK-23 · Rescaled Stokes Liouville on parabolic front

## Approach tried

Parabolically rescale $w_s(y) = \sqrt{|s|} v(\sqrt{\nu|s|} y, s)$;
apply Stokes (biharmonic) Liouville in $L^{3,\infty}$.

## Obstruction

Rescaled Reynolds $\sqrt{|s|/\nu} \to \infty$ as $s \to -\infty$
— front is **high-Reynolds**, not Stokes-dominated.  Self-
similar rescaling amplifies $\|w\|_{L^\infty} = \sqrt{|s|}
C_0 \to \infty$ (Type II).  Stokes approximation invalid.

## Dependencies in context

Supports THR-01 (two-mechanism irreducibility).

## History

Draft 8-11 era (AK3 Item 23), Round 12.  Live corpus 2026-04-22.
