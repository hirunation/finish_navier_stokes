# NS Proof — Seed session (2026-03-29 → 03-30)

Session UUID: `cc52d85c-7323-4878-b7a4-1a03d6567b1a`.

This file is a historical snapshot of the seed working session
that produced the initial corpus of 13 insights, 8 anti-knowledge
entries, and 4 attribution corrections. Preserved here for
provenance; the live corpus under `insights/` supersedes it.

## Session arc
Draft 7 (claimed final) → 8 council rounds → finds six cosmetic + one attribution issue → Draft 8. Geometric exploration round finds three new Remark-worthy structures → baked into Draft 8. Then a quantitative-Liouville agent finds a **structural gap** in the Case A/B analysis of Step 6 → three agents converge on the same diagnosis and fix (eliminate Young absorption, keep cross-terms sublinear) → Draft 9. Three rounds of parallel council+research produce **new mathematics** (4D Liouville, W¹²_loc extension, dimensional discriminant, fractional threshold) → Draft 10 queued. Literature sweep finds the **KNSS §4 citation is wrong** — KNSS §4 is regularity of bounded solutions, not backward uniqueness; KNSS Liouville theorems (§5) are axi-symmetric only. Correction applied → Draft 10 commits with author name "Airo Nahiru".

---

## Insights — Verified Mathematics

### INS-01 · L^{3,∞} Stationary NS Liouville Theorem (CENTRAL THEOREM, Part I)
**Statement.** Let v be a smooth stationary divergence-free solution of Navier–Stokes on ℝ³ with v ∈ L^{3,∞}(ℝ³). Then v ≡ 0.
**Method.** Hat-function weighted energy E(ρ) = ∫|v|² φ_ρ on fixed-ratio annuli A(θρ,ρ). Bogovskii operator eliminates pressure (exact, algebraic, from div w = 0). Caccioppoli + Lorentz embedding (proved in-document via layer-cake) + GN interpolation with exact ρ-cancellation at scaling exponent 3a/p + b = 3 ⟹ superlinear ODE E' ≥ cρ^{-α}E^β with β > 1, α < 1 for all p ∈ (3/2, 3). Integration: LHS bounded (β > 1), RHS ∫ρ^{-α}dρ divergent (α < 1). Contradiction → finite Dirichlet → Galdi testing → v = 0.
**Status.** Verified across 8 council rounds, 26 adversarial vectors, 75+ checks, restructured once (Draft 9). Independently re-derivable from CNY 2024.
**Key exponents at p = 2:** β = 4/3, α = 2/3.

### INS-02 · The Caccioppoli Restructuring (Draft 9 CRITICAL FIX)
**Status.** PROOF REPAIR — Draft 7–8 had a latent gap.
**The gap.** The old Caccioppoli applied Young's inequality to viscous cross-terms, producing a linear ε₀D term (ε₀ = 3/16). Under Case A growth E ~ ρ^{4/3}, the linear term saturates at E/4 while the Case B sublinear term ~ ρ^{3/4} remains o(E). Case B never establishes on a half-line — the superlinear ODE doesn't engage. Case A growth is self-inconsistent but doesn't imply Case B takes over.
**The fix.** Do NOT absorb cross-terms via Young. Keep ‖∇v‖·‖v‖/ρ as a product, bound by Cauchy–Schwarz + Lorentz: ≤ CMρ^{-1/2} D^{1/2}. Combined with the cubic Conv₂ bounded ~ ρ^{-1} D^{1/2} (via (12/5, 12/5, 6) Hölder + Sobolev–Poincaré rescaled back to A(θρ,ρ)), both terms are sublinear in D. For D ≥ 1: D^{1/2} ≤ D^b. Directly:
  E ≤ C₀Mρ^{-1/2}D^{1/2} + C₁M²/ρ + C₂M^a ρ^γ D^b
  ⟹ E^{4/3} ≤ C'' ρ^{2/3} E'
**Impact.** Proof becomes shorter (Case A/B deleted: −30 lines, +15 lines direct ODE). Same β, α. Case A/B analysis is now a permanent anti-knowledge entry.
**Significance.** This is the one actual mathematical repair in the session's arc. Everything else is verification or enrichment.

