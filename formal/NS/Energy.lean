import NS.Basic
import NS.HatFunction
import NS.PDE
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Set

/-!
# NS.Energy — weighted energy, annulus, and Lemma 2.2

Corresponds to Notation 2.1 + Lemma 2.2 of the paper.

## Definitions

- `gradNormSq v x` — Frobenius norm squared of the Jacobian:
  $|\nabla v(x)|^2 = \sum_{i,j} (\partial_j v_i)^2$.
- `annulus a b` — the open spherical annulus
  $\{x \in \mathbb{R}^3 : a < |x|_E < b\}$ in the Euclidean
  norm.
- `weightedEnergy θ V ρ` — the hat-weighted energy at scale `ρ`:
  $\mathcal{E}(\rho) = \int_{\mathbb{R}^3} |\nabla v|^2\,
  \varphi_\theta(|x|_E / \rho)\,dx$.
- `annularGradSq θ V ρ` — the annular gradient norm squared:
  $\mathcal{D}(\rho) = \|\nabla v\|_{L^2(A(\theta\rho,\rho))}^2$.

## Lemma 2.2 (stated, not yet proved)

- `weightedEnergy_deriv` — the exact derivative identity
  $\mathcal{E}'(\rho) = \frac{1}{(1-\theta)\rho^2} \int_{A(\theta\rho,\rho)}
  |\nabla v|^2\,|x|_E\,dx$.
- `D_le_rho_deriv_E` — the bound $\mathcal{D}(\rho) \le
  \frac{1-\theta}{\theta}\,\rho\,\mathcal{E}'(\rho)$.
- `annularGradSq_lb` — the equivalent form
  $\mathcal{E}'(\rho) \ge \frac{\theta}{(1-\theta)\rho}\,\mathcal{D}(\rho)$.

Proofs deferred to a subsequent session (differentiation under the
integral sign + the piecewise-linear chain rule).
-/

namespace NS

open MeasureTheory

/-- Frobenius norm squared of the Jacobian of `v` at `x`:
    `∑ᵢⱼ (∂ⱼ vᵢ)²`. -/
noncomputable def gradNormSq (v : R3 → R3) (x : R3) : ℝ :=
  ∑ i : Fin 3, ∑ j : Fin 3, ((fderiv ℝ v x (basis j)) i) ^ 2

/-- Open spherical annulus `{x : a < |x|ₑ < b}` in the Euclidean
    norm. -/
def annulus (a b : ℝ) : Set R3 := { x : R3 | a < enorm x ∧ enorm x < b }

/-- On the annulus `A(a, b)`, the inner radius `a` is a lower
    bound for the Euclidean norm. -/
lemma le_enorm_of_mem_annulus {a b : ℝ} {x : R3} (hx : x ∈ annulus a b) :
    a ≤ enorm x :=
  le_of_lt hx.1

/-- On the annulus `A(a, b)`, the outer radius `b` is an upper
    bound for the Euclidean norm. -/
lemma enorm_le_of_mem_annulus {a b : ℝ} {x : R3} (hx : x ∈ annulus a b) :
    enorm x ≤ b :=
  le_of_lt hx.2

/-- `gradNormSq` is a sum of squares, hence non-negative. -/
lemma gradNormSq_nonneg (v : R3 → R3) (x : R3) : 0 ≤ gradNormSq v x := by
  unfold gradNormSq
  positivity

/-- Pointwise: on the annulus, the integrand of the gradient-weighted
    integral in `weightedEnergy_deriv` dominates `θ · ρ · gradNormSq`.
    This is the key step in deriving `annularGradSq_lb`. -/
