# Desk · 2026-04-24 · INS-10 ancient extension — the third gap

This piece completes the diagnostic sweep of the corpus's three
orthogonal Clay-closure routes. desk/05 closed energy methods
to Prodi–Serrin; desk/07 located the residual 1-d gap in INS-04
(icosahedral); desk/08 confirmed the canon's own proof that
MPC-5 (helicity flux) is structurally insufficient. INS-10
(Space-time Hull / Ancient Extension) is the last corpus route
not yet examined at this depth.

Result: **INS-10 is blocked differently from INS-04 and MPC-5
but is still blocked.** It is corpus-only (not in canon),
inherits the unresolved exchange-of-limits obstruction OBS-02
from the stationary INS-03 it depends on, and at Step 4
relies on the very $L^{3,\infty}$ inheritance gap that LEM-06
flags as open. Honest confidence calibration: corpus's 0.70 is
optimistic by a factor of ~2; realistic residual is **0.25–0.35**.

## §1 The INS-10 statement

From `insights/INS-10_spacetime_hull_type_II_closure.md`:

> **Space-time Hull Unique Ergodicity.** For every ancient
> bounded smooth NS solution $u : \mathbb{R}^3 \times (-\infty,
> 0] \to \mathbb{R}^3$, the space-time translation hull
> $$
> \mathcal{O}_{\mathrm{st}} := \overline{\{u(\cdot + x, \cdot + \tau) : x \in \mathbb{R}^3,\ \tau \leq 0\}}^{C^\infty_{\mathrm{loc}}}
> $$
> is uniquely ergodic under the space-time translation
> semigroup $(x, \tau) \mapsto u(\cdot + x, \cdot + \tau)$.
>
> **Type II Closure (corollary).** Every ancient bounded
> smooth NS solution satisfies $u(0, 0) = 0$, contradicting the
> KNSS normalisation $\|u(0, 0)\| = 1$. Therefore no Type II
> blow-up exists.

The proposed payoff: **closes Type II singularity directly**,
without relying on the stationary backward limit step of the
KNSS chain.

## §2 INS-10 is corpus-only

A grep of the canon (`/mnt/d/proving_grounds/turbulent_waters/
canon/`, files I.* through VIII.* + MPC-1..6 + BRAID_1) for
"ancient" produces no instances of the space-time-hull or
parabolic-Wiener arguments INS-10 articulates. The canon
treats only stationary solutions; the ancient-solution
contradiction is handled through the stationary backward limit
$v_\infty$ in the KNSS chain (Step 3 in canon §II).

INS-10 was authored on 2026-04-17, the same day as the GUNS
`AncientExtension/SpacetimeHull.lean` file (per
the corpus metadata + Lean tree timestamps). It is an
author-invented extension during the GUNS Step 4 ingest —
**not derived from canon-level proven results**.

This places INS-10 in the same status as INS-04 (the
icosahedral hypothesis): a corpus-era addition with its own
proof sketch but no upstream proven content backing it.

## §3 The proposed proof architecture

INS-10 generalises INS-07 (translation hull theorem,
confidence 0.90, the spatial version) by adding time as another
coordinate of the translation semigroup. Five steps in the
corpus's method:

1. **Compactness:** the space-time hull is compact in
   $C^\infty_{\mathrm{loc}}(\mathbb{R}^3 \times (-\infty, 0])$
   (Krylov–Bogolyubov + parabolic regularity).
2. **Invariant measure:** Krylov–Bogolyubov yields a
   space-time-translation-invariant probability measure
   $\mu_{\mathrm{st}}$ on $\mathcal{O}_{\mathrm{st}}$.
3. **Wiener ergodic averaging:** the parabolic Wiener theorem
   gives asymptotic averaging.
4. **Backward stationary limit:** as $\tau \to -\infty$,
   the spatial slice $u(\cdot, \tau)$ approaches a stationary
   solution $v_\infty$ (canon §II Step 3 of the KNSS chain).
   *Apply INS-03 (Grand Unification): stationary +
   $L^{3,\infty}$ ⟹ constant ⟹ zero.*
5. **Forward propagation by backward uniqueness:** ESS03
   backward uniqueness (LEM-08, via Carleman estimates LEM-07)
   propagates $u \equiv 0$ from $\tau = -\infty$ forward to
   all $\tau \leq 0$, including $(0, 0)$.

So INS-10 is **not** a unique-ergodicity argument that
*directly* forces the hull to consist of constants; it is a
**reduction to the stationary case + ESS03**, with parabolic
machinery providing the time-direction structure.

## §4 The three structural gaps

### 4.1 Space-time hull compactness needs $C^{0,\alpha}$ in time

`AX-04` (KNSS extraction) supplies $\|u\|_{L^\infty} \leq C_0$ + uniform
interior $C^m$ bounds at each fixed time. For the **spatial**
translation hull on a fixed time slice, this is sufficient
(Arzelà–Ascoli on $\mathbb{R}^3$).

