---
id: AK-09
title: Scale-invariant Lyapunov functional (structural open problem)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [INS-02]
cross_citations:
  - label: AK3 Item 9
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 9)
verification:
  method: structural (absence of mixed functional)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, Lyapunov, structural, open-problem, AK3-Item-9, deepest-gap]
---

# AK-09 · Scale-invariant Lyapunov functional

## Approach tried

Find a functional $\Phi(v)$ that is both NS-scale-invariant
(dimension $L^0$) and monotone decreasing under NS flow.

## Obstruction

**No such functional exists.**  $L^2$ energy: monotone,
non-scale-invariant (dimension $L^1$).  $L^{3,\infty}$ norm:
scale-invariant, non-monotone.  No combination known.  **This
is arguably the deepest structural gap in NS theory.**

Liouville theorem (INS-02) serves as the substitute: a
non-Lyapunov, non-local mechanism delivering the same
conclusion (non-existence of bounded scale-invariant stationary
states) without requiring a functional.

## Dependencies in context

Standalone.  Supports INS-02 (Liouville theorem replaces
Lyapunov — the only known mechanism).

## History

Classical (AK1 Item 9), Round 1A.  Live corpus 2026-04-22.
Explicit "deepest gap" commentary in AK3.
