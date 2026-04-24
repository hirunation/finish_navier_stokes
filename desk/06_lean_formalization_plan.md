# Desk · 2026-04-24 · Lean 4 formalization plan for Theorem 1.1

After desk/05 established that energy-method rescues for LEM-06
reduce to Prodi–Serrin, the highest-value next move is to harden
the existing unconditional result — Theorem 1.1 of the paper
(the stationary $L^{3,\infty}$ Liouville theorem) — by machine-
verifying it in Lean 4 against Mathlib. This desk piece lays out
the roadmap.

## §1 Target

**`NS.INS_01_L3inf_Liouville`**: the statement of Theorem 1.1 as
it appears in `formal/NS/INS_01_L3inf_Liouville.lean`, but with
the proof body replaced with a real derivation closing on
Mathlib primitives, and with the axiom placeholders in
`NS.Basic` replaced by Mathlib-backed definitions.

Success criterion: `lake build` passes with **zero `sorry`** and
**zero external `axiom`** in the `NS` namespace. The five
classical axioms quarantined in the corpus (AX-01..AX-05) may be
imported as Mathlib lemmas if available, otherwise stated as
explicit `axiom` declarations at the top of `NS.Basic` with
scope noted.

## §2 Current state

`formal/` is a **skeleton**:

- `NS/Basic.lean`: five `axiom` placeholders (`SmoothDivFreeField`,
  `SatisfiesStationaryNS`, `InWeakL3`, `InWeakL3CapW12Loc`,
  `IsZero`). Logically inert — they fix names so theorem files
  typecheck, nothing more.
- `NS/INS_01_L3inf_Liouville.lean`: states the theorem against
  those placeholders, closes with `sorry`.
- No Mathlib dependency.

## §3 Translation table — paper section → Lean structure

| Paper reference | Lean target | Type / signature sketch |
|:---|:---|:---|
| §2, `SmoothDivFreeField` | `NS.SmoothDivFreeField` | `structure SmoothDivFreeField where  v : EuclideanSpace ℝ (Fin 3) → EuclideanSpace ℝ (Fin 3)  smooth : ContDiff ℝ ⊤ v  div_free : ∀ x, (div v) x = 0` |
| §1 eq. (1.1), `SatisfiesStationaryNS` | `NS.SatisfiesStationaryNS` | Predicate asserting $-\nu \Delta v + (v \cdot \nabla) v + \nabla p = 0$ weakly / classically |
| §2 defn of $L^{3,\infty}$ | `NS.InWeakL3` | Predicate: the distribution function satisfies $\sup_t t \cdot \mu\{|v|>t\}^{1/3} < \infty$ |
| Notation §2, hat function | `NS.hat` | `def hat (θ : ℝ) (r : ℝ) : ℝ` piecewise-linear as in paper |
| Lemma 2.2 (derivative formula) | `NS.hat_deriv_identity` | Theorem: derivative of weighted energy integral |
| Lemma 4.1 (Bogovskii operator) | `NS.Bogovskii` | Structure: operator $\BB$ with (B1)–(B4) properties |
| Cor 4.3 (uniform annular bound) | `NS.bogovskii_annulus_uniform` | $\norm{\nabla \BB f}_{L^q(A(\theta\rho,\rho))} \leq C_{q,\theta}\norm{f}_{L^q}$ |
| Prop 4.5 (master identity eq 4.1) | `NS.master_identity` | Theorem |
| Prop 5.1 (sublinear Caccioppoli) | `NS.caccioppoli_sublinear` | Theorem: eq (5.1) |
| Prop 6.1 (Lorentz embedding) | `NS.lorentz_layer_cake` | Theorem: eq (6.1) |
| Cor 6.2 (Lorentz on annulus) | `NS.lorentz_annulus` | Theorem: $\norm{v}_{L^r(A)} \leq C M \rho^{3/r-1}$ |
| Lemma 7.1 (reference GN) | `NS.gagliardo_nirenberg_reference` | Theorem — likely imported from Mathlib |
| Prop 7.2 (scale cancellation) | `NS.gn_scale_cancellation` | Theorem: eq (7.3) |
| Thm 7.3 (main estimate) | `NS.main_sublinear_estimate` | Theorem: eq (7.5) |
| Prop 8.1 (superlinear ODE) | `NS.superlinear_ODE` | Theorem: eq (8.1) |
| Thm 9.1 (finite Dirichlet) | `NS.finite_dirichlet_energy` | Theorem: $\int \abs{\nabla v}^2 < \infty$ |
| Lemma 10.1 (upgraded regularity) | `NS.upgrade_regularity` | Theorem: $v \in L^6, p \in L^3$ |
| Thm 1.1 (main) | `NS.INS_01_L3inf_Liouville` | Theorem: the Liouville conclusion |

