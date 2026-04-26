import NS.Basic
import Mathlib.Tactic

/-!
# NS.HatFunction — the piecewise-linear hat function and basic properties

Corresponds to Notation 2.1 of the paper.  For `θ ∈ (0, 1)`, the
hat function is

$$
  \varphi_\theta(t) =
  \begin{cases}
  1 & 0 \le t < \theta, \\
  \dfrac{1 - t}{1 - \theta} & \theta \le t < 1, \\
  0 & t \ge 1.
  \end{cases}
$$

This file defines `hat θ t` and establishes the elementary
properties used throughout: non-negativity, $\le 1$ bound,
value on `[0, θ)`, value on `[θ, 1)`, and value on `[1, ∞)`.
The derivative formula (Lemma 2.2 of the paper) is deferred to
a subsequent session.
-/

namespace NS

/-- The piecewise-linear radial hat function.

    `hat θ t = 1` on `(-∞, θ)`, linearly decreases to `0` over
    `[θ, 1]`, and is `0` for `t ≥ 1`. -/
noncomputable def hat (θ : ℝ) (t : ℝ) : ℝ :=
  if t < θ then 1
  else if t < 1 then (1 - t) / (1 - θ)
  else 0

section Basic

variable {θ t : ℝ}

/-- On the plateau `t < θ`, the hat function is identically `1`. -/
lemma hat_of_lt_theta (hθ : t < θ) : hat θ t = 1 := by
  unfold hat; simp [hθ]

/-- On the transition layer `θ ≤ t < 1`, the hat function is
    `(1 - t) / (1 - θ)`. -/
lemma hat_of_mem_annulus (hθ1 : θ ≤ t) (ht1 : t < 1) :
    hat θ t = (1 - t) / (1 - θ) := by
  unfold hat
  have h : ¬ t < θ := not_lt.mpr hθ1
  simp [h, ht1]

/-- On the exterior `t ≥ 1`, the hat function vanishes. -/
lemma hat_of_ge_one (hθ : θ < 1) (ht : 1 ≤ t) : hat θ t = 0 := by
  unfold hat
  have h1 : ¬ t < θ := not_lt.mpr (le_trans (le_of_lt hθ) ht)
  have h2 : ¬ t < 1 := not_lt.mpr ht
  simp [h1, h2]

/-- The hat function is non-negative for `θ < 1`. -/
lemma hat_nonneg (h1 : θ < 1) (t : ℝ) : 0 ≤ hat θ t := by
  unfold hat
  split_ifs with ht1 ht2
  · exact zero_le_one
  · have : 0 < 1 - θ := by linarith
    apply div_nonneg <;> linarith
  · exact le_refl 0

/-- The hat function is bounded above by `1` for `θ < 1`. -/
lemma hat_le_one (h1 : θ < 1) (t : ℝ) : hat θ t ≤ 1 := by
  unfold hat
  split_ifs with ht1 ht2
  · exact le_refl 1
  · have hθ1 : 0 < 1 - θ := by linarith
    have ht : θ ≤ t := not_lt.mp ht1
    rw [div_le_one hθ1]
    linarith
  · linarith

end Basic

/-!
## Differentiability on each piece

The hat function is differentiable separately on each open piece
of its piecewise definition. The boundary points `t = θ` and `t = 1`
are excluded (the function is continuous there but the derivative
jumps); for differentiation-under-the-integral applications they
form a measure-zero set so this is sufficient.

These three lemmas together give pointwise `HasDerivAt` everywhere
on `ℝ \ {θ, 1}`, which is what `weightedEnergy_deriv` needs once
the chain rule on `t = |x|/ρ` is composed.
-/

section Deriv

variable {θ t : ℝ}

/-- On the plateau `t < θ`, `hat θ` has derivative `0`. -/
lemma hat_hasDerivAt_below (h : t < θ) : HasDerivAt (hat θ) 0 t := by
  apply (hasDerivAt_const t (1 : ℝ)).congr_of_eventuallyEq
  filter_upwards [Iio_mem_nhds h] with s hs
  exact hat_of_lt_theta hs

/-- On the linear transition layer `θ < t < 1`, `hat θ` has
    derivative `-1 / (1 - θ)`. -/
lemma hat_hasDerivAt_open (h_lo : θ < t) (h_hi : t < 1) :
    HasDerivAt (hat θ) (-1 / (1 - θ)) t := by
  -- The linear extension `s ↦ (1 - s) / (1 - θ)` agrees with `hat θ`
  -- on the open interval `(θ, 1)`; derive there and transport.
  have h_const : HasDerivAt (fun _ : ℝ => (1 : ℝ)) 0 t := hasDerivAt_const t 1
  have h_id : HasDerivAt (id : ℝ → ℝ) 1 t := hasDerivAt_id t
  have h_sub : HasDerivAt (fun s : ℝ => 1 - s) (0 - 1) t := h_const.sub h_id
  have h_lin : HasDerivAt (fun s : ℝ => (1 - s) / (1 - θ)) ((0 - 1) / (1 - θ)) t :=
    h_sub.div_const (1 - θ)
  have h_simp : (0 - 1) / (1 - θ) = -1 / (1 - θ) := by ring
  rw [h_simp] at h_lin
  apply h_lin.congr_of_eventuallyEq
  filter_upwards [Ioo_mem_nhds h_lo h_hi] with s hs
  exact hat_of_mem_annulus (le_of_lt hs.1) hs.2

