# Desk · 2026-04-24 · Weighted $L^2$ energy — honest Gronwall attempt

Following desk/04. Desk/04 attempted the **pointwise** weighted
bound $A(t) = \sup_{|x|>R_0}(1+|x|)|u(x,t)|$ via the Duhamel/Oseen
decomposition and closed the far-field bilinear only on a
short-time interval (quadratic Volterra $\tilde A \leq L_0 + L_1
\tilde A^2$).

This desk piece tries a different route: the **weighted $L^2$**
quantity

$$
W_\alpha(t) := \int_{\mathbb{R}^3} (1+|x|)^{2\alpha}\,|u(x,t)|^2\,dx,
\qquad \alpha \geq 0.
$$

Goal: prove $W_\alpha(t) < \infty$ uniformly on $[0, T^*)$ for
Schwartz data, then bootstrap to the pointwise bound via weighted
Sobolev / Moser iteration. Result: the Gronwall closes under a
condition equivalent to the classical Prodi–Serrin–Ladyzhenskaya
regularity criterion $u \in L^2_t L^\infty_x$. This is not an
advance on the Clay problem; it is a structural observation about
the weighted-moment rescue.

## §1 The evolution identity

Write $w(x) := (1+|x|)^{2\alpha}$. Differentiate under the integral
(valid by Schwartz decay + smoothness on $[0, T^*)$):

$$
\frac{1}{2}\frac{d}{dt} W_\alpha(t)
= \int w\, u \cdot \partial_t u\,dx
= \int w\, u \cdot \bigl[\nu \Delta u - (u\cdot\nabla)u - \nabla p\bigr]\,dx.
$$

Handle each term by integration by parts.

### Viscous

$$
\nu\int w\, u\cdot\Delta u\,dx
= -\nu\int w|\nabla u|^2 + \frac{\nu}{2}\int|u|^2\,\Delta w\,dx.
$$

Write $D_\alpha(t) := \int w|\nabla u|^2\,dx$ for the **weighted
Dirichlet energy**. Then the viscous contribution is
$-\nu D_\alpha + \frac{\nu}{2}\int|u|^2\Delta w$.

### Convective

Using $u\cdot\nabla v \cdot v = \tfrac{1}{2} u\cdot\nabla|v|^2$:

$$
-\int w\,u\cdot(u\cdot\nabla)u\,dx
= -\frac{1}{2}\int w\,(u\cdot\nabla)|u|^2\,dx
= \frac{1}{2}\int |u|^2\, u\cdot\nabla w\,dx,
$$

the last step by IBP + $\nabla\cdot u = 0$.

### Pressure

$$
-\int w\,u\cdot\nabla p\,dx = \int p\,(u\cdot\nabla w)\,dx,
$$

IBP + $\nabla\cdot u = 0$.

### The master identity

$$
\boxed{\;
\frac{1}{2}\dot W_\alpha
= -\nu D_\alpha + \frac{\nu}{2}\int|u|^2\Delta w
+ \frac{1}{2}\int |u|^2\,u\cdot\nabla w
+ \int p\,(u\cdot\nabla w)\,dx.
\;}
$$

The viscous dissipation $-\nu D_\alpha$ is the only favorable sign.
Everything else is a cross-term in the weight gradient/Laplacian.

## §2 Weight bookkeeping

Compute $\nabla w$ and $\Delta w$. For $w(x) = (1+|x|)^{2\alpha}$:

$$
\nabla w = 2\alpha (1+|x|)^{2\alpha - 1}\,\hat{x},
\qquad
\Delta w = 2\alpha(2\alpha-1)(1+|x|)^{2\alpha - 2} + \frac{4\alpha}{|x|}(1+|x|)^{2\alpha - 1}.
$$

On $\{|x|\geq 1\}$, $1/|x| \leq 2/(1+|x|)$, so
$\Delta w \leq C_\alpha (1+|x|)^{2\alpha - 2}$. Near the origin,
both terms are bounded by $(1+|x|)^{2\alpha - 2}$ up to a
universal constant (and $u$ is locally smooth, so no trouble).
Uniformly:

$$
|\nabla w| \leq 2\alpha\,(1+|x|)^{2\alpha - 1},
\qquad
|\Delta w| \leq C_\alpha\,(1+|x|)^{2\alpha - 2}.
$$

