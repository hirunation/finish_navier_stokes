---
id: AK-05
title: Self-similar variables / scaling trap
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [AX-03]
cross_citations:
  - label: AK3 Item 5
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 5)
verification:
  method: spectral-eigenvalue-mismatch
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, self-similar, scaling, Type-II, unstable-eigenvalue, AK3-Item-5]
---

# AK-05 · Self-similar variables

## Approach tried

Rescale to $w(\xi, \tau) = |s|^{1/2} v(|s|^{1/2} \xi, s)$; show
$w \to 0$, implying Duhamel vanishes.

## Obstruction

The KNSS ancient solution is **Type II, not Type I**.  Self-
similar variables amplify Type II: $\|w\|_{L^\infty}$ grows as
$e^{\tau/2} \to \infty$.  Linearization around $w = 0$ has
eigenvalue $+1/2 > 0$ (unstable).  Only $\|w\|_{L^{3,\infty}} =
M$ preserved (time-uniform scale-invariant norm).  No
compactness for $w$.

## Dependencies in context

Standalone.  Supports AX-03 (Type I exclusion separates the
valid self-similar regime from the Type II ancient-solution
regime).

## History

Classical (AK1 Item 5), Round 2 spectral analysis.  Live corpus
2026-04-22.
