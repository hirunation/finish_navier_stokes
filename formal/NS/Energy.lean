import NS.Basic
import NS.HatFunction
import NS.PDE
import Mathlib.MeasureTheory.Integral.Bochner.Basic
import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Function.LocallyIntegrable
import Mathlib.MeasureTheory.Measure.Haar.InnerProductSpace
import Mathlib.MeasureTheory.Measure.Lebesgue.EqHaar
import Mathlib.Analysis.InnerProductSpace.PiL2
import Mathlib.Analysis.Calculus.ParametricIntegral

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

open MeasureTheory Filter Metric

open scoped Topology

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

/-- The Euclidean norm `enorm` is continuous on `R3`. -/
lemma continuous_enorm : Continuous (enorm : R3 → ℝ) := by
  unfold enorm
  apply Real.continuous_sqrt.comp
  exact continuous_finset_sum _ (fun i _ => (continuous_apply i).pow 2)

/-- The Euclidean norm `enorm` is measurable on `R3`. -/
lemma measurable_enorm : Measurable (enorm : R3 → ℝ) :=
  continuous_enorm.measurable

/-- The annulus is a measurable set. -/
lemma measurableSet_annulus (a b : ℝ) : MeasurableSet (annulus a b) := by
  unfold annulus
  exact (measurableSet_lt measurable_const measurable_enorm).inter
        (measurableSet_lt measurable_enorm measurable_const)

/-- The Euclidean L² norm `enorm` on `R3 = Fin 3 → ℝ` agrees with
    the EuclideanSpace `‖·‖` after embedding via `toLp 2`. -/
lemma euclidean_norm_eq_enorm (x : R3) :
    ‖(WithLp.toLp 2 x : EuclideanSpace ℝ (Fin 3))‖ = enorm x := by
  rw [EuclideanSpace.norm_eq]
  simp only [Real.norm_eq_abs, sq_abs]
  rfl

/-- **Spheres in the Euclidean L² norm have Lebesgue measure zero.**
    The set `{x ∈ R³ : enorm x = c}` is a 2-sphere for `c > 0`,
    a singleton for `c = 0`, and empty for `c < 0`; all have
    Lebesgue measure zero in `R³`.

    Proof: bridge to `EuclideanSpace ℝ (Fin 3)` via the
    volume-preserving `toLp 2`; identify the set with
    `Metric.sphere 0 c`; apply Mathlib's `addHaar_sphere`. -/
lemma volume_enorm_eq_zero (c : ℝ) :
    MeasureTheory.volume {x : R3 | enorm x = c} = 0 := by
  -- Identify the set as the preimage of the EuclideanSpace sphere.
  have h_set_eq : {x : R3 | enorm x = c} =
      (WithLp.toLp 2 : R3 → EuclideanSpace ℝ (Fin 3)) ⁻¹' Metric.sphere 0 c := by
    ext x
    simp only [Set.mem_setOf_eq, Set.mem_preimage, Metric.mem_sphere,
               dist_zero_right, euclidean_norm_eq_enorm]
  rw [h_set_eq]
  -- Volume preserved by toLp; sphere has Haar measure 0.
  rw [(PiLp.volume_preserving_toLp (ι := Fin 3)).measure_preimage
        Metric.isClosed_sphere.measurableSet.nullMeasurableSet]
  exact MeasureTheory.Measure.addHaar_sphere _ 0 c

/-- For a smooth vector field, the Frobenius gradient norm squared
    is continuous. -/
lemma continuous_gradNormSq (V : SmoothDivFreeField) :
    Continuous (gradNormSq V.v) := by
  have h_apply : Continuous fun p : R3 × R3 => (fderiv ℝ V.v p.1 : R3 → R3) p.2 :=
    V.smooth.continuous_fderiv_apply (by simp)
  unfold gradNormSq
  refine continuous_finset_sum _ (fun i _ => continuous_finset_sum _ (fun j _ => ?_))
  apply Continuous.pow
  exact (continuous_apply i).comp
        (h_apply.comp (continuous_id.prodMk continuous_const))

/-- The Pi sup norm is bounded above by the Euclidean norm on
    `R3 = Fin 3 → ℝ`: for every `i`, `(x i)² ≤ ∑ⱼ (x j)²`, so
    `|x i| ≤ √(∑ⱼ (x j)²) = enorm x`; taking the max over `i`
    yields `‖x‖ ≤ enorm x`. -/
