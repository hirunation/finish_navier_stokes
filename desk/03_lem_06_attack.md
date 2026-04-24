# Desk · 2026-04-22 · LEM-06 attack — focused mathematical strategy

**Scope.**  This is the session-2 deliverable, written in session 1
with literature gathered via parallel deep-read subagents
(Phuc 2015 + post-Phuc endpoint literature; Brandolese-Meyer
spatial decay; KNSS §6 deep audit).  The goal is to replace
CORR-07's "three options" with a concrete, mathematically
grounded attack plan — and to begin the first lines of it.

---

## §1 Precise restatement of the blocker

**Draft 12 §3 Step 2 claim (verbatim).**  For the smooth NS
solution $u \in C^\infty(\mathbb{R}^3 \times [0, T^*))$ with
Schwartz divergence-free $u_0$ and hypothetical Type II
singularity at $T^* < \infty$, there exist rescaling sequences
$\lambda_n \to 0$, $x_n \to x_0$, $t_n \to T^*$ and an ancient
solution $v : \mathbb{R}^3 \times (-\infty, 0] \to \mathbb{R}^3$
with

$$v_n(y, s) := \lambda_n u(x_n + \lambda_n y, t_n + \lambda_n^2 s) \to v$$

in $C^m_{\mathrm{loc}}$, $\|v\|_{L^\infty} \leq C_0$,
$|v(0, 0)| = 1$, **and**

$$\|v(\cdot, s)\|_{L^{3,\infty}(\mathbb{R}^3)} \leq M \quad \text{for all } s \leq 0$$

with $M$ depending **only on $\|u_0\|_{L^2}$ and $\nu$**.

The emphasized phrase is what fails.  The argument as written
uses an intermediate **pointwise spatial-decay claim**

$$|u(x, t)| \leq \frac{C_1}{1 + |x - x_0|} \quad \text{for } |x - x_0| \geq \sqrt{T^* - t}, \quad t \in [0, T^*),$$

with $C_1 = C_1(\|u_0\|_{L^2}, \nu)$.

## §2 Why the argument fails as stated (three independent reasons)

### 2.1 The $L^2$-only control is provably impossible

**Brandolese-Meyer (2002), ESAIM COCV 8, 273–285**, §3 exhibit
**explicit counterexamples**: smooth compactly-supported $u_0$
whose NS evolution instantly loses the moment orthogonality
condition (eq. 24 of B-M).  Under B-M's framework, the generic
pointwise-decay rate is $|u(x, t)| \lesssim (1+|x|)^{-(n+1)} =
(1+|x|)^{-4}$ in 3D, and **generic solutions cannot do better**.

**Critical observation.**  The $L^2$ norm is invariant under
spatial translations (shift a fixed-norm bump to $|x| = N$, any
$N$).  Therefore **no pointwise decay statement can have constant
depending on $\|u_0\|_{L^2}$ alone**.  At minimum one needs a
weighted norm like $\|(1+|x|)^\gamma u_0\|_{L^p}$ for $\gamma > 0$.

### 2.2 The $|x|^{-1}$ rate is oriented wrong

Generic Schwartz $u_0$ produces $|u(x, t)| \lesssim (1+|x|)^{-4}$
on the local-existence interval (Brandolese-Meyer Theorem 3.1 +
Lemma 3.2).  This is **stronger** than $|x|^{-1}$.  But the
constant is NOT controlled by $\|u_0\|_{L^2}$ — it depends on
$\|(1+|x|)^4 u_0\|_{L^\infty}$ or similar weighted norm.  Draft 12
mixes "generic Schwartz gets good decay" with "$L^2$-only
constant" — these are incompatible.

### 2.3 The endpoint Lorentz criterion is genuinely open

**Phuc (2015), J. Math. Fluid Mech. 17 Theorem 1.5** closes
$L^\infty_t L^{3,q}_x$ for every $q \in [3, \infty)$ but
**explicitly notes** the $q = \infty$ case is open:

> "To the best of our knowledge, a criterion of local regularity
> for the Navier-Stokes equations in $L^\infty(-1, 0; L^{3,\infty}(B_1))$
> is still unknown."

