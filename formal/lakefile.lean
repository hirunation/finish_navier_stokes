import Lake
open Lake DSL

/-!
Lake project for the Finish Navier–Stokes machine-verification
layer.

Mathlib dependency added 2026-04-24 as part of the infrastructure
step of `desk/06_lean_formalization_plan.md`.  Pinned to
commit `00fca21215c51e01d2d90adc3b3d273de909050b`, which is the
same commit used by the sibling Tree-A and GUNS formalizations.
This matches the `leanprover/lean4:v4.29.0-rc8` toolchain and
allows `lake exe cache get` to fetch precompiled oleans that
are already present on this machine.

Build instructions:
  lake update            # resolves + freezes the Mathlib commit
  lake exe cache get     # fetches precompiled Mathlib oleans
  lake build             # compiles the `NS` library

After the Mathlib cache fetch, `lake build` should succeed with
only the expected `sorry` warning on
`NS.INS_01_L3inf_Liouville`.
-/

package «ns» where
  leanOptions := #[
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩
  ]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "00fca21215c51e01d2d90adc3b3d273de909050b"

@[default_target]
lean_lib «NS» where
  -- Sources at `formal/NS/*.lean`.
