# formal/ — Lean 4 skeleton

A minimal Lean 4 project stating the main theorem of the
accompanying paper as `NS.INS_01_L3inf_Liouville`. The proof
body is a `sorry`; the skeleton fixes names and types so that a
future mechanization can be attached without re-introducing
structural choices.

## Layout

```
formal/
├── lakefile.lean
├── lean-toolchain
├── NS.lean                              # library root (re-exports)
├── NS/
│   ├── Basic.lean                       # axiomatic placeholders
│   └── INS_01_L3inf_Liouville.lean      # main theorem statement + sorry
└── README.md
```

## Build

```
cd formal/
lake build
```

`lake build` passes with a single expected `sorry` warning from
`NS/INS_01_L3inf_Liouville.lean`.

## Roadmap

### Current state

- `NS.Basic` declares axiomatic placeholder types
  (`SmoothDivFreeField`, `SatisfiesStationaryNS`, `InWeakL3`,
  `InWeakL3CapW12Loc`, `IsZero`) to let theorem statements
  compile before a Mathlib dependency is pulled in.
- `NS.INS_01_L3inf_Liouville` states the main theorem against
  these placeholders and discharges it with `sorry`.

### Next steps (in likely order)

1. Pull in Mathlib; replace the placeholder `axiom`s with
   Mathlib-backed definitions of C$^\infty$ vector fields on
   $\mathbb{R}^3$, weak derivatives, and the stationary NS
   PDE predicate.
2. Author the Lorentz $L^{3,\infty}$ membership predicate.
   (Lorentz-space support in Mathlib is in active development;
   a local definition suffices for now.)
3. Author the Bogovski\u{\i}-operator construction
   (Lemmas 4.1–4.3 of the paper) as a Mathlib-style statement.
4. Author the Caccioppoli-type identity
   (Proposition 5.1) and the Gagliardo–Nirenberg scale-cancellation
   step (§7) as local lemmas.
5. Close the main theorem by the superlinear-ODE integration
   argument (§9).

The goal is a full machine-verified proof of
`NS.INS_01_L3inf_Liouville` against Mathlib. Collaboration on
any of the above steps is welcome.

## Correspondence with the paper

| Lean name | Paper reference |
|:---|:---|
| `NS.SmoothDivFreeField`, `NS.SatisfiesStationaryNS` | §1 equation (1.1), §2 |
| `NS.InWeakL3` | §2, Definition of $L^{3,\infty}(\mathbb{R}^3)$ |
| `NS.InWeakL3CapW12Loc` | Corollary 1.3 hypothesis |
| `NS.IsZero` | The conclusion of Theorem 1.1 |
| `NS.INS_01_L3inf_Liouville` | Theorem 1.1 |

When the main theorem closes, the smart-data entry
`insights/INS-01_l3inf_stationary_liouville.md` will update its
`verification.machine_verification` field from `pending` to
`NS.INS_01_L3inf_Liouville`.