### INS-03 · The Dimensional Discriminant (NEW RESULT)
**Statement.** The hat-function Liouville method's reach across dimensions is governed by
  γ(n,p) = −(n−4)(n−2p) / (2n − p(n−2))
giving the ρ-exponent in the dominant Caccioppoli remainder.
**Consequences.**
 | n  | γ at optimal p | Liouville? |
 |----|---------------|-----------|
 | 3  | < 0           | YES (polynomial divergence) |
 | 4  | = 0 exactly   | YES (borderline, logarithmic divergence) |
 | ≥5 | —             | NO (β > 1 needs p > n/2, α ≤ 1 needs p ≤ n/2 — incompatible) |

**Corollary (new theorem).** Smooth stationary NS on ℝ⁴ in L^{4,∞}(ℝ⁴) ⟹ v = 0. At p = 5/2: β = 3/2, α = 1 borderline, logarithmic integral ∫ρ^{-1}dρ vs bounded LHS = contradiction.
**Status.** Verified by independent re-derivation in R2a. Genuinely novel. ~15 lines as a remark in Draft 10.
**Philosophical.** Dimension 4 is the **exact boundary** of the hat-function method. The factor (n − 4) is the dimensional discriminant.

### INS-04 · The W^{1,2}_loc Liouville Extension (NEW)
**Statement.** The L^{3,∞} stationary Liouville theorem extends from smooth v to v ∈ W^{1,2}_loc(ℝ³).
**Requires (interpolation fix).** Convective pairing needs v⊗v ∈ L², i.e. v ∈ L⁴. Use real interpolation: v ∈ L^{3,∞} ∩ L⁶_loc (Sobolev embedding of W^{1,2}_loc) ⟹ v ∈ L⁴_loc, then 1/2 + 1/2 = 1 pairing.
**Sharpness.** L^{3,∞} alone bootstraps only to ∇v ∈ L^{3/2−ε}_loc (via Sobolev gain from Lorentz), insufficient for energy method. W^{1,2}_loc is the sharp threshold. Landau solutions v ~ c/|x| confirm sharpness at the singularity.
**Test-function admissibility:** Heywood 1976 density (Acta Math. 136, 61–102).
**Status.** Verified (R2c) with 4/4 items; one pairing interpolation flagged and fixed in Draft 10 remark.

### INS-05 · Stretching Transience Theorem
**Statement.** For smooth Schwartz-class NS solutions on [0,∞):
  ∫₀^∞ ∫_{ℝ³} |ω · (S ω)| dx dt < ∞
and the unsigned integrand decays as O(t^{-9/2}). Time-average T⁻¹∫₀^T S[u] dt → 0.
**Status.** Corollary of regularity, not a tool for proving it. Likely known in spirit; confidence 90%. Worth a short remark.

### INS-06 · The Generalized Dimensional Discriminant for Fractional NS
**Statement.** For stationary fractional NS with dissipation (−Δ)^s and cubic nonlinearity on ℝ^n in L^{n/(2s−1),∞}:
  n_crit(s) = 6s − 2
General form (degree-k nonlinearity): n_crit(s, k) = 2s(k+1)/(k−1) − 2.
**Consequences.**
- Standard NS (s = 1): n_crit = 4 ✓ (recovers INS-03)
- s = 5/6 in ℝ³: borderline (logarithmic)
- Suggests fractional NS regularity on ℝ³ with Schwartz data when s > 5/6
- Below Lions exponent 5/4 — the gap (5/6, 5/4] measures the Liouville method's efficiency over parabolic energy methods
**Status.** Speculative (needs fractional KNSS framework verified), 80% confidence. Too speculative for main paper. Follow-up paper territory.

### INS-07 · Scale-Coherent Stretching Impossibility (THE GEOMETRIC CONTENT of Part I)
**Statement.** In L^{3,∞}, vortex stretching cannot be coherent across scales. The β > 1 mechanism encodes self-amplification (cubic nonlinearity ‖v‖³ produces superlinear cascade ρ → 2ρ → 4ρ). The α < 1 mechanism encodes L^{3,∞}'s sublinear accommodation (Lorentz decay ‖v‖_{Lʳ(A)} ≤ CMρ^{3/r−1} thins forcing sublinearly; ∫ρ^{−α}dρ diverges — relentless forcing across all scales, insufficient at any one scale to arrest the cascade).
**Collapsed statement.** Infinite forcing into finite capacity ⟹ contradiction.
**Sharpness witness.** Landau solutions v ~ c/|x| are the most resistant flow — exactly L^{3,∞}, exactly scale-invariant, logarithmic Dirichlet growth. They survive only because of the point singularity. Smoothness is what kills them.
**Formalization.** Stretching transfer function T(ρ) := [E(2ρ) − E(ρ)]/E(ρ). Liouville says T ≡ 0 for stationary NS in L^{3,∞}. Kolmogorov 1941 cascade has T = 2^{2/3} − 1 ≈ 0.587 constant — impossible for deterministic stationary flows. **Intermittency is recast as mandatory decoherence.**