Every row is a separate Lean file under `formal/NS/` or a lemma
within an existing file. Estimated ~17 theorems at the top level,
with supporting lemmas underneath.

## §4 Mathlib dependencies

Mandatory imports (in rough order of use):

1. **`Mathlib.Analysis.InnerProductSpace.EuclideanDist`** —
   $\RR^3$ as `EuclideanSpace ℝ (Fin 3)`.
2. **`Mathlib.Analysis.Calculus.ContDiff.Basic`** — smoothness
   $C^\infty$.
3. **`Mathlib.Analysis.Calculus.FDeriv.Basic`** — partial
   derivatives, divergence as `∑ i, ∂ᵢ v i`.
4. **`Mathlib.MeasureTheory.Integral.Bochner`** — weighted
   integrals over $\RR^3$.
5. **`Mathlib.MeasureTheory.Function.LpSpace`** — $L^p$ norms.
6. **`Mathlib.Analysis.Fourier.RiemannLebesgueLemma`** (or similar)
   — Calderón–Zygmund on $L^3$ for the pressure estimate.
7. **Weighted Sobolev / GN** — current Mathlib has
   `MeasureTheory.Integral.MeanInequalities` (Gagliardo–Nirenberg
   in scalar form); the weighted vector version likely needs to
   be authored.
8. **Lorentz spaces**: active development in Mathlib (`MeasureTheory.Function.Lorentz`
   as of late 2025) but unstable. Fallback: define
   `NS.WeakL3` ourselves via the distribution-function formula.

### Author-side: what must be written (no Mathlib analog)

- The **Bogovski\u{\i} operator** on John domains. No Mathlib
  equivalent. Needs the Bogovski\u{\i}–Tartar construction
  (singular integral kernel of degree $-(n-1)$). This is the
  single biggest block of original Lean work — probably 500–1500
  lines.
- The **sublinear Caccioppoli identity** specific to NS. Mathlib
  has elliptic Caccioppoli for scalar linear equations but not
  the vector, nonlinear, Bogovski\u{\i}-corrected form.
- The **hat function derivative formula** (Lemma 2.2) —
  straightforward but needs the mollification limit step.

## §5 The three Tree-A sorries

The companion Tree-A formalization (in a sibling project not
shipped with this repo) has 102 theorem statements with three
sorries remaining for Part I:

1. **Caccioppoli** — eq (5.1): the sublinear restructuring.
2. **ODE contradiction** — Thm 9.1: integration with
   $\beta > 1 \wedge \alpha < 1$.
3. **Dirichlet integral zero** — Thm 1.1 final step.

Closing those three is a *localized* Lean task, roughly 200–500
lines each. Doing this **in the current repository** (rather
than in Tree A) would make `finish_navier_stokes/formal/` the
canonical formalization, but requires first reproducing Tree A's
Mathlib-backed definitions here. Alternative: coordinate with
Tree A and ship a pointer.

**Decision to make:**

- (a) **Duplicate and supersede.** Build the full formalization
  here. Makes this repo self-contained. Multi-month effort.
- (b) **Pointer, with coordinated release.** Lock Tree A's
  current skeleton into a git submodule or vendored directory
  and publish the three sorry-closures as they land. Faster.
- (c) **Port only the three sorries.** Write the three
  sorry-closures here against minimal local definitions,
  validate against Tree A's broader structure. Middle path.

Recommendation: **(c)**. Three concrete proof obligations with
defined structure, each a 1–3 week task. Upgrades this paper to
"machine-verified modulo Mathlib + the five classical axioms"
within 2–3 months of focused work.

## §6 Effort estimate (optimistic / realistic)

| Phase | Optimistic | Realistic | Notes |
|:---|---:|---:|:---|
| Add Mathlib + replace axioms with Mathlib-backed definitions | 1 week | 3 weeks | Lorentz space is the wild card |
| Port Lemma 2.2 (hat function) | 3 days | 1 week | Mostly `simp`-level |
| Port Lemma 4.1–Cor 4.3 (Bogovski\u{\i}) | 2 months | 4 months | Biggest single block |
| Port §5 Caccioppoli identity | 2 weeks | 4 weeks | Tree A sorry #1 |
| Port §6 Lorentz layer-cake | 1 week | 3 weeks | If Lorentz is in Mathlib |
| Port §7 GN + scale cancellation | 2 weeks | 4 weeks | |
| Port §8 Superlinear ODE | 1 week | 3 weeks | Tree A sorry #2 |
| Port §9 Integration / contradiction | 3 days | 1 week | Algebra + integral |
| Port §10 Upgraded regularity + closing | 1 week | 3 weeks | Tree A sorry #3 |
| **Total** | **~4 months** | **~9 months** | Single-person full-time |

