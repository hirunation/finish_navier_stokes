# Desk · 2026-04-24 · MPC-5 helicity flux — the canon's own obstruction proof

After desk/07 located a structural gap in INS-04 (the icosahedral
hypothesis on Fibonacci φ-shells) — the residual 1-d trivial
component of $V_{\ell=2}|_I = \mathbf{1} \oplus \mathbf{4}$ has no
obvious PDE mechanism forcing it to vanish — the recon report
flagged that the *canon's actual* proposed closure is **MPC-5
helicity flux**, not the corpus-era INS-04. This piece examines
MPC-5 with the same rigour applied to INS-04. Result: **the
canon proves its own MPC-5 closure obstructed**, by the Eighth
Obstruction Theorem (link 5.45) and the Ninth Obstruction
Theorem (link 5.70). MPC-5 is structurally as blocked as
INS-04 — just by a different kind of obstruction. The canon's
actual frontier is the anisotropic four-fifths law (a third-order
velocity correlation identity), a multi-year mathematics project.

## §1 The MPC-5 mechanism in the canon's own words

MPC-5 (Master Proof Chain 5, *Helicity-Flux Cascade*) is a
1464-line document at
`/mnt/d/proving_grounds/turbulent_waters/canon/MASTER_PROOF_CHAIN_5.md`.
It proposes a closure of bounded Liouville Case I via a
**signed quadratic invariant** — helicity — being the topological
input that the Closure Wall (OBS-01..OBS-09) lacks.

The canonical claim from BRAID Movement VIII (lines 343–357 of
`BRAID_1.md`):

> **The helicity setup.** Helicity $H := \int v\cdot\omega\,dx$
> is a conserved quantity for ideal (inviscid) Euler flow. For
> stationary viscous NS, the helicity dissipation
> $\int\nabla v:\nabla\omega$ vanishes. The per-shell helicity
> flux $\Pi_k^H := \sum_{j<k}\langle\Delta_j\omega, (\Delta_k w
> \cdot\nabla)\Delta_j w\rangle$ satisfies an exact conservation
> law across shells.
>
> **The hypothesis for MPC-5:** the sign of $\Pi_k^H$ across
> adjacent φ-shells constrains the sign of $\Delta_k\nabla^2_
> {\mathrm{sym}}p^{RR}$ in a way that the integral bounds alone
> cannot.

Read narrowly: helicity is the only conserved scalar quadratic
Euler invariant besides energy; energy is exhausted; helicity is
unused; helicity is *signed*. Per BRAID Movement VI.6 the
remaining gap is "topological, not metric" — i.e., the
obstructions are sign obstructions with controlled magnitudes.
Helicity, being a signed pseudoscalar, is the natural candidate.

## §2 The Waleffe + Craya–Herring decomposition

To make the helicity-pressure connection precise the canon
develops the **Waleffe helical decomposition** at the φ-adic
scale. At wavenumber shell $|k| \in [\varphi^k, \varphi^{k+1})$,
each Fourier mode $\hat w(k)$ splits into two helical
eigenmodes of $\nabla \times$:
$$
\hat w(k) = \hat w^+(k) + \hat w^-(k), \qquad
\widehat{\nabla \times w^\pm}(k) = \pm |k|\,\hat w^\pm(k).
$$

The **per-shell helicity** decomposes as
$$
h_k = \varphi^k(E_k^+ - E_k^-), \qquad E_k^\pm = \|\Delta_k w^\pm\|_{L^2}^2,
$$
and the **helicity fraction** $\eta_k := h_k/(\varphi^{-k}\Omega_k) \in [-1, 1]$ measures chirality at each shell.

The Fibonacci triad $(\varphi^k, \varphi^{k+1}, \varphi^{k+2})$
satisfies $\varphi^{k+2} = \varphi^{k+1} + \varphi^k$ exactly.
The triad-resonant pressure correction of MPC-4 link 4.40,
$$
K_{k,k+1}^{RR} = -K_{k,k} + \varphi^{-2k}\frac{\langle\Delta_k\omega, \Delta_k\nabla^2_{\mathrm{sym}}p^{RR}\cdot\hat\xi_k|\Delta_{k+1}\omega|\rangle}{\|\Delta_k\omega\|\,\|\Delta_{k+1}\omega\|} + O(\varphi^{-k}),
$$
contains the indeterminate-sign term that the seventh obstruction
(OBS-07) flags. MPC-5 §5.38 (line 658 of MPC-5) decomposes this
into helical sectors:
$$
K_{k,k+1}^{RR} = \frac{E_k E_{k+1}}{2}\left[\Lambda_k^{(S)} + \eta_k\,\eta_{k+1}\,\Lambda_k^{(A)}\right] + O(\varphi^{-k}),
$$
where
- $\Lambda_k^{(S)} := \Lambda_k^{++} + \Lambda_k^{+-}$ — the
  **helicity-blind symmetric sector**, *unaffected* by the
  helicity fractions $\eta_k$.
