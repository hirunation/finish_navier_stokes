---
id: THR-05
title: Scaling-Liouville + function-space pivot (synthesis_11-13 breakthrough)
category: THR
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [INS-02, INS-06, INS-11, INS-12, INS-19, INS-20, LEM-12]
supports: []
cross_citations:
  - label: synthesis_11-13 arc
    ref: navier_stokes/synthesis_11.md + synthesis_12.md + synthesis_13.md
verification:
  method: council-synthesis (three rounds of parallel verification; stress-test confidence 54% → 99%)
  rounds: 3
  adversarial_vectors: 40000 (Parity-Theorem partition tests)
  independent_rederivation: three independent derivations in synthesis_11 pass 3
  machine_verification: pending
tags: [thread, synthesis_11, synthesis_12, synthesis_13, function-space-pivot, Scaling-Liouville, Parity-Theorem, narrative]
---

# THR-05 · Scaling-Liouville + function-space pivot

## Narrative — the synthesis_11-13 breakthrough arc

The cc52d85c project's structural stabilization (Draft 10) was
not the end of the NS program.  Between March 28 and March 30 —
synthesis_11 through synthesis_13 — Nahiru executed a
breakthrough arc with five load-bearing insights:

1. **Function-space pivot (methodological)**.  After 20 failed
   attempts to exclude the $(-,-,-)$ helical equilibrium at the
   truncation level, v0.82 pass 2 discovered **exponential
   decay** at truncation — which appeared catastrophic
   (PDE-consistent!).  v0.82 pass 3 **inverted the
   interpretation**: the right question is not "does the
   solution exist?" but **"what function space does it live in?"**

2. **Scaling-Liouville Theorem (INS-06)**.  Homogeneous-degree-0
   helical kernel forces $q = 1$ power-law exponent;
   Gel'fand-Shilov maps degree-0 $k$-space to degree-$(-2)$
   $x$-space; degree-2 homogeneity violates $L^{3,\infty}$.
   Closes $(-,-,-)$.

3. **Parity Theorem (INS-11)**.  Every multi-triad phase
   configuration is uniformly $(+,+,+)$ or $(-,-,-)$; mixed
   classes impossible.  40,000 partition tests, 0 violations.
   Eliminates 6 of 8 equilibrium classes non-perturbatively.

4. **Route 2 purely analytical proof (INS-12)**.  13-step chain
   from KNSS extraction through backward uniqueness and spatial
   continuation.  Tucker pipeline / SRB measure / CLT relegated
   to appendix as independent verification — not in the logical
   backbone.

5. **Barrier lemma (LEM-12)** + **Henry's theorem in subcritical
   norms** (X33 resolution).  Quantitative closure of the
   $(-,-,-)$ integral divergence + resolution of the IFT
   spectral-gap subtlety on $\mathbb{R}^3$.

## Confidence arc (synthesis_11..13 stress-test)

v0.76: 60% → v0.80: 85% → v0.81: 60% (X33 discovered) → v0.82p2:
54% (exponential decay discovered, appeared catastrophic) →
v0.82p3: 72% (Scaling-Liouville breakthrough) → v0.82p4: 93%
(Parity Theorem) → v0.83: 99% (final Route 2 chain).

**Stress-test nadir inverted the conclusion.**  Methodological
lesson: failure at the nadir is a theorem in disguise; inverting
the interpretation can produce breakthroughs.  Treating
computational failures as exclusion theorems (Koch-NSS exponential
decay → trivial) rather than obstacles is the load-bearing move.

## PROOF_FINAL_DRAFT11.tex (1491 lines, 28 pages)

The paper embodying THR-05.  Submission-state "best draft"
before the navier_stokes_official/Draft 12 (16-page shorter
framing).  The core Liouville content is the same; the
helical-triad + Scaling-Liouville supporting analysis is
present in Draft 11 but elided from Draft 12 for conciseness.

## Dependencies in context

Depends on INS-02, INS-06 (Scaling-Liouville), INS-11 (Parity
Theorem), INS-12 (Route 2), INS-19 (Equilibrium Vanishing),
INS-20 (Incompatibility Theorem), LEM-12 (Barrier Lemma).

## History

Breakthrough arc 2026-03-28..30 (sessions preceding cc52d85c and
cc52d85c itself).  Live corpus 2026-04-22.
