---
id: AX-01
title: Layer-cake Lorentz embedding (Marcinkiewicz / weak-L^q interpolation)
category: AX
status: axiom-quarantined
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: []
supports: [INS-02, LEM-01, LEM-03]
cross_citations:
  - label: Stein V.3.2
    ref: "Stein, E. M., Singular Integrals and Differentiability Properties of Functions (Princeton, 1970), §V.3.2"
    note: Classical weak-type interpolation / layer-cake formula.
  - label: Grafakos
    ref: "Grafakos, L., Classical Fourier Analysis, 3rd ed. (Springer GTM 249, 2014), §1.4.6"
    note: Standard modern reference.
verification:
  method: classical (Marcinkiewicz 1939 / Hardy-Littlewood)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard textbook proof
  machine_verification: axiom
lean_ref: GUNS.ClassicalPath.LayerCakeEmbeddingStatement
tags: [axiom, Lorentz, weak-Lp, layer-cake, Marcinkiewicz, quarantined, Tree-A]
---

# AX-01 · Layer-cake Lorentz embedding

## Statement

For $f \in L^{q,\infty}(\mathbb{R}^n)$ (weak $L^q$) and a
measurable set $E \subseteq \mathbb{R}^n$ with $|E| < \infty$,
for every $0 < r < q$:

$$\|f\|_{L^r(E)} \leq \left(\frac{q}{q-r}\right)^{1/r} \|f\|_{L^{q,\infty}} |E|^{1/r - 1/q}.$$

## Canonical Lean form

```lean
axiom LayerCakeEmbeddingStatement : Prop
```

Stated as an opaque `Prop` axiom in `GUNS/ClassicalPath/ClassicalAxioms.lean`;
Tree A has the full statement as a classical lemma at
`NSProof/Infrastructure/Lorentz.lean:83`.

## Classical source

**Stein, Singular Integrals** §V.3.2.  Derivation:

1. Layer-cake formula: $\|f\|_{L^r(E)}^r = r \int_0^\infty
   \lambda^{r-1} |\{x \in E : |f(x)| > \lambda\}|\, d\lambda.$
2. For $\lambda < \lambda_0$: use $|\{|f|>\lambda\} \cap E| \leq |E|$.
3. For $\lambda > \lambda_0$: use $|\{|f|>\lambda\}| \leq
   (\|f\|_{L^{q,\infty}}/\lambda)^q$.
4. Optimize $\lambda_0$ to get $\|f\|_{L^{q,\infty}} |E|^{1/q - 1/r}$
   up to the constant $(q/(q-r))^{1/r}$.

Zero NS-specific content.  Standard measure theory.

## Usage in NS program

Applied to $v \in L^{3,∞}(\mathbb{R}^3)$ on annuli
$A(\theta\rho, \rho)$ with $|A| \sim \rho^3$:

$$\|v\|_{L^r(A)} \leq C\, M\, \rho^{3/r - 1} \quad \text{for } r \in (0, 3),$$

which powers the Caccioppoli-Lorentz chain in INS-02
(Part I Liouville theorem) Steps 3–5.

## Why axiomatized

Tree A and GUNS both axiomatize this to avoid reproducing
~80 lines of measure-theoretic scaffolding.  Full Lean
formalization is tractable (Mathlib has strong-type Lp and
weak-type machinery); scheduled for later reduction pass.

## Dependencies in context

Standalone; foundational.  Supports INS-02 (Liouville / Step 4
layer-cake embedding on annuli) and LEM-03 (Lorentz-norm scaling
on fixed-ratio annuli).

## Citations

- **Stein** *Singular Integrals* (1970), §V.3.2.
- **Grafakos** *Classical Fourier Analysis* 3rd ed., §1.4.6.
- **Marcinkiewicz 1939**, *Studia Math.* (weak-type interpolation).
- **Tao 2011 blog** — `Navier-Stokes instantly destroys Schwartz`
  observation, relevant for the companion CORR-06.

## History

Axiomatized in Tree A `Infrastructure/Lorentz.lean` during the
April 3–9 Lean formalization sessions (0872111a, 4afbf6c4).
Re-axiomatized in GUNS `ClassicalAxioms.lean` on 2026-04-17 in
the Step-4 unification.  Live corpus 2026-04-22.
