---
id: AK-07
title: Time-weighted fixed-point contraction
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: [INS-13]
supports: []
cross_citations:
  - label: AK3 Item 7
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 7)
verification:
  method: refutation-by-scale-invariance
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, time-weight, scale-invariance, contraction, AK3-Item-7]
---

# AK-07 · Time-weighted fixed-point contraction

## Approach tried

Define $w(x, s) = |s|^\alpha v(x, s)$; show the weighted bilinear
operator becomes a contraction.

## Obstruction

$L^{3,\infty}$ norm is **time-uniform**: $\|v(\cdot, s)\|_{L^{3,\infty}}
\leq M$ for all $s$.  Multiplying by $|s|^\alpha$ amplifies the
past: $\|w(\cdot, s)\|_{L^{3,\infty}} = |s|^\alpha M \to \infty$ as
$s \to -\infty$.  Weighted operator unbounded; no contraction.

## Dependencies in context

Standalone.

## History

Classical (AK1 Item 7), Round 1B.  Live corpus 2026-04-22.
