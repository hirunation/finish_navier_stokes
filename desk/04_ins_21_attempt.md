# Desk · 2026-04-23 · Attempt at INS-21 Step 2

Actually sitting with the estimate.  Not re-framing.  Trying
to produce a proof sketch and report honestly what I find.

## §1 Setup

Let $u \in C^\infty(\mathbb{R}^3 \times [0, T^*))$ be the smooth
NS solution with divergence-free Schwartz initial data $u_0$ on
the maximal smooth interval.  Assume (toward contradiction) a
finite blow-up time $T^* < \infty$, with candidate singular set
$\Sigma \subset \mathbb{R}^3$ bounded: $\Sigma \subset B_{R_0/2}(0)$
for some $R_0 > 0$ (WLOG shift so the singularity is near origin).

Define the **exterior-weighted norm**:

$$A(t) := \sup_{|x| > R_0} (1 + |x|) \, |u(x, t)|.$$

Want:

$$\sup_{t \in [0, T^*)} A(t) \leq C(\|u_0\|_{L^2}, \|(1+|x|)u_0\|_{L^\infty}, \nu, R_0).$$

If established, the rescaling $v_n(y, s) = \lambda_n u(x_n +
\lambda_n y, t_n + \lambda_n^2 s)$ with $x_n \in \Sigma$ inherits
$L^{3,\infty}$ uniformly — for $|y| \geq R_0/\lambda_n$ (exterior
part) $|v_n(y, s)| \leq C/|y|$; for $|y| \leq R_0/\lambda_n$
(interior) $|v_n| \leq \gamma_n \to 1$ by KNSS.  Combined:
$\|v_n(\cdot, s)\|_{L^{3,\infty}} \leq $ universal.

## §2 What we'll use (standard inputs, not conjectures)

- **Leray energy**: $\|u(\cdot, t)\|_{L^2} \leq \|u_0\|_{L^2}$ for
  all $t \in [0, T^*)$.
- **Duhamel/Oseen**: $u = e^{\nu t \Delta} u_0 - B(u, u)(t)$ where
  $B(u, v)(t) := \int_0^t e^{\nu(t-s)\Delta} \mathbb{P}\nabla \cdot
  (u \otimes v)(s)\, ds$.  Kernel bound
  $|K(z, \tau)| \leq C (|z| + \sqrt\tau)^{-4}$.
- **CKN ε-regularity** (Caffarelli-Kohn-Nirenberg 1982): if
  $\limsup_{r \to 0} r^{-1} \int_{Q(z_0, r)} (|u|^3 + |p|^{3/2})
  \leq \varepsilon_0$, then $z_0$ is a regular point.
  Corollary: $\Sigma$ is $P^1$-measure zero; we've assumed $\Sigma
  \subset B_{R_0/2}$.

Notation: $Q(z, r) = B(x, r) \times (t-r^2, t)$.

## §3 Linear part is fine

**Lemma 1.** For $t \in [0, T^*]$ and $|x| > R_0$:

$$|(e^{\nu t \Delta} u_0)(x)| \leq \frac{C(\|(1+|y|)u_0\|_{L^\infty})}{1 + |x|}.$$

*Proof.* Heat-kernel convolution.  $|u_0(y)| \leq C_0/(1+|y|)$.
$(e^{\nu t\Delta} u_0)(x) = \int G(x-y, \nu t) u_0(y)\, dy$.  Split
$|y-x| \leq |x|/2$ (near $x$, where $1+|y| \geq 1 + |x|/2$) and
$|y-x| > |x|/2$ (exponentially small Gaussian tail contribution).
Near: $|u_0(y)| \leq 2C_0/(1+|x|)$, so integral is
$\leq 2C_0/(1+|x|)$.  Far: $\int_{|z|>|x|/2} G(z, \nu t)\, dz \leq
\exp(-|x|^2/(16\nu t))$; times $\|u_0\|_{L^\infty} \leq C_0$ gives
exponentially small contribution.  For $|x| \gtrsim \sqrt{\nu t}$
(true for $|x| > R_0$ on bounded time): $\exp(-|x|^2/(16\nu T^*)) \leq C$.
Combined: $|(e^{\nu t\Delta} u_0)(x)| \leq 2C_0/(1+|x|) + $ small.
$\square$

