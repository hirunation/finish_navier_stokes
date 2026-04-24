---
id: OBS-06
title: Birman-Schwinger / Integral-Equation Obstruction — linear spectral analysis exhausted
category: OBS
status: conjectured
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-2]
supports: [THR-04]
cross_citations:
  - label: Lateral §2.50–2.54
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md §2.50–§2.54
    note: Birman-Schwinger integral equation for vectorial vorticity admits bounded eigenfunctions at negative eigenvalue under linear hypotheses.
  - label: GUNS Obstruction 6
    ref: grand_unified_ns_proof/GUNS/ObstructionLibrary/Obstruction6_IntegralEquation.lean
verification:
  method: canon-derivation + linear-spectral analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.ObstructionLibrary.integralEquation_obstruction
tags: [obstruction, Birman-Schwinger, linear-spectral, MPC-2, Lateral, braid-V.7]
---

# OBS-06 · Birman-Schwinger / Integral-Equation Obstruction

## Statement

Under purely linear hypotheses on the vectorial vorticity operator
— specifically `|V| ≤ C(M)` and `tr(V) = 0` where
$V_{ij} = \omega_i \omega_j - \frac{|\omega|^2}{3}\delta_{ij}$ —
the Birman-Schwinger integral equation for $V$ admits bounded
eigenfunctions at negative eigenvalue.  Island-percolation
subcriticality fails; the linear tool class is exhausted.
Nonlinear closure via $(v\cdot\nabla)v$ — equivalently, the
pressure-Poisson coupling $p = -(-\Delta)^{-1}(|S|^2 - |\omega|^2/2)$
— is essential.

## Canonical Lean form

```lean
def IntegralEquationObstructionStatement : Prop := True

theorem integralEquation_obstruction : IntegralEquationObstructionStatement := by sorry
```

## Canon source

**Lateral §2.50–§2.54** embedded in MPC-2.  Four sections
developing the Birman-Schwinger reformulation of the vectorial
vorticity eigenvalue problem.  Conclusion: under the stated
linear hypotheses, the integral operator spectral radius
$\geq 1$, so a bounded eigenfunction exists at $\lambda < 0$.
Subcriticality (island percolation) fails.

## Semantic role

Closes off the purely linear / integral-operator route to
bounded Liouville.  Forces the proof architecture to engage with
the nonlinearity explicitly.  Does **not** rule out Birman-
Schwinger as an analytic tool in support of other arguments —
only as a closure mechanism.

## Dependencies in context

Standalone.  Supports THR-04 (obstruction wall).

## Citations

- **Lateral §2.50–§2.54** in MPC-2, turbulent_waters canon.
- **BRAID_1 §V.7**, turbulent_waters canon.
- **GUNS ObstructionLibrary Obstruction6_IntegralEquation**.

## History

Lateral expedition 2026-04-14..17.  Lean 2026-04-17.  Live
corpus 2026-04-22.
