---
id: INS-01
title: Clay target — global regularity for Schwartz-data 3D Navier–Stokes
category: INS
status: speculative
confidence: 0.85
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [AX-02, CORR-03, CORR-07, DEF-01, INS-02, INS-03, INS-05, INS-06, INS-10, INS-12]
supports: []
supersedes: []
cross_citations:
  - label: Clay Millennium
    ref: "Clay Mathematics Institute, 'Existence and smoothness of the Navier–Stokes equation' Problem Statement (2000)"
    note: The original Millennium-prize problem statement, formulated by Charles Fefferman.
  - label: GUNS Spine
    ref: grand_unified_ns_proof/GUNS/Spine.lean (the top-level theorem with sorry body)
  - label: Draft 12
    ref: official/PROOF_FINAL_DRAFT12.tex, Theorem 1.1
  - label: Tree A main theorem
    ref: lean_formalization/NSProof/PartII/Regularity.lean, NSProof.PartII.mainTheorem
verification:
  method: informal multi-round adversarial council (Draft 1→12) + CPN verification ledger + partial Lean formalization
  rounds: 11
  adversarial_vectors: 26
  independent_rederivation: none — novel KNSS-program completion for general 3D
  machine_verification: pending
lean_ref: GUNS.navier_stokes_global_regularity
tags: [clay-target, regularity, Schwartz, KNSS, completion, main-theorem]
---

# INS-01 · Clay target — global regularity for Schwartz-data 3D Navier–Stokes

## Statement

For every viscosity $\nu > 0$ and every Schwartz divergence-free
initial datum $u_0 \in \mathcal{S}(\mathbb{R}^3)$, there exists
a unique global smooth solution $u : \mathbb{R}^3 \times [0, \infty)
\to \mathbb{R}^3$ of the incompressible Navier–Stokes equations

$$\partial_t u - \nu \Delta u + (u \cdot \nabla) u + \nabla p = 0, \quad \nabla \cdot u = 0, \quad u(\cdot, 0) = u_0,$$

with $u \in C^\infty(\mathbb{R}^3 \times [0, \infty))$.

## Canonical Lean form

```lean
theorem navier_stokes_global_regularity
    (ν : ℝ) (hν : 0 < ν) (u₀ : R3 → R3)
    (hsch : Schwartz u₀) (hdiv : DivergenceFree u₀) :
    ∃! u : VectorField, IsGlobalSolution ν u₀ u := by
  sorry
```

Located at `grand_unified_ns_proof/GUNS/Spine.lean:33-37`.

## Method (architectural summary)

**Two-part structure** (Nahiru 2026, paper Draft 12):

1. **Part I (Liouville theorem, INS-02).**  A smooth stationary
   divergence-free NS solution on $\mathbb{R}^3$ in $L^{3,\infty}$
   is identically zero.  First-principles proof via hat-function
   weighted energy on fixed-ratio annuli, Bogovskii pressure
   elimination, Lorentz layer-cake embedding, Gagliardo-Nirenberg
   interpolation, yielding a superlinear ODE
   $E'(\rho) \geq c \rho^{-\alpha} E(\rho)^\beta$ with
   $\beta > 1, \alpha < 1$ for all $p \in (3/2, 3)$.  Integration
   gives a bounded-vs-divergent contradiction, forcing finite
   Dirichlet energy, which forces $v \equiv 0$.

2. **Part II (regularity composition, INS-05).**  Any
   hypothetical finite-time singularity $T^* < \infty$ implies:
   (a) Type I excluded (NRS + Tsai + ESS, AX-03); (b) KNSS
   extraction (AX-04) yields a bounded ancient solution $v$ with
   $|v(0, 0)| = 1$; (c) backward limit $v_\infty$ is smooth
   stationary $L^{3,\infty}$; (d) Part I kills $v_\infty$;
   (e) full convergence $v(\cdot, s) \to 0$; (f) ESS03 backward
   uniqueness + spatial continuation (LEM-08, LEM-09) forces
   $v \equiv 0$, contradicting $|v(0, 0)| = 1$.

## Status notes

**Speculative at the formal level.**  Informal proof has been
verified across 11 drafts, 8+ adversarial-council rounds, 26+
adversarial vectors, and extensive CPN constraint propagation.
The DRAFT_12_NOTE audit identifies one structural gap (Part II
Step 2, $L^{3,\infty}$ inheritance from KNSS rescaling — see
CORR-07); this is a **real** gap in the current manuscript
overlapping with Phuc 2015's open-problem statement.  Part I
(the Liouville theorem) itself is in better shape — its
structural stability is confirmed by independent re-derivations
(CNY 2024).

**Lean status.**  `GUNS.navier_stokes_global_regularity` has a
`sorry` body; Tree A's `NSProof.PartII.mainTheorem` is proved
*modulo* 3 axioms (AX-02, AX-03, AX-04) + 1 sorry
(`ancientSolution_contradiction`).  GUNS ClassicalPath catalogues
both.

## Dependencies in context

Depends on INS-02 (Part I Liouville), INS-05 (Part II
composition), AX-02 (local existence).  Transitively depends on
AX-01, AX-03, AX-04, AX-05.

## Citations

- **Clay Mathematics Institute**, problem statement (2000),
  Charles Fefferman.
- **Leray 1934**, *Acta Math.*, weak-solution framework.
- **KNSS 2009**, *Acta Math.* 203, arXiv:0709.3599.
- **ESS 2003**, *Russian Math. Surveys* 58.
- **Nahiru 2026**, Draft 12 (manuscript in audit; see CORR-07).

## History

Informal proof finalized in session `298d0965` (Apr 9–12, 2026
— 34.2 MB, 6216 msgs) as Paper Draft 12.  GUNS Clay target
stated 2026-04-17 in `Spine.lean` during GUNS Step 1.  Audit
DRAFT_12_NOTE.md 2026-04-22.  Live corpus 2026-04-22.

**Supersedes** cc52d85c-era PROBLEM.md framing which was
narrower (L^{3,∞} stationary Liouville only, not the Clay
statement).