So on $\{|x| > R_0\}$, the linear contribution satisfies
$(1+|x|)|\text{linear}| \leq 2 C_0$ uniformly in $t$.

## §4 Near-singularity bilinear contribution

Split $B(u, u)(x, t)$ by the $y$-integration into
$|y| \leq R_0/2$ (near $\Sigma$) and $|y| > R_0/2$.

**Lemma 2.** For $|x| > R_0$ and $t \in [0, T^*)$, the
contribution from $|y| \leq R_0/2$ is bounded by

$$|B_{\mathrm{near}}(x, t)| \leq \int_0^t \int_{|y| \leq R_0/2} \frac{|u|^2(y, s)}{(|x-y| + \sqrt{\nu(t-s)})^4}\, dy\, ds \leq \frac{C\|u_0\|_{L^2}^2 \cdot T^*}{|x|^4},$$

hence $(1+|x|) |B_{\mathrm{near}}(x, t)| \leq C \|u_0\|_{L^2}^2 T^*/|x|^3 \leq C \|u_0\|_{L^2}^2 T^*/R_0^3$.

*Proof.*  For $|x| > R_0$ and $|y| \leq R_0/2$: $|x - y| \geq |x|
- R_0/2 \geq |x|/2$.  So $(|x-y| + \sqrt\tau)^{-4} \leq (|x|/2)^{-4}
\leq C/|x|^4$.  Then $\int_{|y| \leq R_0/2} |u(y,s)|^2 \, dy \leq
\|u(\cdot, s)\|_{L^2}^2 \leq \|u_0\|_{L^2}^2$.  Time-integrate. $\square$

**Bounded uniformly in $t$ — does not need any bootstrap.**

## §5 Far-field bilinear contribution — bootstrap

Now the delicate part.  Contribution from $|y| > R_0/2$:

$$B_{\mathrm{far}}(x, t) = \int_0^t \int_{|y| > R_0/2} K(x - y, t - s) (u \otimes u)(y, s)\, dy\, ds.$$

Define the bootstrap quantity

$$\tilde A(t) := \sup_{0 \leq s \leq t} \sup_{|y| > R_0/2} (1 + |y|)|u(y, s)|.$$

Note $A(t) \leq \tilde A(t)$ (supremum over a larger exterior
includes the smaller one).  Conversely on the bootstrap interval
we need both.

Using the hypothesis $|u(y, s)| \leq \tilde A(s) / (1 + |y|)$ for
$|y| > R_0/2$ and $s \leq t$:

$|B_{\mathrm{far}}(x, t)| \leq \int_0^t \tilde A(s)^2 \int_{|y| > R_0/2} \frac{dy}{(1+|y|)^2 (|x-y| + \sqrt{\nu(t-s)})^4}\, ds$.

**The spatial integral** (for $|x| > R_0$, $\tau = \nu(t-s) > 0$):

$$I(x, \tau) := \int_{|y| > R_0/2} \frac{dy}{(1+|y|)^2 (|x-y| + \sqrt{\tau})^4}.$$

Split at $|y - x| = |x|/2$:

**Close to $x$** ($|y - x| \leq |x|/2$): in this ball, $|y| \geq
|x|/2$, so $(1+|y|)^{-2} \leq (1 + |x|/2)^{-2} \leq 4/(1+|x|)^2$.
Integral of $(|y-x| + \sqrt\tau)^{-4}$ over $|y-x| \leq |x|/2$ in
3D is $\leq C/\sqrt\tau \cdot 1$ wait.

