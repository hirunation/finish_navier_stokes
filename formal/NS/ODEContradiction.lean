import NS.Basic
import NS.Energy
import Mathlib.Analysis.Calculus.MeanValue
import Mathlib.MeasureTheory.Integral.IntervalIntegral.FundThmCalculus
import Mathlib.Analysis.SpecialFunctions.Pow.Asymptotics
import Mathlib.Analysis.SpecialFunctions.Pow.Deriv
import Mathlib.Analysis.SpecialFunctions.Pow.Continuity

/-!
# NS.ODEContradiction — the integration-divergence contradiction

This file proves the **abstract real-analysis lemma** underlying
`odeContradiction` in Tree A's
`NSProof/PartI/Liouville.lean:881`. It is the §9 "integration and
contradiction" step of the paper:

> If a positive `E : ℝ → ℝ` satisfies the superlinear ODE
> $E'(\rho) \geq c\,\rho^{-\alpha}\,E(\rho)^\beta$ on
> $[\rho_*, \infty)$ with $\beta > 1$, $\alpha < 1$, and `E` is
> bounded above on $[\rho_*, \infty)$, then a contradiction
> arises.

The argument:

1. Multiply the ODE by $E^{-\beta}$ (positive) to get
   $E^{-\beta} E' \geq c\,\rho^{-\alpha}$.
2. Integrate from $\rho_*$ to $R$. The LHS antiderivative is
   $\frac{E^{1-\beta}}{1-\beta}$; with $\beta > 1$ the factor
   $1 - \beta < 0$, so $E^{1-\beta}$ is decreasing in $E$, and
   the LHS is at most
   $\frac{E(\rho_*)^{1-\beta}}{\beta - 1}$ — a finite constant.
3. The RHS evaluates to
   $\frac{c}{1 - \alpha}(R^{1-\alpha} - \rho_*^{1-\alpha})$,
   which tends to $\infty$ as $R \to \infty$ since $1 - \alpha > 0$.
4. Bounded ≥ unbounded is a contradiction.

This file states the abstract lemma and decomposes it into
named intermediate steps. The structural growth lemmas
(`rpow_pos_diff_tendsto_atTop`, `eventually_rpow_diff_gt_const`)
are unconditionally proved; the FTC step requires `HasDerivAt`
chain rules on `E^{1-β}` and `ρ^{1-α}` plus the comparison
inequality, structured so future closure is incremental.

The PDE-side wrapper that produces the ODE from the paper's
energy estimate is in `NS.Energy` (still `sorry` at
`weightedEnergy_deriv`).
-/

namespace NS

open MeasureTheory Set Real Filter Topology

/-!
## Sign helpers
-/

lemma ode_one_sub_β_neg {β : ℝ} (hβ : 1 < β) : 1 - β < 0 := by linarith

lemma ode_one_sub_α_pos {α : ℝ} (hα : α < 1) : 0 < 1 - α := by linarith

lemma ode_β_minus_one_pos {β : ℝ} (hβ : 1 < β) : 0 < β - 1 := by linarith

/-!
## Step 1: the RHS antiderivative diverges

Closed form: `∫_{ρ₀}^{R} c·ρ^{-α} dρ = c · (R^{1-α} - ρ₀^{1-α}) / (1-α)`.
We avoid invoking interval-integral FTC here by reasoning directly
on the closed form: since `1 - α > 0`, `R ↦ R^{1-α}` tends to `∞`,
hence `R ↦ c·(R^{1-α} - ρ₀^{1-α})/(1-α)` tends to `∞`, so for every
constant `K` there is some `R > ρ₀` with the difference exceeding `K`.
-/

/-- `R ↦ R^{1-α}` tends to `+∞` as `R → ∞`, when `1 - α > 0`. -/
lemma rpow_oneSubAlpha_tendsto_atTop {α : ℝ} (hα : α < 1) :
    Tendsto (fun R : ℝ => R ^ (1 - α)) atTop atTop :=
  tendsto_rpow_atTop (ode_one_sub_α_pos hα)

/-- The closed-form RHS-antiderivative
    `R ↦ c · (R^{1-α} - ρ₀^{1-α}) / (1-α)`
    tends to `+∞` as `R → ∞`, given `c > 0` and `α < 1`. -/
