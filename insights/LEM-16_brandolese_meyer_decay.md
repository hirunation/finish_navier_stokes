---
id: LEM-16
title: Brandolese-Meyer 2002 — generic spatial decay rate |u| ≤ C(1+|x|)^{-(n+1)}
category: LEM
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: []
supports: [LEM-06, AK-36, CORR-09, INS-21]
cross_citations:
  - label: Brandolese-Meyer 2002
    ref: "Brandolese, L.; Meyer, Y., On the instantaneous spreading for the Navier-Stokes system in the whole space, ESAIM: COCV 8 (2002) 273-285. DOI:10.1051/cocv:2002021."
  - label: Dobrokhotov-Shafarevich 1994
    ref: "Dobrokhotov, S. Yu.; Shafarevich, A. I., Some integral identities and remarks on the decay at infinity of the solutions of the Navier–Stokes Equations in the entire space, Russ. J. Math. Phys. 2 (1994) 133-135"
    note: Original integral identity driving the B-M theorem.
  - label: Brandolese 2004
    ref: "Brandolese, L., Space-time decay of Navier-Stokes flows invariant under rotations, Math. Ann. 329 (2004) 685-706"
    note: Enhanced decay for symmetric data.
verification:
  method: literature fact
  rounds: 1
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [Brandolese, Meyer, spatial-decay, moment-conditions, Schwartz, generic-counterexample, Dobrokhotov-Shafarevich]
---

# LEM-16 · Brandolese-Meyer 2002 — generic spatial decay

## Statement (Brandolese-Meyer 2002 Theorem 0.1 + §3)

Let $u_0 \in L^2(\mathbb{R}^n) \cap E$ where $E$ is a Banach
space of $L^1$-functions that are $o(|x|^{-(n+1)})$ at infinity
in an averaged sense.  Assume $u \in C([0, T], L^2)$ with
$u(\cdot, t) \in L^\infty([0, T], E)$ and $|u(\cdot, t)|^2 \in
L^\infty([0, T], E)$ (uniform-in-$t$ on the local existence
interval).

Then

$$\int_{\mathbb{R}^n} u_h(x, t) u_k(x, t)\, dx = c(t)\, \delta_{hk} \quad \forall h, k, \ t \in [0, T].$$

**Critically:** generic Schwartz $u_0$ (even smooth compactly-
supported) do **not** satisfy the orthogonality on the right-
hand side.  Under such data, the $o(|x|^{-(n+1)})$ decay is
**instantly lost**.

**Sharp rate.**  Generic pointwise decay rate for the bilinear
Duhamel term:

$$|B(u, u)(x, t)| \leq C(1 + |x|)^{-(n+1)}$$

uniform in $t \in [0, T]$, where $B(u, u)$ is the NS bilinear
term after heat-kernel projection.  In 3D: $|x|^{-4}$.  **This is
optimal**; $|x|^{-(n+2)}$ is forbidden for generic $u_0$.

## Symmetric / fast-decaying enhancement (Brandolese 2004)

For $u_0$ invariant under a discrete subgroup of rotations +
reflections ($O(d)$-subgroup symmetry), Brandolese 2004
establishes

$$|u(x, t)| \leq C(1 + |x|)^{-(n+3)},$$

in 3D: $|x|^{-6}$.  Requires symmetric initial data; does NOT
generalize to asymmetric Schwartz data.

## Consequences for Nahiru's Draft 12 Step 2

The Draft 12 claim $|u(x, t)| \leq C_1/(1 + |x - x_0|)$ (with
$C_1$ depending only on $\|u_0\|_{L^2}$ and $\nu$) is
**strictly weaker** than Brandolese-Meyer's $|x|^{-4}$ generic
rate.  Two distinct issues:

1. **Strength**: Nahiru wants $|x|^{-1}$; Brandolese gives
   $|x|^{-4}$ generically.  Brandolese is stronger.  But
   Brandolese requires $u_0 \in E$ (weighted), not merely $L^2$.
2. **Constant dependence**: Nahiru's $C_1 = C_1(\|u_0\|_{L^2})$;
   Brandolese's constant depends on the weighted norm
   $\|(1+|x|)^{n+1} u_0\|$.  Brandolese confirms **no
   $L^2$-only constant can work** (AK-36).

**Time range**: Brandolese-Meyer uniform in $t$ on the
**local-existence interval**.  As $t \to T^*$, the weighted
norm may blow up — Brandolese does not guarantee uniform-in-$t$
decay up to the singularity.  This is what Nahiru's INS-21
(weighted-moment rescue) would need to establish.

## Why the B-M orthogonality fails generically

Dobrokhotov-Shafarevich 1994 integral identity: if $u(x, t) =
o(|x|^{-2})$ + some auxiliary conditions, then moment
orthogonality $\int u_h u_k\, dx \propto \delta_{hk}$ follows.
Under generic initial data, this orthogonality is not preserved
at $t > 0$ (B-M Prop. 2.4).  The violation is **instantaneous**.

Intuition: NS evolution mixes moments.  Only symmetric classes
(B-2004) or arbitrarily-fast-decaying classes preserve the
orthogonality.

## Relevance to LEM-06 / Route E

If Route A (weighted hypothesis) is taken: assume $u_0 \in
L^2 \cap E$ with symmetric conditions.  Brandolese-Meyer gives
$|u(x, t)| \leq C/(1 + |x|)^4$ uniform-in-$t$; KNSS §6
inheritance then closes.

If Route E (submit Part I standalone) is taken: LEM-16 explains
the Remark in the paper on why general-3D + Schwartz is not
enough for the Clay target.

## Dependencies in context

Standalone (literature).  Supports LEM-06 (documents what IS
available), AK-36 ($L^2$-only constant impossible), CORR-09
(Brandolese citation scope in KNSS §6 / Draft 12), INS-21
(weighted-moment conjecture — the specific rescue path).

## Citations

- **Brandolese-Meyer 2002**, *ESAIM COCV* 8, 273-285.
- **Dobrokhotov-Shafarevich 1994**, *Russ. J. Math. Phys.* 2.
- **Brandolese 2004**, *Math. Ann.* 329 (symmetric enhancement).
- **Brandolese thesis 2001** (ENS Cachan — the thesis cited by
  KNSS §6 as [1]).
- **Brandolese 2009** (*ARMA* 192 and *Indiana* 58 — self-similar
  solutions + concentration-diffusion).

## History

Catalogued 2026-04-22 during session-1 attack on LEM-06.