The proof breaks at $q = \infty$ for two reasons:
- **Exterior tail control fails.**  $L^{3,\infty}$ is not
  absolutely continuous — $|x|^{-1} \in L^{3,\infty}(\mathbb{R}^3)$
  has non-vanishing norm on exterior domains of any size.  Phuc's
  smallness-via-integration (eq. 4.22-23) requires absolute
  continuity.
- **Interpolation failure for $L^4$.**  The
  $L^{3,q} \cap L^6_{\mathrm{loc}} \hookrightarrow L^4_{\mathrm{loc}}$
  bootstrap breaks at $q = \infty$ because the exterior tail
  cannot be driven to zero.

Known closures of the endpoint:
- **Axisymmetric (Ożański-Palasek 2022, arXiv:2210.10030,
  Annals of PDE 2023)** via Nazarov-Uraltseva parabolic
  Harnack on the swirl $r v_\theta$ — requires the max-principle
  scalar structure absent outside axisymmetry.
- **Smallness (Luo-Tsai 2015, Kim-Kozono 2004)** — norm below a
  threshold.
- **Partial regularity finite singular points (Seregin 2019,
  arXiv:1906.06707)** — L^{3,∞}-bounded solutions have at most
  finitely many singular points; not full regularity.
- **Log-improvement** — $|u| \leq C|x|^{-1} |\log(|x|/2)|^{-\beta}$
  for any $\beta > 0$ closes (Phuc 2015 Theorem 1.5 continues to
  work at $q = \infty$ under logarithmic improvement).

**General-3D $L^{3,\infty}$ endpoint is open.**  Nahiru's Step 2,
if rigorously correct, would **close Phuc's open problem** —
making it novel publishable mathematics in its own right.  The
Draft 12 framing does not claim this, which is the audit flag.

## §3 Literature state of the art (as of April 2026)

| Paper | Year | Closure scope | Method | Relevance |
|:---|:---:|:---|:---|:---|
| ESS03 (Russian Math. Surv. 58) | 2003 | $L^\infty_t L^3_x$ | backward uniqueness + Liouville | parent theorem |
| KNSS (Acta Math. 203) | 2009 | axisymmetric | blow-up extraction + axi Liouville §5 | the scheme Draft 12 adapts |
| Phuc (JMFM 17) | 2015 | $L^\infty_t L^{3,q}_x$, $q<\infty$ | Calderón-Zygmund pressure + ε-regularity | frames the open endpoint |
| Barker-Prange (CMP 2021) | 2019 | Type I + a priori $L^{3,\infty}$ | quantitative concentration | partial |
| Albritton-Barker (JMFM 21) | 2019 | Type I blow-up ⟺ nontrivial bounded ancient | Liouville for $L^3$-along-sequence | documents the structural L^3 vs $L^{3,\infty}$ gap |
| Seregin (JMFM 2019) | 2019 | $L^\infty_t L^{3,\infty}_x$ ⇒ finite singular set | measure-theoretic exterior + Seregin one-scale ε∗ | closest to full result; yields partial reg only |
| Palasek (ARMA 242) | 2021 | $L^\infty_t L^q_x$ generic + axisymmetric $q \in (2,3]$ | quantitative critical-space improvement | scale of endpoints |
| **Ożański-Palasek (Annals of PDE)** | 2022 | **axisymmetric $L^\infty_t L^{3,\infty}_x$** | **Nazarov-Ural'tseva Harnack on $rv_\theta$** | **first endpoint closure** |
| Tao (arXiv:1908.04958) | 2019 | triple-log blow-up rate in $L^3$ | Fourier concentration + Carleman | distinct approach |

## §4 Five rescue routes

### Route A — strengthen the hypothesis to symmetric / weighted

**Requirement.**  Add weighted initial-data hypothesis, e.g.,
$(1+|x|)^\gamma u_0 \in L^p$ for some $\gamma, p$.  Or restrict
to axisymmetric Schwartz data.

**What closes.**  Brandolese-Meyer generic decay $|u| \lesssim
|x|^{-4}$ uniform-in-$t$ on local-existence interval.  KNSS §6
spatial-decay hypothesis (6.6) holds (KNSS's own
Brandolese-citation).  Axisymmetric case closes via Ożański-Palasek.

