---
id: MPC-1
title: MPC-1 — Bounded Liouville (57-link vortical coupling cascade)
category: MPC
status: conjectured
confidence: 0.80
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [INS-07, LEM-11]
supports: [INS-03, MPC-2, MPC-3, MPC-4, OBS-01, THR-02, THR-04]
cross_citations:
  - label: Canonical source
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_1.md (199 lines)
verification:
  method: canon-synthesis (57 verified links)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [MPC-1, vortical-coupling, cascade, Bounded-Liouville, 57-links, Strand-A, turbulent-waters]
---

# MPC-1 · Bounded Liouville (57-link vortical coupling cascade)

## Target theorem

**Bounded Liouville** (conjectured): every bounded smooth
divergence-free stationary NS solution on $\mathbb{R}^3$ is a
constant vector field.

## The 57-link chain (summarized by theme)

**Links 1–6 (Foundational setup):**  Bernoulli identity
$\Delta Q - v \cdot \nabla Q = |\omega|^2$ (1), BMO control
$\|Q\|_{\mathrm{BMO}} \lesssim M^2$ (2), enstrophy bound
$\int_{B_R} |\omega|^2 \leq C_M R^2$ (3), zero volume density
(4), almost periodic ⟹ constant (5), co-linear rigidity (6).

**Links 7–8 (Vectorial decomposition):** Co-planar rigidity (7),
frame decomposition $\nabla Q = -\rho b\, e_3 - \nabla\rho \times
\xi - \rho\,\nabla \times \xi$ (8).

**Links 9–14 (Conservation and flux):** Coupling equation (9),
enstrophy conservation law $|\omega|^2 = -\nabla \cdot (\rho b\,
e_3 + Q v)$ (10), radial flux identity (11), spherical-mean ODE
(12), tail coupling constant $\mathcal{C}_\infty(x_0)$ on golden
shells (13), **tail-coupling closure theorem**: $\sup_{x_0}
\mathcal{C}_\infty < \infty \Rightarrow \sup Q < \infty$ via
six-step proof (14).

**Links 15–21 (Master identity and boundedness):**  $U\rho\phi_R^2$
weighting (15), master identity (16), **lower-bound mirror fails**
(17) — no $\inf Q$ from this route; see AK analog, pressure
lower bound via positive Green kernel (19), uniform boundedness
below (20), master identity reduces to 3 explicit terms (21).

**Links 22–28 (Harmonic pairing and matched-pair structure):**
Beam-Fourier slice $F_{x_0}(R) = \sqrt{4\pi} R^2 a_{0,0}(R)$ (22),
matched-pair decomposition $a_{0,0} = \frac{1}{\sqrt{4\pi}}
\sum_{\ell, m} \beta_{\ell, m}(R) \gamma_{\ell, m}(R)$ (23),
geometric source equation (24), **curl-divergence cancellation**
$\nabla \cdot (g e_3) = -\Delta Q$ (25), matched-pair ODE is
conservation law (26), **Path B equivalence**: $\{E, G, D,
\int|S|^2\}$ all decay together (27), production-dissipation
identity $\int_{B_R} \alpha \rho^2 = \int_{B_R} |\nabla\omega|^2 +
O(R)$ (28).

**Links 29–34 (Equivalence and hull theory):**  Equivalence chain
$E(R) = o(R^{2-\delta}) \iff D_Q = o(R^2) \iff \int \alpha\rho^2
= o(R^2)$ (29), tracelessness $\int_{S^2} \alpha\, d\sigma(\xi) =
0$ (30), **translation hull compactness** Krylov-Bogolyubov (31),
Wiener ergodic + center-$L^2$ smallness (32), Munn-ergodic (33),
**three-fold synthesis** alignment = conservation cancellation =
ergodic rate (34).

**Links 35–40 (Refinement and Rayleigh quotient):**  Borderline
rate exact $\fint_{B_L} |\alpha \rho^2| = O(L^{-1})$ (35), one-
sided polynomial gain (36), **Constantin nonlocal kernel
representation** (37), strain $L^2$ bound $\int_{B_R} |S|^2 \leq
C(M) R^2$ (38), center-averaged alignment decorrelation (39),
structural obstruction to uniform pointwise alignment (40).

**Links 41–45 (Dichotomy and ergodic layer):**  Koch-Tataru UCP
dichotomy — $v$ constant or $|\omega| > 0$ everywhere (41), NS
Liouville under uniform limit at infinity (42), **Layer-2
reduction**: $|\mathcal{C}_\mathcal{O}| = 1 \iff$ uniform limit
$\iff$ unique ergodicity (43), Path C: every ergodic measure
supported on constants (44), **Grand Unification**: unique
ergodicity closes both layers simultaneously (45).

**Links 46–57 (Convergence and closure obstruction):**  Eight-
route convergence analysis (46), hull-constant dichotomy (47),
Lipschitz-in-center (48), all eight routes → same $\varepsilon$-
question (49), strain-flux identity (50), center-divergence-free
(51), center-curl (52), spherical cancellation (53), **Final
sub-question equivalence** (54), center-averaged strain bounds
via Fubini/coarea (55–56), **Closure Obstruction V.1** (57; see
OBS-01).

## Key milestones within MPC-1

- **§31 Translation Hull Theorem** (see INS-07).
- **§43 Layer-2 reduction / Crossing γ** — the grand equivalence
  proving unique ergodicity = bounded Liouville.
- **§57 Closure Obstruction** — terminates the cascade: no
  combination of the 56 prior identities + elementary tools
  (Cauchy-Schwarz, Hodge, Helmholtz, coarea) closes the Final
  Sub-Question.  See OBS-01.

## Status notes

**Conjectured** as a composite whole.  Individual links are each
proved at canon level.  MPC-1's conclusion (bounded Liouville)
is the hypothesis the rest of the BRAID attacks via spectral,
pressure, weaving, and icosahedral paths.  $\equiv$ Grand
Unification Conjecture (INS-03) via the four-forms equivalence
(INS-08).

## Dependencies in context

Depends on INS-07 (Translation Hull Theorem — Link §31) and
LEM-11 (Krein-Rutman — upstream of the matched-pair structure).

Supports INS-03 (Grand Unification), OBS-01 (Closure Obstruction
at Link 57), THR-02 (hull-ergodic thread), THR-04 (obstruction
wall).

## Citations

- **MASTER_PROOF_CHAIN_1.md**, turbulent_waters canon.
- **BRAID_1 §III, §IV** (Movements synthesizing MPC-1 with
  MPC-2).

## History

Canon-frozen 2026-04-14..17 in session `277f7666`.  Live corpus
2026-04-22.