Actually, $\int_{\mathbb{R}^3} (|z| + \sqrt\tau)^{-4}\, dz = C/\sqrt\tau$.
Restricting to $|z| \leq |x|/2$ only decreases this; still bounded
by $C/\sqrt\tau$.

So close-to-$x$ contribution: $\leq 4/(1+|x|)^2 \cdot C/\sqrt\tau
= C/((1+|x|)^2 \sqrt\tau)$.

**Far from $x$** ($|y-x| > |x|/2$, intersect with $|y| > R_0/2$):
in this region $(|y-x| + \sqrt\tau)^{-4} \leq (|x|/2)^{-4}
\leq C/|x|^4$.  Integral of $(1+|y|)^{-2}$ over this region is
$\leq \int_{\mathbb{R}^3}(1+|y|)^{-2}\, dy$ — **divergent!**
$\int r^2/(1+r)^2\, dr$ diverges like $r$.

Hmm.  That's a problem.  Let me redo.

The issue: $(1+|y|)^{-2}$ is not integrable on $\mathbb{R}^3$ —
the integrand is only $|y|^{-2}$ at infinity, and $\int r^2 \cdot
r^{-2}\, dr = \int dr$ diverges.

So the "far from $x$" contribution is not bounded by the simple
estimate.  Need to use the $(|y-x| + \sqrt\tau)^{-4}$ decay.

**Retry far-from-$x$**: $(|y-x| + \sqrt\tau)^{-4}$ is integrable
at infinity ($r^{-4} \cdot r^2$ is $r^{-2}$).  Use Hölder on
$(1+|y|)^{-2}$ and the kernel:

$I_{\text{far}}(x, \tau) = \int_{|y-x|>|x|/2} \frac{dy}{(1+|y|)^2 (|y-x| + \sqrt\tau)^4}$.

Change variable $z = y - x$, restriction $|z| > |x|/2$:

$= \int_{|z|>|x|/2} \frac{dz}{(1+|x+z|)^2 (|z| + \sqrt\tau)^4}$.

In the far-from-$x$ region, $|z| > |x|/2$, so $(|z| + \sqrt\tau)^{-4}
\leq |z|^{-4}$.  And $(1+|x+z|)^{-2} \leq 1$.  So:

$I_{\text{far}}(x, \tau) \leq \int_{|z| > |x|/2} |z|^{-4}\, dz = 4\pi \int_{|x|/2}^\infty r^{-2}\, dr = C/|x|$.

Much better.

So overall:

$$I(x, \tau) \leq \frac{C}{(1+|x|)^2 \sqrt\tau} + \frac{C}{|x|}.$$

**Time-integrate**:

$\int_0^t I(x, \nu(t-s))\, ds \leq \frac{C \sqrt{t/\nu}}{(1+|x|)^2} + \frac{Ct}{|x|}$.

**Multiply by $(1+|x|)$ and combine with $\tilde A^2$**:

$(1 + |x|) |B_{\mathrm{far}}(x, t)| \leq \sup_{s \leq t} \tilde A(s)^2 \cdot \left[ \frac{C \sqrt{t/\nu}}{1+|x|} + C t \right]$.

For $|x| \geq R_0$: first term is $\leq C \sqrt{t/\nu}/R_0$.

So:
$$(1+|x|) |B_{\mathrm{far}}(x, t)| \leq C \tilde A(t)^2 \left( \frac{\sqrt{t/\nu}}{R_0} + t \right) \leq C \tilde A(t)^2 \cdot \Phi(t, \nu, R_0)$$

where $\Phi(t, \nu, R_0) = \sqrt{t/\nu}/R_0 + t$ — **bounded on
bounded time but grows in $t$**.

## §6 Bootstrap — the bad news

Combining Lemmas 1, 2 and the bound of §5:

$$A(t) \leq 2 C_0 + \frac{C \|u_0\|_{L^2}^2 T^*}{R_0^3} + C \tilde A(t)^2 \left( \frac{\sqrt{T^*/\nu}}{R_0} + T^* \right).$$

