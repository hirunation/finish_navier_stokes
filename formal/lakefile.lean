import Lake
open Lake DSL

/-!
Lake project for the Finish Navier–Stokes machine-verification
layer.  Skeleton authored in session 0 (2026-04-22).

No mathlib dependency at this stage.  When the first theorem
requires mathlib content (Lorentz spaces, smooth vector fields,
divergence, test-function pairing), add:

    require mathlib from git
      "https://github.com/leanprover-community/mathlib4.git" @ "<tag>"

and justify the dependency at the top of the importing file per
`formal/README.md`.

Build:  from `formal/`, run  `lake build`.
-/

package «ns» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

@[default_target]
lean_lib «NS» where
  -- Sources at `formal/NS/*.lean`.
