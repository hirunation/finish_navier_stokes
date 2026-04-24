---
id: INS-19
title: Equilibrium Vanishing Theorem — cos(ψ_i) = 0 at every equilibrium
category: INS
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-22
dependencies: [INS-17]
supports: [INS-11, INS-20, THR-05]
cross_citations:
  - label: synthesis_10.md
    ref: navier_stokes/synthesis_10.md
    note: Permanent algebraic results section; 2-line proof from phase-angle differentiation.
verification:
  method: algebraic (2-line proof)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending
tags: [equilibrium, phase-vanishing, Waleffe-triad, algebraic, permanent]
---

# INS-19 · Equilibrium Vanishing Theorem

## Statement

At every equilibrium of the Waleffe helical-triad ODE system
with amplitudes $a_i > 0$, the cosines of the phase angles
$\psi_i$ vanish:

$$\cos(\psi_i) = 0 \quad \text{for all } i.$$

Equivalently: every equilibrium has $\psi_i \in \{\pi/2, 3\pi/2\}$
modulo $2\pi$, i.e., the sine component $\sin(\psi_i) \in
\{+1, -1\}$.

## Method (2-line proof)

The phase equation in the Waleffe system takes the form

$$\dot\psi_i = \frac{\partial}{\partial a_i} H(a, \psi),$$

where $H$ is a Hamiltonian-like function of amplitudes and
phases.  Differentiating, $H$ has separable structure
$H(a, \psi) = f(a) \prod_i \cos(\psi_i)$, so $\dot\psi_i \propto
\cos(\psi_i) \cdot \prod_{j \neq i} \cos(\psi_j)$.  At
equilibrium $\dot\psi_i = 0$; since $a_i > 0$, the only way for
all three to vanish simultaneously is $\cos(\psi_i) = 0$ for
all $i$. □

## Consequences

- **8 equilibrium classes.**  $\sin(\psi_i) \in \{+1, -1\}$
  across three phases gives $2^3 = 8$ sign combinations.
- **Classifies all equilibria algebraically** (INS-20 details
  which classes are stable / unstable / dim($W^u$) = 1 vs 2).
- **Feeds the Parity Theorem INS-11**: the constraint
  $\psi_i \in \{\pi/2, 3\pi/2\}$ + triad balance restricts to
  uniform $(+,+,+)$ or $(-,-,-)$ — mixed configurations
  impossible.

## Status notes

**Speculative** in the strict methodology sense (not Lean-
formalized).  The 2-line algebraic proof is textbook; confidence
1.0 reflects "mathematically stable" rather than "Lean-verified".
Informally verified across the synthesis_1..10 arc.

## Dependencies in context

Depends on INS-17 (Waleffe triad decomposition supplies the
phase-angle structure).

Supports INS-11 (Parity Theorem) and INS-20 (Incompatibility
Theorem).  Foundational for the 8-class equilibrium analysis.

## Citations

- **synthesis_10.md**, navier_stokes corpus, section "Permanent
  algebraic results".
- **Waleffe 1992**.

## History

Established in synthesis_1..5 era (mid-March).  Catalogued as
permanent algebraic fact in synthesis_10 (v0.78).  Live corpus
2026-04-22.
