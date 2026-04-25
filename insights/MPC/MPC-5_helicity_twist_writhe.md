---
id: MPC-5
title: MPC-5 — Helicity flux + twist-writhe (to ℓ=2 irreducible)
category: MPC
status: conjectured
confidence: 0.10
confidence_history:
  - { date: "2026-04-17", value: 0.80, rationale: "initial estimate as canon's preferred closure mechanism for the resonance-diagonal obstruction" }
  - { date: "2026-04-24", value: 0.10, rationale: "recalibrated per desk/08_mpc5_helicity_flux.md. Canon's OWN Eighth Obstruction Theorem (MPC-5 link 5.45) and Ninth Obstruction Theorem (link 5.70) prove that scalar helicity is dimensionally insufficient: it carries one signed dof per shell, the pressure-correction obstruction has two (Λ_k^{++} and Λ_k^{+-}). Even bivector twist-writhe decomposition cannot resolve the parity-representation mismatch. Canon's own diagnostic establishes structural impossibility." }
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [INS-17, MPC-4]
supports: [INS-04, MPC-6, OBS-08, OBS-09, THR-03, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md (1464 lines, shared with MPC-4)
  - label: BRAID Movement VIII
    ref: turbulent_waters/canon/BRAID_1.md
    note: Helicity flux as the signed-invariant entry point; T₄ transformation mapping Resonance-Diagonal obstruction to helicity flux conservation.
verification:
  method: canon-synthesis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [MPC-5, helicity, twist-writhe, L=2, irreducible-obstruction, Moffatt, Calugareanu, turbulent-waters]
---

# MPC-5 · Helicity flux + twist-writhe

## Purpose

Movement VIII entry point.  Helicity is the **only** scalar
quadratic invariant of Euler besides energy (energy is already
used — stationary production-dissipation balance).  Helicity is
a **signed** quantity, not a magnitude — exactly the
topological / signed input identified by BRAID Movement VI as
structurally missing.

MPC-5 attempts to close bounded Liouville via per-shell
helicity flux conservation at $\varphi$-shells.  1464 lines in
canon (shared with MPC-4).

## Structure

**§5.1–5.44 Helicity setup + Waleffe triad + per-shell flux:**
- Helicity $H := \int v \cdot \omega\, dx$.
- For stationary viscous NS, helicity dissipation $\int
  \nabla v : \nabla \omega$ integrates to zero under stationary
  + div-free.
- Per-shell helicity flux
  $$\Pi_k^H := \sum_{j < k} \langle \Delta_j \omega,
  (\Delta_k w \cdot \nabla) \Delta_j w \rangle$$
  — exact conservation law across shells.
- Waleffe helical decomposition $v = v_+ + v_-$ (INS-17).
- Sector decomposition $\Lambda_k = \Lambda_k^{(S)} \oplus
  \Lambda_k^{(A)}$ (symmetric / antisymmetric under triad exchange).

**§5.45 Helicity-Sector Obstruction (V.9, GUNS Obstruction 8):**
see OBS-08.  $\Lambda_k^{(S)}$ unconstrained by scalar quadratic
invariants; helicity cannot close.

**§5.46–5.69 Twist-writhe decomposition:**
Călugăreanu-White-Fuller $h_k = H_k^{\mathrm{Tw}} +
H_k^{\mathrm{Wr}}$ in pseudoscalar parity space.  Moffatt-type
topological approach.

**§5.70 Twist-Writhe Obstruction (V.10, GUNS Obstruction 9):**
see OBS-09.  Pseudoscalar parity vs sector parity-reversal:
**representations incommensurable** for mixed-helicity fields.
**Irreducible obstruction = ℓ=2 angular harmonic on
$\varphi$-shells.**

## Significance

Three obstructions in MPC-5:
- V.8 (Resonance-Diagonal, MPC-4 §4.40 + per-shell MPC-5).
- V.9 (Helicity-Sector).
- V.10 (Twist-Writhe).

Narrows the irreducible obstruction to a specific structural
feature — the $\ell = 2$ spherical harmonic.  This is precisely
the feature **icosahedral averaging** (INS-04) targets: under
the icosahedral group $I$ (order 60), the $\ell = 2$
representation decomposes as $1 \oplus 4$; the 4-dim irrep has
no fixed vectors, so $I$-averaging kills it.

## Dependencies in context

Depends on MPC-4 (Φ-adic weaving + cross-shell machinery) and
INS-17 (Waleffe helical triad).

Supports OBS-08, OBS-09, INS-04 (Icosahedral Hypothesis closure
route), THR-03, THR-04.

## Citations

- **MASTER_PROOF_CHAIN_5.md**, turbulent_waters canon (shared
  with MPC-4).
- **Moffatt 1969** (helicity as topological invariant).
- **Călugăreanu 1959**, **White 1969**, **Fuller 1971**.
- **Waleffe 1992**.

## History

Canon 2026-04-14..17.  Live corpus 2026-04-22.
