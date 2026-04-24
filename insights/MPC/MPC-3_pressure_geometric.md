---
id: MPC-3
title: MPC-3 — Pressure-geometric cascade (Riesz, Vector C, USC)
category: MPC
status: conjectured
confidence: 0.80
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [MPC-1]
supports: [MPC-4, OBS-03, OBS-04, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_3.md (386 lines)
verification:
  method: canon-synthesis + Riesz-kernel singular-integral analysis
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [MPC-3, pressure, Riesz, Vector-C, USC, Strand-C, Poisson, turbulent-waters]
---

# MPC-3 · Pressure-geometric cascade

## Purpose

Strand C of the BRAID: pressure-geometric attack via Riesz
representation of the pressure Hessian + singular-integral
estimates.  386 lines in canon.

## Structure

**§3.1–3.14 Setup:**
Pressure Poisson $-\Delta p = |S|^2 - |\omega|^2/2$ and Riesz
kernel representation
$$p(x) = -(-\Delta)^{-1}(|S|^2 - |\omega|^2/2).$$
Pressure Hessian at a point:
$$\partial_{\hat e}^2 p(0) = I_{\mathrm{near}}(r_0) + I_{\mathrm{far}}(r_0) - f(0)/3$$
where the near-field $I_{\mathrm{near}}$ is a Taylor expansion
to $O(r_0^3)$ and the far-field $I_{\mathrm{far}}$ is a singular
Riesz integral.

**§3.15 Riesz Obstruction (V.4):** see OBS-03.  Pressure Hessian
sign undetermined by Riesz representation + $L^2$ bounds alone.

**Vector C (unnamed section / "USC Vector"):**  Upper-semi-
continuity of $\gamma_\infty$ at constants equivalent to bounded
Liouville.  See OBS-04.  Sharpens OBS-02's non-commutation to an
equivalence.

## Status notes

Conjectured composite.  Strand C's own content is the
pressure/Riesz machinery; V.4 + V.4.2 USC are the derived
obstructions that close the strand's standalone approach.

## Dependencies in context

Depends on MPC-1 (shared notation for $Q$, $\rho$, $\omega$,
$S$).

Supports OBS-03, OBS-04, THR-04.

## Citations

- **MASTER_PROOF_CHAIN_3.md**, turbulent_waters canon.
- **Stein, Singular Integrals** — Riesz-kernel machinery.

## History

Canon 2026-04-14..17.  Live corpus 2026-04-22.
