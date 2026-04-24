---
id: INS-02
title: L^{3,∞} stationary NS Liouville theorem (Part I, Nahiru 2026)
category: INS
status: speculative
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [AK-01, AK-03, AK-09, AK-28, AX-01, CORR-03, CORR-04, DEF-01, LEM-01, LEM-02, LEM-03, LEM-04, LEM-05]
supports: [INS-01, INS-05, INS-06, INS-07, INS-08, INS-09, INS-12, INS-13, INS-14, INS-15, INS-16, THR-01, THR-05]
supersedes: [cc52d85c-era/INS-01]
cross_citations:
  - label: Draft 12 Theorem 2.1
    ref: official/PROOF_FINAL_DRAFT12.tex, lines 189-198
  - label: Draft 11
    ref: navier_stokes/PROOF_FINAL_DRAFT11.tex (1491 lines, 28 pages, submission-state "best draft" pre-official)
  - label: CNY 2024
    ref: "DOI 10.1088/1361-6544/ad1efc (Nonlinearity 37, Paper No. 035007)"
    note: Independent re-derivation; shares core mechanism (hat-weight, Bogovskii, Caccioppoli). L^{3,∞} embeds into their annular growth framework.
  - label: CY 2026
    ref: arXiv:2603.23833
    note: Near-simultaneous submission (2026-03-25, 3 days before cc52d85c); first author Youseung Cho; related terrain.
  - label: KNSS 2009
    ref: arXiv:0709.3599
    note: Axi-symmetric Liouville (§5); general 3D case completed here. CORR-03.
  - label: Galdi 2011
    ref: "Galdi, An Introduction to the Mathematical Theory of the NS Equations (Springer Monographs 2011)"
    note: Testing framework used in Step 8 (finite Dirichlet → v = 0).
verification:
  method: multi-round adversarial council + independent re-derivation (CNY 2024)
  rounds: 8
  adversarial_vectors: 26
  independent_rederivation: CNY 2024 — L^{3,∞} embeds into their annular growth framework
  machine_verification: pending
lean_ref: GUNS.ClassicalPath.Inherit.liouville_tree_a (Tree A NSProof.PartI.liouville, modulo caccioppoli_obligation + odeContradiction_obligation + dirichletIntegralZero_obligation)
tags: [Part-I, Liouville, L3inf, Lorentz, stationary, hat-function, Bogovskii, Caccioppoli, central-theorem]
---

# INS-02 · L^{3,∞} stationary NS Liouville theorem (Part I)

## Statement

Let $v : \mathbb{R}^3 \to \mathbb{R}^3$ be a smooth
divergence-free vector field satisfying the stationary
Navier–Stokes equations

$$-\nu \Delta v + (v \cdot \nabla) v + \nabla p = 0, \quad \nabla \cdot v = 0,$$

on all of $\mathbb{R}^3$, with $v \in L^{3,\infty}(\mathbb{R}^3)$.
Then $v \equiv 0$.

**Key exponents at $p = 2$:** $\beta = 4/3$, $\alpha = 2/3$,
$\gamma = -1/4$.

## Canonical Lean form

```lean
theorem NSProof.PartI.liouville :
    ∀ v : R3 → R3, ContDiff ℝ ⊤ v → DivergenceFree v →
      SatisfiesStationaryNS v → InLorentz_3_inf v →
      v = 0 := sorry
```

(Exact signature in Tree A at `NSProof/PartI/Liouville.lean:1007`,
proved modulo three sorried obligations: `caccioppoli`,
`odeContradiction`, `dirichletIntegralZero`.)

## Method (8-step chain, Draft 12 §2)

1. **Hat-function weighted energy** $\mathcal{E}(\rho) = \int |\nabla v|^2
   \varphi(|x|/\rho)\, dx$ on fixed-ratio annuli $A(\theta\rho,
   \rho)$, with $\varphi$ piecewise linear (LEM-04).  Key:
   $\mathcal{E}'(\rho) \geq \frac{\theta}{(1-\theta)\rho} D(\rho)$
   where $D(\rho) = \|\nabla v\|_{L^2(A)}^2$.

2. **Pressure elimination via Bogovskii** (LEM-02).  Test
   function $w = v\psi - \mathcal{B}[v \cdot \nabla\psi]$ is
   divergence-free, compactly supported; $\int \nabla p \cdot w\, dx = 0$.

3. **Caccioppoli inequality** (LEM-01).  Both cross-term and
   convective remainders kept **sublinear** in $D$ — the
   Draft-9 restructuring that eliminated the Case A/B absorption
   gap (retired as AK-28).

4. **Lorentz layer-cake** (LEM-03, AX-01).
   $\|v\|_{L^r(A)} \leq CM\rho^{3/r - 1}$ for $r \in (0, 3)$.

5. **Gagliardo-Nirenberg interpolation** (LEM-05) on reference
   annulus + rescaling.  Scaling cancellation $3 - 3a/p - b = 0$.
   Combined estimate:
   $$\mathcal{E}(\rho) \leq C_0 M \rho^{-1/2} D(\rho)^{1/2} + C_1 M^3 \rho^{-1} + C_2 M^a \rho^\gamma D(\rho)^b$$
   with $\gamma = (3 - 2p)/(6 - p) < 0$ for $p > 3/2$.

