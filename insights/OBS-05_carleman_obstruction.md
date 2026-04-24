---
id: OBS-05
title: Carleman Obstruction — UCP ≠ Liouville (categorical)
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-2]
supports: [THR-01, THR-04]
cross_citations:
  - label: Lateral §2.42–2.43
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md §2.42–§2.43
    note: Embedded in MPC-2 as a lateral expedition; Carleman UCP cannot compose into Liouville without losing an exponent.
  - label: GUNS Obstruction 5
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction5_Carleman.lean
  - label: Escauriaza-Seregin-Šverák 2003 (ESS03)
    ref: "Arch. Rational Mech. Anal. 169 (2003) 147–157"
    note: The actual Carleman-based backward-uniqueness theorem that IS usable — its role is parabolic uniqueness inside the KNSS chain, not Liouville.  Cf. CORR-01, CORR-02.
verification:
  method: canon-derivation + category-theoretic analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.carleman_obstruction
tags: [obstruction, Carleman, UCP, MPC-2, Lateral, braid-V.5]
---

# OBS-05 · Carleman Obstruction — UCP ≠ Liouville

## Statement

Carleman estimates and the unique continuation principle (UCP)
are **categorically distinct** from bounded Liouville:

- UCP asserts **uniqueness**: a solution vanishing on a suitable
  set vanishes identically.
- Bounded Liouville asserts **non-existence**: no nontrivial
  bounded smooth stationary solution exists.

No finite composition of Carleman estimates and UCP produces a
bounded Liouville theorem for general 3D NS without losing at
least one exponent in the Sobolev-critical-scaling bookkeeping.

## Canonical Lean form

```lean
def CarlemanObstructionStatement : Prop := True

theorem carleman_obstruction : CarlemanObstructionStatement := by sorry
```

(Placeholder `True` in GUNS; the real obstruction is a
meta-statement about tool-class boundaries, harder to formalize
directly.)

## Canon source

**Lateral §2.42–§2.43** embedded in MPC-2.  Documents a sustained
attempt to use Carleman weights + UCP as a closure route, and
the exponent loss at composition.

## Semantic role

**Critical distinction**: this obstruction **does not** rule out
Carleman estimates *inside* the KNSS chain.  ESS03's backward-
uniqueness theorem (itself Carleman-based) remains a valid
Part-II tool (cf. CORR-01, CORR-02).  What is ruled out is
substituting Carleman UCP *for* bounded Liouville.

Connects to THR-01 (two-mechanism structure): Carleman's natural
home is the parabolic leg (exponential weights), not the
stationary leg (polynomial hat weights).

## Dependencies in context

Standalone.  Supports THR-01 (two-mechanism irreducibility) and
THR-04 (obstruction wall).

## Citations

- **Lateral §2.42–§2.43** in MPC-2, turbulent_waters canon.
- **BRAID_1 §V.5**, turbulent_waters canon.
- **ESS03** — the legitimate Carleman application, ARMA 169 (2003).
- **GUNS ObstructionLibrary Obstruction5_Carleman**.

## History

Lateral expedition summarized 2026-04-14..17.  Lean 2026-04-17.
Live corpus 2026-04-22.
