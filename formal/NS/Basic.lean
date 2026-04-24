import Mathlib.Analysis.Calculus.ContDiff.Basic
import Mathlib.Analysis.Normed.Lp.PiLp
import Mathlib.MeasureTheory.Constructions.Pi
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic

/-!
# NS.Basic — foundations for the Navier–Stokes Lean project

Replaces the five session-0 `axiom` placeholders with Mathlib-
backed definitions.  Infrastructure landed via
`desk/06_lean_formalization_plan.md` on 2026-04-24.

| Formerly axiomatic       | Now                                                |
|:--                       |:--                                                  |
| `SmoothDivFreeField`     | structure bundling `ContDiff ℝ ⊤` + pointwise `div = 0` |
| `SatisfiesStationaryNS`  | stub `Prop` (full PDE predicate deferred to NS.PDE)  |
| `InWeakL3`               | distribution-function definition of $L^{3,\infty}(\mathbb{R}^3)$ |
| `InWeakL3CapW12Loc`      | conjunction; second factor deferred to NS.Sobolev    |
| `IsZero`                 | pointwise `∀ x, v x = 0`                             |

We use `R3 := Fin 3 → ℝ` as the underlying type: it inherits a
`MeasureSpace` instance via `MeasureTheory.MeasureSpace.pi` and a
`NormedAddCommGroup` via `Pi.normedAddCommGroup`, both of which
the stationary $L^{3,\infty}$ Liouville theorem requires.  The
Euclidean inner-product structure is equivalent for the purposes
of Fréchet differentiation (`fderiv`) and appears when needed
through `PiLp 2` in later files.
-/

namespace NS

open MeasureTheory

/-- Three-dimensional Euclidean space, as a function type.  Inherits
    `NormedAddCommGroup`, `NormedSpace ℝ`, `MeasureSpace` (Lebesgue)
    from the `Pi` construction. -/
abbrev R3 : Type := Fin 3 → ℝ

/-- The canonical basis vector of `R3` along axis `i`. -/
noncomputable def basis (i : Fin 3) : R3 := Pi.single i (1 : ℝ)

/-- Euclidean ($L^2$) norm on `R3 = Fin 3 → ℝ`:
    `enorm x = (x₀² + x₁² + x₂²)^{1/2}`.

    Distinct from the default Pi sup norm `‖x‖`; the paper's
    `|x|` is always the Euclidean norm, so energy integrals and
    annulus definitions in `NS.Energy` use `enorm`. -/
noncomputable def enorm (x : R3) : ℝ := Real.sqrt (∑ i : Fin 3, (x i)^2)

lemma enorm_nonneg (x : R3) : 0 ≤ enorm x := Real.sqrt_nonneg _

/-- Pointwise divergence of a differentiable vector field
    `v : R3 → R3`, defined as `∑ i, ∂ᵢ (v x) i`. -/
noncomputable def divergence (v : R3 → R3) (x : R3) : ℝ :=
  ∑ i : Fin 3, (fderiv ℝ v x (basis i)) i

/-- A smooth, divergence-free vector field on $\mathbb{R}^3$. -/
structure SmoothDivFreeField where
  /-- The underlying vector field. -/
  v : R3 → R3
  /-- `v` is smooth ($C^\infty$). -/
  smooth : ContDiff ℝ (⊤ : ℕ∞) v
  /-- `v` has zero divergence pointwise. -/
  div_free : ∀ x, divergence v x = 0

/--
Membership in the Lorentz weak-$L^3$ space
$L^{3,\infty}(\mathbb{R}^3)$, defined via the distribution
function:
  $\|v\|_{L^{3,\infty}} := \sup_{t > 0} t\,\mu(\{|v| > t\})^{1/3} < \infty$.
-/
def InWeakL3 (V : SmoothDivFreeField) : Prop :=
  ∃ C : ℝ, 0 ≤ C ∧ ∀ t : ℝ, 0 < t →
    t * ((volume { x : R3 | t < ‖V.v x‖ }).toReal) ^ ((1 : ℝ) / 3) ≤ C

/--
Membership in $L^{3,\infty}(\mathbb{R}^3) \cap W^{1,2}_\mathrm{loc}(\mathbb{R}^3)$,
the sharp regularity threshold for Corollary 1.3 of the paper.

**Partial stub.** The $W^{1,2}_\mathrm{loc}$ component is deferred to
a Sobolev file; for smooth `SmoothDivFreeField` it is automatic,
so for the main theorem (which concerns smooth solutions) the
weak-$L^3$ component carries the content.
-/
def InWeakL3CapW12Loc (V : SmoothDivFreeField) : Prop := InWeakL3 V

/-- `V.v` is identically the zero vector field. -/
def IsZero (V : SmoothDivFreeField) : Prop := ∀ x, V.v x = 0

end NS
