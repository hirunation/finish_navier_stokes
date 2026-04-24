---
id: AK-03
title: Time-averaged Caccioppoli iteration
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [AK-19, INS-02]
cross_citations:
  - label: AK3 Item 3
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 3)
verification:
  method: refutation-by-Jensen-inequality-sign
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: algebraic (all $p \in (3/2, 3)$)
  machine_verification: n/a
tags: [anti-knowledge, time-average, Jensen, Caccioppoli, AK3-Item-3]
---

# AK-03 · Time-averaged Caccioppoli iteration

## Approach tried

Average the hat-function energy $E_s(\rho)$ over $[-T, 0]$; apply
Liouville iteration to the time-averaged quantity.

## Obstruction (algebraic)

Jensen's inequality for the sublinear term $D^b$ ($b < 1$) has
**wrong sign**: $T^{-1} \int D_s^b \geq \bar D^b$, not $\leq$.
Corrected: $T^{-1} \int D_s^b \leq (\max D_s)^{1 - b} \bar D^b$,
introducing $\rho$-exponent $\gamma + 3(1 - b) = (4p - 6)/(6 - p)$,
**positive for all $p \in (3/2, 3)$**.  Time-averaging always
worsens the $\rho$-decay.  At $p = 2$: $\gamma = -1/4$, $b = 3/4$,
sum = $+1/2 > 0$.

## Dependencies in context

Standalone.  Supports INS-02 (time-averaged methods fail;
stationary Liouville required).

## History

Classical dead-end (AK1 Item 3), verified algebraically Rounds
3–11.  Live corpus 2026-04-22.
