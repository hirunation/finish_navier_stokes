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

end NS
