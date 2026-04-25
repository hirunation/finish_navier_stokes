import NS.Basic
import NS.PDE
import NS.HatFunction
import NS.Energy

/-!
# NS.Caccioppoli — Tree A obligation #1, the sublinear Caccioppoli estimate

This file states the **Caccioppoli-style energy estimate** of the
paper §5 (Proposition 5.1) and Tree A's
`NSProof/PartI/Liouville.lean:724` (`caccioppoli`). It is the
"final algebraic assembly" of six prerequisite sub-lemmas that
Tree A has already proven:

| Tree A sub-lemma | Status | What it gives |
|:---|:---:|:---|
| `phi_contDiff_two`              | ✓ proved | $\varphi \in C^2$ |
| `phi_hasCompactSupport`         | ✓ proved | $\mathrm{supp}\,\varphi \subset B_\rho$ |
| `phi_eq_one_of_norm_le`         | ✓ proved | $\varphi = 1$ on $B_{\theta\rho}$ |
| `phi_eq_zero_of_norm_ge`        | ✓ proved | $\varphi = 0$ off $B_\rho$ |
| `phi_nonneg`, `phi_le_one`      | ✓ proved | $0 \le \varphi \le 1$ |
| `phi_norm_fderiv_bound`         | ✓ proved | $\|\nabla\varphi\| \le C_\varphi$ |
| `convective_bound`              | ✓ proved | bounds $\sum_j \int (v\cdot\nabla v_j) v_j \varphi^2$ |
| `pressure_bound`                | ✓ proved | bounds $\sum_j \int (\partial_j p) v_j \varphi^2$ |
| `green_identity_3d`             | ✓ proved | per-coordinate IBP for the Laplacian |
| `ibp_divfree`                   | ✓ proved | IBP for divergence-free fields |
| **`caccioppoli` final assembly** | sorry | combines above via Cauchy-Schwarz on cross term |

The Tree A obligation #1 (in GUNS `ClassicalPath/OpenObligations.
lean:67`) is **this final assembly**. It is provably closeable
modulo the six listed sub-lemmas, all already in Tree A's
infrastructure. The remaining ~100 lines of "algebraic assembly"
combine the test-equation $-\nu\Delta v + (v\cdot\nabla)v +
\nabla p = 0$ paired with $v\varphi^2$, then split via integral
linearity into Laplacian / convective / pressure parts, apply
the corresponding bounds, and bound the cross-term via
Cauchy–Schwarz.

We mirror Tree A's signature in our own type system here. The
proof body is `sorry` pending the algebraic assembly; closing
it locally would require porting (or restating) Tree A's six
sub-lemmas in our setting.
-/

namespace NS

open MeasureTheory

/--
**Tree A obligation #1, ported.** The sublinear Caccioppoli
inequality for stationary smooth divergence-free NS solutions in
$L^{3,\infty}(\mathbb{R}^3)$.

For every $\theta \in (0, 1)$, $\rho > 0$, and smooth
divergence-free $V$ satisfying the stationary NS equations, there
exist non-negative constants $C_1, C_2$ such that the weighted
Dirichlet energy on the hat-cutoff $\eta(\cdot/\rho)$ is
controlled by:

$$
\mathcal{E}(\rho) \le C_1 \cdot \mathcal{D}(\rho)^{1/2} \cdot
  \Big(\int_{A(\theta\rho, \rho)} \|v\|^2\,dx\Big)^{1/2}
  + C_2 \cdot \int_{A(\theta\rho, \rho)} \|v\|^3\,dx.
\tag{Caccioppoli}
$$

The first term is the *Bogovski\u{\i}-viscous + Bogovski\u{\i}-
convective* contribution (paper §5, terms $I_2, I_4$); the second
is the *convective cutoff* (paper §5, term $I_3$, before the
GN–Lorentz reduction of §7).

This is the unconditional statement; closing the existential
constants requires the Bogovski\u{\i} operator infrastructure
of paper §4 (Lemma 4.1, Corollary 4.3) plus the §5 proof of
Proposition 5.1.
-/
theorem caccioppoli_obligation
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) (hPDE : SatisfiesStationaryNS V)
    {ρ : ℝ} (hρ : 0 < ρ) :
    ∃ (C₁ C₂ : ℝ), 0 ≤ C₁ ∧ 0 ≤ C₂ ∧
      weightedEnergy θ V ρ ≤
        C₁ * (annularGradSq θ V ρ) ^ (1/2 : ℝ)
            * (∫ x in annulus (θ * ρ) ρ, ‖V.v x‖ ^ 2) ^ (1/2 : ℝ)
        + C₂ * ∫ x in annulus (θ * ρ) ρ, ‖V.v x‖ ^ 3 := by
  sorry

/-- Non-negative real-arithmetic sign helper used by the
    Caccioppoli closure (the constants $C_1, C_2$ are products of
    $\nu$, $\theta$, and the universal hat-function gradient
    bound). -/
lemma caccioppoli_const_nonneg
    {ν : ℝ} (hν : 0 ≤ ν) {Cφ : ℝ} (hCφ : 0 ≤ Cφ) :
    0 ≤ 2 * ν * Cφ ∧ 0 ≤ Cφ + 2 * Cφ := by
  refine ⟨?_, ?_⟩
  · have h1 : 0 ≤ 2 * ν := by positivity
    exact mul_nonneg h1 hCφ
  · have h2 : 0 ≤ 2 * Cφ := by positivity
    linarith

end NS
