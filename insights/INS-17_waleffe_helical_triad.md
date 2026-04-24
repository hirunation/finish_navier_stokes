---
id: INS-17
title: Waleffe helical triad decomposition (foundational algebra)
category: INS
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-15
dependencies: [AK-35, DEF-03]
supports: [INS-04, INS-06, INS-11, INS-19, INS-20, LEM-12, MPC-5, OBS-08, OBS-09, THR-03]
cross_citations:
  - label: Waleffe 1992
    ref: "Waleffe, F., The nature of triad interactions in homogeneous turbulence, Phys. Fluids A 4 (1992) 350–363"
    note: Classical helical-basis decomposition of incompressible vector fields.
verification:
  method: classical (Waleffe 1992, standard turbulence reference)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: n/a
tags: [Waleffe, helical-basis, triad, Fourier, foundational, classical]
---

# INS-17 · Waleffe helical triad decomposition

## Statement

Every incompressible vector field $v : \mathbb{R}^3 \to \mathbb{R}^3$
admits a **helical decomposition** in Fourier space: for each
mode $k \in \mathbb{R}^3 \setminus \{0\}$,

$$\hat v(k) = a_+(k) h_+(k) + a_-(k) h_-(k),$$

where $h_\pm(k)$ are the **helical basis vectors** (eigenfunctions
of $\mathrm{curl}$: $i k \times h_\pm(k) = \pm |k| h_\pm(k)$,
$\|h_\pm(k)\| = 1$, $k \cdot h_\pm(k) = 0$).

Interaction triads satisfy $k + p + q = 0$.  The nonlinear NS
interaction decomposes into **8 triad types** indexed by
$(\sigma_k, \sigma_p, \sigma_q) \in \{+, -\}^3$, with
trilinear interaction coefficient

$$C_{\sigma_k \sigma_p \sigma_q}(k, p, q) = (k \cdot h_{\sigma_p}(p))(h_{\sigma_k}(k) \cdot h_{\sigma_q}(q) \times h_{\sigma_p}(p))$$

(and variants).  The interaction is **homogeneous of degree 0 in
$k$** (a fact that powers INS-06 Scaling-Liouville).

## Usage in NS program

Foundational for:

- **INS-04** (Icosahedral Hypothesis): triad decomposition +
  $\varphi$-adic Fibonacci shells organize the resonance structure.
- **INS-06** (Scaling-Liouville): kernel degree-0 homogeneity is
  the key input.
- **INS-11** (Parity Theorem): triad sign classes are the object
  being enumerated.
- **INS-19** (Equilibrium Vanishing): phase structure of
  equilibria inherited from triad algebra.
- **INS-20** (Incompatibility Theorem): determinant identity
  depends on the triad Jacobian.
- **OBS-08, OBS-09**: helicity-sector and twist-writhe
  obstructions operate in the Waleffe basis.

## Status notes

**Verified** (classical; Waleffe 1992 is a standard reference in
turbulence theory).  Not a NS-specific novelty — it is
foundational infrastructure.  Not Lean-formalized in GUNS (not
needed at the Clay-target level).

## Dependencies in context

Standalone (foundational).  Supports the many entries listed
above.

## Citations

- **Waleffe 1992**, *Phys. Fluids A* 4, 350–363.
- **Frisch, *Turbulence*** (Cambridge, 1995), §6.3.
- Standard references: **Cambon-Rubinstein-Godeferd 2004**,
  **Cheng-Constantin-Gallavotti 1995** in the mathematical-
  analysis literature.

## History

Classical (1992).  Nahiru's use in the NS program dates to the
earliest synthesis files (synthesis_1..3, Mar 12–15).  Live
corpus 2026-04-22.
