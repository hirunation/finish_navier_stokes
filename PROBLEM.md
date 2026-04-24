# The Problem — Navier–Stokes

## The Clay statement (3D incompressible, evolutionary)

For the incompressible Navier–Stokes equations in ℝ³:

  ∂_t u + (u · ∇)u − νΔu = −∇p    on ℝ³ × (0, ∞)
  ∇ · u = 0
  u(·, 0) = u₀   (divergence-free Schwartz data)

**Question (Clay Millennium, statement A):** Do smooth
solutions exist for all time?  Or do singularities form in
finite time from smooth initial data?

Equivalent form (statement B): if smooth solutions exist
globally, they satisfy the standard energy inequality.

## What "finish NS" means here

Open-ended.  The data artifact converges on one of:

1. **Regularity.**  Constructive proof that smooth Schwartz data
   → smooth global-in-time solution.  With machine-verified
   proof terms.
2. **Blowup.**  Constructive proof of finite-time singularity
   for a specific smooth divergence-free initial datum.
3. **Conditional resolution.**  Rigorous proof that reduces NS
   regularity to a specifically characterized open question
   (e.g., a stronger Liouville theorem, a sharper geometric
   constraint), with machine-verified reduction.

Partial progress is first-class.  Every INS (insight), AK
(anti-knowledge), CORR (attribution correction), LEM (lemma),
DEF (definition) entered into the smart data counts, provided it
carries provenance.

## Current state of the proof program (cc52d85c, 2026-03-29)

**Part I: L^{3,∞} stationary Liouville theorem** — verified.
Central theorem INS-01.  A smooth divergence-free stationary
Navier–Stokes solution on ℝ³ with v ∈ L^{3,∞}(ℝ³) must vanish
identically.  Method: hat-function weighted energy E(ρ) = ∫|v|²φ_ρ
on fixed-ratio annuli A(θρ, ρ); Bogovskii operator eliminates
pressure (exact, algebraic, from div w = 0); Caccioppoli +
Lorentz embedding + Gagliardo–Nirenberg interpolation with
exact ρ-cancellation at scaling exponent 3a/p + b = 3 yields
superlinear ODE E' ≥ cρ^{-α}E^β with β > 1, α < 1 for all p ∈
(3/2, 3); LHS bounded, ∫ρ^{-α}dρ divergent → contradiction →
finite Dirichlet → Galdi testing → v = 0.  Key exponents at
p = 2: β = 4/3, α = 2/3.

**Proof repair INS-02 (Caccioppoli restructuring).**  Draft 7–8
absorbed viscous cross-terms via Young's inequality, producing
a linear ε₀D term (ε₀ = 3/16) that dominates sublinear Case B
and prevents the superlinear ODE from engaging on a half-line.
Draft 9 fix: do NOT absorb via Young; keep ‖∇v‖·‖v‖/ρ as a
product, bound by Cauchy–Schwarz + Lorentz.  Both convective and
viscous remainders become sublinear in D.  Case A/B analysis
eliminated.  Proof shortens by −30/+15 lines.  Same β, α.  The
retired Case A/B analysis lives permanently as AK-01.

**W^{1,2}_loc extension (INS-04).**  Interpolation fix: convective
pairing needs v⊗v ∈ L²; use real interpolation L^{3,∞} ∩ L⁶_loc
(Sobolev of W^{1,2}_loc) ⟹ v ∈ L⁴_loc; 1/2 + 1/2 = 1 pairing.
L^{3,∞} ∩ W^{1,2}_loc is the sharp threshold.  Landau solutions
confirm sharpness at the singularity.  Test-function admissibility
per Heywood 1976.

**Dimensional discriminant (INS-03).**  γ(n,p) =
−(n−4)(n−2p) / (2n − p(n−2)) gives the ρ-exponent in the dominant
Caccioppoli remainder across dimensions.  n = 3: γ < 0 (polynomial
divergence) → Liouville holds.  n = 4: γ = 0 exactly (logarithmic
divergence) → Liouville holds (new theorem in L^{4,∞}(ℝ⁴) at
p = 5/2, β = 3/2, α = 1 borderline).  n ≥ 5: β > 1 needs p >
n/2 (Sobolev) and α ≤ 1 needs p ≤ n/2 — incompatible; method
provably fails.  See AK-07 for the impossibility claim.