lemma pointwise_bound_on_annulus
    {θ ρ : ℝ} {V : SmoothDivFreeField} {x : R3}
    (hx : x ∈ annulus (θ * ρ) ρ) :
    θ * ρ * gradNormSq V.v x ≤ gradNormSq V.v x * enorm x := by
  have h1 : θ * ρ ≤ enorm x := le_enorm_of_mem_annulus hx
  have h2 : 0 ≤ gradNormSq V.v x := gradNormSq_nonneg V.v x
  calc θ * ρ * gradNormSq V.v x
      = gradNormSq V.v x * (θ * ρ) := by ring
    _ ≤ gradNormSq V.v x * enorm x :=
        mul_le_mul_of_nonneg_left h1 h2

/-- Hat-weighted energy at scale `ρ`:
    `∫ |∇v(x)|² · hat θ (|x|ₑ/ρ) dx`. -/
noncomputable def weightedEnergy (θ : ℝ) (V : SmoothDivFreeField) (ρ : ℝ) : ℝ :=
  ∫ x, gradNormSq V.v x * hat θ (enorm x / ρ)

/-- Annular gradient norm squared at scale `ρ`:
    `∫_{A(θρ,ρ)} |∇v|² dx`. -/
noncomputable def annularGradSq (θ : ℝ) (V : SmoothDivFreeField) (ρ : ℝ) : ℝ :=
  ∫ x in annulus (θ * ρ) ρ, gradNormSq V.v x

/-!
## Lemma 2.2 — statements (proofs `sorry`)
-/

/-- **Lemma 2.2, first identity.** The weighted energy
    `E(ρ) = ∫|∇v|² φ(|x|ₑ/ρ) dx` satisfies
    `E'(ρ) = (1 / ((1 - θ) ρ²)) ∫_{A(θρ,ρ)} |∇v|²·|x|ₑ dx`
    for every `θ ∈ (0, 1)` and `ρ > 0`. -/
theorem weightedEnergy_deriv
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ) :
    deriv (weightedEnergy θ V) ρ =
      (1 / ((1 - θ) * ρ ^ 2))
        * ∫ x in annulus (θ * ρ) ρ, gradNormSq V.v x * enorm x := by
  sorry

/-- **Lemma 2.2, first inequality.** `E'(ρ) ≥ (θ / ((1-θ)ρ)) · D(ρ)`. -/
theorem annularGradSq_lb
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ) :
    (θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ
      ≤ deriv (weightedEnergy θ V) ρ := by
  sorry

/-- **Lemma 2.2, equation (2.3).**  `D(ρ) ≤ ((1-θ)/θ) · ρ · E'(ρ)`.
    This is the form invoked throughout Sections 5-8 of the paper
    to convert ODE bounds on `E` into gradient-integral bounds on
    the annulus.

    Proved from `annularGradSq_lb` by multiplying both sides by
    `(1 - θ) * ρ / θ > 0`. -/
theorem D_le_rho_deriv_E
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ) :
    annularGradSq θ V ρ
      ≤ ((1 - θ) / θ) * ρ * deriv (weightedEnergy θ V) ρ := by
  have h1θ : 0 < 1 - θ := by linarith
  have hθne : θ ≠ 0 := ne_of_gt hθ0
  have h1θne : (1 - θ) ≠ 0 := ne_of_gt h1θ
  have hρne : ρ ≠ 0 := ne_of_gt hρ
  have hscale : 0 ≤ (1 - θ) * ρ / θ :=
    le_of_lt (div_pos (mul_pos h1θ hρ) hθ0)
  have hlb := annularGradSq_lb hθ0 hθ1 V hρ
  have key : annularGradSq θ V ρ
      = ((1 - θ) * ρ / θ) * ((θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ) := by
    field_simp
  calc annularGradSq θ V ρ
      = ((1 - θ) * ρ / θ) * ((θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ) := key
    _ ≤ ((1 - θ) * ρ / θ) * deriv (weightedEnergy θ V) ρ :=
        mul_le_mul_of_nonneg_left hlb hscale
    _ = ((1 - θ) / θ) * ρ * deriv (weightedEnergy θ V) ρ := by ring

end NS
