---
id: AK-08
title: Spectral / linearization analysis (DF(0) = 0)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: [INS-14]
supports: []
cross_citations:
  - label: AK3 Item 8
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 8)
verification:
  method: refutation-by-spectral-radius-mismatch
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, spectral, linearization, large-data, AK3-Item-8]
---

# AK-08 · Spectral / linearization analysis

## Approach tried

Show linearization of $v \mapsto B(v, v)$ at $v = 0$ has spectral
radius $< 1$, forcing $v = 0$ as only fixed point.

## Obstruction

$DF(0) = 0$ (bilinear form is homogeneous of degree 2).  Spectral
radius = 0.  IFT confirms $v = 0$ locally isolated, but KNSS
solution lies far outside the isolation ball.  No perturbative
continuation from 0: at first order $0 = 0$; at second order,
$\phi = B(\phi, \phi)$ (same equation).

## Dependencies in context

Standalone.

## History

Classical (AK1 Item 8), Round 1B.  Live corpus 2026-04-22.
