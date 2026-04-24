---
id: LEM-11
title: Krein-Rutman eigenfunction extraction on translation hull
category: LEM
status: speculative
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-02, LEM-10]
supports: [INS-03, INS-07, INS-08, MPC-1, MPC-2, THR-02]
cross_citations:
  - label: MPC-2 §2.4-2.6
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_2.md
    note: Spectral-dynamical core; production-dissipation identity; Krein-Rutman extraction of bounded eigenfunction at eigenvalue -γ_∞.
  - label: Krein-Rutman 1948
    ref: "Krein, M. G.; Rutman, M. A., Linear operators leaving invariant a cone in a Banach space, Uspekhi Mat. Nauk 3 (1948) 3–95"
verification:
  method: classical (Krein-Rutman 1948) applied to linearized vorticity-stretching operator on the hull
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending
tags: [Krein-Rutman, spectral, eigenfunction, Rayleigh-quotient, hull, MPC-2, Strand-B]
---

# LEM-11 · Krein-Rutman eigenfunction extraction

## Statement

Given a bounded smooth stationary divergence-free NS solution
$v$ on $\mathbb{R}^3$ with translation hull $\mathcal{O}$ and
$\gamma_\infty(v) > 0$ (the asymptotic Rayleigh quotient, nonzero
by production-dissipation identity), there exists
$w \in \mathcal{O}$ supporting a bounded divergence-free
eigenfunction $\phi$ of the linearized vorticity-stretching
operator

$$\mathcal{L}_w^{\mathrm{vec}} \phi = -\gamma_\infty(v)\, \phi,$$

with $|\phi|$ attaining its supremum at $x = 0$, where
$\nabla\phi(0) = 0$ and $\alpha^*(0) = \gamma_\infty$.

## Usage

- **INS-07** (Translation Hull Theorem): Krein-Rutman extraction
  is the Strand-B eigenfunction that, combined with Strand-A
  rigidity, yields bounded harmonic Liouville and a constant in
  the hull.
- **INS-08** (Four Forms of Bounded Liouville): FormA
  (alignment) is phrased at the Krein-Rutman eigenfunction
  supremum.  FormB (conservation) is the production-dissipation
  identity $\gamma_\infty \equiv 0$.
- **INS-03** (Grand Unification Conjecture): FormC (unique
  ergodicity) is equivalent to $\gamma_\infty \equiv 0$, which
  is equivalent to nonexistence of a bounded eigenfunction at
  negative eigenvalue.

## Status notes

**Speculative** in live-corpus sense.  Classical (Krein-Rutman
1948).  Application to the linearized vorticity-stretching
operator $\mathcal{L}_w^{\mathrm{vec}}$ on the hull is the
MPC-2 §2.4 content.

## Dependencies in context

Depends on LEM-10 (Krylov-Bogolyubov provides the compact hull
on which Krein-Rutman operates).

Supports INS-03, INS-07, INS-08.

## Citations

- **Krein-Rutman 1948**, *Uspekhi Mat. Nauk* 3.
- **MPC-2 §§2.4-2.6**, turbulent_waters canon.

## History

Classical.  Applied in BRAID synthesis 2026-04-14..17.  Live
corpus 2026-04-22.