- $\Lambda_k^{(A)} := \Lambda_k^{++} - \Lambda_k^{+-}$ — the
  **helicity-dependent antisymmetric sector**, multiplied by
  $\eta_k\eta_{k+1}$.

This decomposition is what MPC-5 calls the *critical resonance
splitting*. The sign of $K_{k,k+1}^{RR}$ — which controls the
Schur test that, if closed, would prove bounded Liouville —
depends on the signs of $\Lambda_k^{(S)}$ and $\Lambda_k^{(A)}$.

## §3 The Eighth Obstruction (MPC-5 §5.43–5.45)

Here is the canon's own proven negative result, quoted verbatim
from MPC-5 lines 794–828 (`MASTER_PROOF_CHAIN_5.md`):

> **Theorem.** Let $w$ be a smooth bounded stationary NS
> solution on $\mathbb{R}^3$ with $|w| \leq M$, $\gamma_\infty(w)
> > 0$, and $K_{k,k+1}^{RR}$ the resonance nearest-neighbour
> coupling. Then:
>
> *(i)* The resonance coupling decomposes into a helicity-blind
> symmetric sector and a helicity-dependent antisymmetric sector
> as above.
>
> *(ii)* **The symmetric sector $\Lambda_k^{(S)}$ is not
> constrained by helicity.** There exist bounded divergence-free
> fields with the same per-shell enstrophy, energy, and helicity
> profiles for which $\Lambda_k^{(S)}$ takes either sign.
>
> *(iii)* Even at maximal helicity ($|\eta_k| = 1$ for all
> active shells), the coupling $K_{k,k+1}^{RR}$ has indefinite
> sign from the triad geometry.
>
> *(iv)* The helicity-blind sector $\Lambda_k^{(S)}$ is the
> *dominant* contribution to the resonance pressure correction
> when $\eta_k\eta_{k+1} \approx 0$ (mixed or alternating
> helicity), and is always present regardless of helicity
> content.
>
> *(v)* The missing ingredient is a constraint on the sign of
> $\Lambda_k^{(S)}$ that uses the *full NS momentum equation* at
> shell $k$. This constraint is beyond the reach of helicity,
> energy, enstrophy, and strain bounds taken individually or in
> combination. It requires structural information about the
> spatial correlations of the velocity field within the
> Fibonacci triad geometry.

This is **proven** in the canon, not conjectured. The proof
(MPC-5 link 5.41, line 717) is constructive: the canon explicitly
exhibits two bounded divergence-free fields with identical
helicity profiles ($\eta_k$ at every shell, including
$\eta_k = 0$ in the helicity-neutral case) but with
$\Lambda_k^{(S)}$ of opposite sign. Field 1 has
$\Lambda_k^{(S)} > 0$; field 2, obtained by rotating field 1 by
$\pi/2$, has $\Lambda_k^{(S)} < 0$. Rotation preserves all
energy and helicity profiles but flips the Riesz-kernel sign in
the resonance pressure correction.

## §4 The Ninth Obstruction (MPC-5 §5.46–5.70)

Can the **Călugăreanu–White–Fuller twist–writhe** decomposition
($h_k = H_k^{\mathrm{Tw}} + H_k^{\mathrm{Wr}}$) — which carries
*more* signed information than scalar helicity alone — close
what scalar helicity cannot?

The canon's answer (MPC-5 link 5.69, line 988): no.

> The twist–writhe decomposition provides two independent
> geometric invariants per shell, but they act on **vortex-line
> geometry** (physical space), while the sectors $\Lambda_k^{(S)},
> \Lambda_k^{(A)}$ act on **helical-mode geometry** (Fourier
> space). The two geometries are incommensurable for $|\eta_k|
> < 1$.