## §3 Viscous cross-term

$$
\left|\frac{\nu}{2}\int |u|^2\Delta w\right|
\leq \frac{C_\alpha\nu}{2}\int |u|^2 (1+|x|)^{2\alpha - 2}\,dx
= \frac{C_\alpha\nu}{2}\, W_{\alpha-1}(t).
$$

Since $(1+|x|)^{2\alpha-2} \leq (1+|x|)^{2\alpha}$ pointwise,
$W_{\alpha-1} \leq W_\alpha$, giving

$$
\left|\tfrac{\nu}{2}\int|u|^2\Delta w\right| \leq \tfrac{C_\alpha\nu}{2}\,W_\alpha(t). \qquad\textbf{[OK]}
$$

## §4 Convective cross-term — the core difficulty

$$
\left|\tfrac{1}{2}\int|u|^2\,u\cdot\nabla w\right|
\leq \alpha\int|u|^3 (1+|x|)^{2\alpha-1}\,dx =: \alpha\,\mathcal C(t).
$$

Bound $\mathcal C(t)$.

### §4.1 Route A — Hölder with $L^\infty$

$$
\mathcal C(t) = \int |u|\cdot |u|^2 (1+|x|)^{2\alpha-1}\,dx
\leq \|u(\cdot,t)\|_{L^\infty}\int |u|^2 (1+|x|)^{2\alpha - 1}\,dx.
$$

Since $(1+|x|)^{2\alpha - 1} \leq (1+|x|)^{2\alpha}$:

$$
\mathcal C(t) \leq \|u(\cdot,t)\|_{L^\infty}\,W_\alpha(t).
$$

So $\bigl|\tfrac{1}{2}\int|u|^2 u\cdot\nabla w\bigr| \leq \alpha\|u(\cdot,t)\|_{L^\infty} W_\alpha(t)$.

### §4.2 Route B — Cauchy–Schwarz + weighted Hardy + Young

Split $|u|^3(1+|x|)^{2\alpha-1}$ as
$[(1+|x|)^\alpha u]\cdot [(1+|x|)^{\alpha-1}|u|^2]$:

$$
\mathcal C(t)
\leq W_\alpha^{1/2}\cdot\Bigl(\int |u|^4 (1+|x|)^{2\alpha - 2}\,dx\Bigr)^{1/2}.
$$

The second factor is $\int |u|^4 w^{-2} w = \|u^2\|_{L^2(w^{2\alpha -2})}^2$.
Now set $v := u\,(1+|x|)^\alpha$. Then $v \in L^2$ with
$\|v\|_{L^2}^2 = W_\alpha$, and

$$
|\nabla v|^2 \leq 2|\nabla u|^2 (1+|x|)^{2\alpha} + 2\alpha^2 |u|^2 (1+|x|)^{2\alpha-2}
\;\Rightarrow\;
\|\nabla v\|_{L^2}^2 \leq 2(D_\alpha + \alpha^2 W_{\alpha - 1}) \leq 2(D_\alpha + \alpha^2 W_\alpha).
$$

Applying the 3D Gagliardo–Nirenberg inequality
$\|v\|_{L^4}^4 \leq C\|v\|_{L^2}\|\nabla v\|_{L^2}^3$ to $v$:

$$
\int|u|^4(1+|x|)^{4\alpha}\,dx = \|v\|_{L^4}^4
\leq C\,W_\alpha^{1/2}\,(D_\alpha + W_\alpha)^{3/2}.
$$

Using $(1+|x|)^{2\alpha - 2} \leq (1+|x|)^{4\alpha}$ for $\alpha \geq 1$:

$$
\Bigl(\int |u|^4 (1+|x|)^{2\alpha-2}\Bigr)^{1/2}
\leq \Bigl(\int|u|^4(1+|x|)^{4\alpha}\Bigr)^{1/2}
\leq C^{1/2} W_\alpha^{1/4}\,(D_\alpha + W_\alpha)^{3/4}.
$$

Combining:

$$
\mathcal C(t) \leq C\,W_\alpha^{3/4}\,(D_\alpha + W_\alpha)^{3/4}.
$$

