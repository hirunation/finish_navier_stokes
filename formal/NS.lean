import NS.Basic
import NS.PDE
import NS.HatFunction
import NS.Energy
import NS.ODEContradiction
import NS.Caccioppoli
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
- `NS.Energy` — Frobenius-norm gradient `gradNormSq`,
  Euclidean annulus `annulus`, weighted energy
  `weightedEnergy`, annular gradient `annularGradSq`, and the
  three parts of Lemma 2.2 (D_le_rho_deriv_E and
  annularGradSq_lb_of_integrable proved; weightedEnergy_deriv
  + unconditional annularGradSq_lb still `sorry`).
- `NS.ODEContradiction` — abstract real-analysis lemma underlying
  Tree A's `odeContradiction_obligation` (Liouville Steps 6-7 of
  the paper §9). Statement + helper sign lemmas proved; main body
  `sorry`.
- `NS.Caccioppoli` — Tree A obligation #1, the sublinear
  Caccioppoli estimate of paper §5. Statement ported with
  non-negativity sign helper proved; main body `sorry` pending
  Bogovskii operator infrastructure (paper §4).
- `NS.INS_01_L3inf_Liouville` — Theorem 1.1 of the paper
  (currently `sorry`-bodied).
-/
