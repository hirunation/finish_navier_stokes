import NS.Basic

/-!
# NS.PDE — the stationary Navier–Stokes predicate

Authors the real content that `NS.Basic.SatisfiesStationaryNS`
was stubbed for in the Session N+2 axiom-replacement pass.

## The equation

$$
  -\nu\,\Delta v(x) + (v \cdot \nabla) v(x) + \nabla p(x) = 0
  \qquad \forall x \in \mathbb{R}^3,
$$

for a smooth divergence-free vector field $v : \mathbb{R}^3 \to
\mathbb{R}^3$, a smooth scalar pressure field $p : \mathbb{R}^3
\to \mathbb{R}$, and a fixed kinematic viscosity $\nu > 0$.

## Components

- `partialD j v` — the $j$-th partial derivative of a vector
  field, defined as `x ↦ fderiv ℝ v x (basis j)`.  Value in
  `R3`.
- `vectorLaplacian v x` — the componentwise Laplacian
  $\Delta v(x)$, defined as $\sum_j \partial_j^2 v(x)$.
- `advection v x` — the directional derivative
  $(v(x) \cdot \nabla) v(x) = (\mathrm{fderiv}\; v\; x)(v(x))$.
- `scalarGradient p x` — the gradient of a scalar field
  $p$ at $x$, returned as an element of `R3`.
-/

namespace NS

open MeasureTheory

/-- The $j$-th partial derivative operator on vector fields. -/
noncomputable def partialD (j : Fin 3) (v : R3 → R3) : R3 → R3 :=
  fun x => fderiv ℝ v x (basis j)

/-- Componentwise Laplacian of a vector field. -/
noncomputable def vectorLaplacian (v : R3 → R3) (x : R3) : R3 :=
  ∑ j : Fin 3, partialD j (partialD j v) x

/-- The directional derivative $(v \cdot \nabla) v$ evaluated at `x`:
    the Fréchet derivative of `v` at `x` applied to the vector
    `v x`. -/
noncomputable def advection (v : R3 → R3) (x : R3) : R3 :=
  fderiv ℝ v x (v x)

/-- Gradient of a scalar field `p : R3 → ℝ`, represented as a
    vector in `R3` with $i$-th component $\partial_i p(x)$. -/
noncomputable def scalarGradient (p : R3 → ℝ) (x : R3) : R3 :=
  fun i => fderiv ℝ p x (basis i)

/--
The stationary Navier–Stokes equation with a specific viscosity
`ν` and pressure field `p`:
$$ -\nu\,\Delta v(x) + (v \cdot \nabla) v(x) + \nabla p(x) = 0 $$
pointwise for every `x ∈ R3`, together with the positivity of
`ν` and the smoothness of `p`.
-/
def SatisfiesStationaryNSWithPressure
    (V : SmoothDivFreeField) (ν : ℝ) (p : R3 → ℝ) : Prop :=
  0 < ν ∧ ContDiff ℝ (⊤ : ℕ∞) p ∧
  ∀ x : R3,
    (- ν) • vectorLaplacian V.v x + advection V.v x + scalarGradient p x = 0

/--
`V` satisfies the stationary Navier–Stokes equations for some
viscosity `ν > 0` and some smooth pressure field `p`.  This is
the unqualified predicate used in the statement of Theorem 1.1.

This **supersedes** the `True`-valued stub introduced in
`NS.Basic` during the Session N+2 axiom-replacement pass.  The
main theorem file imports this module and uses this predicate.
-/
def SatisfiesStationaryNS (V : SmoothDivFreeField) : Prop :=
  ∃ (ν : ℝ) (p : R3 → ℝ), SatisfiesStationaryNSWithPressure V ν p

end NS
