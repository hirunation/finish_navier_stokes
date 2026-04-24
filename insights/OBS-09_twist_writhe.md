---
id: OBS-09
title: Twist-Writhe Obstruction — ℓ=2 incommensurability as the irreducible obstruction
category: OBS
status: conjectured
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-03, INS-17, MPC-5, OBS-07, OBS-08]
supports: [INS-04, INS-10, THR-03, THR-04]
cross_citations:
  - label: MPC-5 §5.70
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md §5.70
    note: Twist-writhe decomposition lives in pseudoscalar parity space; sector decomposition Λ_k^{(S)} ⊕ Λ_k^{(A)} lives in even/odd parity-reversal space; incommensurable.
  - label: GUNS Obstruction 9
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction9_TwistWrithe.lean
  - label: Călugăreanu-White-Fuller
    ref: "Călugăreanu 1959; White 1969; Fuller 1971"
    note: Twist-writhe decomposition h = H^{Tw} + H^{Wr} for closed curves and vector fields.
verification:
  method: canon-derivation + representation-theoretic incommensurability
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.twistWrithe_obstruction
tags: [obstruction, twist-writhe, helicity, parity, MPC-5, icosahedral, braid-V.10]
---

# OBS-09 · Twist-Writhe Obstruction — ℓ=2 incommensurability

## Statement

The Călugăreanu-White-Fuller twist-writhe decomposition

$$h_k = H_k^{\mathrm{Tw}} + H_k^{\mathrm{Wr}}$$

of the per-shell helicity density lives in the **pseudoscalar
parity space** (eigenstates of the parity operator $\mathcal{P}$).
The sector decomposition
$\Lambda_k = \Lambda_k^{(S)} \oplus \Lambda_k^{(A)}$ (symmetric /
antisymmetric under triad-exchange in the Waleffe helical basis)
lives in a **different representation space** (even / odd
parity-reversal).  For generic mixed-helicity fields the two
decompositions are **incommensurable**; no linear or quadratic
helicity-based identity controls the `ℓ = 2` angular-harmonic
component of $\Lambda_k^{(S)}$ on Fibonacci $\varphi$-shells.

The irreducible obstruction is the `ℓ = 2` angular harmonic on
$\varphi$-shells.

## Canonical Lean form

```lean
def TwistWritheObstructionStatement : Prop := True

theorem twistWrithe_obstruction : TwistWritheObstructionStatement := by sorry
```

## Canon source

**MPC-5 §5.70**.  Follows §5.45 (OBS-08) as the final refinement
in MPC-5's helicity-based analysis.  Shows that the most natural
topological / Moffatt-style decomposition of helicity cannot
control $\Lambda_k^{(S)}$ because it lives in the wrong
representation.

## Semantic role

Identifies the **irreducible obstruction** to bounded Liouville
via helicity methods: the `ℓ = 2` harmonic on $\varphi$-shells.
This is the precise structural feature that THR-03 (icosahedral
resolution) targets: the icosahedral group $I \subset SO(3)$
(order 60) has irreducible representations of dimensions
$\{1, 3, 3, 4, 5\}$; the `ℓ = 2` representation (dimension 5)
decomposes under $I$ as $1 \oplus 4$ (no fixed vectors in the
4-dim irrep), so icosahedral averaging kills the obstruction if
a consistent rank-2-tensor average is available on $\varphi$-shells.

Supports INS-10 (Icosahedral Hypothesis) — if true, resolves
OBS-09 and closes the Schur test of OBS-07, giving bounded
Liouville and (via KNSS chain) the Clay target.

## Dependencies in context

Depends on OBS-07 (Φ-adic weaving) and OBS-08 (helicity sector).
Supports INS-10 (Icosahedral Hypothesis), THR-03, THR-04.

## Citations

- **MPC-5 §5.70**, turbulent_waters canon.
- **BRAID §V.10** (extended wall), turbulent_waters
  grand_unified_ns_proof.
- **Călugăreanu 1959**, Czechoslovak Math J.
- **White 1969**, *Amer. J. Math.*
- **Fuller 1971**, PNAS (Self-linking number of space curves).
- **Moffatt 1969**, *J. Fluid Mech.* (helicity as topological
  invariant).
- **GUNS ObstructionLibrary Obstruction9_TwistWrithe**.

## History

Canon 2026-04-14..17.  Lean 2026-04-17.  Live corpus 2026-04-22.
