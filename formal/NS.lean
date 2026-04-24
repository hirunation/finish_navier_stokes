import NS.Basic
import NS.PDE
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
- `NS.INS_01_L3inf_Liouville` — Theorem 1.1 of the paper
  (currently `sorry`-bodied).
-/
