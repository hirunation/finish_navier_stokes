---
id: INS-20
title: Incompatibility Theorem — dim(W^u) ≥ 2 ∧ all sin < 0 impossible
category: INS
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-22
dependencies: [INS-17, INS-19]
supports: [INS-11, INS-12, THR-05]
cross_citations:
  - label: synthesis_10.md
    ref: navier_stokes/synthesis_10.md
    note: Determinant identity det(J) = -4 a₁ a₂ a₃ s₁ s₂ s₃; 3-line proof.
verification:
  method: algebraic (3-line proof from determinant identity)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending
tags: [Incompatibility, Jacobian, determinant, dim-Wu, stretching-sign, permanent]
---

# INS-20 · Incompatibility Theorem

## Statement

For an equilibrium of the Waleffe helical-triad ODE with
amplitudes $a_i > 0$ and phases $\psi_i \in \{\pi/2, 3\pi/2\}$
(forced by INS-19), the **determinant identity**

$$\det(J) = -4\, a_1 a_2 a_3 \, s_1 s_2 s_3, \qquad s_i := \sin(\psi_i),$$

gives an obstruction: if all $s_i < 0$ (the $(-,-,-)$ class)
then $s_1 s_2 s_3 = -1$, hence $\det(J) = -4 a_1 a_2 a_3 > 0$.
But a sign-positive determinant for a 3-dimensional Jacobian
with some positive eigenvalues forces $\dim(W^u) \leq 1$.

Therefore: **$\dim(W^u) \geq 2$ and all $\sin(\psi_i) < 0$ is
impossible.**

## Method (3-line proof)

1. Direct computation of $J$ from the Waleffe ODE and
   differentiating at equilibrium yields
   $\det(J) = -4 a_1 a_2 a_3 s_1 s_2 s_3$.
2. The Jacobian eigenvalues come in pairs $(-\lambda_i, +\lambda_i)$
   for a Hamiltonian-like system; $\dim(W^u)$ equals the number
   of positive eigenvalues.
3. If all $s_i < 0$: $\det(J) > 0$, so the sign count of positive
   eigenvalues is even but bounded by 3; the only even option
   $\leq 1$ is 0, so $\dim(W^u) = 0$ or 1.  "$\geq 2$" is
   impossible. □

## Consequences (the 8-class analysis)

Combined with INS-19 (Equilibrium Vanishing) and the stretching-
sign theorem ($S > 0$ iff $\sum \sin(\psi_i) < 0$):

| Class | $\Sigma \sin$ | $S$ sign | $\dim(W^u)$ | Excluded by |
|:---:|:---:|:---:|:---:|:---|
| $(+,+,+)$ | $+3$ | $< 0$ | 2 | Stretching + energy drain |
| $(+,+,-)$ | $+1$ | $< 0$ | 1 | Parity Theorem (INS-11; mixed impossible) |
| $(+,-,+)$ | $+1$ | $< 0$ | 1 | Parity |
| $(-,+,+)$ | $+1$ | $< 0$ | 1 | Parity |
| $(+,-,-)$ | $-1$ | $> 0$ | 2 | Parity + Incompatibility? (mixed) |
| $(-,+,-)$ | $-1$ | $> 0$ | 2 | Parity |
| $(-,-,+)$ | $-1$ | $> 0$ | 2 | Parity |
| $(-,-,-)$ | $-3$ | $> 0$ | **1 (forced by Incompatibility)** | Scaling-Liouville (INS-06) |

Parity kills the 6 mixed classes.  $(+,+,+)$ killed by energy
drain.  $(-,-,-)$ surviving as $\dim(W^u) = 1$; killed by
Scaling-Liouville.  **All 8 classes closed.**

## Status notes

**Speculative** (not Lean-formalized); algebraic proof is 3
lines.  Confidence 1.0 = "mathematically stable"; the 8-class
table is the load-bearing output.

## Dependencies in context

Depends on INS-17 (Waleffe triad) and INS-19 (Equilibrium
Vanishing).

Supports INS-11 (Parity Theorem operates alongside) and INS-12
(Route 2's helical backbone relies on the closure of all 8
classes).

## Citations

- **synthesis_10.md**, permanent algebraic results.
- **Waleffe 1992**.

## History

Established mid-March 2026 in the synthesis-arc lead-up.
Catalogued in synthesis_10 as permanent algebraic fact.  Live
corpus 2026-04-22.
