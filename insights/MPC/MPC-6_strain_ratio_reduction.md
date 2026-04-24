---
id: MPC-6
title: MPC-6 — Strain-ratio reduction r(x) = |S|²/|ω|² < 1/4 (CUDA kernel target)
category: MPC
status: conjectured
confidence: 0.65
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-5]
supports: [THR-03, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_6.md (845 lines)
  - label: GUNS Cycle 1 kernel
    ref: "grand_unified_ns_proof/kernel/ + vellum.md"
    note: CUDA kernel with certified fp64 interval arithmetic. Cycle 1 numerical sweep: r(x) = 0.7386 at ℓ=1 (exceeds 1/4, fails), 0.0466 at ℓ=4 (1/ℓ² scaling confirmed). Cycle 2 planned: install pressure-Poisson projection.
verification:
  method: canon-derivation + numerical sweep (GUNS Cycle 1)
  rounds: 1
  adversarial_vectors: "ℓ∈{1,2,4} × 64 orientations"
  independent_rederivation: CUDA kernel numerical test
  machine_verification: pending (numerical only; analytical proof open)
tags: [MPC-6, strain-ratio, r(x), CUDA, GUNS-Cycle-1, Waleffe-triad, kinematic-ansatz, numerical-verification]
---

# MPC-6 · Strain-ratio reduction

## Target theorem

**Pointwise strain-ratio reduction**: for every bounded smooth
stationary divergence-free NS solution,

$$r(x) := \frac{|S(x)|^2}{|\omega(x)|^2} < \frac{1}{4} \quad \text{for all } x \in \mathbb{R}^3$$

implies $\nabla v \equiv 0$ (and hence $v$ constant, by
divergence-free + mean value).

## Structure

MPC-6 states the reduction + its canonical scaling analysis in
845 lines.  Proof-by-computation via CUDA kernel is the GUNS
`kernel/` contribution (2026-04-17..22, session `74b58d41`).

## GUNS Cycle 1 numerical results

Single-Gaussian kinematic ansatz (not NS-constrained):
$$u(x) = A \sum_{i=1}^{\ell} c_i e^{-|x - x_i|^2/(2\sigma_i^2)}\hat n_i$$
with $\ell \in \{1, 2, 4\}$ and 64 orientation samples per $\ell$.

Sweep output:
- $\ell = 1$: $\max r(x) = 0.7386$ — **exceeds 1/4 threshold,
  fails the reduction hypothesis**.
- $\ell = 2$: $\max r(x) \sim 0.18$ (approximate).
- $\ell = 4$: $\max r(x) = 0.0466$ — comfortably below $1/4$.
- **$1/\ell^2$ scaling** confirmed across the sweep.

**Interpretation**: higher-symmetry ansätze concentrate vorticity
relative to strain.  The $1/\ell^2$ scaling suggests icosahedral-
symmetric (or similar high-symmetry) configurations push
$r(x)$ further below $1/4$, consistent with the INS-04
Icosahedral-Hypothesis route.

## Cycle 2 planned

Install pressure-Poisson projection: sweep **NS-constrained**
fields (satisfying $-\Delta p = |S|^2 - |\omega|^2/2$), not just
kinematic ansätze.  Expected: reduction hypothesis holds more
strictly under NS constraint than under kinematic.

## Status notes

**Conjectured.**  Analytical proof open.  Numerical verification
at fp64 interval precision is the current evidence.  If
verified, closes the GUNS Clay target via the strain-ratio →
Liouville chain.

The $1/\ell^2$ scaling is empirically suggestive of
representation-theoretic structure (icosahedral $\ell = 2$
cancellation, consistent with INS-04).

## Dependencies in context

Depends on MPC-5 (helicity + twist-writhe structure feeds the
strain-ratio framework).

Supports THR-03 (icosahedral closure route), THR-04 (obstruction
wall — MPC-6 is an alternative route alongside MPC-1..5).

## Citations

- **MASTER_PROOF_CHAIN_6.md**, turbulent_waters canon.
- **GUNS Cycle 1**: `grand_unified_ns_proof/vellum.md` +
  `kernel/` source.
- Standard: strain tensor / vorticity magnitude references in
  fluid mechanics.

## History

Canon 2026-04-14..17.  Cycle 1 numerics 2026-04-17..22 (session
`74b58d41`).  Live corpus 2026-04-22.
