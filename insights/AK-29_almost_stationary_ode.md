---
id: AK-29
title: Almost-stationary ODE (time-dependent Caccioppoli attempt)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [INS-05, LEM-08, THR-01]
cross_citations:
  - label: AK3 Item 29
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 29)
  - label: INVESTIGATION_TIME_DEPENDENT_GEOMETRY.txt
    ref: "session 298d0965 artifacts"
verification:
  method: refutation-by-correction-O(1)-at-front
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, almost-stationary, time-dependent, two-mechanism, irreducibility, AK3-Item-29, Drafts-8-11]
---

# AK-29 · Almost-stationary ODE (time-dependent Caccioppoli)

## Approach tried

At each time $s$, treat $v(\cdot, s)$ as "almost stationary"
($\partial_s v \to 0$ in $C^m_{\mathrm{loc}}$ as $s \to -\infty$).
Apply hat-function Caccioppoli at scale $\rho$ with time-derivative
correction $\eta(s, \rho) = \|\partial_s v\|_{C^0(B_\rho)}$:

$$E_s(\rho) \leq \varepsilon_0 D_s + C_1 M^2/\rho + C_2 M^a \rho^\gamma D_s^b + C M \eta(s, \rho) \rho^2.$$

For fixed $\rho$ and $s \to -\infty$, $\eta(s, \rho) \to 0$.  Run
ODE at each $s$; send $\rho \to \infty$.

## Obstruction

Correction $\eta(s, \rho) \cdot \rho^2$ is $O(1)$ at the
retreating front $\rho \sim \sqrt{|s|}$:

- Retreating vorticity localizes at $\rho \sim \sqrt{\nu |s|}$.
- $\partial_s v$ NOT small at the front (solution transitioning
  from "almost zero" to "present").
- Threshold $E_s(\rho) \sim C_1 M^2/\rho$ is $O(1/\sqrt{|s|})$;
  correction $\eta \cdot |s|$ is $O(|s|)$.  Ratio
  $\sqrt{|s|} \to \infty$.  Correction dominates, destroys ODE.

## Dependencies in context

Supports INS-05 (Part II composition needs ESS03, not a
time-dependent Caccioppoli), LEM-08 (backward uniqueness is
the correct tool), THR-01 (two-mechanism structure).

## History

Draft 8-11 era (AK3 Item 29), session `298d0965`.  Live corpus
2026-04-22.

One of **five routes** (AK-29..33) all failing to replace ESS03,
**proving the two-mechanism structure is mathematically
irreducible**.
