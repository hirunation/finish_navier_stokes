---
id: AK-14
title: Forward parabolic propagation (Gronwall)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [AK-31, LEM-08]
cross_citations:
  - label: AK3 Item 14
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 14)
verification:
  method: refutation-by-local-vs-global-norm
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Round 3
  machine_verification: n/a
tags: [anti-knowledge, Gronwall, forward-parabolic, local-vs-global, AK3-Item-14]
---

# AK-14 · Forward parabolic propagation (Gronwall)

## Approach tried

Use $\|\omega(\cdot, s_2)\|_{L^\infty} \leq e^{c(s_2 - s_1)}
\|\omega(\cdot, s_1)\|_{L^\infty}$ to propagate decay from
$s_1 \to -\infty$ to $s_2 = 0$.

## Obstruction

**Global** $\|\omega\|_{L^\infty(\mathbb{R}^3)} \leq C$ uniformly
bounded (not decaying).  Only **local** $\|\omega\|_{L^\infty(B_R)}
\to 0$ for fixed $R$.  Gronwall on the global norm: $C \cdot e^{cT}
\to \infty$.  Local $L^\infty$ decay ≠ global $L^\infty$ decay;
vorticity escapes to infinity while bounded on compact regions.

## Dependencies in context

Supports LEM-08 (forward Gronwall cannot reverse; backward
uniqueness is the correct tool) and AK-31 (Morrey-propagation
version of the same obstruction).

## History

Classical (AK1 Item 14), Round 3.  Live corpus 2026-04-22.
