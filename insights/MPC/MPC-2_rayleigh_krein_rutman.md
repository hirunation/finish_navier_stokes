---
id: MPC-2
title: MPC-2 — Spectral dynamics (Rayleigh γ_∞, Krein-Rutman, lateral obstructions)
category: MPC
status: conjectured
confidence: 0.80
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [LEM-11, MPC-1]
supports: [INS-08, MPC-4, OBS-02, OBS-04, OBS-05, OBS-06, THR-02, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md (524 lines)
verification:
  method: canon-synthesis + spectral analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [MPC-2, spectral, Rayleigh-gamma, Krein-Rutman, Wiener, lateral-obstructions, Strand-B, turbulent-waters]
---

# MPC-2 · Spectral dynamics

## Purpose

Strand B of the BRAID: **spectral-dynamical** attack on bounded
Liouville via Rayleigh quotient $\gamma_\infty$, Krein-Rutman
eigenfunction extraction on the translation hull, Wiener ergodic
theorem.  524 lines in canon.

## Structure

**§2.1–2.6 Foundational Strand B machinery:**
- Rayleigh quotient $\gamma_\infty(v) := \limsup_R
  \frac{\int_{B_R} \alpha |\omega|^2}{\int_{B_R} |\omega|^2}
  = \limsup_R \frac{\int_{B_R} |\nabla\omega|^2}{\int_{B_R} |\omega|^2}$.
- Translation-hull compactness (shared with MPC-1 §31).
- **§2.6 Translation Hull Theorem** — see INS-07.

**§2.7–2.36 Core development:**
- Production-dissipation identity $\alpha |\omega|^2 =
  -\tfrac{1}{2} \mathcal{L}_v |\omega|^2 + |\nabla\omega|^2$.
- Krein-Rutman extracts bounded divergence-free eigenfunction
  at $\lambda = -\gamma_\infty < 0$ (LEM-11).
- Wiener ergodic averaging.
- Aronson semigroup compactness.

**§2.37 Case II Closure (positive result!):**
If $\vec\beta := \mathbb{P}_\perp[(\nabla w(0))^T \hat e] = 0$ at
the eigenfunction supremum: $\phi \equiv 0$, contradiction with
Krein-Rutman extraction.  Proof: strong maximum principle on
$|h|^2$ + analyticity.  **Only positive closure result in the
Obstruction Wall.**  GUNS analog partially reflected in
`Obstruction4_USC.lean` (the Vector C equivalence).

**§2.38–2.39 Exchange-of-Limits Obstruction (V.3):** see OBS-02.

**§2.42–2.43 Carleman Obstruction (V.5):** see OBS-05.

**§2.47–2.49 Strain Riccati Obstruction (V.6):** local pointwise
analysis at eigenfunction supremum underdetermined at every
Taylor order.

**§2.50–2.54 Birman-Schwinger Obstruction (V.7):** see OBS-06.

## Status notes

Conjectured composite.  Forms Strand B of the BRAID; Strand A
(MPC-1) + Strand B (MPC-2) + Strand C (MPC-3) weave in Movement
IV (MPC-4 Φ-adic).

## Dependencies in context

Depends on MPC-1 (shared Translation Hull + Rayleigh machinery)
and LEM-11 (Krein-Rutman).

Supports INS-08 (Four Forms — FormC is unique ergodicity on the
hull, closely tied to MPC-2's Strand-B content), OBS-02, OBS-04,
OBS-05, OBS-06, THR-02, THR-04.

## Citations

- **MASTER_PROOF_CHAIN_2.md**, turbulent_waters canon.
- **Krein-Rutman 1948**, **Wiener 1939**, **Aronson**.

## History

Canon 2026-04-14..17.  Live corpus 2026-04-22.