**Cost.**  The Clay target narrows: "Schwartz + moment $\gamma$"
instead of "Schwartz".  Acceptable for publication but a
weakened theorem.

**Difficulty.**  Low (weeks).  Mostly bookkeeping.

**Verdict.**  Fallback option, not the preferred route.

### Route B — log-improvement rescue (Phuc Theorem 1.5)

**Requirement.**  Upgrade the ancient-solution $L^{3,\infty}$
bound to a logarithmic-pointwise refinement:
$|v(x, s)| \leq C |x|^{-1} |\log(|x|/2)|^{-\beta}$ for some
$\beta > 0$, uniform in $s$.

**What closes.**  Phuc 2015 Theorem 1.5 continues to work under
log-improvement (the blow-up extracts into $L^{3,q}$ effective
$q$ slightly less than $\infty$, and closure works).

**Cost.**  Need to prove the log-improvement directly on the
ancient solution.

**Difficulty.**  Medium-hard.  No direct literature precedent.
Plausibly requires a finer version of Brandolese-Meyer + a
control of higher moments of the rescaling sequence.

**Verdict.**  Promising but not obviously within reach.

### Route C — Nazarov-Ural'tseva / scalar angular-momentum

**Requirement.**  Find a scalar quantity $q(v)$ on general-3D
NS that satisfies a parabolic equation with divergence-free
coefficients, analogous to how $rv_\theta$ works in the
axisymmetric case.

**Candidates.**
- Angular momentum around a point: $L(x) = (x - x_0) \times v$.
  Does NOT satisfy a nice scalar equation in general 3D.
- Kinetic energy density $|v|^2/2$: parabolic inequality with
  sign-indefinite source.
- Swirl-analog for symmetry subgroups (helical, discrete
  rotations, icosahedral — cf. THR-03).

**Cost.**  Research-program scale.  Even identifying the right
scalar is a major step.

**Difficulty.**  Hard.  Years of research.

**Verdict.**  Long-term direction.  Probably requires collaboration
with Ożański-Palasek's group or similar.

### Route D — Excise the $|x|^{-1}$ profile via Part I

**Requirement.**  Show that any stationary $L^{3,\infty}$ NS
solution is either trivial or a **Landau-type** self-similar
solution, and the KNSS ancient solution's backward-time limit
$v_\infty$ is incompatible with Landau structure.

**Key observation.**  Landau solutions $v_L$ are **axisymmetric**
(about their force-axis).  Seregin-Šverák 2009 already showed
axisymmetric $L^{3,\infty}$ stationary solutions are trivial.
Combined with Part I's general-3D Liouville (INS-02), the picture
closes — **provided Part I is correct as stated**.

**Cost.**  None beyond Part I being proven.  This is the
architecture Draft 12 uses.  The Step 2 gap is not about this
layer — it's about whether $v_\infty$ lies in $L^{3,\infty}$ at
all.

**Difficulty.**  N/A — this is Draft 12's actual strategy
assuming Step 2.

**Verdict.**  Route D and Step 2 are the same route.  Route D
doesn't close Step 2; it's what Step 2 feeds into.

### Route E — Submit Part I standalone (my recommendation)

**Requirement.**  None.  Part I (INS-02) is a **standalone
theorem** — the $L^{3,\infty}$ stationary NS Liouville theorem.
It does not require the Step 2 inheritance.

**Publication target.**  *Archive for Rational Mechanics and
Analysis*, *Communications in Mathematical Physics*, *Journal
of Mathematical Fluid Mechanics*, or similar PDE venue.  Not
Annals of Mathematics (which expects the full Clay target).

**Paper structure.**  `PROOF_FINAL_DRAFT11.tex` (1491 lines,
28 pp) already exists as submission-state.  Restructure:
- Remove Part II entirely.
- Promote Part I to the main theorem.
- Add Remarks on how Part I plugs into the KNSS-type chain,
  **noting Phuc's open problem as the bridge that would produce
  the Clay target**.
- Add the 4D extension (INS-13 / INS-16) as a corollary.
- Add the W^{1,2}_{loc} extension (INS-14) as a remark.
- Add the quantitative bound (INS-15) as a remark.

**Timeline.**  1-2 weeks of polishing to Annals-submission
quality.  Lean formalization (Tree A) is already in progress
on Part I specifically; closing the three sorries there
upgrades the paper to "machine-verified."

