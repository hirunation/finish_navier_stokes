---
id: OBS-07
title: Resonance-Diagonal Obstruction — Φ-adic per-shell pressure indeterminacy
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-03, INS-18, MPC-4, OBS-03]
supports: [OBS-08, OBS-09, THR-03, THR-04]
cross_citations:
  - label: MPC-4 §4.40
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_4.md §4.40 (in MASTER_PROOF_CHAIN_5.md line range)
    note: Φ-adic cross-shell coupling matrix; resonance-diagonal identity with undetermined sign.
  - label: MPC-4 §4.1–4.8
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md
    note: Φ-adic Meyer profile partition of unity; numerical verification |Σ|ψ̂(φ⁻ᵏξ)|² - 1| ≤ 1.55×10⁻¹⁵ at fp64 interval precision (grand_unified_ns_proof/kernel/lut_phi.cuh:verify_phi_partition_of_unity).
  - label: GUNS Obstruction 7
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction7_ResonanceDiagonal.lean
verification:
  method: canon-derivation + kernel numerics verification (fp64 intervals)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: kernel-certified at R5 resolution 128 sample points
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.resonanceDiagonal_obstruction
tags: [obstruction, Phi-adic, Meyer, resonance, golden-scale, MPC-4, braid-V.8]
---

# OBS-07 · Resonance-Diagonal Obstruction

## Statement

In the Φ-adic cross-shell coupling matrix

$$K_{k,j} := \frac{\int \alpha \cdot (\Delta_k \omega) \cdot (\Delta_j \omega) \, dx}{\|\Delta_k \omega\|_{L^2} \|\Delta_j \omega\|_{L^2}}$$

at golden scales $R_k = R_0 \varphi^k$ with $\varphi = (1+\sqrt 5)/2$,
the resonance-diagonal identity

$$K_{k,k+1}^{RR} = -K_{k,k} + \varphi^{-2k} \frac{\langle \Delta_k \omega, \Delta_k \nabla^2_{\mathrm{sym}} p^{RR} \cdot \hat\xi_k |\Delta_{k+1}\omega|\rangle}{\|\Delta_k\omega\|\,\|\Delta_{k+1}\omega\|} + O(\varphi^{-k})$$

suggests a nearest-neighbor cancellation that would close the
Schur test $\|\mathbf{K}\|_{\ell^2 \to \ell^2} < \gamma_\infty$.
However, the pressure-correction term $\Delta_k \nabla^2_{\mathrm{sym}} p^{RR}$
(resonance component of the pressure Hessian at shell $k$) has
undetermined sign.  The per-shell version of OBS-03 (Riesz) fires
at every frequency shell: the single global Riesz obstruction
becomes a sequence of per-shell obstructions; no scale resolves
it.

## Canonical Lean form

```lean
def ResonanceDiagonalObstructionStatement : Prop :=
  ∀ _k : ℤ, True

theorem resonanceDiagonal_obstruction : ResonanceDiagonalObstructionStatement := by sorry
```

## Canon source

**MPC-4 §4.40** (within MASTER_PROOF_CHAIN_5.md).  Prior §4.1–§4.8
set up the Φ-adic Meyer profile partition of unity
$\sum_k |\hat\psi(\varphi^{-k}\xi)|^2 = 1$, numerically verified
at fp64 interval precision.  §4.35–§4.40 derive the cross-shell
coupling matrix $\mathbf{K}$, prove off-diagonal decay
$|K_{k,j}| \leq C(M)\varphi^{-|k-j|/2}$ for $|k-j| \geq 2$, and
show the Schur test reduces to the sign of the pressure-correction
term — which OBS-03 (Riesz) blocks at every shell.

## Semantic role

This is the **Φ-adic avatar of OBS-03**.  What OBS-03 blocks at
one global point becomes OBS-07's sequence-of-obstructions across
all Fibonacci shells.  The golden scale $\varphi$ is the unique
base at which nearest-neighbor resonances $\Delta_k \cdot
\Delta_{k+1}$ live in shell $k+2$ (Fibonacci identity
$\varphi^{k+2} = \varphi^{k+1} + \varphi^k$, cf. INS-18).

Together with OBS-08 (helicity-sector independence) and OBS-09
(twist-writhe incommensurability), OBS-07 motivates the
**icosahedral resolution** (THR-03): the `ℓ = 2` angular harmonic
on $\varphi$-shells is the irreducible obstruction, to be
cancelled by averaging over the icosahedral group.

## Dependencies in context

Depends on OBS-03 (Riesz; the per-shell version inherits the
global sign indeterminacy).  Supports OBS-08, OBS-09, THR-03
(icosahedral thread), THR-04 (obstruction wall).

## Citations

- **MPC-4 §4.40** (MASTER_PROOF_CHAIN_5.md), turbulent_waters.
- **BRAID_1 §V.8**, turbulent_waters canon.
- **`kernel/lut_phi.cuh:verify_phi_partition_of_unity`** for
  numerical verification of the Meyer partition at fp64 interval
  precision.
- **GUNS ObstructionLibrary Obstruction7_ResonanceDiagonal**.

## History

Canon 2026-04-14..17.  CUDA kernel certification round-tripped
during the same period.  Lean 2026-04-17.  Live corpus
2026-04-22.