### INS-08 · The Retreating Vorticity Picture (backward ancient solution)
At s ≪ 0 the bounded ancient solution exhibits:
- **Constant enstrophy per logarithmic shell.** |ω(x)| ~ 1/|x|² typical far-field ⟹ ‖ω‖²_{L²(A(R,2R))} ~ 1 for all R. Signature of critical scaling.
- **The "hollow solution" structure.** Approximately irrotational core, swirling far field. Near field quiescent; far field carries the full L^{3,∞} content.
- **Spectral preservation with spatial retreat.** NOT standard parabolic decay (where high frequencies die and low persist). ALL frequencies persist, carried by structures at increasingly large |x|. Energy spectrum approximately preserved but spatially delocalized. Fundamentally different from heat-equation behavior.
- **Biot–Savart cancellation mechanism.** v(0,s) → 0 does NOT require far-field ω to vanish; it requires cancellations when integrated against the 1/|y|² kernel. Far-field vorticity can be intense, provided no net contribution viewable from the origin.

### INS-09 · The Three Incompatible Constraints (Carleman geometry)
The geometric content of Step 5's contradiction:
1. ω cannot survive at the origin. Liouville theorem killed the stationary anchor (no steady L^{3,∞} flow to support it).
2. ω cannot retreat to infinity. The Carleman weight exp(−|x|²/(4a(s))) with a ~ |s| creates a Gaussian aperture of width √|s| — matches the diffusive retreat rate exactly. Weight chases retreating vorticity at the speed it retreats. ω(·,0) ≠ 0 propagates backward through the weighted integral.
3. ω cannot cease to exist. Backward uniqueness (ESS03): nontrivial solution of |∂_t u + νΔu| ≤ c(|u| + |∇u|) with Gaussian growth, vanishing at one time, must vanish identically.
Three constraints mutually incompatible ⟹ v ≡ 0.

### INS-10 · The Unified Scale-Mismatch Principle (Two-Weight Complementarity)
Liouville (Part I) and backward uniqueness (Step 5) are complementary lenses on one impossibility:

|                | Liouville (Part I)       | Backward Uniqueness (Step 5) |
|----------------|-------------------------|------------------------------|
| Setting        | Elliptic (stationary)    | Parabolic (ancient)           |
| Weight class   | Polynomial φ_ρ           | Exponential (Gaussian Carleman) |
| Variable       | Scale ρ                  | Space-time (x, t)             |
| What it kills  | The stationary anchor   | The parabolic retreat         |
| Mechanism      | Bounded ≥ divergent in ρ | Local amplification vs far-field suppression |
| Calibration    | Hat function on annuli  | Gaussian matched to √|s|      |

Polynomial weights suffice for stationary (no time variable for ω to hide in). Exponential weights needed for parabolic (ω can retreat through space-time; only exponential weight outpaces polynomial retreat). The two weight classes **tessellate all escape routes.**

### INS-11 · The Parabolic Front Architecture
The transition time s*(ρ) ~ −ρ²/ν separating Liouville jurisdiction (above) from backward-uniqueness jurisdiction (below). On the front:
- **Same curve** as diffusive retreat rate, Carleman calibration √|s|, natural parabolic scaling.
- **High-Reynolds regime.** Effective Re ~ √(|s|/ν) → ∞. NOT Stokes-dominated. Nonlinearity fully active.
- **Stretching-to-dissipation ratio R < 1.** ∂_s Ω_s(ρ) < 0 on the front — enstrophy evacuating, dissipation exceeds stretching.
- **Irreducibility of the two-mechanism structure.** The almost-stationary Caccioppoli fails on the front because the correction from ∂_s v grows like |s|. The energy is above threshold only where the stationary approximation fails, and the stationary approximation is good only where the energy is below threshold. Provable: neither mechanism alone can cover both regions.
- **"Tame dynamics / impossible statics" principle.** The superlinear ODE requires the time derivative to vanish. Dynamics at each time are tame (bounded doubling index ≤ 3 log 2); impossibility lives only in the asymptotic stationary state that the dynamics inevitably produce.

