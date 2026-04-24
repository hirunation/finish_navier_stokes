---
id: AK-31
title: Morrey propagation backward (Gronwall exponential reversal attempt)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: [AK-14]
supports: [LEM-07, THR-01]
cross_citations:
  - label: AK3 Item 31
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 31)
verification:
  method: refutation-by-exponential-amplification
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, Morrey, backward-propagation, Gronwall-exponential, Carleman-needed, AK3-Item-31]
---

# AK-31 · Morrey propagation backward

## Approach tried

Liouville gives $v_\infty = 0$; parabolic regularity + almost-
stationary behavior ⟹ propagate Morrey-type bound (small local
energy) backward in time to reach $\varepsilon$-regularity at
$s = 0$, contradicting $|v(0, 0)| = 1$.

## Obstruction

**Gronwall exponential neutralizes decay**: propagating from
$s_0$ to $s_1 > s_0$ introduces factor $e^{c(s_1 - s_0)}$.
Propagating $s \to -\infty$ to $s = 0$: $e^{c|s|} \to \infty$.
Amplifies smallness.  Forward-Gronwall is inherently forward-in-
time; backward reversal requires **Carleman estimates** (LEM-07)
— which IS the correct tool, not an energy method.

Morrey propagation is a disguised energy method (AK-02).

## Dependencies in context

Depends on AK-14 (forward Gronwall obstruction generally).
Supports LEM-07 (Carleman is the correct route), THR-01.

## History

Draft 8-11 era (AK3 Item 31).  Live corpus 2026-04-22.
