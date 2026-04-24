/-!
# NS.Basic — common foundations for the Navier–Stokes Lean project

Skeleton authored in session 0 (2026-04-22).  Contains **axiomatic
placeholders** for the function-space and NS-equation predicates
used by downstream theorem files.  Each placeholder will be
replaced with a mathlib-based definition in a subsequent session
when the mathlib dependency is pulled in.

**Mathlib dependency at this stage:** NONE.

## Roadmap for replacement

| Placeholder              | Future definition                                    |
|:--                       |:--                                                    |
| `SmoothDivFreeField`     | C^∞ vector field on ℝ³ with ∇·v = 0 via mathlib       |
| `SatisfiesStationaryNS`  | Weak/classical stationary NS PDE predicate           |
| `InWeakL3`               | Lorentz-space membership L^{3,∞}(ℝ³)                  |
| `InW12Loc`               | Sobolev W^{1,2}_loc(ℝ³) membership (for INS-04)      |
| `IsZero`                 | Pointwise / a.e.-zero vector field                    |

The axiom-stubs are intentionally logically inert: they fix
names and namespaces so theorem files compile now, and they will
be removed in favor of genuine `def`s when mathlib arrives.
-/

namespace NS

/-- Placeholder type for a smooth divergence-free vector field on
    ℝ³.  Future sessions replace with a mathlib-based definition
    of a C^∞ map `ℝ³ → ℝ³` whose divergence vanishes pointwise. -/
axiom SmoothDivFreeField : Type

/-- Placeholder predicate: `v` satisfies the stationary Navier–
    Stokes equation  `−νΔv + (v · ∇)v + ∇p = 0`  in the appropriate
    (weak or classical) sense.  Future sessions replace with the
    genuine PDE predicate built from mathlib calculus primitives. -/
axiom SatisfiesStationaryNS : SmoothDivFreeField → Prop

/-- Placeholder predicate: `v ∈ L^{3,∞}(ℝ³)`, the Lorentz weak-L³
    space.  Future sessions replace with a mathlib-based Lorentz
    membership (pending Lorentz-space support landing in mathlib,
    which is in active development but not yet stable). -/
axiom InWeakL3 : SmoothDivFreeField → Prop

/-- Placeholder predicate: `v ∈ L^{3,∞}(ℝ³) ∩ W^{1,2}_loc(ℝ³)`,
    the sharp threshold for the INS-04 weak-solution extension. -/
axiom InWeakL3CapW12Loc : SmoothDivFreeField → Prop

/-- Placeholder predicate: `v` is identically the zero vector
    field on ℝ³.  Future sessions replace with a pointwise (or
    a.e.-)zero predicate matching the regularity class. -/
axiom IsZero : SmoothDivFreeField → Prop

end NS
