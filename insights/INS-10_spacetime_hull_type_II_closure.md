---
id: INS-10
title: Space-time hull / Type II closure (Ancient Extension)
category: INS
status: conjectured
confidence: 0.30
confidence_history:
  - { date: "2026-04-17", value: 0.70, rationale: "initial estimate as parabolic extension of INS-07 Translation Hull Theorem" }
  - { date: "2026-04-24", value: 0.30, rationale: "recalibrated per desk/09_ins10_ancient_extension.md. INS-10 is corpus-only (not in Turbulent Waters canon), structurally weaker than INS-03 (Step 4 of its proof literally cites LEM-06 as a hypothesis), and inherits OBS-02 (exchange-of-limits) from the parabolic analogue of the stationary case." }
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [AX-04, DEF-02, INS-03, LEM-10, OBS-09]
supports: [INS-01, THR-04]
cross_citations:
  - label: GUNS AncientExtension
    ref: grand_unified_ns_proof/GUNS/AncientExtension/SpacetimeHull.lean
  - label: KNSS §6
    ref: arXiv:0709.3599
    note: Space-time analogue of the bounded-solution hull extraction.  GUNS extends BRAID Movement III to ancient bounded NS solutions.
verification:
  method: extension of Translation Hull Theorem (INS-07) to space-time translations
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: pending
lean_ref: GUNS.AncientExtension.{spacetime_hull_uniquely_ergodic, type_two_closure}
tags: [ancient-solution, space-time-hull, unique-ergodicity, Type-II, KNSS, Ancient-Extension, GUNS]
---

# INS-10 · Space-time hull / Type II closure

## Statement

**Space-time Hull Unique Ergodicity.**  For every ancient
bounded smooth NS solution $u : \mathbb{R}^3 \times (-\infty, 0]
\to \mathbb{R}^3$, the space-time translation hull

$$\mathcal{O}_{\mathrm{st}} := \overline{\{u(\cdot + x, \cdot + \tau) : x \in \mathbb{R}^3, \tau \leq 0\}}^{C^\infty_{\mathrm{loc}}}$$

is uniquely ergodic under the space-time translation semigroup
$(x, \tau) \mapsto u(\cdot + x, \cdot + \tau)$.

**Type II Closure (corollary).**  Every ancient bounded smooth
NS solution satisfies $u(0, 0) = 0$, contradicting the KNSS
normalization $\|u(0, 0)\| = 1$.  Therefore no Type II blow-up
exists; combined with AX-03 (Type I exclusion), no finite-time
singularity exists.

## Canonical Lean form

```lean
theorem spacetime_hull_uniquely_ergodic
    (ν : ℝ) (hν : 0 < ν) (u : R3 → ℝ → R3)
    (h : AncientBoundedNS ν u) :
    SpacetimeHullUniquelyErgodic ν u := by sorry

theorem type_two_closure
    (ν : ℝ) (hν : 0 < ν) (u : R3 → ℝ → R3)
    (h : AncientBoundedNS ν u) :
    u 0 0 = 0 := by sorry
```

## Method (proposed, canon-synthesis)

1. Extend INS-07 Translation Hull Theorem from stationary $v$ to
   ancient bounded $u(x, \tau)$ by treating the space-time
   semigroup $(x, \tau) \mapsto u(\cdot + x, \cdot + \tau)$.
2. Krylov-Bogolyubov ⟹ invariant $\mu_{\mathrm{st}}$ on
   $\mathcal{O}_{\mathrm{st}}$.
3. Space-time Wiener ergodic theorem ⟹ asymptotic averaging.
4. Grand Unification Conjecture (INS-03) applied to the
   $\tau \to -\infty$ spatial slice: stationary + $L^{3,\infty}$
   ⟹ constant ⟹ zero ⟹ full backward convergence.
5. Forward-in-time equicontinuity ⟹ $u(x, \tau) = 0$ for all
   $(x, \tau)$, including $(0, 0)$.

Type II closure is then the corollary that $\|u(0, 0)\| = 1$
contradicts $u(0, 0) = 0$.

## Status notes

**Conjectured.**  Depends on INS-03 (Grand Unification
Conjecture), whose closure currently flows via the Icosahedral
Hypothesis (INS-04).  Space-time extension is the GUNS
Ancient-Extension contribution (April 17 Step 4 ingest).

If INS-03 (or its icosahedral-route completion INS-04) holds,
INS-10 is an almost-immediate corollary.

## Dependencies in context

Depends on INS-03 (Grand Unification Conjecture), LEM-10
(Krylov-Bogolyubov generalized to space-time semigroup), AX-04
(KNSS extraction supplying the ancient solution).

Supports INS-01 (Clay target — provides an alternative closure
route alongside INS-05's Liouville+backward-uniqueness route)
and THR-04 (obstruction wall / closure-routes thread).

## Citations

- **KNSS 2009** §6.
- **GUNS AncientExtension/SpacetimeHull.lean** (the GUNS-native
  space-time extension).
- **BRAID Movement III** (stationary version).

## History

Space-time extension authored in GUNS Step 4 ingest (2026-04-17)
as the formal statement of KNSS-§6-style closure at the
ancient-solution level.  Live corpus 2026-04-22.
