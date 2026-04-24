---
id: AK-02
title: Local energy inequality (parabolic transmission from infinity)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [LEM-07, LEM-08]
cross_citations:
  - label: AK3 Item 2
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 2)
verification:
  method: refutation-by-boundary-flux-growth
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: n/a
tags: [anti-knowledge, local-energy, boundary-flux, parabolic, AK3-Item-2]
---

# AK-02 · Local energy inequality

## Approach tried

Apply the NS energy identity on $B_R \times [-T, 0]$ to bound
$\|v(\cdot, 0)\|_{L^2(B_R)}$ in terms of initial data
$\|v(\cdot, -T)\|_{L^2(B_R)}$ (→ 0 by $C^m_{\mathrm{loc}}$) and
boundary flux (~ $T/R^{1/2}$ by $L^{3,\infty}$).

## Obstruction

Parabolic equations transmit information from spatial infinity
in zero time.  Boundary flux over $T$ is $O(T/R^{1/2})$; for
fixed $R$, initial data $\to 0$ but flux $\to \infty$; for
$R \sim \sqrt T$, initial data doesn't improve (fixed-$R$
property).  No $R(T)$ balances.

## Dependencies in context

Standalone.  Supports LEM-07 / LEM-08 (Carleman exponential
weights needed; polynomial weights insufficient).

## History

Classical (AK1 Item 2).  Live corpus 2026-04-22.
