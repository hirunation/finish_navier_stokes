---
id: MPC-4
title: MPC-4 — Φ-adic Meyer weaving at golden scale (resonance-diagonal)
category: MPC
status: conjectured
confidence: 0.85
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-03, INS-18, MPC-1, MPC-2, MPC-3]
supports: [MPC-5, OBS-07, THR-03, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_4.md + MASTER_PROOF_CHAIN_5.md §4
  - label: Kernel numerics
    ref: "grand_unified_ns_proof/kernel/lut_phi.cuh:verify_phi_partition_of_unity"
    note: fp64 interval precision; |Σ|ψ̂(φ⁻ᵏξ)|² - 1| ≤ 1.55×10⁻¹⁵ at 128 sample points.
verification:
  method: canon-synthesis + kernel-certified Meyer partition (fp64 interval)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: numerically verified Meyer partition
  machine_verification: pending (kernel numerical verification only)
tags: [MPC-4, Phi-adic, Meyer, weaving, golden-scale, Fibonacci, resonance-diagonal, cross-shell, turbulent-waters]
---

# MPC-4 · Φ-adic Meyer weaving at golden scale

## Purpose

Movement IV of the BRAID: **the weaving** — where Strand A, B, C
meet at the golden scale.  Introduces Φ-adic Littlewood-Paley
decomposition, Meyer profile partition of unity, Fibonacci
triad structure, cross-shell coupling matrix $\mathbf{K}$.

## Structure

**§4.1–4.8 Φ-adic machinery:**
- $R_0 = \max(1, \ell)$; $R_k = R_0 \varphi^k$ where $\varphi$
  is the golden ratio.
- Meyer profile $\hat\psi \in C_c^\infty$ with
  $\mathrm{supp}(\hat\psi) \subset \{\varphi^{-1} \leq |\xi| \leq \varphi\}$
  and $\sum_k |\hat\psi(\varphi^{-k}\xi)|^2 = 1$.  **Numerically
  certified** at fp64 interval precision.
- Shell projections $\Delta_k f$, Parseval $\sum_k \|\Delta_k f\|^2
  = \|f\|^2$, Bernstein $\|\Delta_k f\|_{L^p} \leq C_p
  \varphi^{3k(1/2 - 1/p)} \|\Delta_k f\|_{L^2}$.
- Frequency localization: $\|\nabla \Delta_k f\|_{L^2}^2 \sim
  \varphi^{2k} \|\Delta_k f\|_{L^2}^2$.
- Almost-orthogonality: $\langle \Delta_k f, \Delta_j g\rangle = 0$
  for $|k - j| \geq 3$.
- Per-shell enstrophy bounds: $\|\Delta_k \omega\|_{L^2(B_R)}^2
  \leq C_M R^2 \varphi^{-2k}$.

**§4.9–4.39 Cross-shell coupling matrix + spectral radius:**
$K_{k,j} := \frac{\int \alpha \cdot (\Delta_k\omega) \cdot (\Delta_j\omega)}
{\|\Delta_k\omega\|_{L^2} \|\Delta_j\omega\|_{L^2}}$.  Off-diagonal
decay $|K_{k,j}| \leq C(M) \varphi^{-|k-j|/2}$ for $|k-j| \geq 2$.
Diagonal $K_{k,k}$ = shell Rayleigh quotient.  Spectral radius
$\|\mathbf{K}\|_{\ell^2 \to \ell^2} \geq \gamma_\infty$ by Krein-
Rutman.  Bony pressure decomposition $\Delta_k p = \Delta_k p^{HL}
+ \Delta_k p^{LH} + \Delta_k p^{RR}$ with **resonance**
$p^{RR}$ at Fibonacci-triad frequencies $\varphi^m + \varphi^n
\sim \varphi^{m+1}$.

**§4.40 Resonance-Diagonal Obstruction (V.8):** see OBS-07.  Per-
shell pressure correction sign undetermined.

## Why golden scale

Golden ratio is the **unique** base at which nearest-neighbor
resonance triads $\Delta_k \cdot \Delta_{k+1}$ land in shell
$k + 2$ (Fibonacci identity $\varphi^{k+2} = \varphi^{k+1} +
\varphi^k$, INS-18).  Dyadic shells bleed; golden shells align.
Algebraic cleanness of resonance-diagonal identity is a
consequence of Fibonacci structure.  See INS-18.

## Status notes

**Conjectured.**  Φ-adic partition **numerically certified** at
fp64 interval precision via CUDA kernel.  Cross-shell coupling
theory + resonance-diagonal identity are canon-level derivations;
not yet Lean-formalized beyond definitions.

## Dependencies in context

Depends on MPC-1 (foundational setup), MPC-2 (Rayleigh machinery
for $K_{k,k}$), MPC-3 (pressure Poisson), INS-18 (Fibonacci
triad identity), DEF-03 (PhiShell + Meyer partition).

Supports OBS-07 (Resonance-Diagonal Obstruction), THR-03
(icosahedral thread), THR-04 (obstruction wall).

## Citations

- **MASTER_PROOF_CHAIN_4.md + MASTER_PROOF_CHAIN_5.md §4**,
  turbulent_waters canon.
- **Meyer, Wavelets and Operators**, Cambridge.
- **Bony** (pressure decomposition), **Littlewood-Paley theory**.

## History

Canon 2026-04-14..17.  Numerical kernel verification
2026-04-17..22 (session `74b58d41`).  Live corpus 2026-04-22.