Since $A(t) \leq \tilde A(t)$ and conversely the estimate works
for $|x| > R_0/2$ (adjusting $R_0$), roughly $A \approx \tilde A$.

This gives a **self-referential Volterra inequality**:

$$\tilde A(t) \leq L_0 + L_1 \tilde A(t)^2,$$

with $L_0 = O(1)$ from linear + near and $L_1 = O(\sqrt{T^*/(\nu R_0^2)} + T^*)$.

**This does NOT close a Gronwall.**  Solutions of $\tilde A \leq L_0
+ L_1 \tilde A^2$ have a threshold: $\tilde A$ is bounded by
$\frac{1 - \sqrt{1 - 4 L_0 L_1}}{2 L_1}$ **only if** $4 L_0 L_1 < 1$.
Otherwise no fixed point.

Concretely: on the time interval $[0, T]$ with $T < \min(1/(\|u_0\|_{L^2}^2),
R_0^2/\nu)$ or so — a short time depending on initial data — the
bootstrap closes.  For longer times, need to reuse.

**Reusing at $t = T$**: new initial data $u(\cdot, T)$ has
$\|(1+|y|) u(\cdot, T)\|_{L^\infty(\{|y| > R_0/2\})} \leq \tilde A(T)$,
which is bounded.  The new time $[T, T + T']$ interval has $T'$
depending on $\tilde A(T)^{-2}$.  As long as $\tilde A$ stays
**bounded** across iterations, $T'$ stays bounded-below, and we
can cover $[0, T^*)$ in finitely many steps.

**But** — this is exactly circular.  We need $\tilde A$ bounded
throughout to iterate; the iteration shows $\tilde A$ bounded IF
it's bounded at each restart.

## §7 Where this gets honest

**The argument closes IF $\tilde A$ stays bounded up to $T^*$.**

**It doesn't prove $\tilde A$ stays bounded.**

The step I skipped — **CKN ε-regularity on the exterior** — is
supposed to give the bound directly, independent of Gronwall:
CKN says $u$ is smooth on any parabolic cylinder $Q(z, r)$
where the smallness condition holds.  On $\{|x| > R_0\} \times
[0, T^*)$, smallness holds because $u$ is smooth there and
integrating $|u|^3$ on fixed-$r$ cylinders is bounded by the
exterior $L^\infty$ bound, which in turn is bounded by...

And this loops.  CKN regularity gives pointwise bounds, but those
pointwise bounds can grow polynomially in some ways that don't
obviously close a $1/(1+|x|)$-type decay.

The clean way would be:

**Claim (would-be key)**: On $\{|x| > R_0\} \times [0, T^*)$ the
solution $u$ is uniformly smooth with
$$|\nabla^k u(x, t)| \leq C_k(u_0, \nu, R_0, T^*) \cdot (1+|x|)^{-1-k}.$$

This is a **uniform decay** statement up to $T^*$ on the
exterior.  If I could prove this, the $L^{3,\infty}$ inheritance
would follow.

But proving it is exactly the question.  The Duhamel/Oseen
bootstrap above gives it on short intervals; extending to $T^*$
requires controlling the interior-to-exterior information
transfer.  And the interior is blowing up, which is the problem.

## §8 What I actually showed

(a) **Linear contribution is fine** — uniform weighted bound on
the exterior, any finite $T$.

(b) **Near-singularity bilinear contribution is fine** — uniform
weighted bound on the exterior, using only the $L^2$ energy of
$u$ (Leray-Hopf).

(c) **Far-field bilinear contribution closes by bootstrap on
short time**, but the bootstrap does not obviously extend to all
of $[0, T^*)$ — the Volterra inequality is quadratic and has a
blow-up threshold.

**The weighted-moment rescue reduces to: does the far-field
bootstrap close up to $T^*$?**

This is a well-defined technical question, but it's not obviously
affirmative.  It's a Schauder-type continuity argument that has
to be run carefully, using either (i) CKN smoothness uniformly
on the exterior to bound $\tilde A$ directly, or (ii) a local
maximum principle on the weighted quantity $w = (1+|x|) u$.

## §9 What I did not show — honest list

1. The CKN ε-regularity bound on the exterior gives smoothness,
   but I did not establish that the **derivatives** decay like
   $(1+|x|)^{-1-k}$ as $|x| \to \infty$.  Without that, the
   bootstrap can pick up interior contributions that degrade.

2. The near-singularity contribution (Lemma 2) used $\|u\|_{L^2}$.
   But that's the bound for all of $\mathbb{R}^3$, not $B_{R_0/2}$.
   On the full ball $B_{R_0/2}$, $\|u\|_{L^2(B_{R_0/2})}^2 \leq
   \|u_0\|_{L^2}^2$ (energy is monotone non-increasing for smooth
   solutions of viscous NS — this is rigorous).  So the bound
   IS right.  OK good.

3. The Volterra inequality threshold $4 L_0 L_1 < 1$ was stated
   but not carefully computed.  This determines the short-time
   bootstrap radius.

4. **The crucial step — continuing the bootstrap up to $T^*$ —
   requires an independent bound on $\tilde A(T)$ as $T \to T^*$.**
   Without CKN-type exterior smoothness uniform up to $T^*$, this
   is open.

## §10 Honest verdict

The weighted-moment rescue **has a concrete argument structure**
(Duhamel + bilinear estimate + exterior bootstrap), but it
**does not close trivially**.  The crux is whether CKN-type
exterior smoothness propagates weighted-$L^\infty$ decay up to
$T^*$.

My best guess: it does, because the singular set $\Sigma$ is
bounded and exterior smoothness is well-understood (CKN +
standard parabolic regularity).  But making it rigorous requires
either:

- A **uniform-in-$t$ exterior decay lemma** — prove
  $|\nabla^k u(x, t)| \leq C_k/(1+|x|)^{1+k}$ uniform on
  $\{|x| > R_0\} \times [0, T^*)$.  This is a regularity
  statement, not a bootstrap.  It probably follows from CKN +
  Oseen + careful Duhamel, but needs work.

- A **weighted energy estimate** — prove
  $\|(1+|x|)^2 u(\cdot, t)\|_{L^2} \leq C$ uniform on $[0, T^*)$.
  This should follow from a Gronwall on the weighted $L^2$
  quantity + Leray-Hopf energy.  Weighted $L^2$ bounds under NS
  are classical (Brandolese, Miyakawa, etc.) — typically they
  propagate on bounded time with a constant depending on $T$.

I believe **the weighted $L^2$ estimate approach is more
tractable than the weighted $L^\infty$ approach** — $L^2$ is
Hilbert, Gronwall works cleanly, and the Leray energy structure
cooperates.  Pointwise decay then follows from weighted Sobolev
embedding.

## §11 Next moves

Two concrete items:

1. **Try the weighted $L^2$ estimate.**  Compute
   $d/dt\, \|(1+|x|)^2 u\|_{L^2}^2$ and check whether the NS
   nonlinearity produces a manageable RHS.  This is a standard
   calculation; either it works or it reveals a specific obstruction.

2. **Check whether parabolic interior regularity (Serrin-type) on
   $\{|x| > R_0\}$ gives $(1+|x|)$-decay uniform in $t$ up to
   $T^*$.**  Standard NS regularity theory for bounded-energy
   solutions on smooth-domain exteriors — this is likely in the
   literature under "interior regularity away from singular set."

Either of these, if it works, closes the gap the weighted-moment
rescue aims at.  Both require **actual mathematical work** beyond
what's in the literature summaries.

**Attempt status**: the argument has structure but is not yet a
proof.  Honest assessment: **this is where a month of focused
research begins**, not ends.

---

_End of attempt.  No more organization.  The estimate either
closes or it doesn't; answering requires doing the two concrete
items in §11.  I'll try one of them next if asked._
