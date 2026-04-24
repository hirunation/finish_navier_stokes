---
id: AK-01
title: Mild-solution / Duhamel backward integration
category: AK
status: retired-anti-knowledge
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-09
dependencies: []
supports: [INS-02, INS-05]
cross_citations:
  - label: AK3 Item 1
    ref: official/ACCUMULATED_ANTIKNOWLEDGE_3.md (Item 1)
verification:
  method: refutation-by-information-mismatch
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: verified in all councils 1-11
  machine_verification: n/a
tags: [anti-knowledge, Duhamel, Oseen-kernel, integral-divergence, AK3-Item-1]
---

# AK-01 · Mild-solution / Duhamel backward integration

## Approach tried

Represent $v(0, 0) = \int_{-\infty}^0 [e^{-\nu s\Delta}
\mathbb{P}\nabla \cdot (v \otimes v)](0, s)\, ds$ and show the
bilinear integral vanishes, linear part decaying like
$T^{-1/2}$.

## Obstruction (information-theoretic mismatch)

The Oseen kernel at delay $|s|$ probes spatial scale $\sqrt{|s|}$,
but the ancient-solution $C^m_{\mathrm{loc}}$ decay holds only on
fixed compact sets.  As $|s| \to \infty$ the probing scale
outgrows the control region.  Lorentz-Hölder estimate gives
$|\mathrm{integrand}| \leq CM^2 |s|^{-1/2}$ and
$\int |s|^{-1/2}\, ds$ diverges at $-\infty$.  No cutoff choice
in $s$ or $R(s)$ makes both near-field + far-field contributions
simultaneously small and integrable.

## Dependencies in context

Standalone.  Supports INS-02 / INS-05 (local-to-global bridge
impossible by Duhamel alone; non-local Liouville mechanism
required).

## History

Classical dead-end (inherited AK1 Item 1).  Confirmed across
Rounds 1–11 of the adversarial councils.  Live corpus 2026-04-22.