lemma pi_norm_le_enorm (x : R3) : ‖x‖ ≤ enorm x := by
  rw [pi_norm_le_iff_of_nonneg (enorm_nonneg x)]
  intro i
  show ‖x i‖ ≤ enorm x
  rw [Real.norm_eq_abs, ← Real.sqrt_sq_eq_abs]
  unfold enorm
  apply Real.sqrt_le_sqrt
  exact Finset.single_le_sum (f := fun j : Fin 3 => (x j) ^ 2)
    (fun _ _ => sq_nonneg _) (Finset.mem_univ i)

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
    for every `θ ∈ (0, 1)` and `ρ > 0`.

    Proof via differentiation under the integral sign
    (`hasDerivAt_integral_of_dominated_loc_of_lip`).  The domain
    of integration is all of `R³`; the integrand
    `|∇v|² · φ(|x|/ρ')` vanishes for `|x| ≥ ρ'`, so the support
    sits inside a fixed compact ball as `ρ'` ranges over a small
    neighborhood of `ρ`.  The Lipschitz bound for the parametric
    family comes from the global Lipschitz constant `1/(1-θ)`
    of `φ_θ` and the bound `|d/dρ' (|x|/ρ')| = |x|/ρ'² ≤ 4|x|/ρ²`
    on `ρ' ∈ B(ρ, ρ/2)`. -/
