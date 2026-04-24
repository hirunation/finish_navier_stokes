---
id: AK-34
title: Parabolic frequency function monotonicity (Almgren-Poon)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 34
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 34)
  - label: FREQUENCY_ANALYSIS.txt
    ref: "session 298d0965 artifacts"
verification:
  method: refutation-by-nonlinear-sign-variation
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, frequency-function, Almgren, Poon, nonlinear, indefinite-sign, AK3-Item-34]
---

# AK-34 · Parabolic frequency function monotonicity

## Approach tried

Define Almgren-Poon-type frequency $N_s(\rho) = \rho^2 E_s(\rho)/
F_s(\rho)$ where $F_s(\rho) = \int |v|^2 \varphi(|x|/\rho)\, dx$.
Show monotonicity in $\rho$ or $s$ ⟹ quantitative decay.

## Obstruction

Almgren monotonicity requires **harmonicity**; Poon requires
**linear parabolic equation**.  NS nonlinear $(v \cdot \nabla)v$
introduces trilinear stretching in $dN$ with oscillating sign.
Doubling index bounded at each time but temporal monotonicity
fails.  Superlinear ODE of Part I (INS-02) requires
$\partial_s = 0$ exactly (stationary); parabolic frequency
function inherits temporal evolution that destroys the
monotonicity.

## History

Draft 8-11 era (AK3 Item 34).  Live corpus 2026-04-22.