The canon traces the precise mismatch (lines 950–958): the
Waleffe parity $s \to -s$ flips helical eigenvalues, while the
vortex-line parity $\xi \to -\xi$ flips the orientation of
$\omega/|\omega|$. These two parities coincide *only* for
purely helical modes ($|\eta_k| = 1$); for generic mixed flows
they act on incommensurable representations.

## §5 The structural diagnosis

The canon's own *Insight 1* (MPC-5 lines 832–836) names the
diagnosis in one sentence:

> The pressure resonance correction involves two independent
> geometric scalars ($\Lambda_k^{++}$ and $\Lambda_k^{+-}$),
> while helicity provides only one scalar constraint per shell
> ($\eta_k$). One number cannot determine two. This is not a
> failure of technique; it is a **dimensional mismatch between
> the invariant (helicity, a pseudoscalar) and the object it
> must constrain (the Riesz kernel integrated over triad
> orientations, a rank-2 tensor contraction).**

The eighth and ninth obstruction theorems together establish:

1. **Scalar helicity is structurally insufficient.** It carries
   only one signed degree of freedom per shell; the obstruction
   has two.
2. **Bivector helicity (twist + writhe) is also insufficient.**
   It carries two signed dof per shell, but in the wrong
   geometric representation (vortex-line vs Fourier helical).
3. **The required closing input** is a constraint that uses the
   *full NS momentum equation* on the Fibonacci triad geometry,
   beyond any combination of energy/enstrophy/helicity/strain
   integral bounds. The canon names this only in the abstract
   — no concrete proposal exists.

## §6 The canon's actual frontier — third-order structure
functions

In MPC-5's epilogue (lines 909–920), the canon points to the
next research direction:

> The NS energy flux identity $\langle(\delta u_L)^3\rangle +
> 6\langle\delta u_L\,\delta p\rangle / \rho = -4\epsilon\,r$
> (the exact four-fifths law with pressure) constrains the
> correlation between longitudinal velocity increments and
> pressure increments. At the Fibonacci scale, this couples the
> symmetric helical-sector geometry $\Lambda_k^{(S)}$ to the
> energy dissipation rate, potentially forcing a definite sign.

This is the **anisotropic four-fifths law**: an extension of
Kolmogorov's classical isotropic four-fifths identity to
direction-dependent stationary solutions. The classical version
governs the homogeneous-isotropic ensemble; an anisotropic
version, projected onto Fibonacci triad geometry, would in
principle constrain $\Lambda_k^{(S)}$ via the third-order
velocity correlation $\langle(\delta u_L)^3\rangle(r)$ at scale
$r = R_0\varphi^k$.

**Three caveats:**

1. The classical four-fifths law presumes statistical homogeneity
   and isotropy; stationary smooth solutions of NS need not be
   either. The required generalization is non-trivial.
2. The pressure-velocity correlation $\langle\delta u_L \delta
   p\rangle$ requires structural information about the pressure
   field — exactly the same type of structural input that the
   eighth obstruction declares missing.
3. Even if such an anisotropic identity is derived, projecting
   it onto Fibonacci triad geometry to extract a sign on
   $\Lambda_k^{(S)}$ is a third-step calculation; the structural
   gap might persist there too.

## §7 Comparison: MPC-5 vs INS-04 vs the actual frontier

