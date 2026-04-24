---
id: LEM-10
title: Krylov-Bogolyubov — invariant measure on translation hull
category: LEM
status: speculative
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-17
dependencies: [DEF-02]
supports: [INS-03, INS-07, INS-10, LEM-11, THR-02]
cross_citations:
  - label: Krylov-Bogolyubov 1937
    ref: "Krylov, N. M.; Bogolyubov, N. N., La théorie générale de la mesure dans son application à l'étude des systèmes dynamiques de la mécanique non linéaire, Ann. Math. 38 (1937) 65–113"
    note: Classical existence of invariant probability measures for continuous maps on compact metric spaces.
  - label: BRAID §III
    ref: turbulent_waters/canon/BRAID_1.md Movement III
verification:
  method: classical (Krylov-Bogolyubov 1937)
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: standard
  machine_verification: pending (BRAID application; Mathlib has Krylov-Bogolyubov at various abstraction levels)
tags: [Krylov-Bogolyubov, invariant-measure, translation-hull, compactness, classical, Strand-B]
---

# LEM-10 · Krylov-Bogolyubov on translation hull

## Statement

Let $v$ be a bounded smooth divergence-free stationary NS
solution on $\mathbb{R}^3$, and let

$$\mathcal{O} := \overline{\{v(\cdot + x) : x \in \mathbb{R}^3\}}^{C^\infty_{\mathrm{loc}}}$$

be the translation hull.  The hull is:

- **Nonempty** (contains $v$ itself).
- **Compact** in the $C^\infty_{\mathrm{loc}}$ topology (by
  uniform boundedness $|v| \leq M$ + parabolic-interior regularity
  → uniform $C^m$ bounds on balls → Arzelà-Ascoli compactness).

Therefore by **Krylov-Bogolyubov**, there exists a translation-
invariant probability measure $\mu$ on $\mathcal{O}$.

## Usage

- **INS-07 (Translation Hull Theorem):** $\mu$-averaging + bounded
  harmonic Liouville ⟹ hull contains a constant field.
- **INS-03 (Grand Unification):** unique ergodicity (uniqueness
  of $\mu$) is FormC equivalent to bounded Liouville.
- **INS-10 (Space-time hull):** extension of the semigroup to
  $(x, \tau) \mapsto u(\cdot + x, \cdot + \tau)$ inherits
  compactness + Krylov-Bogolyubov.

## Status notes

**Speculative** in the live-corpus sense.  Classical
(Krylov-Bogolyubov 1937) + standard parabolic-interior
regularity.  Full Lean formalization may use Mathlib's
abstract-ergodic-theory machinery; not yet wired into GUNS.

## Dependencies in context

Depends on DEF-02 (`IsBoundedSmoothStationary`).

Supports INS-07, INS-10, and the whole hull-ergodic thread
THR-02.

## Citations

- **Krylov-Bogolyubov 1937**, *Ann. Math.* 38.
- **BRAID Movement III**, turbulent_waters canon.
- **Aronson** — semigroup compactness framework.

## History

Classical.  Applied in BRAID Movement III synthesis (2026-04-14..17)
as the foundational ergodic-theory input.  Live corpus 2026-04-22.
