---
id: AK-32
title: E_s(ρ) monotonicity in ρ (spatial ≠ temporal structure)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [THR-01]
cross_citations:
  - label: AK3 Item 32
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 32)
verification:
  method: refutation-by-structural-independence
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, monotonicity, spatial-vs-temporal, structural-independence, AK3-Item-32]
---

# AK-32 · $E_s(\rho)$ monotonicity in $\rho$

## Approach tried

For the ancient solution at each time $s$, hat-function energy
$E_s(\rho)$ is nondecreasing in $\rho$.  Use spatial monotonicity
to derive temporal information.

## Obstruction

Spatial monotonicity $E_s(\rho_1) \leq E_s(\rho_2)$ for
$\rho_1 < \rho_2$ is **geometric**: tells how energy distributes
across scales at fixed time.  Contains **no temporal
information**.  $\partial_s E_s(\rho)$ is unconstrained by
$\partial_\rho E_s$ — evolution depends on NS nonlinearity
(pressure, convection, dissipation) independently of spatial
partitioning.

## Dependencies in context

Supports THR-01 (two-mechanism irreducibility — spatial
structure doesn't bridge to temporal).

## History

Draft 8-11 era (AK3 Item 32).  Live corpus 2026-04-22.