lemma rpow_diff_antideriv_tendsto_atTop
    {c α ρ₀ : ℝ} (hc : 0 < c) (hα : α < 1) :
    Tendsto (fun R : ℝ => c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α))
            atTop atTop := by
  have h1α : 0 < 1 - α := ode_one_sub_α_pos hα
  -- factor: c/(1-α) > 0
  have hfac : 0 < c / (1 - α) := div_pos hc h1α
  -- f R = (c/(1-α)) * R^(1-α) + (- (c/(1-α)) * ρ₀^(1-α))
  have h_eq : (fun R : ℝ => c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α))
            = (fun R : ℝ => (c / (1 - α)) * R ^ (1 - α)
                          + (-((c / (1 - α)) * ρ₀ ^ (1 - α)))) := by
    funext R; field_simp; ring
  rw [h_eq]
  -- use `Tendsto.atTop_add` with the constant offset.
  have h_main : Tendsto (fun R : ℝ => (c / (1 - α)) * R ^ (1 - α)) atTop atTop :=
    Tendsto.const_mul_atTop hfac (rpow_oneSubAlpha_tendsto_atTop hα)
  have h_const :
      Tendsto (fun _ : ℝ => -((c / (1 - α)) * ρ₀ ^ (1 - α)))
              atTop (𝓝 (-((c / (1 - α)) * ρ₀ ^ (1 - α)))) :=
    tendsto_const_nhds
  exact h_main.atTop_add h_const

/-- For every constant `K`, some `R > ρ₀` makes the closed-form
    RHS-antiderivative exceed `K`. -/
lemma exists_rpow_diff_antideriv_gt
    {c α ρ₀ : ℝ} (hc : 0 < c) (hα : α < 1) (hρ₀ : 0 < ρ₀)
    (K : ℝ) :
    ∃ R, ρ₀ < R ∧ K < c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α) := by
  have h_tendsto := rpow_diff_antideriv_tendsto_atTop (ρ₀ := ρ₀) hc hα
  -- pick R > max ρ₀ K large enough
  obtain ⟨R, hR_ge, hR_lt⟩ : ∃ R : ℝ, ρ₀ + 1 ≤ R ∧
      K < c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α) := by
    have h := (h_tendsto.eventually (eventually_gt_atTop K)).and
              (eventually_ge_atTop (ρ₀ + 1))
    exact (h.exists).imp (fun R ⟨h1, h2⟩ => ⟨h2, h1⟩)
  exact ⟨R, by linarith, hR_lt⟩

/-!
## Step 2: the LHS antiderivative is bounded

The pointwise antiderivative identity is
`d/dρ [E(ρ)^{1-β} / (1-β)] = E(ρ)^{-β} · E'(ρ)` (chain rule on
`x ↦ x^{1-β}`). FTC gives
`∫_{ρ₀}^{R} E^{-β}·E' dρ = (E(R)^{1-β} - E(ρ₀)^{1-β}) / (1-β)`,
which (using `1 - β < 0` and `E(R)^{1-β} > 0`) is bounded above
by `E(ρ₀)^{1-β} / (β-1)`.

We state the bound as a separate lemma; its proof uses
`HasDerivAt.rpow_const` + `intervalIntegral.integral_eq_sub_of_hasDerivAt`.
-/

/-- **LHS-bound (deferred).** Under the hypotheses of
    `ode_divergence_contradiction`, for every `R ≥ ρ₀`:
    `∫_{ρ₀}^{R} E(ρ)^{-β}·E'(ρ) dρ ≤ E(ρ₀)^{1-β}/(β-1)`.

    Proof sketch: chain rule gives
    `HasDerivAt (E^{1-β}/(1-β)) (E^{-β}·E') ρ`; FTC gives
    `∫ = (E(R)^{1-β} - E(ρ₀)^{1-β})/(1-β)`; rearrange using
    `1-β < 0` and `E(R)^{1-β} > 0` (positive rpow). -/
