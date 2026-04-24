---
id: AK-19
title: Helical mode decomposition breaking Jensen barrier
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: [AK-03]
supports: []
cross_citations:
  - label: AK3 Item 19
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 19)
verification:
  method: algebraic-identity closure (Jensen sign structural)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: algebraic, definitively closed
  machine_verification: n/a
tags: [anti-knowledge, helical-decomposition, Jensen-barrier, algebraic, definitively-closed, AK3-Item-19]
---

# AK-19 · Helical mode decomposition breaking Jensen barrier

## Approach tried

Decompose $v = v_+ + v_-$ (positive/negative helicity);
circumvent AK-03 Jensen barrier from time-averaged Caccioppoli.

## Obstruction

(a) Stretching has no definite sign within a single helicity
sector (both $v_\pm$ stretch or compress).  (b) Jensen's
inequality for $x^b$, $b < 1$, is **concavity-algebraic** —
immune to any decomposition.  (c) The GN interpolation exponent
$b < 1$ is structural.  The algebraic identity $\gamma + 3(1-b) =
(4p - 6)/(6 - p) > 0$ holds universally.  **Definitively
closed by algebraic identity.**

## Dependencies in context

Depends on AK-03 (same Jensen barrier at time-averaged
Caccioppoli level; helical decomposition does not bypass).

## History

Classical (AK2 Item 19), Rounds 9-11.  Live corpus 2026-04-22.
