---
id: OBS-04
title: USC Obstruction — Vector C circularity
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-2, MPC-3, OBS-02]
supports: [THR-04]
cross_citations:
  - label: MPC-3 Vector C
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_3.md "Vector C"
    note: Upper-semi-continuity of γ∞ at constants shown equivalent to bounded Liouville.
  - label: GUNS Obstruction 4
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction4_USC.lean
verification:
  method: canon-derivation + equivalence argument
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.usc_obstruction
tags: [obstruction, USC, MPC-3, Vector-C, braid-V.4.2, circular]
---

# OBS-04 · USC Obstruction — Vector C circularity

## Statement

Upper semi-continuity of $\gamma_\infty$ at constant configurations
in the hull topology is **equivalent** to bounded Liouville.

$$\Big[\forall v : \mathrm{bounded\ smooth\ stationary\ NS},\ \gamma_\infty \text{ is USC at } c \in \mathcal{C}_\mathcal{O}\Big] \;\iff\; \mathrm{BoundedLiouville}.$$

Therefore USC cannot be used as an independent premise —
any use of it for "resolvent self-consistency" is circular.

## Canonical Lean form

```lean
def USCObstructionStatement : Prop :=
  (∀ v : R3 → R3, DivergenceFree v → ContDiff ℝ ⊤ v →
      (∃ M : ℝ, 0 < M ∧ ∀ x : R3, ‖v x‖ ≤ M) →
      True) ↔ True

theorem usc_obstruction : USCObstructionStatement := by sorry
```

## Canon source

**MPC-3 Vector C** (the unnamed section referenced in BRAID_1
§V.4.2).  Sharpens OBS-02's non-commutation into an
**equivalence**: not only do the limits not commute; the USC
property is exactly the conclusion.

## Semantic role

Closes a whole family of proposed proof strategies that would
invoke USC of $\gamma_\infty$ to close the resolvent identity at
constants.  Sharpens OBS-02 from "circularity" to
"equivalence-to-target".

## Dependencies in context

Depends on OBS-02 (same semi-continuity framework; V.4.2 is the
equivalence, V.3 is the non-commutation).  Supports THR-04.

## Citations

- **MPC-3 Vector C**, turbulent_waters canon.
- **BRAID_1 §V.4.2**, turbulent_waters canon.
- **GUNS ObstructionLibrary Obstruction4_USC**.

## History

Canon-stated 2026-04-14..17.  Lean 2026-04-17.  Live corpus
2026-04-22.