For the **space-time** hull on $\mathbb{R}^3 \times (-\infty,
0]$, Arzelà–Ascoli compactness in $C^\infty_{\mathrm{loc}}$
requires equicontinuity in *both* space and time. Parabolic
interior regularity gives $C^{0,1/2}$ in time for smooth
solutions of the heat equation, and KNSS-extracted ancient
solutions inherit this from the original smooth solution — but
**AX-04 as currently stated is silent** on the time regularity.

This gap is moderate. For genuinely smooth $u$, the parabolic
bootstrap yields $C^{0,\alpha}$ in time automatically, so
compactness holds. INS-10's statement should make this explicit
(it does not). **Confidence cost: small** if AX-04 is
strengthened to include time regularity; non-zero if not.

### 4.2 The exchange-of-limits obstruction (OBS-02) likely transplants

This is the deepest concern. INS-03 (the stationary unique
ergodicity hypothesis that INS-10 reduces to in Step 4) is
blocked by **OBS-02 (Exchange-of-limits Obstruction)**: along
hull-convergent sequences $w_n \to c$, the asymptotic Rayleigh
quotient $\gamma_R$ fails $\limsup_n \limsup_R \neq \limsup_R
\limsup_n$.

In the parabolic setting, define the analogue
$$
\Gamma_{\mathrm{st}}(u) := \limsup_{R, T \to \infty}
  \frac{\int_{B_R \times (-T, 0)} \alpha\,|\omega|^2}{\int_{B_R \times (-T, 0)} |\omega|^2}.
$$
The new question: does $\limsup_n \limsup_{R,T \to \infty} =
\limsup_{R,T \to \infty} \limsup_n$ for hull-convergent
sequences $u_n \to c$ (constant in space-time)?

**The proof of OBS-02 uses the fact that the enstrophy
density's mass can escape to spatial infinity along the
translation orbit.** The parabolic version has the analogous
mechanism: enstrophy density can escape *both* to spatial
infinity *and* to $\tau \to -\infty$. The two escape directions
do not commute with hull-convergence in any obvious way. So
the proof of OBS-02 likely transplants.

**Best case for INS-10:** parabolic dissipation forces enstrophy
to decay backward in time, breaking the time-direction escape.
But this is conjectural — the corpus does not articulate why
it should hold. **Confidence cost: large.**

### 4.3 Step 4 invokes the open $L^{3,\infty}$ inheritance gap

This is the most striking finding. INS-10 Step 4 reads:
"stationary + $L^{3,\infty}$ ⟹ constant ⟹ zero". The
"$L^{3,\infty}$" here is exactly **LEM-06** (the corpus's
flagged open gap, equivalent in scope to Phuc 2015's open
endpoint).

In other words: INS-10 *as stated* assumes the very thing the
paper's §11 identifies as the unresolved barrier. To use INS-10
to close Type II, one needs to first establish $L^{3,\infty}$
inheritance on the rescaled ancient solution — but
that's LEM-06, the open gap that motivated examining INS-04 and
MPC-5 in the first place.

**INS-10 does not bypass LEM-06; it depends on it.** This is
a structural circularity: the corpus's INS-10 is an "alternative
closure route" to the LEM-06 problem, but its own proof
mechanism cites LEM-06 as a hypothesis. Confidence cost:
**large**, possibly fatal if no parallel mechanism for the
$L^{3,\infty}$ step exists.

## §5 Comparison with INS-03 (stationary)

| Aspect | Stationary INS-03 | Ancient INS-10 |
|:---|:---|:---|
| Hull type | Spatial $\overline{\{v(\cdot+x)\}}$ | Space-time $\overline{\{u(\cdot+x, \cdot+\tau)\}}$ |
| Compactness | Krylov–Bogolyubov on $\mathbb{R}^3$ | Krylov–Bogolyubov on $\mathbb{R}^3 \times (-\infty, 0]$ |
| Invariant measure | $\mu$ on hull | $\mu_{\mathrm{st}}$ on hull |
| Closure mechanism | Form C (unique ergodicity) | Reduction to Form C of INS-03 + ESS03 backward uniqueness |
| OBS-02 status | Open (canon proof) | Likely inherited (parabolic analogue) |
| $L^{3,\infty}$ status | LEM-06 open | LEM-06 open, *and* INS-10 cites it |

The parabolic time direction does *not* break OBS-02, and the
$L^{3,\infty}$ gap is shared. INS-10 is **structurally weaker**
than INS-03, in the sense that anything closing INS-10 closes
INS-03 (because Step 4 is a direct application of INS-03), but
not vice versa.

## §6 The AK retirement check

