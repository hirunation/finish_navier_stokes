---
id: AK-28
title: Young-absorption Case A/B (Draft 7–8 approach — THE CENTRAL DRAFT-9-ERA AK)
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cc52d85c-7323-4878-b7a4-1a03d6567b1a
author: Airo Nahiru
date: 2026-03-29
dependencies: []
supports: [INS-02, LEM-01]
supersedes: [cc52d85c-era/AK-01]
cross_citations:
  - label: AK3 Item 28
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 28)
  - label: cc52d85c session
    ref: "session cc52d85c-7323-4878-b7a4-1a03d6567b1a, Mar 29 2026"
    note: Three independent council agents diagnosed this gap in parallel.
verification:
  method: growth-analysis refutation + 3-agent convergence
  rounds: 3
  adversarial_vectors: n/a
  independent_rederivation: three independent council agents (cc52d85c) reached the same diagnosis and fix
  machine_verification: n/a
tags: [anti-knowledge, Young-absorption, Case-A-B, Draft-9-fix, AK3-Item-28, CENTRAL-AK, cc52d85c-breakthrough]
---

# AK-28 · Young-absorption Case A/B (central Draft-9-era AK)

## Approach tried (Drafts 7–8)

Apply Young's inequality to viscous cross-terms, absorbing
$D^{1/2}$ into a linear $\varepsilon_0 D$ term with
$\varepsilon_0 = 3/16$.  Split analysis into Case A (linear
dominates; $E \sim \rho^{4/3}$) and Case B (sublinear $D^b$
dominates; $E \sim \rho^{3/4}$).  Claim Case B holds because
linear growth is slower.

## Obstruction

Young absorption upgrades $D^{1/2}$ (sublinear) to $D$ (linear).
For large $D$, linear **always** dominates sublinear $D^b$
($b < 1$).  Under Case A growth $E \sim \rho^{4/3}$: linear
term $\varepsilon_0 D \sim \varepsilon_0 C \rho E' \sim \rho^{4/3}$
saturates at $E/4$.  Case B term $\sim \rho^{3/4} = o(\rho^{4/3})$.
**Case A is self-consistent; Case B never establishes.**  Case
A/B dichotomy does not close the superlinear ODE — it kills it.

The linear term is self-reinforcing: $E \uparrow \Rightarrow E' \uparrow
\Rightarrow D \uparrow \Rightarrow $ more linear dominance.

## The fix (LEM-01 Draft-9 restructuring)

**Do NOT absorb via Young.**  Keep $D^{1/2}$ as a sublinear
product; bound by Cauchy-Schwarz + Lorentz (LEM-03).  Both
cross-term and convective remainder remain sublinear; superlinear
ODE closes directly.

Three independent council agents in cc52d85c session converged
on same diagnosis and same fix.  Draft 9 commits the
restructuring.

## Dependencies in context

Standalone.  Supports LEM-01 (the restructured Caccioppoli that
replaces this approach) and INS-02 (Part I Liouville — fix is
the load-bearing Caccioppoli step).

**Supersedes** cc52d85c-era/AK-01 (same content; re-authored in
live corpus with full cross-references to LEM-01 and the
multi-project context).

## History

**The central anti-knowledge entry of the cc52d85c session.**
Draft 7–8 contained this gap; Draft 9 fixed it via three-agent
convergence; Draft 10–12 stabilized.  Live corpus 2026-04-22
supersedes cc52d85c-era AK-01.