theorem lhs_FTC_bound
    {c α β ρ₀ M : ℝ} (_hc : 0 < c) (_hα : α < 1) (hβ : 1 < β)
    (hρ₀ : 0 < ρ₀) (_hM : 0 < M)
    (E : ℝ → ℝ)
    (hE_pos : ∀ ρ ∈ Ici ρ₀, 0 < E ρ)
    (_hE_diff : ∀ ρ ∈ Ici ρ₀, DifferentiableAt ℝ E ρ)
    (_hE_bdd : ∀ ρ ∈ Ici ρ₀, E ρ ≤ M)
    (_hODE : ∀ ρ ∈ Ici ρ₀, c * ρ ^ (-α) * (E ρ) ^ β ≤ deriv E ρ)
    (R : ℝ) (_hR : ρ₀ ≤ R) :
    ∫ ρ in ρ₀..R, (E ρ) ^ (-β) * deriv E ρ ≤
      (E ρ₀) ^ (1 - β) / (β - 1) := by
  -- Detailed FTC argument deferred.
  -- Key constants: E(ρ₀) > 0 (from hE_pos applied at ρ₀), so
  -- E(ρ₀)^{1-β} > 0 by Real.rpow_pos_of_pos.
  -- Antiderivative: `fun ρ => E(ρ)^{1-β} / (1-β)`.
  -- HasDerivAt step uses: `HasDerivAt.rpow_const`,
  --   `HasDerivAt.div_const`.
  -- intervalIntegral.integral_eq_sub_of_hasDerivAt yields equality.
  -- E(R)^{1-β} > 0 + (1-β < 0) gives the upper bound.
  have hE_ρ₀_pos : 0 < E ρ₀ := hE_pos ρ₀ Set.self_mem_Ici
  have h_β_pos : 0 < β - 1 := ode_β_minus_one_pos hβ
  have h_E_ρ₀_rpow_pos : 0 < (E ρ₀) ^ (1 - β) := Real.rpow_pos_of_pos hE_ρ₀_pos _
  -- Sign sanity: E(ρ₀)^{1-β}/(β-1) > 0; this is consistent with
  -- the LHS being ≤ a positive constant.
  sorry

/-!
## Step 3: the comparison inequality

Pointwise on `[ρ₀, R]`: `c·ρ^{-α} ≤ E(ρ)^{-β}·E'(ρ)`. Integration
preserves the inequality.

Rearranging from `c·ρ^{-α}·E^β ≤ E'`: dividing by `E^β > 0` gives
`c·ρ^{-α} ≤ E^{-β}·E'`. The integral form follows by
`intervalIntegral.integral_mono_on`.
-/

/-- **Pointwise comparison.** Dividing the ODE inequality by
    `E(ρ)^β > 0` recovers `c·ρ^{-α} ≤ E^{-β}(ρ)·E'(ρ)`. -/
lemma ode_pointwise_compared
    {c α β : ℝ} (_hc : 0 < c) (_hβ : 1 < β)
    {ρ₀ : ℝ} (_hρ₀ : 0 < ρ₀)
    (E : ℝ → ℝ)
    (hE_pos : ∀ ρ ∈ Ici ρ₀, 0 < E ρ)
    (hODE : ∀ ρ ∈ Ici ρ₀, c * ρ ^ (-α) * (E ρ) ^ β ≤ deriv E ρ)
    {ρ : ℝ} (hρ : ρ ∈ Ici ρ₀) :
    c * ρ ^ (-α) ≤ (E ρ) ^ (-β) * deriv E ρ := by
  have hE : 0 < E ρ := hE_pos ρ hρ
  have hEβ_pos : 0 < (E ρ) ^ β := Real.rpow_pos_of_pos hE _
  have hODE_at : c * ρ ^ (-α) * (E ρ) ^ β ≤ deriv E ρ := hODE ρ hρ
  -- Multiply both sides by (E ρ) ^ (-β) > 0 (preserves ≤).
  have hENegBeta_pos : 0 < (E ρ) ^ (-β) := Real.rpow_pos_of_pos hE _
  -- Use: a*b*c ≤ d ⟹ a ≤ d / (b*c) (when b*c > 0).
  -- Cleaner: rewrite (E ρ)^(-β) * (E ρ)^β = 1.
  have h_rpow_inv :
      (E ρ) ^ (-β) * (E ρ) ^ β = 1 := by
    rw [← Real.rpow_add hE]; simp
  calc c * ρ ^ (-α)
      = c * ρ ^ (-α) * 1 := by ring
    _ = c * ρ ^ (-α) * ((E ρ) ^ (-β) * (E ρ) ^ β) := by rw [h_rpow_inv]
    _ = (E ρ) ^ (-β) * (c * ρ ^ (-α) * (E ρ) ^ β) := by ring
    _ ≤ (E ρ) ^ (-β) * deriv E ρ :=
        mul_le_mul_of_nonneg_left hODE_at (le_of_lt hENegBeta_pos)

