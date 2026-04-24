---
id: THR-02
title: Hull-ergodic arc — Translation Hull → Four Forms → Grand Unification
category: THR
status: conjectured
confidence: 0.75
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [INS-03, INS-07, INS-08, LEM-10, LEM-11, MPC-1, MPC-2]
supports: []
cross_citations:
  - label: BRAID Movements III-IV
    ref: turbulent_waters/canon/BRAID_1.md
verification:
  method: canon-synthesis (BRAID)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
tags: [thread, hull-ergodic, Grand-Unification, BRAID, narrative, Strand-A-plus-B-plus-C]
---

# THR-02 · Hull-ergodic arc

## Narrative

The BRAID's positive route to bounded Liouville runs through
the **translation hull** and culminates in the **Grand
Unification Conjecture**.

1. **Translation Hull Theorem (INS-07)**.  Every bounded smooth
   stationary NS solution has a translation hull containing at
   least one constant field.  Compactness (Krylov-Bogolyubov,
   LEM-10) + Krein-Rutman eigenfunction (LEM-11) + Wiener
   ergodic averaging yields the existence.  Dichotomy:
   $|\mathcal{C}_\mathcal{O}| = 1$ (uniquely ergodic) or
   $\mathcal{C}_\mathcal{O}$ is a perfect set.

2. **Four Equivalent Forms (INS-08)**.  BRAID Movement IV
   synthesizes the equivalence chain via four transformations
   $T_1, T_2, T_3, T_4$:

   $$\mathrm{FormA} \iff \mathrm{FormB} \iff \mathrm{FormC} \iff \mathrm{FormD} \iff \mathrm{BoundedLiouville}.$$

   FormA: alignment condition.  FormB: $\gamma_\infty \equiv 0$
   (production-dissipation conservation).  FormC: unique
   ergodicity.  FormD: strain $L^2$ improvement.

3. **Grand Unification Conjecture (INS-03)**.  FormC holds
   unconditionally for every bounded smooth stationary NS
   solution.  Conjectural.  Equivalent to bounded Liouville.

## Blockers

The obstruction wall (THR-04) currently blocks direct proof.
OBS-02 (exchange-of-limits) + OBS-04 (USC) rule out semi-
continuity attacks.  OBS-03 (Riesz) rules out pressure-Poisson-
only attacks.  OBS-05 (Carleman) rules out UCP substitution.
OBS-06 (Birman-Schwinger) rules out linear-spectral.

Alternatives:
- **Icosahedral route (THR-03)**: close OBS-07..09 via INS-04
  (Icosahedral Hypothesis on $\varphi$-shells).
- **MPC-6 strain-ratio reduction**: alternative closure via
  $r(x) < 1/4$ pointwise.

## KNSS chain to Clay target

If Grand Unification holds, bounded Liouville follows; Tree A's
`mainTheorem` + the KNSS chain (AX-02, AX-03, AX-04, LEM-08,
LEM-09) then closes INS-01 (Clay target) — **modulo CORR-07's
Step-2b $L^{3,\infty}$-inheritance gap**.

## Dependencies in context

Depends on INS-03, INS-07, INS-08, LEM-10, LEM-11, MPC-1, MPC-2.

## History

BRAID synthesis 2026-04-14..17 in session `277f7666`.  GUNS
Step-4 formalization 2026-04-17.  Live corpus 2026-04-22.