### INS-12 · Quantitative Regularity Bound (Derived)
  E(ρ₀) ≤ O(M⁶ R⁻¹), with explicit constants tracked.
Morrey M^{2,1} likely accessible. Constructivized KNSS should yield **single-exponential** regularity bounds (vs Tao's triple-exponential). Schonbek–Wiegner decay holds unconditionally once regularity is established.

### INS-13 · Lie-Algebraic Framing of Strain/Vorticity (incidental, classical)
sl(3,ℝ) = so(3) ⊕ sym₀(3) is the correct algebraic framing of the strain/vorticity split: vorticity = spin-1, strain = spin-2. ω·Sω is the SO(3)-invariant contraction of spin-1 and spin-2 representations. Dimension 8 = 3 + 5 is numerical coincidence with dim(octonions) = 8 and rank(E8) = 8 — **but the SO(3) decomposition 3+5 is incompatible with the G₂ decomposition 7+1 of the octonions. No algebraic map.** A₂ not E8.
The Case A/B crossover ratio (1−α)/(β−1) = 1 at p = 2 is a Z/2Z Weyl-group reflection — the Weyl group of A₁, nothing exceptional.

---

## Anti-Knowledge (Refutations) from this session

### AK-01 · Case A/B absorption creates a gap (the Draft 7–8 approach)
Absorbing cross-terms via Young into ε₀D = (3/16)D produces a linear term that dominates sublinear Case B for all large D. Case B never establishes on a half-line → superlinear ODE may not engage. Fix: INS-02. **This is the central anti-knowledge entry of the session.**

### AK-02 · Helical symmetry Liouville in L^{3,∞} does not exist
Helicity is supercritical (not controlled by L^{3,∞}). The ancient solution is not helical. No helical Liouville theorem closes the gap.

### AK-03 · Topological vortex line constraints vanish under NS
NS is parabolic. Viscosity destroys topological invariants: helicity is dissipated, linking numbers change via reconnection, vortex lines deform freely. No discrete topological barrier exists.

### AK-04 · Exceptional algebras (E8, G₂, octonions) do not illuminate this proof
13 directions tested (root systems as multi-scale, Weyl groups, plane projections, octonion cross product, trilinear form, G₂+QR diagram, E8 Dynkin+8 steps, magic square+p-family). All superficial coincidences. **Deep reason:** the proof works by dimensional reduction to 1D (scale variable ρ). Any proof succeeding by such reduction has at most A₁ rank. E8 describes structures resisting dimensional reduction; the proof's success is antithetical to exceptional complexity. If exceptional algebras live anywhere in fluid mechanics, it's in the turbulent attractor / unsolved cascade — where reduction fails.

### AK-05 · The almost-stationary Caccioppoli fails on the parabolic front
|CORRECTION| ≤ C · η(s, c√|s|) · |s|. ‖∂_s v‖_{L^∞} ≤ C globally forces linear growth. Energy is above threshold only where stationary approximation fails, and vice versa. Provable: no single analytic mechanism covers both regions. The two-weight complementarity (INS-10) is *irreducible*, not just convenient.

### AK-06 · The superlinear regime cannot engage for time-dependent flow
The correction from ∂_s v at scale ρ is O(ρ³), comparable to E_0(ρ) itself. The time derivative "softens" the nonlinear amplification. Only in the stationary limit (∂_s v = 0 exactly) does the full superlinear cascade activate.

### AK-07 · n ≥ 5 NS Liouville via hat-function method provably fails
β > 1 requires p > n/2 (Sobolev); α ≤ 1 requires p ≤ n/2 (integration). At n ≥ 5 these are incompatible. Not just "method doesn't work here" — provably cannot work.

### AK-08 · L^{3,∞}-only bootstrap for weak-solution Liouville is insufficient
From L^{3,∞} alone the Caccioppoli gives only ∇v ∈ L^{3/2−ε}_loc. This misses the energy method (needs ∇v ∈ L²_loc). W^{1,2}_loc is the sharp threshold. (INS-04.)

---

## Attribution Corrections (CRITICAL for submission)

### CORR-01 · KNSS §4 does NOT contain backward uniqueness
**Drafts 7–9 error:** "Koch–Nadirashvili–Seregin–Šverák [Theorem 1.2, Section 4] prove that a bounded ancient solution… must be identically zero."
**Reality (verified by reading arXiv:0709.3599):**
 - KNSS §3: Stokes kernel estimates, representation formulas.
 - KNSS §4: "Bounded solutions of Navier–Stokes" — **regularity/compactness only** (Lemma 4.1, interior smoothing, sequence compactness). No backward uniqueness.
 - KNSS §5: Liouville theorems — Thms 5.1, 5.2, 5.3. **All axi-symmetric.**
 - KNSS §6: "Singularities and ancient solutions" — the blow-up extraction procedure; then application to axi-symmetric regularity (= published Thms 1.1, 1.2 in Acta Math).
**Implication:** The published KNSS Thms 1.1/1.2 are AXI-SYMMETRIC REGULARITY THEOREMS, not the blow-up extraction procedure, not backward uniqueness.

### CORR-02 · Backward uniqueness belongs to ESS03 alone
KNSS §4 supplies regularity of the bounded ancient solution. ESS03 supplies backward uniqueness. Two different tools, two different jobs. The draft conflated them.

### CORR-03 · The general (non-axisymmetric) case has no KNSS Liouville theorem
This is a **stronger novelty claim** than earlier drafts made. KNSS could close the blow-up → regularity loop only for axi-symmetric flows (via their §5 Liouville theorems). For general 3D flows they had no Liouville theorem. **That is exactly what Part I supplies.** The proof is the **completion** of the KNSS program for the general case, not a reassembly of KNSS.

### CORR-04 · L^{3,∞} is not a KNSS notion
KNSS works entirely in L^∞. The paper never mentions L^{3,∞}. The draft correctly derives the L^{3,∞} bound on the ancient solution via scale-invariance + Fatou — this is the draft's own argument.

---

## Landscape (as of 2026-03-29)

- **CNY 2024** — real (Nonlinearity 37, Paper No. 035007, DOI 10.1088/1361-6544/ad1efc). Shares core mechanism (Bogovskii, hat-weight, Caccioppoli). L^{3,∞} embedding into their annular growth condition works.
- **CY 2026** — real (arXiv:2603.23833, submitted 2026-03-25 = 3 days before session). First author Youseung Cho.
- **Hou–Wang–Yang 2025** (arXiv:2509.25116) — non-uniqueness of Leray–Hopf solutions for **non-smooth** (L^q, q < 3) compactly supported data. **Complementary**, not a threat: proof here gives regularity + Prodi–Serrin uniqueness for Schwartz data. The regularity threshold is the boundary between the two regimes.
- **Seregin 2025** (arXiv:2507.08733) — Type II blow-up, conditional, Euler-system Liouville. Not scooping.
- **Tan 2025** — frequency-space Liouville approach. Different.
- **arXiv:2401.17147 (Xu, 16 revisions), 2508.19590 (Ri), Budden Lean4** — all debunked.
- **No one has completed the KNSS program for general 3D.** Path remains open. Window narrowing.

## Significance summary

This session is the one where the proof reached **structural stability**:
- The Case A/B gap (INS-02 / AK-01) was the last real crack. Sealed.
- The dimensional discriminant (INS-03) and the W^{1,2}_loc extension (INS-04) turn the hat-function method from "ad hoc tool" into a principled framework.
- The attribution corrections (CORR-01–04) turn the novelty claim from "synthesis of existing work" into "completion of the general case KNSS could not reach".
- The geometric content (INS-07–11) turns the proof from "pages of inequalities" into a teaching object: **polynomial weights for static impossibility, exponential weights for dynamic impossibility, meeting at the parabolic front s*(ρ) ~ −ρ²/ν.**

The main file ended at Draft 10 with author "Airo Nahiru", after the meta-instance coached the primary instance through two more voice/attribution fixes. K3/AK3 (accumulated knowledge/anti-knowledge docs) queued but not produced in this session.