/-!
## Step 4: the RHS integral lower bound

`∫_{ρ₀}^{R} c·ρ^{-α} dρ = c·(R^{1-α} - ρ₀^{1-α})/(1-α)` by FTC
applied to the antiderivative `c·ρ^{1-α}/(1-α)`. We state this
explicitly since it provides the "unbounded RHS" closed form
without needing to compute integrals downstream.
-/

/-- **RHS-FTC value.** For `0 < ρ₀ ≤ R`,
    `∫_{ρ₀}^{R} c·ρ^{-α} dρ = c·(R^{1-α} - ρ₀^{1-α})/(1-α)`.

    Proof: the antiderivative `F(ρ) = c·ρ^{1-α}/(1-α)` has
    `HasDerivAt F (c·ρ^{-α}) ρ` for every `ρ > 0` via
    `Real.hasDerivAt_rpow_const`. The integrand is continuous on
    `[ρ₀, R]` (rpow is continuous away from 0), hence
    interval-integrable. `intervalIntegral.integral_eq_sub_of_hasDerivAt`
    closes. -/
theorem rhs_FTC_value
    {c α ρ₀ : ℝ} (_hc : 0 < c) (hα : α < 1) (hρ₀ : 0 < ρ₀)
    (R : ℝ) (hR : ρ₀ ≤ R) :
    ∫ ρ in ρ₀..R, c * ρ ^ (-α) =
      c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α) := by
  have h1α : 0 < 1 - α := ode_one_sub_α_pos hα
  have h1α_ne : (1 - α) ≠ 0 := ne_of_gt h1α
  -- Antiderivative.
  set F : ℝ → ℝ := fun ρ => c * ρ ^ (1 - α) / (1 - α) with hF_def
  -- Step 1: pointwise HasDerivAt for ρ in the interval.
  have h_deriv : ∀ ρ ∈ Set.uIcc ρ₀ R, HasDerivAt F (c * ρ ^ (-α)) ρ := by
    intro ρ hρ
    rw [Set.uIcc_of_le hR] at hρ
    have hρ_pos : 0 < ρ := lt_of_lt_of_le hρ₀ hρ.1
    have hρ_ne : ρ ≠ 0 := ne_of_gt hρ_pos
    have h_rpow : HasDerivAt (fun ρ : ℝ => ρ ^ (1 - α))
                  ((1 - α) * ρ ^ ((1 - α) - 1)) ρ :=
      Real.hasDerivAt_rpow_const (Or.inl hρ_ne)
    have h1 : HasDerivAt (fun ρ : ℝ => c * ρ ^ (1 - α))
                  (c * ((1 - α) * ρ ^ ((1 - α) - 1))) ρ :=
      h_rpow.const_mul c
    have h2 : HasDerivAt F
                  (c * ((1 - α) * ρ ^ ((1 - α) - 1)) / (1 - α)) ρ :=
      h1.div_const (1 - α)
    have h_simp : c * ((1 - α) * ρ ^ ((1 - α) - 1)) / (1 - α) = c * ρ ^ (-α) := by
      have h_exp : (1 - α) - 1 = -α := by ring
      rw [h_exp]; field_simp
    rwa [h_simp] at h2
  -- Step 2: continuity of the integrand on the interval ⟹ integrable.
  have h_int : IntervalIntegrable (fun ρ => c * ρ ^ (-α))
                  MeasureTheory.volume ρ₀ R := by
    apply ContinuousOn.intervalIntegrable
    apply (continuousOn_id (s := Set.uIcc ρ₀ R)).rpow_const ?_ |>.const_mul c
    intro x hx
    rw [Set.uIcc_of_le hR] at hx
    exact Or.inl (ne_of_gt (lt_of_lt_of_le hρ₀ hx.1))
  -- Step 3: assemble via FTC.
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt h_deriv h_int]
  simp only [hF_def]
  field_simp

/-!
## Main theorem

Assembling Steps 1–4: choose `R` per Step 1 with the closed-form
RHS exceeding the Step-2 bound; combine Steps 3 & 4 with
`intervalIntegral.integral_mono_on` to get the integral inequality;
contradict.
-/

/--
**ODE-divergence contradiction (abstract form).**

