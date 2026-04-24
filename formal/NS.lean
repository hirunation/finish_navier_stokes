import NS.Basic
import NS.PDE
import NS.HatFunction
import NS.INS_01_L3inf_Liouville

/-!
# NS — library root

Re-exports the modules of the NS Lean library.  Import this file
to get access to the entire library in one line:

    import NS

Module index:

- `NS.Basic` — R3, basis, divergence, SmoothDivFreeField,
  InWeakL3, InWeakL3CapW12Loc, IsZero.
- `NS.PDE` — partialD, vectorLaplacian, advection,
  scalarGradient, SatisfiesStationaryNSWithPressure,
  SatisfiesStationaryNS.
- `NS.HatFunction` — piecewise-linear hat `hat θ t` of
  Notation 2.1, with the elementary properties (support,
  non-negativity, value on each piece, bound ≤ 1).
- `NS.INS_01_L3inf_Liouville` — Theorem 1.1 of the paper
  (currently `sorry`-bodied).
-/