6. **ODE reduction**.  For large $\rho$ where $\mathcal{E}(\rho) \geq
   2C_1 M^3/\rho$, absorb constant term; use $D \geq 1$.  Both
   sublinear terms give $D^{1/2} \leq D^b$ for $p \leq 12/5$.
   Result:
   $$\mathcal{E}'(\rho) \geq c \rho^{-\alpha} \mathcal{E}(\rho)^\beta,$$
   $\beta = 2(6-p)/(3(6-2p))$, $\alpha = (24 - 10p)/(3(6 - 2p))$;
   $\beta > 1$ and $\alpha < 1$ for all $p \in (3/2, 3)$ by
   algebraic identity.  At $p = 2$: $\beta = 4/3$, $\alpha = 2/3$.

7. **Integration → contradiction**.  LHS $\int \mathcal{E}'/\mathcal{E}^\beta
   \leq \mathcal{E}(\rho_0)^{1-\beta}/(\beta - 1) < \infty$ (bounded
   since $\beta > 1$).  RHS $\int \rho^{-\alpha}\, d\rho \to \infty$
   as $R \to \infty$ (diverges since $\alpha < 1$).
   Contradicts; therefore $\int_{\mathbb{R}^3} |\nabla v|^2 dx < \infty$.

8. **Finite Dirichlet → $v = 0$**.  Test stationary equation
   against $v \varphi_R^2$; three cross-terms $I_1, I_2, I_3$
   (convective, pressure via Calderón–Zygmund, viscous) each
   $\to 0$ as $R \to \infty$.  Hence $\nu \int |\nabla v|^2 = 0$;
   $\nabla v = 0$; constant cannot lie in $L^{3,\infty}$; hence
   $v \equiv 0$.

## Sharpness

At $p = 3/2$: $\beta = \alpha = 1$ exactly (polynomial growth;
no contradiction).  **Landau solutions** $v \sim c/|x|$ are
smooth outside the origin, lie exactly in $L^{3,\infty}$, and
**confirm sharpness** — they are excluded only by global
smoothness.

**4D extension (INS-15).**  The dimensional discriminant
$\gamma(n, p) = -(n-4)(n-2p)/(2n - p(n-2))$ gives $\gamma = 0$
borderline at $n = 4$, $p = 5/2$; logarithmic integral divergence
still contradicts bounded LHS.  $n \geq 5$ provably fails
(AK-07).

**W^{1,2}_{loc} extension (INS-16).**  Sharp function-space
threshold for weak-solution generalization.

## Status notes

The central mathematical content of the NS program is Part I,
this theorem.  Informal verification is strong (8 rounds, 26
adversarial vectors; independent re-derivation by CNY 2024).
Lean formalization is in active development at Tree A
`NSProof/PartI/Liouville.lean`; three open obligations
(`caccioppoli`, `odeContradiction`, `dirichletIntegralZero`) must
be discharged for a `verified` status upgrade.

## Dependencies in context

Depends on LEM-01 (Caccioppoli), LEM-02 (Bogovskii), LEM-03
(Lorentz layer-cake / annular), LEM-04 (hat function), LEM-05
(Gagliardo-Nirenberg), AX-01 (layer-cake embedding underlying
LEM-03).

Supports: INS-01 (Clay target), INS-05 (Part II composition),
INS-06 (Scaling-Liouville sharpening), INS-07 (geometric
content / scale-coherent stretching), INS-08 (retreating
vorticity picture in Part II), INS-09 (three-incompatible-
constraints geometry), INS-15 (4D Liouville corollary), INS-16
(W^{1,2}_loc extension).

**Supersedes** the cc52d85c-era INS-01 (retired), which had the
same mathematical content but was authored against the narrower
framing (Draft 10 state, no Part II synthesis, no audit of the
L^{3,∞} inheritance gap).

## Citations

- **Nahiru 2026**, Draft 12 (ongoing audit), Draft 11 (28 pp,
  submission-state "best draft" of March 28).
- **Cho-Neustupa-Yang 2024**, *Nonlinearity* 37.
- **Cho-Yang 2026**, arXiv:2603.23833 (near-simultaneous).
- **KNSS 2009**, *Acta Math.* 203 (axi-symmetric only; CORR-03).
- **Galdi 2011**, §15.3 (testing).

## History

Core argument present by Draft 5 (cc52d85c session, Mar 29);
Caccioppoli restructuring (Draft 9) eliminated the Case A/B
absorption gap (AK-28) in session `cc52d85c` — three independent
council agents converged on the same diagnosis and fix.  Paper
Drafts 10-12 refined the presentation (298d0965, Apr 9–12).
Lean stubs from Tree A formalization session `0872111a` (Apr 3-5);
GUNS bridge 2026-04-17.  Live corpus 2026-04-22 replacing the
cc52d85c-era entry.
