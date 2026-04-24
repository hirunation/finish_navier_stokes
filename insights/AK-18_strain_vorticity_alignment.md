---
id: AK-18
title: Strain-vorticity alignment (Constantin-Fefferman-Majda)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: []
cross_citations:
  - label: AK3 Item 18
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 18)
  - label: Constantin-Fefferman-Majda 1996
    ref: "Constantin, P.; Fefferman, C.; Majda, A., Geometric constraints on potentially singular solutions for the 3D Euler/NS equations, Comm. PDE 21 (1996) 559–571"
verification:
  method: refutation-by-one-way-direction-of-regularity-criterion
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Rounds 9-11
  machine_verification: n/a
tags: [anti-knowledge, CFM, alignment, regularity-criterion, one-way, AK3-Item-18]
---

# AK-18 · Strain-vorticity alignment (CFM)

## Approach tried

Use the CFM alignment criterion (vorticity aligned with strain
eigenvectors) as a dynamical constraint under $L^{3,\infty}$
bound.

## Obstruction

CFM is a **regularity criterion** (sufficient condition for
non-blowup), not a dynamical constraint.  The alignment angle
$\xi = \omega/|\omega|$ has no monotonicity; bounding $\nabla\xi$
requires controlling a highly nonlinear quantity from only
integral bounds (unavailable).  CFM is **one-way**; cannot be
inverted as a constraint on the flow.

## History

Classical (AK2 Item 18), Rounds 9-11.  Live corpus 2026-04-22.
