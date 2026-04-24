---
id: AK-15
title: Weighted (Gaussian) energy estimates
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [LEM-07]
cross_citations:
  - label: AK3 Item 15
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 15)
verification:
  method: refutation-by-boundary-flux-growth-with-weight
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Round 3
  machine_verification: n/a
tags: [anti-knowledge, Gaussian-weight, boundary-flux, AK3-Item-15]
---

# AK-15 · Weighted (Gaussian) energy estimates

## Approach tried

Use Gaussian weight $w(x) = \exp(-|x|^2/(4a))$ to make global
energy finite.

## Obstruction

Weighted energy $\int |v|^2 w\, dx$ is finite, but the weighted
identity carries boundary terms $\sim |x|^2/a^2 \cdot w$ that
grow linearly in $T$ for fixed $a$.  For $a \to \infty$, initial
data doesn't improve (fixed-$R$ property).  No $a(T)$ vanishes
all terms simultaneously.

This is **exactly the obstruction overcome by Carleman
weights** (LEM-07): Carleman uses $a(s) \sim |s|$ with
differentiation killing boundary growth.

## History

Classical (AK1 Item 15), Round 3.  Live corpus 2026-04-22.