**Fractional generalization (INS-06, speculative).**  For stationary
fractional NS with dissipation (−Δ)^s and degree-k nonlinearity:
n_crit(s, k) = 2s(k+1)/(k−1) − 2.  Recovers n_crit(1, 2) = 4 for
standard NS.  Suggests fractional NS regularity on ℝ³ with
Schwartz data when s > 5/6.  Below Lions exponent 5/4 — gap
(5/6, 5/4] measures the Liouville method's efficiency over
parabolic energy methods.  Needs fractional KNSS framework
verified.  80% confidence.  Follow-up paper territory.

**Part II: backward uniqueness (Step 5 of Liouville → regularity).**
Uses ESS03 backward uniqueness applied to bounded ancient
solutions.  KNSS §4 supplies regularity of the bounded ancient
solution (NOT backward uniqueness — that was the CORR-01..04
attribution correction).

**Two-weight complementarity (INS-10).**  Polynomial weights for
stationary (elliptic) impossibility; exponential Gaussian
Carleman weights for parabolic (ancient) impossibility.  The
two weight classes *tessellate all escape routes*.  Liouville
kills the stationary anchor.  Backward uniqueness kills the
parabolic retreat.  ω cannot survive, cannot retreat, cannot
cease to exist — contradiction.

**Parabolic front (INS-11).**  Transition time s*(ρ) ~ −ρ²/ν
separates Liouville jurisdiction (above) from backward-uniqueness
jurisdiction (below).  Same curve as diffusive retreat rate;
Carleman calibration √|s| matched.  High-Reynolds regime —
Re_eff ~ √(|s|/ν) → ∞.  Stretching-to-dissipation ratio R < 1
on the front.  The two-mechanism structure is *irreducible*,
not just convenient.

**Quantitative regularity bound (INS-12).**  E(ρ₀) ≤ O(M⁶R⁻¹)
with explicit constants tracked.  Morrey M^{2,1} likely
accessible.  Constructivized KNSS should yield **single-
exponential** regularity bounds (vs Tao's triple-exponential).
Schonbek–Wiegner decay holds unconditionally once regularity is
established.

## Success criteria for smart-data entry

An entry enters `insights/` iff one of:

- **verified** — multi-round independent validation + machine-
  verified Lean proof term.  Target state for INS-01 after Lean
  encoding.
- **speculative** — framed correctly, dependencies named, risk
  identified.  Example: INS-06.
- **retired-anti-knowledge** — a path that does NOT work, with
  reason.  Example: AK-01 (Case A/B absorption), AK-04
  (exceptional algebras).
- **attribution-correction** — literature error identified, with
  source-reading verification.  Example: CORR-01 (KNSS §4 ≠
  backward uniqueness).

Every entry carries session UUID + author + date + method.
Without provenance, the entry does not enter `insights/`.

## Competitive landscape (2026-03-29 snapshot)

- **CNY 2024** (Nonlinearity 37, Paper No. 035007, DOI
  10.1088/1361-6544/ad1efc) — shares core mechanism (Bogovskii,
  hat-weight, Caccioppoli).  L^{3,∞} embedding into their
  annular growth condition works.
- **CY 2026** (arXiv:2603.23833, 2026-03-25) — submitted 3 days
  before the cc52d85c session.  Near-simultaneous.  Window
  narrowing.  First author: Youseung Cho.
- **KNSS 2009** (arXiv:0709.3599) — axi-symmetric Liouville
  theorems only (§5).  §4 is regularity of bounded solutions,
  not backward uniqueness.  **Part I completes the program for
  general 3D** — this is the stronger novelty claim, not
  reassembly of KNSS.
- **Hou–Wang–Yang 2025** (arXiv:2509.25116) — non-uniqueness of
  Leray–Hopf solutions for **non-smooth** (L^q, q < 3) compactly
  supported data.  Complementary, not a threat.
- **Seregin 2025** (arXiv:2507.08733) — Type II blow-up,
  conditional, Euler-system Liouville.  Different approach.
- **Tan 2025** — frequency-space Liouville.  Different.
- **Debunked**: Xu (arXiv:2401.17147, 16 revisions), Ri
  (2508.19590), Budden Lean4.

## The target state

When the corpus reaches the point where:

- Every claim is `verified` with a Lean proof term, or
  explicitly `speculative` with named gap.
- No `retired-anti-knowledge` approach is being re-attempted
  (the retired entries prevent re-exploration).
- The INS dependency graph closes either on (1) regularity,
  (2) blowup, or (3) a conditional reduction to a narrower
  open question.
- A submission-quality document compiles out of the smart data.

At that point, the solution artifact exists.  Publication is a
consequence, not a goal.
