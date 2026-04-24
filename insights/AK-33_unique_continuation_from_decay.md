---
id: AK-33
title: Unique continuation from spatial decay (reduces to backward uniqueness)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [LEM-08, LEM-09, THR-01]
cross_citations:
  - label: AK3 Item 33
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 33)
verification:
  method: refutation-by-reduction-to-backward-uniqueness
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: Drafts 8-11
  machine_verification: n/a
tags: [anti-knowledge, UCP, spatial-decay, reduces-to-backward-uniqueness, Carleman, AK3-Item-33]
---

# AK-33 · Unique continuation from spatial decay

## Approach tried

Ancient solution $v(\cdot, s) \to 0$ in $C^m_{\mathrm{loc}}$
(local decay).  Use parabolic unique-continuation principle
(UCP) from spatial decay to deduce $v \equiv 0$.

## Obstruction

**Reduces to backward uniqueness (LEM-08) — no bypass.**
(a) "UCP from spatial decay" requires solution decay **faster
than any Gaussian** at $|x| \to \infty$.  $L^{3,\infty}$ gives
$|v| \leq C/|x|$ at best (polynomial, not super-Gaussian).
(b) Local decay $v \to 0$ on compact sets is **temporal** behavior,
not spatial.  (c) UCP itself uses Carleman estimates — same
machinery as LEM-08.  Approach does not bypass ESS03; reduces
to it.

## Dependencies in context

Supports LEM-08 (ESS03 backward uniqueness is the actual tool),
LEM-09 (ESS03 spatial continuation), THR-01.

## History

Draft 8-11 era (AK3 Item 33).  **Five routes** (AK-29..33) all
fail; two-mechanism structure mathematically irreducible.  Live
corpus 2026-04-22.