theorem weightedEnergy_deriv
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ) :
    deriv (weightedEnergy θ V) ρ =
      (1 / ((1 - θ) * ρ ^ 2))
        * ∫ x in annulus (θ * ρ) ρ, gradNormSq V.v x * enorm x := by
  -- Notation.
  have h1θ : 0 < 1 - θ := by linarith
  have hρ2 : 0 < ρ ^ 2 := by positivity
  have hρ_half : 0 < ρ / 2 := by linarith
  have h2ρ : 0 < 2 * ρ := by linarith
  have h1θne : (1 - θ : ℝ) ≠ 0 := ne_of_gt h1θ
  have hρne : (ρ : ℝ) ≠ 0 := ne_of_gt hρ
  -- Parametric family `F ρ' x` and its pointwise ρ-derivative `F'`.
  set F : ℝ → R3 → ℝ :=
    fun ρ' x => gradNormSq V.v x * hat θ (enorm x / ρ') with hF_def
  set F' : R3 → ℝ :=
    fun x => (annulus (θ * ρ) ρ).indicator
      (fun x => gradNormSq V.v x * enorm x / ((1 - θ) * ρ ^ 2)) x with hF'_def
  -- The neighborhood `s` of `ρ` on which we apply DUI: ball ρ (ρ/2).
  set s : Set ℝ := Metric.ball ρ (ρ / 2) with hs_def
  have hs_mem : s ∈ 𝓝 ρ := Metric.ball_mem_nhds ρ hρ_half
  -- For ρ' ∈ s, ρ' > ρ/2.
  have hs_lower : ∀ ρ' ∈ s, ρ / 2 < ρ' := fun ρ' hρ' => by
    rw [Metric.mem_ball, Real.dist_eq] at hρ'
    have := abs_lt.mp hρ'
    linarith [this.1]
  -- For ρ' ∈ s, ρ' < 3ρ/2.
  have hs_upper : ∀ ρ' ∈ s, ρ' < 3 * ρ / 2 := fun ρ' hρ' => by
    rw [Metric.mem_ball, Real.dist_eq] at hρ'
    have := abs_lt.mp hρ'
    linarith [this.2]
  -- Integrand `gradNormSq V.v` is bounded on the closed ball `closedBall(0, 2ρ)`
  -- (Pi sup norm). Continuous functions are bounded on compacts.
  have h_compact : IsCompact (Metric.closedBall (0 : R3) (2 * ρ)) :=
    isCompact_closedBall _ _
  have h_grad_cont : Continuous (gradNormSq V.v) := continuous_gradNormSq V
  -- The bound function for DUI.
  set bound : R3 → ℝ :=
    fun x => (Metric.closedBall (0 : R3) (2 * ρ)).indicator
      (fun x => (4 * gradNormSq V.v x * enorm x) / ((1 - θ) * ρ ^ 2)) x
    with hbound_def
  -- Step A: bound ≥ 0 a.e.
  have hbound_nn : ∀ x, 0 ≤ bound x := fun x => by
    by_cases hx : x ∈ Metric.closedBall (0 : R3) (2 * ρ)
    · simp only [hbound_def, Set.indicator_of_mem hx]
      have : 0 ≤ (4 * gradNormSq V.v x * enorm x) :=
        mul_nonneg (mul_nonneg (by norm_num) (gradNormSq_nonneg _ _))
          (enorm_nonneg _)
      exact div_nonneg this (le_of_lt (mul_pos h1θ hρ2))
    · simp only [hbound_def, Set.indicator_of_notMem hx]; exact le_refl 0
  -- Step B: bound is integrable.
  have h_bound_int : Integrable bound := by
    -- bound = indicator of (closedBall (0:R3) 2ρ) of a continuous function;
    -- integrable since the closed ball is compact and the function continuous.
    have hf_cont : Continuous fun x : R3 =>
        (4 * gradNormSq V.v x * enorm x) / ((1 - θ) * ρ ^ 2) := by
      refine Continuous.div_const ?_ _
      exact (continuous_const.mul h_grad_cont).mul continuous_enorm
    have hf_intOn : IntegrableOn
        (fun x : R3 => (4 * gradNormSq V.v x * enorm x) / ((1 - θ) * ρ ^ 2))
        (Metric.closedBall (0 : R3) (2 * ρ)) :=
      hf_cont.continuousOn.integrableOn_compact h_compact
    exact hf_intOn.integrable_indicator measurableSet_closedBall
  -- Step C: For ρ' ∈ s and x ∉ closedBall(0, 2ρ), F ρ' x = 0.
  have h_F_zero_outside : ∀ ρ' ∈ s, ∀ x ∉ Metric.closedBall (0 : R3) (2 * ρ),
      F ρ' x = 0 := by
    intro ρ' hρ' x hx
    rw [Metric.mem_closedBall, dist_zero_right, not_le] at hx
    have hρ'pos : 0 < ρ' := lt_trans hρ_half (hs_lower ρ' hρ')
    have hρ'lt : ρ' < 2 * ρ := lt_trans (hs_upper ρ' hρ') (by linarith)
    -- direct: enorm x ≥ ‖x‖ > 2ρ
    have h_enorm_gt : 2 * ρ < enorm x := lt_of_lt_of_le hx (pi_norm_le_enorm x)
    have h_ratio_ge : 1 ≤ enorm x / ρ' := by
      rw [le_div_iff₀ hρ'pos]
      linarith
    simp only [hF_def, hat_of_ge_one hθ1 h_ratio_ge, mul_zero]
  -- Step D: Pointwise derivative — for a.e. x, HasDerivAt (F · x) (F' x) ρ.
  have h_diff : ∀ᵐ (x : R3) ∂volume, HasDerivAt (F · x) (F' x) ρ := by
    -- Exceptional set is {enorm x = θρ} ∪ {enorm x = ρ}.
    have hθρ_zero : volume {x : R3 | enorm x = θ * ρ} = 0 :=
      volume_enorm_eq_zero (θ * ρ)
    have hρ_zero : volume {x : R3 | enorm x = ρ} = 0 := volume_enorm_eq_zero ρ
    have h_exc : volume ({x : R3 | enorm x = θ * ρ} ∪ {x : R3 | enorm x = ρ}) = 0 :=
      le_antisymm
        ((measure_union_le _ _).trans (by rw [hθρ_zero, hρ_zero]; simp))
        (zero_le _)
    refine MeasureTheory.ae_iff.mpr ?_
    apply MeasureTheory.measure_mono_null _ h_exc
    intro x hx
    -- hx : ¬ HasDerivAt (F · x) (F' x) ρ.
    -- We need to show x ∈ {enorm x = θρ} ∪ {enorm x = ρ}.
    -- Equivalent: by contrapositive, if enorm x ∉ {θρ, ρ}, derive ¬hx.
    by_contra h_not
    apply hx
    -- h_not : x ∉ ({enorm x = θρ} ∪ {enorm x = ρ}) ⟹ enorm x ≠ θρ ∧ enorm x ≠ ρ.
    have hx_neq : enorm x ≠ θ * ρ ∧ enorm x ≠ ρ := by
      constructor
      · intro h; exact h_not (Or.inl h)
      · intro h; exact h_not (Or.inr h)
    -- Branch on |x| < θρ, θρ < |x| < ρ, |x| > ρ.
    have henn : 0 ≤ enorm x := enorm_nonneg x
    have hθρ_pos : 0 < θ * ρ := mul_pos hθ0 hρ
    have h_F_ρ' : ∀ ρ', F ρ' x = gradNormSq V.v x * hat θ (enorm x / ρ') := fun _ => rfl
    -- Inner derivative: d/dρ' (enorm x / ρ') at ρ = -enorm x / ρ²
    have h_div : HasDerivAt (fun ρ' : ℝ => enorm x / ρ') (-(enorm x) / ρ ^ 2) ρ := by
      have h_inv : HasDerivAt (fun ρ' : ℝ => ρ'⁻¹) (-(ρ ^ 2)⁻¹) ρ :=
        hasDerivAt_inv hρne
      have := h_inv.const_mul (enorm x)
      have heq1 : (fun ρ' : ℝ => enorm x * ρ'⁻¹) = fun ρ' => enorm x / ρ' := by
        funext ρ'; rw [← div_eq_mul_inv]
      rw [heq1] at this
      convert this using 1
      field_simp
    -- The hat derivative depends on whether enorm x < θρ, θρ < enorm x < ρ, or > ρ.
    rcases lt_trichotomy (enorm x) (θ * ρ) with h_lo | h_eq | h_mid
    · -- Case 1: enorm x < θ * ρ ⟹ enorm x / ρ < θ ⟹ hat' = 0.
      have h_ratio_lt : enorm x / ρ < θ := by
        rw [div_lt_iff₀ hρ]; linarith
      have h_hat : HasDerivAt (hat θ) 0 (enorm x / ρ) := hat_hasDerivAt_below h_ratio_lt
      have h_chain : HasDerivAt (fun ρ' : ℝ => hat θ (enorm x / ρ'))
          (0 * (-(enorm x) / ρ ^ 2)) ρ := h_hat.comp ρ h_div
      simp only [zero_mul] at h_chain
      have h_full : HasDerivAt (fun ρ' : ℝ => gradNormSq V.v x * hat θ (enorm x / ρ'))
          (gradNormSq V.v x * 0) ρ := h_chain.const_mul (gradNormSq V.v x)
      rw [mul_zero] at h_full
      -- The annulus indicator of x is 0 since enorm x < θρ.
      have h_not_in : x ∉ annulus (θ * ρ) ρ := fun ⟨h1, _⟩ => by linarith
      simp only [hF'_def, Set.indicator_of_notMem h_not_in]
      exact h_full
    · exact (hx_neq.1 h_eq).elim
    · rcases lt_trichotomy (enorm x) ρ with h_in | h_eq2 | h_hi
      · -- Case 2: θρ < enorm x < ρ.
        have h_ratio_lo : θ < enorm x / ρ := by rw [lt_div_iff₀ hρ]; linarith
        have h_ratio_hi : enorm x / ρ < 1 := by rw [div_lt_one hρ]; linarith
        have h_hat : HasDerivAt (hat θ) (-1 / (1 - θ)) (enorm x / ρ) :=
          hat_hasDerivAt_open h_ratio_lo h_ratio_hi
        have h_chain : HasDerivAt (fun ρ' : ℝ => hat θ (enorm x / ρ'))
            ((-1 / (1 - θ)) * (-(enorm x) / ρ ^ 2)) ρ := h_hat.comp ρ h_div
        have h_full : HasDerivAt (fun ρ' : ℝ => gradNormSq V.v x * hat θ (enorm x / ρ'))
            (gradNormSq V.v x * ((-1 / (1 - θ)) * (-(enorm x) / ρ ^ 2))) ρ :=
          h_chain.const_mul (gradNormSq V.v x)
        have h_in : x ∈ annulus (θ * ρ) ρ := ⟨h_mid, h_in⟩
        simp only [hF'_def, Set.indicator_of_mem h_in]
        convert h_full using 1
        field_simp
      · exact (hx_neq.2 h_eq2).elim
      · -- Case 3: enorm x > ρ ⟹ enorm x / ρ > 1.
        have h_ratio_gt : 1 < enorm x / ρ := by rw [lt_div_iff₀ hρ]; linarith
        have h_hat : HasDerivAt (hat θ) 0 (enorm x / ρ) := hat_hasDerivAt_above hθ1 h_ratio_gt
        have h_chain : HasDerivAt (fun ρ' : ℝ => hat θ (enorm x / ρ'))
            (0 * (-(enorm x) / ρ ^ 2)) ρ := h_hat.comp ρ h_div
        simp only [zero_mul] at h_chain
        have h_full : HasDerivAt (fun ρ' : ℝ => gradNormSq V.v x * hat θ (enorm x / ρ'))
            (gradNormSq V.v x * 0) ρ := h_chain.const_mul (gradNormSq V.v x)
        rw [mul_zero] at h_full
        have h_not_in : x ∉ annulus (θ * ρ) ρ := fun ⟨_, h2⟩ => by linarith
        simp only [hF'_def, Set.indicator_of_notMem h_not_in]
        exact h_full
  -- Step E: Lipschitz bound for parametric family.
  have h_lipsch : ∀ᵐ (x : R3) ∂volume,
      LipschitzOnWith (Real.nnabs (bound x)) (F · x) s := by
    refine Filter.Eventually.of_forall fun x => ?_
    by_cases hx : x ∈ Metric.closedBall (0 : R3) (2 * ρ)
    · -- In this case, bound x = (4 * grad * enorm x) / ((1-θ)*ρ²).
      simp only [hbound_def, Set.indicator_of_mem hx]
      have h_bound_nn : 0 ≤ 4 * gradNormSq V.v x * enorm x / ((1 - θ) * ρ ^ 2) :=
        div_nonneg
          (mul_nonneg (mul_nonneg (by norm_num) (gradNormSq_nonneg _ _))
            (enorm_nonneg _))
          (le_of_lt (mul_pos h1θ hρ2))
      have h_nnabs : (Real.nnabs (4 * gradNormSq V.v x * enorm x / ((1 - θ) * ρ ^ 2)) : ℝ)
          = 4 * gradNormSq V.v x * enorm x / ((1 - θ) * ρ ^ 2) := by
        rw [Real.coe_nnabs, abs_of_nonneg h_bound_nn]
      refine LipschitzOnWith.of_dist_le_mul fun ρ₁ hρ₁ ρ₂ hρ₂ => ?_
      rw [h_nnabs]
      have hρ₁_pos : 0 < ρ₁ := lt_trans hρ_half (hs_lower ρ₁ hρ₁)
      have hρ₂_pos : 0 < ρ₂ := lt_trans hρ_half (hs_lower ρ₂ hρ₂)
      have hρ₁_ge : ρ / 2 ≤ ρ₁ := le_of_lt (hs_lower ρ₁ hρ₁)
      have hρ₂_ge : ρ / 2 ≤ ρ₂ := le_of_lt (hs_lower ρ₂ hρ₂)
      -- distance is |·|.
      rw [show dist (F ρ₁ x) (F ρ₂ x)
            = |gradNormSq V.v x * (hat θ (enorm x / ρ₁) - hat θ (enorm x / ρ₂))| by
        rw [Real.dist_eq, hF_def]; congr 1; ring]
      rw [abs_mul, abs_of_nonneg (gradNormSq_nonneg _ _)]
      -- |hat θ (enorm x / ρ₁) - hat θ (enorm x / ρ₂)| ≤ (1/(1-θ)) * dist (enorm x / ρ₁) (enorm x / ρ₂)
      have h_hat_lip := (hat_lipschitzWith hθ1).dist_le_mul (enorm x / ρ₁) (enorm x / ρ₂)
      rw [Real.dist_eq, Real.dist_eq] at h_hat_lip
      have hposinv : (0 : ℝ) ≤ 1 / (1 - θ) := le_of_lt (one_div_pos.mpr h1θ)
      rw [Real.coe_toNNReal _ hposinv] at h_hat_lip
      -- |enorm x / ρ₁ - enorm x / ρ₂| ≤ enorm x * (4/ρ²) * |ρ₁ - ρ₂|
      have h_lower_prod : ρ ^ 2 / 4 ≤ ρ₁ * ρ₂ := by
        have h1 : (ρ/2) * (ρ/2) ≤ ρ₁ * ρ₂ :=
          mul_le_mul hρ₁_ge hρ₂_ge (by linarith) (by linarith)
        have h2 : ρ^2 / 4 = (ρ/2) * (ρ/2) := by ring
        rw [h2]; exact h1
      have h_enorm_diff :
          |enorm x / ρ₁ - enorm x / ρ₂| ≤ enorm x * (4 / ρ ^ 2) * |ρ₁ - ρ₂| := by
        have h_eq : enorm x / ρ₁ - enorm x / ρ₂ = enorm x * (ρ₂ - ρ₁) / (ρ₁ * ρ₂) := by
          field_simp
        rw [h_eq, abs_div, abs_mul, abs_of_nonneg (enorm_nonneg x)]
        rw [abs_of_pos (mul_pos hρ₁_pos hρ₂_pos), abs_sub_comm ρ₂ ρ₁]
        rw [div_le_iff₀ (mul_pos hρ₁_pos hρ₂_pos)]
        have hρ_sq_le : ρ^2 ≤ 4 * (ρ₁ * ρ₂) := by linarith
        have hineq : enorm x * |ρ₁ - ρ₂| * 1 ≤ enorm x * |ρ₁ - ρ₂| * ((4/ρ^2) * (ρ₁ * ρ₂)) := by
          apply mul_le_mul_of_nonneg_left _ (mul_nonneg (enorm_nonneg _) (abs_nonneg _))
          rw [show (4:ℝ)/ρ^2 * (ρ₁ * ρ₂) = (4 * (ρ₁ * ρ₂)) / ρ^2 by ring]
          rw [le_div_iff₀ hρ2]; linarith
        calc enorm x * |ρ₁ - ρ₂|
            = enorm x * |ρ₁ - ρ₂| * 1 := by ring
          _ ≤ enorm x * |ρ₁ - ρ₂| * ((4/ρ^2) * (ρ₁ * ρ₂)) := hineq
          _ = enorm x * (4 / ρ ^ 2) * |ρ₁ - ρ₂| * (ρ₁ * ρ₂) := by ring
      -- Final chain.
      calc gradNormSq V.v x * |hat θ (enorm x / ρ₁) - hat θ (enorm x / ρ₂)|
          ≤ gradNormSq V.v x * ((1 / (1 - θ)) * |enorm x / ρ₁ - enorm x / ρ₂|) :=
            mul_le_mul_of_nonneg_left h_hat_lip (gradNormSq_nonneg _ _)
        _ ≤ gradNormSq V.v x * ((1 / (1 - θ)) * (enorm x * (4 / ρ ^ 2) * |ρ₁ - ρ₂|)) :=
            mul_le_mul_of_nonneg_left
              (mul_le_mul_of_nonneg_left h_enorm_diff hposinv)
              (gradNormSq_nonneg _ _)
        _ = (4 * gradNormSq V.v x * enorm x / ((1 - θ) * ρ ^ 2)) * dist ρ₁ ρ₂ := by
            rw [Real.dist_eq]
            field_simp
    · -- x outside compact: F vanishes for all ρ' ∈ s, so Lipschitz with constant 0.
      simp only [hbound_def, Set.indicator_of_notMem hx]
      refine LipschitzOnWith.of_dist_le_mul fun ρ₁ hρ₁ ρ₂ hρ₂ => ?_
      rw [h_F_zero_outside ρ₁ hρ₁ x hx, h_F_zero_outside ρ₂ hρ₂ x hx]
      rw [dist_self]
      have : (Real.nnabs 0 : ℝ) = 0 := by simp
      rw [this, zero_mul]
  -- Step F: AE strong measurability of F at every ρ' near ρ.
  have h_F_meas_at : ∀ ρ', AEStronglyMeasurable (F ρ') volume := fun ρ' => by
    apply Continuous.aestronglyMeasurable
    refine h_grad_cont.mul ?_
    refine Continuous.comp (hat_lipschitzWith hθ1).continuous ?_
    exact continuous_enorm.div_const ρ'
  have h_F_meas : ∀ᶠ ρ' in 𝓝 ρ, AEStronglyMeasurable (F ρ') volume :=
    Filter.Eventually.of_forall h_F_meas_at
  -- Step G: Integrability of F at ρ — bound via `gradNormSq` truncated.
  have h_F_int : Integrable (F ρ) volume := by
    -- F ρ x = 0 for x outside closedBall(0, 2ρ); inside, |F| ≤ gradNormSq.
    set bound2 : R3 → ℝ :=
      fun x => (Metric.closedBall (0 : R3) (2 * ρ)).indicator
        (fun x => gradNormSq V.v x) x with hbound2_def
    have h_bound2_intOn : IntegrableOn (gradNormSq V.v)
        (Metric.closedBall (0 : R3) (2 * ρ)) :=
      h_grad_cont.continuousOn.integrableOn_compact h_compact
    have h_bound2_int : Integrable bound2 :=
      h_bound2_intOn.integrable_indicator measurableSet_closedBall
    refine Integrable.mono' h_bound2_int (h_F_meas_at ρ) ?_
    refine Filter.Eventually.of_forall fun x => ?_
    by_cases hx : x ∈ Metric.closedBall (0 : R3) (2 * ρ)
    · simp only [hbound2_def, Set.indicator_of_mem hx]
      rw [hF_def, Real.norm_eq_abs, abs_mul, abs_of_nonneg (gradNormSq_nonneg _ _)]
      have h_hat_le : |hat θ (enorm x / ρ)| ≤ 1 := by
        rw [abs_of_nonneg (hat_nonneg hθ1 _)]
        exact hat_le_one hθ1 _
      have h_grad_nn : 0 ≤ gradNormSq V.v x := gradNormSq_nonneg _ _
      calc gradNormSq V.v x * |hat θ (enorm x / ρ)|
          ≤ gradNormSq V.v x * 1 :=
            mul_le_mul_of_nonneg_left h_hat_le h_grad_nn
        _ = gradNormSq V.v x := by ring
    · simp only [hbound2_def, Set.indicator_of_notMem hx]
      rw [h_F_zero_outside ρ (Metric.mem_ball_self hρ_half) x hx]
      simp
  -- Step H: AE strong measurability of F'.
  have h_F'_meas : AEStronglyMeasurable F' volume := by
    rw [hF'_def]
    apply AEStronglyMeasurable.indicator _ (measurableSet_annulus _ _)
    apply Continuous.aestronglyMeasurable
    refine Continuous.div_const ?_ _
    exact h_grad_cont.mul continuous_enorm
  -- Step I: Apply DUI.
  have h_DUI := hasDerivAt_integral_of_dominated_loc_of_lip
    (μ := volume) (F := F) (s := s) (x₀ := ρ) (F' := F') (bound := bound)
    hs_mem h_F_meas h_F_int h_F'_meas h_lipsch h_bound_int h_diff
  obtain ⟨_, h_hasDeriv⟩ := h_DUI
  -- The result.
  have h_eq : (∫ a, F' a ∂volume) =
      (1 / ((1 - θ) * ρ ^ 2)) *
        ∫ x in annulus (θ * ρ) ρ, gradNormSq V.v x * enorm x := by
    rw [hF'_def]
    rw [integral_indicator (measurableSet_annulus _ _)]
    rw [show ((1 / ((1 - θ) * ρ ^ 2)) *
              ∫ x in annulus (θ * ρ) ρ, gradNormSq V.v x * enorm x)
            = ∫ x in annulus (θ * ρ) ρ,
                (1 / ((1 - θ) * ρ ^ 2)) * (gradNormSq V.v x * enorm x) by
      rw [integral_const_mul]]
    apply setIntegral_congr_fun (measurableSet_annulus _ _)
    intro x _
    field_simp
  -- Convert the function `fun x => F ρ' x = gradNormSq * hat (.../ρ')` so it matches
  -- the definition of weightedEnergy.
  have h_we : weightedEnergy θ V = fun ρ' => ∫ a, F ρ' a ∂volume := by
    funext ρ'
    rfl
  rw [h_we]
  rw [h_hasDeriv.deriv]
  exact h_eq

/-- **Lemma 2.2, first inequality, conditional form.**
    Given integrability of `gradNormSq V.v` and
    `gradNormSq V.v · enorm` on the annulus, the inequality
    `(θ / ((1-θ)ρ)) · D(ρ) ≤ E'(ρ)` follows from
    `weightedEnergy_deriv` plus the pointwise bound and set
    integral monotonicity.

    For smooth `SmoothDivFreeField` on a bounded annulus, both
    integrability hypotheses hold automatically by continuity +
    boundedness of the closed annulus; that derivation is
    deferred to a separate session. -/
theorem annularGradSq_lb_of_integrable
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ)
    (h_int_f : IntegrableOn (gradNormSq V.v) (annulus (θ * ρ) ρ))
    (h_int_g : IntegrableOn
                  (fun x => gradNormSq V.v x * enorm x)
                  (annulus (θ * ρ) ρ)) :
    (θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ
      ≤ deriv (weightedEnergy θ V) ρ := by
  rw [weightedEnergy_deriv hθ0 hθ1 V hρ]
  have h1θ : 0 < 1 - θ := by linarith
  have hρ2 : 0 < ρ ^ 2 := by positivity
  have hprod : 0 < (1 - θ) * ρ ^ 2 := mul_pos h1θ hρ2
  have hinv : (0 : ℝ) ≤ 1 / ((1 - θ) * ρ ^ 2) :=
    le_of_lt (one_div_pos.mpr hprod)
  have hθne : θ ≠ 0 := ne_of_gt hθ0
  have h1θne : (1 - θ) ≠ 0 := ne_of_gt h1θ
  have hρne : ρ ≠ 0 := ne_of_gt hρ
  -- Factor the LHS so the (1/((1-θ)ρ²)) prefactor matches the RHS:
  have lhs_rw : (θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ
              = (1 / ((1 - θ) * ρ ^ 2))
                  * (θ * ρ * annularGradSq θ V ρ) := by
    field_simp
  rw [lhs_rw]
  -- Strip the common nonneg factor:
  apply mul_le_mul_of_nonneg_left _ hinv
  -- Goal: θ * ρ * annularGradSq θ V ρ
  --       ≤ ∫ x in annulus (θ*ρ) ρ, gradNormSq V.v x * enorm x
  -- Pull the constant `θ * ρ` inside the integral:
  have const_pull :
      θ * ρ * annularGradSq θ V ρ
        = ∫ x in annulus (θ * ρ) ρ, θ * ρ * gradNormSq V.v x := by
    unfold annularGradSq
    rw [integral_const_mul]
  rw [const_pull]
  -- Apply set integral monotonicity:
  exact setIntegral_mono_on
    (h_int_f.const_mul (θ * ρ)) h_int_g (measurableSet_annulus _ _)
    (fun x hx => pointwise_bound_on_annulus hx)

/-- A continuous function on `R3` is integrable on every annulus.
    The annulus is bounded in `enorm`, hence in the Pi sup norm
    (`pi_norm_le_enorm`), so it sits inside the Pi-norm closed
    ball of radius `b`, which is compact in `R3` (a finite-
    dimensional real vector space, hence a `ProperSpace`). A
    continuous function is integrable on any compact set
    (`ContinuousOn.integrableOn_compact`); restricting via
    `IntegrableOn.mono_set` finishes. -/
lemma integrableOn_annulus_of_continuous {f : R3 → ℝ}
    (hf : Continuous f) (a b : ℝ) :
    IntegrableOn f (annulus a b) := by
  by_cases hb : 0 < b
  · -- `b > 0`: embed annulus in the Pi-norm closed ball.
    have h_subset : annulus a b ⊆ Metric.closedBall (0 : R3) b := fun x hx => by
      rw [Metric.mem_closedBall, dist_zero_right]
      exact le_of_lt (lt_of_le_of_lt (pi_norm_le_enorm x) hx.2)
    have h_compact : IsCompact (Metric.closedBall (0 : R3) b) :=
      isCompact_closedBall _ _
    exact (hf.continuousOn.integrableOn_compact h_compact).mono_set h_subset
  · -- `b ≤ 0` ⟹ `enorm x < b` is vacuous since `enorm x ≥ 0` ⟹ annulus empty
    have hb' : b ≤ 0 := not_lt.mp hb
    have h_empty : annulus a b = ∅ := by
      ext x
      refine ⟨fun hx => ?_, False.elim⟩
      have hx_nn : 0 ≤ enorm x := enorm_nonneg x
      linarith [hx.2]
    rw [h_empty]
    exact integrableOn_empty

/-- **Lemma 2.2, first inequality (unconditional form).**
    `E'(ρ) ≥ (θ / ((1-θ)ρ)) · D(ρ)`.

    Discharges the two integrability hypotheses of
    `annularGradSq_lb_of_integrable` via
    `integrableOn_annulus_of_continuous` (continuous functions
    on R3 are integrable on bounded annuli, since the annulus
    sits inside a compact Pi-norm closed ball). -/
theorem annularGradSq_lb
    {θ : ℝ} (hθ0 : 0 < θ) (hθ1 : θ < 1)
    (V : SmoothDivFreeField) {ρ : ℝ} (hρ : 0 < ρ) :
    (θ / ((1 - θ) * ρ)) * annularGradSq θ V ρ
      ≤ deriv (weightedEnergy θ V) ρ :=
  annularGradSq_lb_of_integrable hθ0 hθ1 V hρ
    (integrableOn_annulus_of_continuous (continuous_gradNormSq V) (θ * ρ) ρ)
    (integrableOn_annulus_of_continuous
      ((continuous_gradNormSq V).mul continuous_enorm) (θ * ρ) ρ)

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
