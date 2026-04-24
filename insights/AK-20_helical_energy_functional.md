---
id: AK-20
title: Helical energy functional E_H(ρ)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 20
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 20)
verification:
  method: refutation-by-non-independence
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Rounds 9-11
  machine_verification: n/a
tags: [anti-knowledge, helicity, energy-functional, non-independence, AK3-Item-20]
---

# AK-20 · Helical energy functional $E_H(\rho)$

## Approach tried

Define $E_H(\rho) = \int (v \cdot \omega) \varphi(|x|/\rho)\, dx$;
derive independent ODE with $\beta > 1$.

## Obstruction

$E_H$ bounded by $E(\rho)$ and $D(\rho)$; no independent
inequality.  Helicity dissipation has no definite sign.
Second-derivatives introduce $\rho^{-2}$ scaling penalty.
**Not an independent dynamical variable.**

## History

Classical (AK2 Item 20), Rounds 9-11.  Live corpus 2026-04-22.
