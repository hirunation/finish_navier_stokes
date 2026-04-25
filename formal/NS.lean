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
  `weightedEnergy`, annular gradient `annularGradSq`, and Lemma 2.2.
  `D_le_rho_deriv_E`, `annularGradSq_lb_of_integrable`,
  `annularGradSq_lb` (unconditional, via auto-integrability through
  compact Pi-norm closed-ball + `pi_norm_le_enorm`), and helpers
  (`pi_norm_le_enorm`, `integrableOn_annulus_of_continuous`,
  `pointwise_bound_on_annulus`, `continuous_gradNormSq`,
  `measurableSet_annulus`) all proved. `weightedEnergy_deriv`
  still `sorry` (deferred — needs differentiation under the
  integral sign on the piecewise hat function).
- `NS.ODEContradiction` — **fully proved**: abstract real-analysis
  lemma underlying Tree A's `odeContradiction_obligation`
  (Liouville Steps 6-7 of paper §9). Decomposed into
  `rpow_diff_antideriv_tendsto_atTop`, `exists_rpow_diff_antideriv_gt`,
  `ode_pointwise_compared`, `rhs_FTC_value`, `lhs_FTC_bound`, and
  the main theorem `ode_divergence_contradiction` — closed via
  `Real.hasDerivAt_rpow_const` + `intervalIntegral.integral_eq_sub_of_hasDerivAt`
  + `intervalIntegral.integral_mono_on` + `tendsto_rpow_atTop`.
  Signature change: added `(hE_C1 : ContinuousOn (deriv E) (Ici ρ₀))`
  hypothesis to capture the docstring's "continuously differentiable"
  claim (needed for integrability of `E^(-β)·deriv E`).
- `NS.Caccioppoli` — Tree A obligation #1, the sublinear
  Caccioppoli estimate of paper §5. Statement ported with
  non-negativity sign helper proved; main body `sorry` pending
  Bogovskii operator infrastructure (paper §4).
- `NS.INS_01_L3inf_Liouville` — Theorem 1.1 of the paper
  (currently `sorry`-bodied; depends on `weightedEnergy_deriv`,
  `caccioppoli_obligation`, plus Lorentz embedding + GN +
  Galdi-testing pieces not yet stated).

## Library status

**3 sorries / 0 axioms / 28+ proved theorems.**

Proved sorry-free in Lean as of this session:
- All sign helpers + helper lemmas in NS.Basic / Energy / HatFunction.
- `pi_norm_le_enorm`, `integrableOn_annulus_of_continuous`.
- `D_le_rho_deriv_E`, `annularGradSq_lb_of_integrable`,
  `annularGradSq_lb` (unconditional).
- Full `ode_divergence_contradiction` chain.

Open obligations:
- `weightedEnergy_deriv` (NS/Energy.lean:130) — DUI on hat function.
- `caccioppoli_obligation` (NS/Caccioppoli.lean:77) — Bogovskii infrastructure.
- `INS_01_L3inf_Liouville` (NS/INS_01_L3inf_Liouville.lean:86) —
  the main theorem; assembly pending the above + Lorentz/GN/Galdi.
-/
