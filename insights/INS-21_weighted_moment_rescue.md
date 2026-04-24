---
id: INS-21
title: Weighted-moment rescue — L^{3,∞} inheritance under (1+|x|)u_0 ∈ L^∞ hypothesis
category: INS
status: conjectured
confidence: 0.50
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: [AK-36, AX-04, LEM-06, LEM-13, LEM-14, LEM-16]
supports: [INS-05]
cross_citations:
  - label: Brandolese-Meyer 2002
    ref: ESAIM COCV 8, 273-285
    note: Provides the local-existence-interval weighted decay.
  - label: Kato 1984
    ref: "Kato, T., Math. Z. 187, 471-480"
    note: Mild-solution theory compatible with weighted initial data.
verification:
  method: proposed closure — informal strategy document (desk/03_lem_06_attack.md §6)
  rounds: 0
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [conjecture, weighted-moment, spatial-decay, KNSS-inheritance, rescue-path, Gronwall]
---

# INS-21 · Weighted-moment rescue

## Statement (proposed)

Let $u \in C^\infty(\mathbb{R}^3 \times [0, T^*))$ be the smooth
NS solution with Schwartz divergence-free $u_0 \in \mathcal{S}(\mathbb{R}^3)$
**plus the weighted hypothesis** $(1 + |x|) u_0 \in L^\infty(\mathbb{R}^3)$.

Define
$$\mathcal{M}(u_0) := \|u_0\|_{L^2} + \|(1+|x|) u_0\|_{L^\infty}.$$

**Proposed claim.**  The rescaled KNSS sequence
$v_n(y, s) = \lambda_n u(x_n + \lambda_n y, t_n + \lambda_n^2 s)$
(AX-04) satisfies

$$\|v_n(\cdot, s)\|_{L^{3,\infty}(\mathbb{R}^3)} \leq M(\mathcal{M}(u_0), \nu) \quad \forall s \in (-\infty, 0], \ \forall n,$$

so the KNSS-extracted ancient solution $v$ inherits a uniform
$L^{3,\infty}$ bound with $M$ depending on $\mathcal{M}(u_0)$
and $\nu$, **not** on $\|u_0\|_{L^2}$ alone.

## Strategy

Three-step proof attempt:

**Step 1 — Weighted $L^\infty$ propagation on local-existence
interval.**  Using mild-solution theory (Kato 1984) and the
Brandolese-Meyer 2002 framework (LEM-16), establish

$$\sup_{t \in [0, T_1]} \|(1+|x|) u(\cdot, t)\|_{L^\infty} \leq C(\mathcal{M}(u_0), \nu)$$

on the short-time interval $[0, T_1]$ where $T_1 = \varepsilon \cdot
\|(1+|x|)u_0\|_{L^\infty}^{-2}$.  Standard.

**Step 2 — Global propagation up to $T^*$.**  Show the weighted
$L^\infty$ bound extends to all of $[0, T^*)$ via a
**Gronwall-type argument**.  Specifically, on the weighted
quantity $w(x, t) := (1 + |x|) u(x, t)$, the NS equation gives

$$\partial_t w - \nu \Delta w = (1 + |x|) \mathbb{P}[(u \cdot \nabla) u] + \text{lower-order}$$

which can be bounded in $L^\infty$ by $\|u\|_{L^\infty} \|w\|_{L^\infty}$
plus terms controlled by the solution's $L^\infty$ on the
support of the weight.  Since smooth solutions on $[0, T^*)$ have
$u \in L^\infty_{\mathrm{loc}}$ (by hypothesis — the blow-up is
Type II, not Type I), the Gronwall argument gives

$$\|w(\cdot, t)\|_{L^\infty} \leq \|w(\cdot, 0)\|_{L^\infty} \exp\left(\int_0^t \|u(\cdot, s)\|_{L^\infty} ds\right).$$

**This is the crux**: is $\int_0^{T^*} \|u(\cdot, s)\|_{L^\infty} ds
< \infty$ for Type II blow-up?