/-- On the exterior `1 < t`, `hat θ` has derivative `0`. -/
lemma hat_hasDerivAt_above (hθ1 : θ < 1) (h : 1 < t) : HasDerivAt (hat θ) 0 t := by
  apply (hasDerivAt_const t (0 : ℝ)).congr_of_eventuallyEq
  filter_upwards [Ioi_mem_nhds h] with s hs
  exact hat_of_ge_one hθ1 (le_of_lt hs)

end Deriv

/-!
## Lipschitz form

The hat function admits the closed-form
`hat θ t = max 0 (min 1 ((1 - t) / (1 - θ)))`. As composition
of Lipschitz functions, this gives `hat θ` a global Lipschitz
constant of `1 / (1 - θ)`.
-/

section Lipschitz

variable {θ : ℝ}

/-- Closed form of `hat θ` as `max 0 (min 1 ((1-t)/(1-θ)))`. -/
lemma hat_eq_max_min (hθ1 : θ < 1) (t : ℝ) :
    hat θ t = max 0 (min 1 ((1 - t) / (1 - θ))) := by
  have h1θ : 0 < 1 - θ := by linarith
  unfold hat
  by_cases ht1 : t < θ
  · simp only [if_pos ht1]
    have : 1 ≤ (1 - t) / (1 - θ) := by
      rw [le_div_iff₀ h1θ, one_mul]; linarith
    rw [min_eq_left this]
    exact (max_eq_right zero_le_one).symm
  · simp only [if_neg ht1]
    by_cases ht2 : t < 1
    · simp only [if_pos ht2]
      have hθt : θ ≤ t := not_lt.mp ht1
      have hupper : (1 - t) / (1 - θ) ≤ 1 := by
        rw [div_le_one h1θ]; linarith
      have hlower : 0 ≤ (1 - t) / (1 - θ) :=
        div_nonneg (by linarith) (le_of_lt h1θ)
      rw [min_eq_right hupper, max_eq_right hlower]
    · simp only [if_neg ht2]
      have ht : 1 ≤ t := not_lt.mp ht2
      have hupper : (1 - t) / (1 - θ) ≤ 0 :=
        div_nonpos_of_nonpos_of_nonneg (by linarith) (le_of_lt h1θ)
      have hupper' : (1 - t) / (1 - θ) ≤ 1 := le_trans hupper zero_le_one
      rw [min_eq_right hupper']
      rw [max_eq_left hupper]

/-- The hat function is globally Lipschitz with constant `1/(1-θ)`. -/
lemma hat_lipschitzWith (hθ1 : θ < 1) :
    LipschitzWith (Real.toNNReal (1 / (1 - θ))) (hat θ) := by
  have h1θ : 0 < 1 - θ := by linarith
  have hposinv : (0 : ℝ) ≤ 1 / (1 - θ) := le_of_lt (one_div_pos.mpr h1θ)
  -- Step 1: `t ↦ (1 - t) / (1 - θ)` is `1/(1-θ)`-Lipschitz.
  have h_lin : LipschitzWith (Real.toNNReal (1 / (1 - θ)))
      (fun t : ℝ => (1 - t) / (1 - θ)) := by
    refine LipschitzWith.of_dist_le_mul fun x y => ?_
    rw [Real.dist_eq, Real.dist_eq]
    have hsub : (1 - x) / (1 - θ) - (1 - y) / (1 - θ) = (y - x) / (1 - θ) := by ring
    rw [hsub, abs_div, abs_of_pos h1θ]
    rw [Real.coe_toNNReal _ hposinv]
    rw [abs_sub_comm y x]
    apply le_of_eq
    field_simp
  -- Step 2: composition with min 1 (1-Lipschitz).
  have h_min : LipschitzWith (Real.toNNReal (1 / (1 - θ)))
      (fun t : ℝ => min 1 ((1 - t) / (1 - θ))) := h_lin.const_min 1
  -- Step 3: composition with max 0.
  have h_max : LipschitzWith (Real.toNNReal (1 / (1 - θ)))
      (fun t : ℝ => max 0 (min 1 ((1 - t) / (1 - θ)))) := h_min.const_max 0
  -- Step 4: rewrite to `hat θ`.
  have heq : hat θ = (fun t : ℝ => max 0 (min 1 ((1 - t) / (1 - θ)))) := by
    funext t; exact hat_eq_max_min hθ1 t
  rw [heq]
  exact h_max

end Lipschitz

end NS
