---
id: OBS-08
title: Helicity-Sector Obstruction — Λ_k^{(S)} independent of helicity flux
category: OBS
status: conjectured
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-03, INS-17, MPC-5, OBS-03, OBS-07]
supports: [OBS-09, THR-03, THR-04]
cross_citations:
  - label: MPC-5 §5.45
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md §5.45
    note: Symmetric geometric factor Λ_k^{(S)} in Fibonacci triad resonance is unconstrained by helicity, enstrophy, stationarity, helicity flux.
  - label: GUNS Obstruction 8
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction8_HelicitySector.lean
verification:
  method: canon-derivation + helicity-flux conservation analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.helicitySector_obstruction
tags: [obstruction, helicity, MPC-5, Phi-adic, Waleffe-triad, braid-V.9]
---

# OBS-08 · Helicity-Sector Obstruction

## Statement

The **symmetric geometric factor** $\Lambda_k^{(S)}$ in the
Fibonacci triad resonance decomposition of the resonance-pressure
correction (OBS-07) depends on the triad geometry — specifically
the Riesz kernel integrated over shell orientations — and is
**independent** of the scalar quadratic NS invariants (energy,
helicity, enstrophy, helicity flux, stationary production-
dissipation identity).

No closure via helicity-based identities (Moffatt-type, Constantin
nonlocal kernel reformulation) fixes the sign of $\Lambda_k^{(S)}$.

## Canonical Lean form

```lean
def HelicitySectorObstructionStatement : Prop := True

theorem helicitySector_obstruction : HelicitySectorObstructionStatement := by sorry
```

## Canon source

**MPC-5 §5.45**.  MPC-5 develops per-shell helicity-flux
conservation $\Pi_k^H = \sum_{j<k} \langle \Delta_j \omega,
(\Delta_k w \cdot \nabla)\Delta_j w\rangle$ as the candidate
signed invariant (Movement VIII entry point in BRAID).  §5.45
shows the sector decomposition $\Lambda_k = \Lambda_k^{(S)} \oplus
\Lambda_k^{(A)}$ (symmetric/antisymmetric under triad exchange)
and proves $\Lambda_k^{(S)}$ is unaffected by any scalar
quadratic invariant at shell $k$ under stationary NS.

## Semantic role

Rules out the simplest helicity-based closure path.  Sharpens
the "sign gap" diagnosis of BRAID Movement VI: helicity flux is
a signed invariant but its sector decomposition does not
constrain the resonance-pressure correction.

Connects to OBS-09 (twist-writhe decomposition: another
helicity-based attempt, also blocked) and to THR-03 (icosahedral
resolution hypothesizes that the `ℓ = 2` component of
$\Lambda_k^{(S)}$ vanishes under icosahedral averaging on
Fibonacci shells — the only route not ruled out).

## Dependencies in context

Depends on OBS-07 (the pressure-correction setup that $\Lambda_k^{(S)}$
parameterizes).  Supports OBS-09, THR-03, THR-04.

## Citations

- **MPC-5 §5.45**, turbulent_waters canon.
- **BRAID §V.9** (extended wall in BRAID.md), turbulent_waters
  grand_unified_ns_proof.
- **GUNS ObstructionLibrary Obstruction8_HelicitySector**.

## History

MPC-5 canon 2026-04-14..17.  Sector analysis at the transition
from MPC-4 to MPC-5 per BRAID Movement VIII.  Lean 2026-04-17.
Live corpus 2026-04-22.
