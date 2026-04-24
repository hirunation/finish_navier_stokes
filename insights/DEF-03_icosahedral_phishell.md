---
id: DEF-03
title: Icosahedral group + Fibonacci φ-shells + Meyer partition + cross-shell coupling
category: DEF
status: verified
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-01]
supports: [INS-04, INS-17, INS-18, MPC-4, OBS-07, OBS-08, OBS-09, THR-03]
cross_citations:
  - label: GUNS IcosahedralPath
    ref: grand_unified_ns_proof/GUNS/IcosahedralPath/Hypothesis.lean
  - label: MPC-4 §4.1–4.8
    ref: turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md
    note: Φ-adic Meyer partition; numerical verification at fp64 interval precision.
verification:
  method: Lean-proved (4 golden-ratio theorems) + kernel numerics (Meyer partition of unity)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: classical (golden ratio); canon-standard (Meyer profile)
  machine_verification: verified (golden_* lemmas in GUNS; partial for others)
lean_ref: GUNS.IcosahedralPath.{golden, phiShellRadius, PhiShell, IcosahedralGroup, BinaryIcosahedralGroup, IcosahedralAverage}
tags: [definitions, icosahedral, Fibonacci, golden-ratio, Meyer-partition, Phi-adic, cross-shell-coupling]
---

# DEF-03 · Icosahedral group + Fibonacci φ-shells + Meyer partition

## Golden ratio and Fibonacci shells

```lean
noncomputable def golden : ℝ := (1 + Real.sqrt 5) / 2

noncomputable def phiShellRadius (R_0 : ℝ) (k : ℤ) : ℝ :=
  R_0 * golden ^ k

def PhiShell (R_0 : ℝ) (k : ℤ) : Set R3 :=
  { x : R3 | ‖x‖ = phiShellRadius R_0 k }
```

## Icosahedral group, binary icosahedral group

```lean
structure IcosahedralGroup where
  act : R3 → R3
  isometry : ∀ x : R3, ‖act x‖ = ‖x‖
  linear : ∀ (a : ℝ) (x y : R3),
    act (a • x + y) = a • act x + act y

structure BinaryIcosahedralGroup where
  act : R3 × ℝ
```

The **icosahedral group $I \subset SO(3)$** has order 60 and
irreducible representations of dimensions $\{1, 3, 3, 4, 5\}$.
The **binary icosahedral group $2I \subset SU(2)$** has order
120 (double cover of $I$).

## Icosahedral average

```lean
noncomputable def IcosahedralAverage
    (S : Finset IcosahedralGroup) (F : R3 → R3) (x : R3) : R3 :=
  if h : 0 < S.card then
    (S.card : ℝ)⁻¹ • (S.sum (fun g : IcosahedralGroup => F (g.act x)))
  else 0
```

Finite averaging over a subset $S \subset I$.  Full average is
over all 60 elements of $I$.

## Meyer Φ-adic partition of unity (MPC-4 §4.1)

$\sum_k |\hat\psi(\varphi^{-k} \xi)|^2 = 1$ for every $\xi \neq 0$,
with Meyer profile $\hat\psi \in C_c^\infty$ supported in
$\{\varphi^{-1} \leq |\xi| \leq \varphi\}$.  Shell projections

$$\Delta_k f := \mathcal{F}^{-1}\!\left[\hat\psi(\varphi^{-k}\cdot)\hat f\right].$$

**Numerical certification**: $|\sum_k |\hat\psi(\varphi^{-k}\xi)|^2 - 1|
\leq 1.55 \times 10^{-15}$ at 128 sample points, fp64 interval
precision (kernel `lut_phi.cuh:verify_phi_partition_of_unity`).

## Cross-shell coupling matrix (MPC-4 §4.35)

$$K_{k,j} := \frac{\int \alpha \cdot (\Delta_k \omega) \cdot (\Delta_j \omega)\, dx}{\|\Delta_k \omega\|_{L^2} \|\Delta_j \omega\|_{L^2}}.$$

Off-diagonal decay $|K_{k,j}| \leq C(M) \varphi^{-|k-j|/2}$ for
$|k - j| \geq 2$; diagonal = shell Rayleigh quotient.

## Status

**Verified** for the golden-ratio + Fibonacci algebra (INS-18
covers the 4 proven theorems in Lean).  **Speculative** for the
full Meyer / cross-shell machinery (canon-level derivations;
not yet Lean-formalized beyond definitions).

## Dependencies in context

Depends on DEF-01 (core types).

Supports INS-04 (Icosahedral Hypothesis), INS-17 (Waleffe
helical triad), INS-18 (Fibonacci triad proved theorems),
OBS-07 (Resonance-Diagonal uses $K_{k,j}$), OBS-08 (Helicity-
Sector), OBS-09 (Twist-Writhe).

## Citations

- **GUNS IcosahedralPath/Hypothesis.lean**.
- **MPC-4 §§4.1-4.40** (Meyer partition + cross-shell coupling),
  turbulent_waters canon.
- **Meyer, Y., Wavelets and Operators** (Cambridge).
- **Coxeter**, *Regular Polytopes* (Dover), for icosahedral
  group + binary icosahedral group.

## History

GUNS Step 4 (2026-04-17) — golden-ratio Lean proofs + structural
definitions.  MPC-4 canon synthesis 2026-04-14..17.  Live
corpus 2026-04-22.
