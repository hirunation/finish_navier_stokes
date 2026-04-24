---
id: INS-14
title: W^{1,2}_loc extension — sharp function-space threshold
category: INS
status: speculative
confidence: 0.90
session_uuid: cross-session
author: Airo Nahiru
date: 2026-03-30
dependencies: [INS-02, LEM-03]
supports: [AK-08]
supersedes: [cc52d85c-era/INS-04]
cross_citations:
  - label: Draft 12 Remark 4.5(v)
    ref: official/PROOF_FINAL_DRAFT12.tex
    note: W^{1,2}_loc extension of the Liouville theorem from smooth v to weak solutions.
  - label: Heywood 1976
    ref: "Heywood, J. G., The Navier–Stokes equations: on the existence, regularity, and decay of solutions, Acta Math. 136 (1976) 61–102"
    note: Test-function admissibility density for weak solutions.
  - label: Landau 1944
    ref: "Landau, L. D., Dokl. Akad. Nauk SSSR 43 (1944) 299–301"
    note: Landau solutions v ~ c/|x| confirm sharpness of the W^{1,2}_loc threshold at the singularity.
verification:
  method: constructive proof + real-interpolation + adversarial review (R2c, 4/4 items)
  rounds: 1
  adversarial_vectors: 4
  independent_rederivation: n/a
  machine_verification: pending
tags: [W12-loc, weak-solutions, Lorentz-Sobolev, sharp-threshold, Landau, interpolation]
---

# INS-14 · W^{1,2}_loc extension

## Statement

The L^{3,∞} stationary Liouville theorem (INS-02) extends from
smooth $v$ to weak solutions $v \in L^{3,\infty}(\mathbb{R}^3)
\cap W^{1,2}_{\mathrm{loc}}(\mathbb{R}^3)$.  The
$W^{1,2}_{\mathrm{loc}}$ hypothesis is **sharp**: weaker local
regularity breaks the convective pairing.

## Method — interpolation fix

Convective pairing $(u \cdot \nabla) u : v$ integrates
test-function-wise as

$$\int (v \otimes v) : \nabla\phi\, dx,$$

which requires $v \otimes v \in L^1_{\mathrm{loc}}$, i.e. each
component $v_i \in L^2_{\mathrm{loc}}$.  $L^{3,\infty}$ alone
is insufficient.  Real-interpolation fix:

$$v \in L^{3,\infty} \cap L^6_{\mathrm{loc}} \implies v \in L^4_{\mathrm{loc}},$$

where $L^6_{\mathrm{loc}}$ comes from Sobolev embedding of
$W^{1,2}_{\mathrm{loc}}$ in 3D.  Then $L^4_{\mathrm{loc}} \cdot
L^4_{\mathrm{loc}} \subset L^2_{\mathrm{loc}}$ and the $1/2 + 1/2 =
1$ Hölder pairing closes.

## Sharpness witness — Landau solutions

Landau solutions $v(x) = c/|x|$ are smooth outside the origin,
lie **exactly** in $L^{3,\infty}(\mathbb{R}^3)$, and are in
$W^{1,2}_{\mathrm{loc}}$ away from the origin but **not** at the
origin.  They are excluded from Part I only by the global
smoothness hypothesis.  This confirms the $W^{1,2}_{\mathrm{loc}}$
threshold is sharp: the Liouville theorem cannot be extended to
weaker local regularity without admitting Landau-singularity
solutions.

Test-function admissibility for weak solutions uses Heywood 1976
density of divergence-free smooth compactly-supported test
functions.

## Status notes

**Speculative** at the formal level (not yet Lean-formalized),
but informally verified through a full R2c round (4 adversarial
items, 4/4 addressed in Draft 12).

Presented as Remark 4.5(v) in Draft 12 rather than a standalone
theorem; full promotion to theorem status is a reasonable next
step for a subsequent paper.

## Dependencies in context

Depends on INS-02 (the smooth-v theorem being extended) and
LEM-03 (Lorentz layer-cake on annuli).

Supports AK-08 (the $L^{3,\infty}$-only-bootstrap-insufficient
entry, which INS-14 resolves by adding the
$W^{1,2}_{\mathrm{loc}}$ hypothesis).

**Supersedes** cc52d85c-era/INS-04; same mathematical content,
updated with sharper framing and audit status.

## Citations

- **Nahiru 2026**, Draft 12 Remark 4.5(v).
- **Heywood 1976**, *Acta Math.* 136, 61–102.
- **Landau 1944**, Dokl. Akad. Nauk SSSR 43.
- **cc52d85c session R2c round** — adversarial verification.

## History

Derived in cc52d85c session Mar 29–30 (R2c round).  Integration
in Draft 10–12.  Live corpus 2026-04-22 supersedes cc52d85c-era
version.