Suppose `E : ℝ → ℝ` is positive and continuously differentiable
on `[ρ₀, ∞)`, bounded above by some `M`, and satisfies the
superlinear ODE inequality
$E'(\rho) \geq c\,\rho^{-\alpha}\,E(\rho)^\beta$ for $\rho \geq
\rho_*$, with $\beta > 1$, $\alpha < 1$, $c > 0$, and $\rho_* > 0$.

Then `False`.

**Proof strategy** (assembled from Steps 1–4 above):

1. By `exists_rpow_diff_antideriv_gt`, pick `R > ρ₀` with
   `c·(R^{1-α}-ρ₀^{1-α})/(1-α) > E(ρ₀)^{1-β}/(β-1)`.
2. By `rhs_FTC_value`, this equals `∫_{ρ₀}^{R} c·ρ^{-α} dρ`.
3. By `ode_pointwise_compared` + `intervalIntegral.integral_mono_on`,
   `∫_{ρ₀}^{R} c·ρ^{-α} dρ ≤ ∫_{ρ₀}^{R} E^{-β}·E' dρ`.
4. By `lhs_FTC_bound`, `∫_{ρ₀}^{R} E^{-β}·E' dρ ≤ E(ρ₀)^{1-β}/(β-1)`.
5. Chain: the chosen `R` makes the RHS strictly greater than the LHS
   on the very same expression — contradiction.

Closure pending steps `lhs_FTC_bound` and `rhs_FTC_value`
(both FTC + chain-rule on `rpow`); the structural divergence
(Step 1) and pointwise comparison (Step 3) are unconditional.
-/
theorem ode_divergence_contradiction
    {c α β ρ₀ M : ℝ} (hc : 0 < c) (hα : α < 1) (hβ : 1 < β)
    (hρ₀ : 0 < ρ₀) (hM : 0 < M)
    (E : ℝ → ℝ)
    (hE_pos : ∀ ρ ∈ Ici ρ₀, 0 < E ρ)
    (hE_diff : ∀ ρ ∈ Ici ρ₀, DifferentiableAt ℝ E ρ)
    (hE_bdd : ∀ ρ ∈ Ici ρ₀, E ρ ≤ M)
    (hODE : ∀ ρ ∈ Ici ρ₀, c * ρ ^ (-α) * (E ρ) ^ β ≤ deriv E ρ) :
    False := by
  -- Step 1: pick R large enough.
  obtain ⟨R, hR_gt, hR_big⟩ :=
    exists_rpow_diff_antideriv_gt hc hα hρ₀ ((E ρ₀) ^ (1 - β) / (β - 1))
  have hR_ge : ρ₀ ≤ R := le_of_lt hR_gt
  -- Step 2: rewrite RHS via FTC.
  have h_rhs : ∫ ρ in ρ₀..R, c * ρ ^ (-α) =
      c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α) :=
    rhs_FTC_value hc hα hρ₀ R hR_ge
  -- Step 3: comparison gives integral inequality (assembly via FTC step).
  have h_compare : ∫ ρ in ρ₀..R, c * ρ ^ (-α)
                  ≤ ∫ ρ in ρ₀..R, (E ρ) ^ (-β) * deriv E ρ := by
    -- Apply pointwise comparison + integral_mono_on (assembly deferred
    -- to the FTC closure: we need integrability of both sides on [ρ₀, R],
    -- which follows from continuity of `c·ρ^{-α}` on `(0, ∞)` and of
    -- `E^{-β}·E'` from `hE_pos`/`hE_diff`).
    sorry
  -- Step 4: bound LHS-side.
  have h_lhs : ∫ ρ in ρ₀..R, (E ρ) ^ (-β) * deriv E ρ ≤
                (E ρ₀) ^ (1 - β) / (β - 1) :=
    lhs_FTC_bound hc hα hβ hρ₀ hM E hE_pos hE_diff hE_bdd hODE R hR_ge
  -- Chain Steps 3–4 with the closed form from Step 2 to derive
  -- the contradiction with our choice of R.
  have h_chain : c * (R ^ (1 - α) - ρ₀ ^ (1 - α)) / (1 - α)
              ≤ (E ρ₀) ^ (1 - β) / (β - 1) := by
    rw [← h_rhs]
    exact le_trans h_compare h_lhs
  linarith

end NS