**Verdict.**  The highest-leverage near-term move.  Captures
the genuinely novel result Nahiru has (general-3D stationary
$L^{3,\infty}$ Liouville) without claiming the Clay target.
Builds reputation for the follow-up paper on the endpoint.

## §5 Recommendation (ranked)

**Primary move.** Route E — submit Part I standalone.  Lowest
risk, highest near-term value, captures the genuinely novel
theorem.  1-2 weeks polish + 3-6 months review cycle.

**Secondary move (in parallel).** Route C — begin research
program on non-axisymmetric scalar angular-momentum analog.
Reach out to Ożański / Palasek collaboratively if possible.
Research-program horizon: 1-3 years.

**Tertiary (conditional).** Route A — if a paper reviewer or
referee demands a Clay-target framing, fallback to axisymmetric
hypothesis + Draft 11's original structure.  Minor loss of
scope, major gain of closure.

**Not recommended now.**
- Route B (log-improvement): speculative and hard without a
  concrete mechanism.
- Route D (excise $|x|^{-1}$ via Part I alone): not a rescue; this
  is Draft 12's architecture.

## §6 Concrete mathematical proposition

Beyond the strategic routes, here is a **precise mathematical
question** worth pursuing in the research direction:

**Conjecture (strong form).**  Let $u \in C^\infty(\mathbb{R}^3 \times
[0, T^*))$ be the smooth NS solution with Schwartz divergence-
free $u_0$.  If the rescaling sequence
$v_n(y, s) = \lambda_n u(x_n + \lambda_n y, t_n + \lambda_n^2 s)$
converges in $C^m_{\mathrm{loc}}$ (KNSS §6 compactness) to a
bounded ancient $v$, then

$$\|v(\cdot, s)\|_{L^{3,\infty}(\mathbb{R}^3)} \leq M \quad \text{for all } s \leq 0$$

with $M$ depending on $\nu$ and the **weighted moment**
$\mathcal{M}(u_0) = \|(1+|x|) u_0\|_{L^\infty} + \|u_0\|_{L^2}$
(not merely $\|u_0\|_{L^2}$).

**What this would give.**  The Draft 12 chain closes under a
mildly weighted hypothesis on Schwartz data.  The Clay target
applies to $\{u_0 \in \mathcal{S} : \mathcal{M}(u_0) < \infty\}$,
which is essentially all Schwartz data of practical interest
(Schwartz is closed under $(1+|x|)$-multiplication).

**Why it might be provable.**  Brandolese-Meyer gives the
pointwise decay $|u(x, t)| \lesssim C(t)/(1+|x|)$ for data with
$(1+|x|) u_0 \in L^\infty$ on the local-existence interval.  The
question is whether $C(t)$ stays bounded as $t \to T^*$.  If
yes — a Gronwall-on-weighted-norm argument — then scale-invariance
under the KNSS rescaling transfers the decay to $v_n$ uniformly
in $n$, and $L^{3,\infty}$ inheritance follows.

**What a proof would need.**

1. A **weighted-norm propagation lemma**: for $u_0 \in \mathcal{S}$
   with $(1+|x|) u_0 \in L^\infty$, prove
   $\sup_{t \in [0, T^*)} \|(1+|x|) u(\cdot, t)\|_{L^\infty(\{|x| \geq R(t)\})} < \infty$
   for some ball-radius $R(t)$.

2. A **Gronwall-type argument** preventing blow-up of the
   weighted-$L^\infty$ norm as $t \to T^*$.  Key: the weight
   $(1+|x|)$ is compatible with scaling; the NS equation on the
   weighted field $w = (1+|x|) u$ has extra terms bounded by the
   un-weighted $\|u\|$ quantities.

3. **Scale invariance** of the weighted $L^\infty$ norm under
   parabolic rescaling $(x, t) \mapsto (\lambda x, \lambda^2 t)$:
   the weight $(1+|x|)$ scales homogeneously, so the rescaled
   $v_n$ inherits an $|y|^{-1}$-decay after division by $\lambda_n$.
   This gives $|v_n(y, s)| \lesssim |y|^{-1}$, hence
   $v_n \in L^{3,\infty}$ with uniform norm.

