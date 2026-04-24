---
id: LEM-01
title: Caccioppoli inequality on annuli (Draft-9 sublinear restructuring)
category: LEM
status: speculative
confidence: 0.95
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-28
dependencies: [AK-04, AK-28, AX-01, LEM-02, LEM-03, LEM-04, LEM-05]
supports: [INS-02]
supersedes: [cc52d85c-era/INS-02]
cross_citations:
  - label: Draft 12 §2 Step 3
    ref: official/PROOF_FINAL_DRAFT12.tex lines 376–473
  - label: CNY 2024
    ref: "DOI 10.1088/1361-6544/ad1efc"
    note: Independent Caccioppoli-on-annuli framework; L^{3,∞} embeds into their annular growth condition.
verification:
  method: constructive proof repair + 3-agent council convergence
  rounds: 3
  adversarial_vectors: n/a
  independent_rederivation: three independent council agents converged on the same fix (cc52d85c session)
  machine_verification: pending (Tree A: NSProof.PartI.caccioppoli, open sorry at line 807)
lean_ref: GUNS.ClassicalPath.OpenObligations.caccioppoli_obligation
tags: [Caccioppoli, annulus, sublinear, Draft-9-fix, Cauchy-Schwarz, Lorentz, pressure-elimination-composition]
---

# LEM-01 · Caccioppoli inequality on annuli

## Statement

For a smooth stationary divergence-free NS solution $v \in
L^{3,\infty}(\mathbb{R}^3)$ with $\|v\|_{L^{3,\infty}} \leq M$, the
hat-function weighted energy $\mathcal{E}(\rho) = \int |\nabla v|^2
\varphi(|x|/\rho)\, dx$ on fixed-ratio annulus $A = A(\theta\rho,
\rho)$ satisfies

$$\mathcal{E}(\rho) \leq C_0 M \rho^{-1/2} D(\rho)^{1/2} + C_1 M^3 \rho^{-1} + C_2 M^a \rho^\gamma D(\rho)^b$$

where $D(\rho) := \|\nabla v\|_{L^2(A)}^2$, and the exponents
$a = 3p/(6 - p)$, $b = 3(6 - 2p)/(2(6 - p))$,
$\gamma = (3 - 2p)/(6 - p) < 0$ for $p \in (3/2, 3)$.

**Key feature:** both the cross-term ($D^{1/2}$) and the
convective remainder ($D^b$ with $b < 1$) are **sublinear** in
$D$.  No Young-absorption of either into a linear $\varepsilon D$
term (which would break the superlinear ODE; see AK-28).

## Method — the Draft-9 restructuring

1. Test the stationary NS equation against $w = v\psi -
   \mathcal{B}[v \cdot \nabla\psi]$ (Bogovskii pressure-
   elimination test function; LEM-02), with $\psi$ a smooth
   radial cutoff matching the hat function.
2. Pressure term vanishes identically ($\int \nabla p \cdot w = 0$
   by Leray-Helmholtz orthogonality).
3. Viscous cross-term $\int \nabla v : \nabla w$ decomposes into
   principal $\nabla v : \nabla(v\psi)$ and remainder
   $\|\nabla v\|\|v\|/\rho$.  **Do NOT absorb via Young**.
   Keep as product, bound by Cauchy-Schwarz + Lorentz
   (LEM-03):
   $$\|\nabla v\|_{L^2(A)} \|v\|_{L^2(A)}/\rho \leq C M \rho^{-1/2} D^{1/2}.$$
4. Convective term handled by Gagliardo-Nirenberg
   interpolation (LEM-05) on the reference annulus $A(\theta, 1)$
   + rescaling, giving
   $\|v\|_{L^3(A)}^3 \leq C(M^a \rho^\gamma D^b + M^3)$.
5. Combine.  Both terms sublinear in $D$ for $p \leq 12/5$.

## Why the "don't absorb via Young" fix matters

The Draft 7–8 version absorbed cross-terms via Young's inequality
into $\varepsilon_0 D$ (with $\varepsilon_0 = 3/16$), producing
a **linear** $D$ term that saturates the ODE in the Case A
regime $E \sim \rho^{4/3}$.  Case B ($E \sim \rho^{3/4}$) never
establishes on a half-line, so the superlinear ODE doesn't
engage.  This is AK-28 (retired Draft 7–8 approach).

Three independent council agents in the cc52d85c session
(Mar 29–30) converged on the same diagnosis and the same fix:
**keep the cross-term as a product, not a Young absorption**.

## Status notes

**Speculative.**  Tree A has `NSProof.PartI.caccioppoli` as an
open sorry at `Liouville.lean:807`; six prerequisite sub-lemmas
are proved (hat-function smoothness + gradient bound, convective
bound, pressure bound, testing equation, Green's identity);
~100-line final algebraic assembly remains.  GUNS catalogues
in `OpenObligations.lean`.

## Dependencies in context

Depends on LEM-02 (Bogovskii pressure elimination), LEM-03
(Lorentz embedding on annuli), LEM-04 (hat function
properties), LEM-05 (Gagliardo-Nirenberg interpolation), AX-01
(layer-cake underlying LEM-03).

Supports INS-02 (Part I Liouville — this lemma is the
combined-estimate Step 3 of the 8-step chain).

**Supersedes** cc52d85c-era/INS-02 (which captured the same
mathematical content but was titled as a separate "insight"
rather than a supporting lemma).

## Citations

- **Draft 12 §2 Step 3**, lines 376–473.
- **CNY 2024** — independent hat-weight + Caccioppoli framework.
- **Caccioppoli 1950** (classical annulus energy estimate).

## History

Draft-9 restructuring 2026-03-29 in cc52d85c session.  Three-
agent council converged; fix merged into Drafts 10–12.  Lean
open sorry from Tree A `Liouville.lean:807`.  Live corpus
2026-04-22 supersedes cc52d85c-era/INS-02.
