---
id: LEM-14
title: Ożański-Palasek 2022 — axisymmetric L^{3,∞} endpoint closed via Nazarov-Ural'tseva Harnack
category: LEM
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [LEM-13]
supports: [LEM-06, INS-21, THR-03]
cross_citations:
  - label: Ożański-Palasek 2022
    ref: "arXiv:2210.10030; Annals of PDE (2023)"
    note: First closure of the L^{3,∞} endpoint in the axisymmetric case.
  - label: Nazarov-Ural'tseva 2012
    ref: "Nazarov, A. I.; Ural'tseva, N. N., The Harnack inequality and related properties of solutions to elliptic and parabolic equations with divergence-free lower-order coefficients, Algebra i Analiz 23 (2011) 136-168"
    note: Parabolic Harnack for scalar equations with divergence-free drift — the engine.
verification:
  method: literature fact (peer-reviewed in Annals of PDE)
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: Annals peer review
  machine_verification: n/a
tags: [Ozanski-Palasek, axisymmetric, Nazarov-Uraltseva, Harnack, L3inf, endpoint-closed, swirl]
---

# LEM-14 · Ożański-Palasek 2022 — axisymmetric L^{3,∞} endpoint closed

## Statement

Let $u$ be a strong **axisymmetric** solution of the 3D
Navier–Stokes equations on $[0, T] \times \mathbb{R}^3$ with

$$\|u\|_{L^\infty([0, T]; L^{3,\infty}(\mathbb{R}^3))} \leq A,$$

$A \gg 1$.  Then

$$\|D^k u(t)\|_{L^\infty} \leq t^{-(1+k)/2} \exp \exp A^{C_k} \quad \forall t \in (0, T], \ k \geq 0.$$

In particular, axisymmetric $L^{3,\infty}$-bounded solutions are
smooth — the axisymmetric analog of Phuc 2015's open endpoint.

## Method — Nazarov-Ural'tseva Harnack on the swirl

The core tool is **Nazarov-Ural'tseva's parabolic Harnack
inequality** (Algebra i Analiz 23, 2011) for **scalar** equations
with **divergence-free lower-order coefficients**.

In axisymmetric NS, the swirl component $u_\theta$ satisfies

$$(\partial_t + u_r \partial_r + u_z \partial_z) (r u_\theta) = \text{diffusion terms}$$

where the drift $(u_r, u_z)$ is divergence-free (axisymmetric
incompressibility).  Nazarov-Ural'tseva Harnack applies directly
to $r u_\theta$, yielding pointwise bounds from integral bounds.

## Why the non-axisymmetric case doesn't follow

**No scalar analog of $r u_\theta$ exists in general 3D.**

In axisymmetric NS, the radial symmetry reduces the vector
equation to a coupled system where one component ($r u_\theta$,
the swirl times radius) satisfies a scalar equation.
Nazarov-Ural'tseva Harnack applies to scalar equations; it does
not apply to coupled vector systems without structure.

For general-3D NS, the velocity $u$ is a vector; no obvious
scalar reduction preserves the divergence-free lower-order
structure required by Nazarov-Ural'tseva.

Candidate scalar quantities:
- $|u|^2$: parabolic inequality with sign-indefinite source
  $-|\nabla u|^2 + u \cdot \nabla p$.
- Kinetic-energy flux $u \cdot \omega$: not conserved for
  viscous NS.
- Angular momentum $(x - x_0) \times u$: doesn't satisfy scalar
  equation in general.

The absence of such a scalar reduction is precisely the
technical barrier Phuc 2015 and the subsequent literature have
not overcome.

## Relevance to LEM-06

Ożański-Palasek's closure **does not** apply to general-3D
Navier-Stokes.  It applies in the axisymmetric case.  Draft 12
aims at general-3D, so Ożański-Palasek is not a direct rescue.

However: if Route A is chosen (strengthen Draft 12's hypothesis
to axisymmetric Schwartz data), Ożański-Palasek gives the
$L^{3,\infty}$ inheritance for free.  Part II closes under the
axisymmetric restriction.

## Significance

First closure of the $L^{3,\infty}$ endpoint in any case.
Establishes that the endpoint IS closable when the right
scalar-reduction structure is present.  Motivates **Route C**
(find a non-axisymmetric scalar analog) as a research program.

## Dependencies in context

Depends on LEM-13 (Phuc 2015, the endpoint framing).

Supports LEM-06 (Ożański-Palasek is relevant if Route A is
taken), INS-21 (weighted-moment rescue — may benefit from a
similar Harnack approach in the non-axisymmetric case), THR-03
(icosahedral thread — represent-theoretic attacks on
non-axisymmetric analogs).

## Citations

- **Ożański-Palasek 2022**, arXiv:2210.10030, Annals of PDE
  (2023).
- **Nazarov-Ural'tseva 2012**, *Algebra i Analiz* 23(1), 136–168.
- **Seregin-Šverák 2009** (axisymmetric stationary $L^{3,\infty}$
  Liouville — antecedent to Ożański-Palasek).
- **Chen-Strain-Tsai-Yau 2008/2009** (axisymmetric blow-up rate
  lower bounds).

## History

Literature fact as of 2022.  Catalogued 2026-04-22 during
session-1 focused attack on LEM-06 as a boundary marker.
