---
id: AK-10
title: Pressure-sign constraints (strain vs vorticity indeterminate)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [LEM-02]
cross_citations:
  - label: AK3 Item 10
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 10)
verification:
  method: refutation-by-mixed-sign-structure
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [anti-knowledge, pressure, Poisson, strain-vorticity, indeterminate-sign, AK3-Item-10]
---

# AK-10 · Pressure-sign constraints

## Approach tried

Use the structure $-\Delta p = |S|^2 - \tfrac{1}{2}|\omega|^2$
(strain vs vorticity) to constrain pressure.

## Obstruction

$|S|^2 - \tfrac{1}{2}|\omega|^2$ has **no definite sign** in
general 3D flows.  Strain-dominated regions: $p$ superharmonic;
vorticity-dominated: subharmonic.  $L^{3,\infty}$ bound does not
constrain the ratio $|S|^2/|\omega|^2$.  Pressure sign varies
pointwise.

The proof (Liouville, INS-02) correctly **eliminates pressure
entirely via Bogovskii** (LEM-02) rather than try to constrain
it.

## Dependencies in context

Standalone.  Supports LEM-02 (pressure elimination is the
correct response).

## History

Classical (AK1 Item 10), Round 1A.  Live corpus 2026-04-22.