Not obvious.  Type II blow-up means $\|u(\cdot, t)\|_{L^\infty}$
grows faster than $(T^* - t)^{-1/2}$, so $\int$ may diverge.  BUT
the integral can be controlled by the **local** $L^\infty$ near
$x_0$ only — far from the singularity location $x_0$, $\|u\|_{L^\infty}$
may stay bounded.  A more careful Gronwall on $\|w(\cdot, t)\|_{L^\infty(\{|x - x_0| \geq r\})}$
may suffice.

**Step 3 — Scale-invariance transfer.**  Once Step 2 is
established, weighted decay
$|u(x, t)| \leq C(\mathcal{M}(u_0), \nu)/(1 + |x - x_0|)$ is
uniform-in-$t$ in the exterior region.  Scale-invariance under
the KNSS rescaling gives

$$|v_n(y, s)| \leq \lambda_n \cdot \frac{C}{1 + \lambda_n |y|} \leq \frac{C}{|y|}$$

for $|y| \geq \lambda_n^{-1}$ (the exterior part).  Inside
$|y| \leq \lambda_n^{-1}$, the bound $|v_n| \leq \gamma_n \to 1$
from KNSS §6 applies (bounded ancient solution).  Combined,
$\|v_n(\cdot, s)\|_{L^{3,\infty}} \leq C$ uniformly, and Fatou
gives the conclusion.

## Status

**Conjectured.**  Step 1 is classical (Kato + Brandolese-Meyer).
Step 3 is elementary (scale-invariance + distribution function).
**Step 2 is the novel mathematical content.**  The crucial
question is whether the weighted $L^\infty$ norm propagates
globally.

If Step 2 holds, this closes Draft 12's Clay-target chain under
the weighted hypothesis $(1+|x|) u_0 \in L^\infty$ — a strictly
weaker restriction than Brandolese's symmetry / compact-support
hypothesis, and strictly stronger than Phuc's open $L^{3,\infty}$
endpoint.

## Why this might work where the original claim doesn't

The original Draft 12 claim needed constant depending only on
$\|u_0\|_{L^2}$ — provably impossible (AK-36).  The weighted
version depends on $\mathcal{M}(u_0) = \|u_0\|_{L^2} + \|(1+|x|)u_0\|_{L^\infty}$,
which is a **genuinely stronger** hypothesis that carries
spatial-decay information.

The rescue is **strictly within** the Schwartz class: if $u_0
\in \mathcal{S}$, then $(1+|x|) u_0 \in \mathcal{S} \subset L^\infty$,
so the weighted hypothesis is automatic for Schwartz data.
**But** the constant $M$ depends on $\|(1+|x|) u_0\|_{L^\infty}$,
which varies within $\mathcal{S}$ (not uniformly bounded).

So the Clay target's conclusion still holds for all Schwartz
data — but the constants in the proof depend on the weighted
norm, not on $L^2$ alone.

## Publication prospects

If Step 2 can be rigorously established, this is a **novel
result** closing the $L^{3,\infty}$ inheritance for
weight-Schwartz data (not for the full Phuc open problem, which
would require dropping the weighted hypothesis).

Target journals: JMFM, ARMA, CPAM.  Estimated difficulty:
medium-hard (3-9 months of focused work).

## Dependencies in context

Depends on AX-04 (KNSS extraction), LEM-06 (the gap being
closed), LEM-16 (Brandolese-Meyer machinery), AK-36 (the
$L^2$-only impossibility).

Supports INS-05 (Part II composition — if INS-21 holds, the
full chain closes under weighted hypothesis).

## Citations

- **Brandolese-Meyer 2002**, *ESAIM COCV* 8, 273-285.
- **Kato 1984**, *Math. Z.* 187, 471-480.
- **Amann** (weighted Sobolev frameworks for NS).

## History

Proposed 2026-04-22 during session-1 focused attack on LEM-06.
Novel to this session; not in the upstream literature.
