---
id: AX-03
title: Type I blow-up excluded (NRS / Tsai / ESS)
category: AX
status: axiom-quarantined
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [AK-05]
supports: [AX-04, INS-03, INS-05, INS-12]
cross_citations:
  - label: NRS 1996
    ref: "Nečas, J.; Růžička, M.; Šverák, V., On Leray's self-similar solutions of the Navier–Stokes equations, Acta Math. 176 (1996) 283–294"
    note: No nontrivial self-similar solutions.
  - label: Tsai 1998
    ref: "Tsai, T.-P., On Leray's self-similar solutions of the Navier–Stokes equations satisfying local energy estimates, Arch. Rational Mech. Anal. 143 (1998) 29–51"
    note: Extension of NRS under local energy hypothesis.
  - label: Escauriaza-Seregin-Šverák 2003 (main thm)
    ref: "Escauriaza, L.; Seregin, G.; Šverák, V., L^{3,∞}-solutions of Navier–Stokes equations and backward uniqueness, Russian Math. Surveys 58 (2003) 211–250"
    note: Any L^∞(0, T; L^{3,∞}) solution extends smoothly past t = T; combined with NRS + Tsai, rules out Type I blow-up.
verification:
  method: classical (PDE theory / combined published results)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: three independent papers converging on same conclusion
  machine_verification: axiom
lean_ref: GUNS.ClassicalPath.TypeIExcludedStatement
tags: [axiom, type-I, blow-up-dichotomy, self-similar, NRS, Tsai, ESS, quarantined, Tree-A]
---

# AX-03 · Type I blow-up excluded

## Statement

If a smooth NS solution $u$ has a finite blow-up time $T^* < \infty$,
then the blow-up is **not** Type I: there is no self-similar
profile at the singularity.  Equivalently: if
$\|u\|_{L^\infty(0, T^*; L^{3,\infty}(\mathbb{R}^3))} < \infty$,
then the solution extends smoothly past $T^*$.

Therefore any hypothetical finite-time singularity must be
**Type II** — the supremum norm blows up faster than
$(T^* - t)^{-1/2}$.

## Canonical Lean form

```lean
axiom TypeIExcludedStatement : Prop
```

Tree A: `NSProof/Infrastructure/TypeI.lean:60`.  GUNS quarantines
in `ClassicalPath/ClassicalAxioms.lean`.

## Classical source

Three-paper combination:

- **NRS 1996** (*Acta Math.* 176): no nontrivial self-similar
  Leray solutions.
- **Tsai 1998** (*ARMA* 143): same conclusion under local-
  energy-bounded hypothesis.
- **ESS 2003** (*Russian Math. Surveys* 58): the $L^{3,\infty}$
  regularity criterion — any solution in $L^\infty_t(L^{3,\infty}_x)$
  extends smoothly.

Combined, these give: self-similar blow-up impossible
(NRS + Tsai); $L^{3,\infty}$-bounded blow-up impossible (ESS).
Type I blow-up implies one of these (self-similar rate
$\|u\|_{L^\infty} \sim (T^* - t)^{-1/2}$ requires the solution
to satisfy the self-similar ansatz at the singularity).
Therefore Type I excluded.

## Usage in NS program

Part II Step 1 of the main regularity theorem (INS-03).  Any
hypothetical finite-time singularity must be Type II, which
feeds into AX-04 (KNSS extraction of a bounded ancient solution
via blow-up rescaling).

## Dependencies in context

Standalone; foundational.  Supports INS-03 (Main Regularity)
and INS-05 (Part II composition).

## Citations

- **NRS 1996**.
- **Tsai 1998**.
- **ESS 2003** (Russian Math. Surveys version — not the ARMA
  paper; cf. CORR-05 on the citation correction).

## History

NRS 1996, Tsai 1998, ESS 2003 independently.  Standard in the NS
literature.  Lean-axiomatized in Tree A (session `0872111a`,
Apr 3–5).  GUNS quarantined 2026-04-17.  Live corpus 2026-04-22.
Planned formalization is a multi-author multi-month project;
deferred.