Young with $(p,p') = (4, 4/3)$: $W_\alpha^{3/4}\cdot D_\alpha^{3/4}
\leq \epsilon D_\alpha + C_\epsilon W_\alpha^3$.
Choose $\epsilon = \nu/(4\alpha)$ to absorb into the viscous sink.

$$
\alpha\,\mathcal C \leq \tfrac{\nu}{4} D_\alpha + C(\alpha,\nu)\,(W_\alpha^3 + W_\alpha).
$$

**This gives a CUBIC bound in $W_\alpha$.** Cubic growth blows up
in finite time: $\dot W_\alpha \leq C\,W_\alpha^3 \Rightarrow
W_\alpha(t) \to \infty$ at $t \leq W_\alpha(0)^{-2}/(2C)$.

Route B does NOT give a Gronwall-integrable bound without further
input. The cubic arises because the weighted Gagliardo–Nirenberg
estimate inflates the nonlinearity.

### §4.3 The honest cleanest bound

Route A is strictly the best one can do without extra regularity:

$$
\boxed{\;
\left|\tfrac{1}{2}\int|u|^2 u\cdot\nabla w\right|
\leq \alpha\,\|u(\cdot,t)\|_{L^\infty}\,W_\alpha(t).
\;}
$$

## §5 Pressure cross-term

$$
\left|\int p\,(u\cdot\nabla w)\right|
\leq 2\alpha \int |p||u|(1+|x|)^{2\alpha - 1}\,dx.
$$

Cauchy–Schwarz with the $(1+|x|)^{\alpha}$/$(1+|x|)^{\alpha-1}$
split:

$$
\int|p||u|(1+|x|)^{2\alpha - 1}
\leq \|p\|_{L^2((1+|x|)^{2\alpha-2})}\cdot W_\alpha^{1/2}.
$$

To bound $\|p\|_{L^2(w^{2\alpha - 2})}$, use $p = R_iR_j(u_iu_j)$
and Calderón–Zygmund on the weighted $L^2$ space. On $A_p$-type
weights $(1+|x|)^{\beta}$ with $|\beta| < 3$ (Muckenhoupt
condition for 3D), CZ operators are bounded; so
$\|p\|_{L^2(w^{2\alpha-2})} \leq C\|u\otimes u\|_{L^2(w^{2\alpha-2})}
\leq C\|u\|_{L^\infty}\,W_{\alpha - 1}^{1/2}
\leq C\|u\|_{L^\infty}\,W_\alpha^{1/2}$,
valid for $\alpha < 5/2$ (so that $2\alpha - 2 < 3$).

Combining:

$$
\left|\int p\,(u\cdot\nabla w)\right|
\leq C(\alpha)\,\|u(\cdot,t)\|_{L^\infty}\,W_\alpha(t).
$$

Same structural form as the convective term.

## §6 The Gronwall

Assembling §3, §4, §5:

$$
\frac{1}{2}\dot W_\alpha \leq -\nu D_\alpha +
\underbrace{\tfrac{C_\alpha\nu}{2} W_\alpha}_{\text{visc.\ cross}}
+ \underbrace{\alpha\|u\|_{L^\infty} W_\alpha}_{\text{convective}}
+ \underbrace{C(\alpha)\|u\|_{L^\infty} W_\alpha}_{\text{pressure}}.
$$

Dropping the good sink $-\nu D_\alpha$:

$$
\dot W_\alpha \leq \bigl[C_{1}(\alpha,\nu) + C_{2}(\alpha)\|u(\cdot,t)\|_{L^\infty}\bigr]\,W_\alpha(t).
$$

By Gronwall,

$$
\boxed{\;
W_\alpha(t)\leq W_\alpha(0)\,\exp\!\Bigl(C_1(\alpha,\nu)\,t + C_2(\alpha)\int_0^t\|u(\cdot,s)\|_{L^\infty}\,ds\Bigr).
\;}
$$

## §7 Diagnosis: the obstruction is Prodi–Serrin–Ladyzhenskaya

$W_\alpha(t)$ stays bounded on $[0,T^*)$ iff

$$
\int_0^{T^*}\|u(\cdot,s)\|_{L^\infty}\,ds < \infty.
$$

This is the **Prodi–Serrin–Ladyzhenskaya criterion at
$(r,s) = (1,\infty)$**. But the standard Prodi–Serrin family
$L^r_t L^s_x$ with $2/r + 3/s = 1$ gives $(r,s) = (2,\infty)$ at
the $L^\infty$ endpoint, i.e., $\int\|u\|_{L^\infty}^2 < \infty$
suffices for regularity. My bound asks for $\int\|u\|_{L^\infty} <
\infty$ (unweighted), which is **stronger** than the Prodi–Serrin
criterion itself — it is sub-critical for the scaling $2/r + 3/s
= 1$.

A tighter Cauchy–Schwarz sharpens this. In the Gronwall,

$$
\int_0^t\|u\|_{L^\infty}\,ds \leq \sqrt t\cdot\Bigl(\int_0^t\|u\|_{L^\infty}^2\,ds\Bigr)^{1/2},
$$

so actually

$$
W_\alpha(t) \leq W_\alpha(0)\,\exp\!\Bigl(C_1 t + C_2\sqrt{t}\cdot\|u\|_{L^2_t L^\infty_x([0,t])}\Bigr).
$$

Finite for $t<T^*$ iff $\|u\|_{L^2_t L^\infty_x([0,T^*))} < \infty$
— exactly Prodi–Serrin.

## §8 What this means

**The weighted $L^2$ rescue reduces to the Prodi–Serrin condition.**

- The pointwise rescue (desk/04) asked for $\|(1+|x|)u\|_{L^\infty_x} \in L^\infty_t$
  — equivalent to $u \in L^\infty_t L^\infty_x$ with a spatial-decay tag.
- The weighted-$L^2$ rescue (this desk) asks for $u \in L^2_t L^\infty_x$
  — strictly weaker than pointwise, but still a classical Prodi–Serrin
  regularity criterion.

Both reductions land in the same territory: **the rescue works if
some a priori $L^\infty$ control is available on $u$**, and such
control is itself a known regularity-criterion hypothesis. The
weighted-moment rescue does not give a genuinely new opening to
the Clay problem at this level of analysis.

**This is a real finding, not a failure.** It precisely locates
the obstruction:

1. The LEM-06 $L^{3,\infty}$ inheritance gap sits at the
   scale-invariant level.
2. The INS-21 weighted-moment rescue, in either pointwise or
   $L^2$ form, translates that gap into a sub-critical Prodi–Serrin
   condition.
3. The reduction is equivalent, not an advance.

## §9 What is the next real move

Three candidates, in descending order of tractability:

**(i) Lean-formalize Part I.** The stationary $L^{3,\infty}$
Liouville theorem is what the paper proves unconditionally.
Machine-checking it hardens the foundation and is achievable
within months. This does not touch Clay but makes the existing
result bulletproof.

**(ii) Submit Part I to ARMA/JMFM/CMP standalone.** The honest
paper stands: a genuine new theorem + precise mapping of the
remaining gap (which overlaps Phuc 2015). Peer review is the
next honest step for the already-done work.

**(iii) Abandon the weighted-moment route entirely and attack
the $\ell = 2$ icosahedral obstruction (INS-04) directly.** The
corpus flags this as the irreducible representation-theoretic
obstruction. It is higher-variance but orthogonal to everything
tried here — the Prodi–Serrin equivalence shows that energy-
method rescues all reduce to the same known criterion, so a
fundamentally different mechanism is needed. This is the
highest-impact but least-predictable bet.

**Recommendation for the immediate next session:** (i) — Lean-
formalize. Builds a verified foundation under Part I, establishes
institutional credibility, and frees attention for (iii) in
subsequent work without the weight of unproved-foundation anxiety.

## §10 New corpus entries implied

The Prodi–Serrin equivalence here should be promoted to an `AK-`
entry (retired anti-knowledge) or a new `LEM-` / `OBS-` entry
classifying the reduction.

Proposed:

- **AK-37** · Weighted-moment rescue in $L^2$ form reduces to
  Prodi–Serrin. Does not open new progress on LEM-06.
  Supersedes the INS-21 weighted-$L^2$ sub-route.
- **Update INS-21**: status remains `conjectured`, but scope
  narrowed — the claim is now specifically that the POINTWISE
  bound propagates (desk/04), not the $L^2$ bound. Add a
  cross-reference to this desk piece.

These updates can be made in a subsequent pass; they are not
urgent and the finding does not invalidate anything already
published.