`AK-30` (Ancient Liouville Direct) — retired attempt to prove
ancient bounded Liouville directly via superlinear ODE growth.
Failed because ancient solutions lack temporal monotonicity.
**INS-10 avoids this**: Step 4 uses backward convergence to a
stationary limit, then applies the *stationary* INS-03, not
direct ancient Liouville.

`AK-31` (Morrey propagation backward) — retired attempt to
propagate Morrey bounds backward in time via Gronwall. Failed
because Gronwall amplifies backward. The correct tool is
Carleman estimates (LEM-07). **INS-10 avoids this**: Step 5
uses ESS03 backward uniqueness, which is Carleman-based.

So INS-10 has internalized the lessons from prior failed
approaches. The retirement-knowledge has been respected.

## §7 Honest confidence calibration

Corpus claim: **0.70**.

Adjustments:
- Statement clarity: 0 (clear, just over-claimed)
- Inherits OBS-02: -0.20
- Cites LEM-06 in Step 4: -0.20
- Time-regularity gap in compactness: -0.05
- Avoids AK-30/31 correctly: +0.05
- Tools (ESS03, Carleman, KNSS chain) are correct: +0.05

**Honest residual: 0.35.** Generous interpretation: 0.35–0.40
(if parabolic dissipation does some of the work the corpus
suggests). Strict reading: 0.20–0.30 (since the LEM-06
dependence is structural).

For comparison:
- INS-04: corpus 0.65, residual 0.30–0.40 (desk/07).
- MPC-5: corpus implicit 0.80, residual 0.10 (desk/08).
- INS-10: corpus 0.70, residual 0.25–0.35 (this piece).

**Best-of-three: INS-04 ties with INS-10**, both around 0.30–0.40.
MPC-5 is materially worse.

## §8 The corpus's actual remaining live routes

After the diagnostic sweep across desk/05, desk/07, desk/08,
desk/09, the surviving Clay-closure candidates are:

1. **Direct LEM-06 attack** via something not yet articulated.
   The desk/03 + desk/04 attempts (energy methods + weighted
   moment) closed; desk/05's analysis showed the structural
   reason. But the obstruction is sign-undetermined, not
   sign-impossible. A *different* signed invariant (not
   helicity) might break it.
2. **The canon's own frontier — anisotropic four-fifths law**.
   Multi-year mathematics; new identities for third-order
   velocity correlations on Fibonacci triad geometry. Beyond
   the current corpus's scope.
3. **A direct exchange-of-limits resolution for INS-03**.
   This is what INS-04 / MPC-5 / INS-10 were each trying to
   provide; each fails for its own reason. A genuinely new
   approach to OBS-02 would unlock all three.
4. **Submit Part I as a standalone result** — peer-review may
   identify which of the orthogonal routes the community can
   actually push on.

## §9 Recommendation

**Do not invest further desk-level research in INS-04, MPC-5,
or INS-10 closure attempts.** All three have residual
confidence under 0.40, and the gaps are structural, not
tactical.

**Update corpus confidences to honest values:**
- INS-03 Grand Unification: 0.75 → **0.30** (depends on one of
  INS-04/MPC-5/INS-10 closing; none closeable as stated).
- INS-04 Icosahedral: 0.65 → **0.35** (per desk/07).
- INS-10 Ancient Extension: 0.70 → **0.30** (per this piece).
- MPC-5 status (implicit): → **retire** (per desk/08; canon's
  own theorems prove insufficient).

**The honest map:**

> The corpus has cleanly identified the obstruction landscape
> (9 obstruction theorems) and three orthogonal routes
> (INS-03 / INS-04 / INS-10), but the routes' confidence levels
> were over-stated. After diagnostic, the *real* state is:
> bounded Liouville requires either a new signed invariant
> beyond helicity (the canon's anisotropic four-fifths law
> direction, multi-year mathematics) or a fundamentally new
> approach to OBS-02 (also research-level).
>
> The paper's existing result (Theorem 1.1, the unconditional
> stationary $L^{3,\infty}$ Liouville) is solid and submission-
> ready independently. Its $\S 11$ already states the gap
> honestly.

**Resource priorities, in order:**

1. Submit Part I to ARMA / JMFM / CMP. Peer review will
   sharpen the obstruction-wall narrative more than any further
   AI desk work.
2. Continue Lean Tree-A obligation porting (caccioppoli,
   ode_divergence_contradiction, dirichletIntegralZero) —
   these advance the *unconditional* paper toward machine-
   verified status independent of Clay closure.
3. Update the corpus's `confidence` fields to the honest values
   above, with cross-references to desk/05, desk/07, desk/08,
   desk/09.
4. Author MAYBE one more desk piece on the canon's actual
   frontier — the anisotropic four-fifths law — as a
   research-program statement, not a closure attempt.

The diagnostic sweep is complete. Three orthogonal routes
examined; all three blocked at residual confidence under 0.40.
The next move is peer review, not further AI research.