| Route | Status | Type of obstruction |
|:---|:---|:---|
| Energy-method rescues (desk/05) | Reduced to Prodi-Serrin | Equivalent to known regularity criterion |
| INS-04 Icosahedral (desk/07) | Structural gap in 1-d residual | Representation-theoretic, no PDE bridge |
| **MPC-5 Helicity flux (this piece)** | **Proven blocked by canon's Eighth + Ninth Obstruction** | **Dimensional mismatch (scalar vs tensorial)** |
| Anisotropic four-fifths law (canon's frontier) | Not yet developed | Requires new mathematics on third-order structure functions |
| INS-10 Ancient extension | Not examined here; corpus-only addition | Different mechanism, deferred |

**The honest reading:** all three "orthogonal Clay routes" the
corpus highlights — INS-03 (Grand Unification, condensed from
canon), INS-04 (Icosahedral), INS-10 (Ancient) — sit *between*
the canon's proven obstructions and the canon's
not-yet-developed frontier. INS-04 fails at the
representation-theoretic residual; MPC-5 (the canon's own
candidate) fails at the dimensional mismatch; INS-10 has not
been examined here but is corpus-only and similarly ungrounded
in canon-level proven results.

The canon itself does **not** declare bounded Liouville
provable. It declares the **diagnostic complete** through nine
obstruction theorems and identifies the third-order structure
function programme as the next research direction. That
programme is, plausibly, multi-year mathematics requiring new
identities, new estimates, new tools.

## §8 Implications for the project

Three implications for the live work:

### 8.1 Calibrate corpus confidence values

INS-03 confidence 0.75, INS-04 confidence 0.65, INS-10
confidence 0.70 in the corpus appear to over-state how close
each route is to closure. After desk/05, desk/07, and this desk
piece:

- INS-04 honest estimate: **0.30–0.40** (clean rep-theory,
  missing PDE bridge for the residual 1-d component).
- MPC-5 (helicity flux closure): **0.10** (canon's own
  Eighth + Ninth Obstruction Theorems prove the structural
  insufficiency).
- INS-03 (Grand Unification = unique ergodicity on translation
  hull): not directly examined here, but it sits as the
  *positive form* of what the obstruction wall must close. Its
  closure depends on either INS-04 or MPC-5 or the four-fifths
  law working — none of which look close. So INS-03 inherits
  whichever closure mechanism succeeds: confidence **0.10–0.30**.
- INS-10 ancient extension: not yet examined; estimate pending.

### 8.2 Resource allocation

Given that the three corpus-flagged orthogonal routes are
either structurally blocked (MPC-5, by the canon's own theorems)
or have material gaps (INS-04, per desk/07), the highest-impact
research-level moves on the Clay front are:

1. **Develop the anisotropic four-fifths law for stationary
   smooth NS.** This is the canon's actual frontier. New
   mathematics; multi-year horizon. Possibly publishable as
   intermediate results before bounded Liouville is closed.
2. **Examine INS-10 (ancient extension) with the depth of
   desk/07 and this piece.** Determine if the space-time hull
   ergodicity has the same structural gap or is genuinely
   different.
3. **Submit Part I to ARMA / JMFM / CMP and let peer review
   sharpen the obstruction wall.** External validation of the
   diagnostic, even without closure, is a real contribution to
   the field.

### 8.3 The Lean front continues independently

The desk-level analysis does not affect the Lean
formalization plan. The three Tree-A obligations
(`caccioppoli`, `odeContradiction`, `dirichletIntegralZero`)
are about Theorem 1.1 of the *paper* — the unconditional
stationary $L^{3,\infty}$ Liouville result, which is proved.
That work continues regardless of whether the Clay-chain
extensions close.

## §9 Recommendation

**Drop active research investment in MPC-5 and INS-04 closure
attempts.** The canon's own theorems and our representation-
theoretic analysis (desk/07) establish that these are not the
right targets for near-term work.

**Promote MPC-5 to retired-anti-knowledge** in the corpus,
*not* with the meaning "the helicity flux is wrong" — it isn't,
the per-shell flux is a perfectly real conservation law — but
with the meaning "scalar helicity cannot close the bounded
Liouville obstruction; it's structurally insufficient by the
canon's Eighth Obstruction Theorem." This is exactly the kind
of dead-end that the AK category is designed to catalogue.

**Keep INS-04 as conjectured with calibrated confidence**
(0.30–0.40, down from 0.65). It's not refuted, but the residual
PDE bridge is missing.

**Examine INS-10 next** with the same rigour; that's the only
remaining corpus-flagged route I haven't structurally examined.

**The actual research frontier** — anisotropic four-fifths law +
third-order structure functions — is real mathematics that
deserves its own program, not a desk piece from an AI
assistant. Mark it as such in the corpus and return to the
Lean infrastructure work, the paper submission process, and
the obstruction-wall formalization.

---

**One-line summary:** the canon's own Eighth and Ninth
Obstruction Theorems prove that scalar helicity flux — the
canon's proposed closure mechanism — cannot resolve the bounded
Liouville obstruction, by a dimensional mismatch (scalar
invariant vs tensorial obstruction). MPC-5 is as structurally
blocked as INS-04, just for a different reason. The canon's
actual frontier is the anisotropic four-fifths law, which is
multi-year mathematics not in scope for the current corpus.