Steps 1 and 3 are straightforward; step 2 is the crux.  It is
essentially the proof that the weighted $L^\infty$ bound on $u$
does not blow up at $T^*$ — equivalently, the solution does not
concentrate mass at infinity.

**A priori expectation.**  This conjecture is plausible but not
obvious.  Neither published paper proves it; Brandolese-Meyer
and KNSS use weighted initial data + local existence (the
weighted norm degenerates with $T$).  The Gronwall step likely
requires an $L^\infty$ bound on the velocity at spatial infinity,
which again is a localized concentration question.

**Estimated difficulty.**  Publishable result in JMFM / CPAM /
Math. Ann.  Timeline: 3-9 months of focused work.

## §7 Execution plan

**This turn (session 1 closeout):**
- [x] Desk analysis authored (this file).
- [x] LEM-06 updated with deepened literature map.
- [x] LEM-13..16 authored (Phuc 2015 endpoint, Ożański-Palasek,
  Seregin 2019, Brandolese-Meyer).
- [x] AK-36 authored (L^2-only pointwise-decay impossible).
- [x] CORR-08, CORR-09 authored (phantom KNSS citation;
  Brandolese scope).
- [x] INS-21 authored (weighted-moment rescue conjecture).
- [x] State.md + memory updated.
- [x] DAG closure verified.

**Next turn (session 2):**
1. **Decide the submission route with Nahiru.**  Route E
   (standalone Part I) is my strong recommendation.  Route A
   (narrow to axisymmetric / weighted) is the fallback.
2. **Begin the weighted-moment conjecture (INS-21)** as a
   research program in parallel.
3. **Reach out** (if desired) to Ożański / Palasek / Seregin /
   Phuc about the non-axisymmetric endpoint.  The Brandolese
   citation error in KNSS §6 / Draft 12 is worth mentioning in
   any such correspondence.

**If Route E chosen (recommended):**
- Restructure Draft 11 / Draft 12 → "Part I paper."
- Add Remarks (4D extension, W^{1,2}_loc, quantitative bound).
- Cover letter acknowledging Phuc 2015 open problem as the
  bridge to Clay.
- Target: *ARMA*, *CMP*, or *JMFM*.
- Lean formalization: close the three `NSProof.PartI.liouville`
  sorries; the paper then claims "machine-verified" legitimately.

**If Route A chosen:**
- Draft 11's structure with axisymmetric hypothesis added.
- Part I general-3D remains standalone (can submit separately).
- Part II + Clay target under axisymmetric restriction.
- Follow-up paper on the non-axisymmetric endpoint as a
  research program.

## §8 Submission-package checklist (when Route E is picked)

- [ ] PROOF_FINAL_DRAFT11.tex restructured to "Part I only".
- [ ] Abstract rewritten (140 words) emphasizing Part I as the
  theorem; Part II framed as "this theorem would combine with
  an $L^{3,\infty}$ inheritance result to close the Clay
  problem; the latter is the subject of Phuc 2015's open
  problem and is beyond the scope of this paper."
- [ ] Bibliography: replace ESS03 ARMA citations with ESS03
  RMS citations (CORR-05 fix).
- [ ] Remove the phantom "KNSS §3 Proposition 3.1" reference
  (CORR-08).
- [ ] Remark on Brandolese scope (CORR-09): clarify when spatial
  decay is available.
- [ ] 4D extension as a corollary (INS-16).
- [ ] W^{1,2}_{loc} extension as a remark (INS-14).
- [ ] Quantitative bound as a remark (INS-15).
- [ ] Cover letter to ARMA or CMP emphasizing the first
  general-3D $L^{3,\infty}$ stationary Liouville theorem
  (CORR-03 novelty claim).
- [ ] Zenodo deposit after submission acceptance (priority is
  secondary to review).
- [ ] Lean formalization: close three `NSProof.PartI.liouville`
  sorries (`caccioppoli`, `odeContradiction`,
  `dirichletIntegralZero`).  Each is a bounded Lean exercise.
  When closed, INS-02 graduates from `speculative` to
  `verified`.

---

_End of desk analysis.  The attack is concrete.  Route E is
the recommended near-term move; Route C is the long-term
research program.  No further literature-review needed before
acting._