Three-sorry-only path (recommended (c) above): **2–3 months
realistic** if Tree A's broader structure can be reused.

## §7 Sequence — concrete first steps (this session + next 2)

**Session N (this): planning doc.** Done (this file).

**Session N+1: infrastructure.**

1. Update `formal/lean-toolchain` to match a current
   Mathlib-pinned release (`leanprover/lean4:v4.29.0` or later).
2. Add Mathlib as a dependency in `formal/lakefile.lean`.
3. Run `lake update` — this pulls Mathlib (gigabytes, ~30 min).
4. Verify `lake build` still succeeds.

**Session N+2: replace axiom placeholders.**

1. In `NS/Basic.lean`, replace the five `axiom` declarations with
   real definitions using Mathlib. Start with:
   - `SmoothDivFreeField`: structure bundling `ContDiff ℝ ⊤ v`
     and `∀ x, (div v) x = 0`.
   - `SatisfiesStationaryNS`: predicate using
     `Mathlib.Analysis.Calculus` primitives.
   - `InWeakL3`: either Mathlib `Lorentz` or a local
     distribution-function definition.
   - `InWeakL3CapW12Loc`: conjunction of `InWeakL3` and local
     `Hˡ` membership.
   - `IsZero`: $v \equiv 0$ pointwise / almost-everywhere.
2. Ensure `NS/INS_01_L3inf_Liouville.lean` still typechecks.
3. `lake build` still has exactly one `sorry` (the main theorem).

**Session N+3 onward:** start proving the three Tree-A sorries
in reverse dependency order (Thm 9.1 integration → Thm 1.1
finish → Prop 5.1 Caccioppoli → Prop 8.1 ODE). Each session
closes one sub-lemma or partial step.

## §8 What "done" means

1. `lake build` in `formal/` compiles cleanly.
2. `NS.INS_01_L3inf_Liouville` theorem carries a proof term with
   no `sorry`.
3. No `axiom` declarations in the `NS` namespace beyond
   Mathlib's own and (optionally) the five quarantined AX-01..05.
4. The theorem statement reads exactly Theorem 1.1 of the paper,
   modulo Mathlib's canonical names.
5. A GitHub CI action runs `lake build` on every push and posts
   a green checkmark.
6. The `insights/INS-02_l3inf_stationary_liouville.md`
   frontmatter updates
   `verification.machine_verification: NS.INS_01_L3inf_Liouville`
   and `status: speculative → verified`.

At that point the corpus gains its first load-bearing `verified`
INS entry, and the paper's claim is machine-checked modulo the
quarantined axioms.

## §9 Risks

- **Mathlib Lorentz spaces may not land in stable Mathlib before
  this formalization is ready.** Fallback: local definition
  (~200 lines).
- **Bogovski\u{\i} operator formalization is hard.** If it
  blocks, consider a workaround: prove Theorem 1.1 in a
  formulation that does not explicitly invoke $\BB$, e.g., via
  the Leray projection $\PP$ applied to a test function chosen
  to be already divergence-free. The paper's choice of $\BB$ is
  convenient, not essential.
- **Toolchain drift.** Between Mathlib releases, proofs can
  break on minor rename churn. Pin the toolchain and tolerate
  6–12-month update cycles.

## §10 Proposed next action for the immediate next session

Execute "Session N+1: infrastructure" above:

1. `git checkout -b lean-mathlib-import` (work in a topic branch).
2. Update `formal/lean-toolchain` → `leanprover/lean4:v4.29.0`
   (or whatever is current Mathlib-pinned at the time).
3. Update `formal/lakefile.lean` to add the Mathlib dependency.
4. Run `lake update` (large download; ~gigabytes; ~30 min on
   good connection).
5. Verify `lake build` still succeeds with only the expected
   `sorry` warning on `INS_01_L3inf_Liouville`.
6. Commit and push the branch.
7. Open a PR; merge to `main` after local CI green.

After that merge, the repo is set up for the actual
formalization work. Every subsequent session proves one lemma.
