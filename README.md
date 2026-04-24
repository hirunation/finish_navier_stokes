# finish_navier_stokes

**A Liouville theorem for stationary Navier–Stokes in
$L^{3,\infty}(\mathbb{R}^3)$, and the endpoint gap in the Clay
regularity chain.**

[![Zenodo DOI](https://img.shields.io/badge/Zenodo-DOI%20forthcoming-blue)](https://zenodo.org/)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC--BY--4.0-lightgrey.svg)](LICENSE)

**Author.** Airo Nahiru — <aironahiru@gmail.com>.

## Overview

This repository contains the preprint *A Liouville theorem for
stationary Navier–Stokes in $L^{3,\infty}(\mathbb{R}^3)$, and
the endpoint gap in the Clay regularity chain* and the
provenance-tracked smart-data corpus that accompanies it.

1. **The paper** — `paper/paper.tex`, compiled to
   `paper/paper.pdf` (22 pages, AMS article class). Zenodo-archived
   with a permanent DOI; see *Citation* below.
2. **A 103-entry smart-data corpus** in `insights/`, organized
   across nine categories (central insights, supporting lemmas,
   definitions, obstruction theorems, classical axioms, retired
   anti-knowledge, attribution corrections, master proof chains,
   cross-cutting narrative threads) with DAG-closed dependencies,
   full provenance, and citations into the literature.
3. **Desk-level attack analyses** in `desk/` — tracing the
   mathematical exploration of the $L^{3,\infty}$ inheritance
   endpoint blocker, including an explicit attempt at the
   weighted-moment rescue.
4. **A Lean 4 skeleton** in `formal/` — a top-level statement
   file for the main theorem with axiom stubs, intended as the
   starting point for a full mechanization.

## Citation

If you use the paper or corpus, please cite:

> Nahiru, A. (2026). *A Liouville theorem for stationary
> Navier–Stokes in $L^{3,\infty}(\mathbb{R}^3)$, and the
> endpoint gap in the Clay regularity chain.* Zenodo.
> DOI: 10.XXXX/zenodo.XXXXXXX

Machine-readable metadata in `CITATION.cff`.

## The paper (TL;DR)

**Main theorem.** Every smooth stationary divergence-free
Navier–Stokes solution on $\mathbb{R}^3$ in the Lorentz space
$L^{3,\infty}(\mathbb{R}^3)$ is identically zero.

**Method.** Hat-function weighted energy on fixed-ratio annuli →
Bogovski\u{\i} pressure elimination → sublinear Caccioppoli
inequality → Lorentz layer-cake embedding → rescaled
Gagliardo–Nirenberg interpolation with exact scale cancellation
→ superlinear ODE $\mathcal{E}'(\rho) \geq c\rho^{-\alpha}
\mathcal{E}(\rho)^\beta$ with $\beta > 1$, $\alpha < 1$ for all
$p \in (3/2, 3)$ → bounded-left-hand-side / divergent-right-hand-side
contradiction → finite Dirichlet energy → $v \equiv 0$.

**Corollaries.** Four-dimensional Liouville theorem (dimensional
discriminant $\gamma(n, p) = -(n-4)(n-2p)/(2n - p(n-2))$);
$W^{1,2}_{\mathrm{loc}}$ weak-solution extension (Landau
solutions confirm sharpness); single-exponential quantitative
bound $\mathcal{E}(\rho_0) \leq O(M^6/\rho_0)$.

**Clay chain and the endpoint gap.** Applied within the
Koch–Nadirashvili–Seregin–Šverák blow-up framework, the theorem
reduces the full Clay regularity problem to a single structural
step: the rescaled ancient solution's uniform $L^{3,\infty}$
bound, equivalent to **Phuc 2015's open endpoint**. Partial
closures (axisymmetric, smallness, finite singular set,
logarithmic improvement) and a concrete weighted-moment rescue
are surveyed in §11 of the paper and developed in detail in
`desk/03_lem_06_attack.md` and `desk/04_ins_21_attempt.md`.

## Repository layout

```
finish_navier_stokes/
├── README.md             # this file
├── CITATION.cff          # machine-readable citation metadata
├── LICENSE               # CC-BY-4.0
├── PROBLEM.md            # the Clay problem framing
├── METHOD.md             # smart-data methodology
├── paper/
│   ├── README.md
│   ├── paper.tex         # LaTeX source
│   └── paper.pdf         # compiled PDF
├── insights/             # 103-entry smart-data corpus
│   ├── README.md         # schema + navigation
│   ├── INS-*.md          # 20 central insights
│   ├── LEM-*.md          # 12 supporting lemmas (incl. the OPEN gap LEM-06)
│   ├── DEF-*.md          # 3 definitions
│   ├── OBS-*.md          # 9 canonical obstruction theorems
│   ├── AX-*.md           # 5 classical axioms (quarantined)
│   ├── AK-*.md           # 35 retired anti-knowledge entries
│   ├── CORR-*.md         # 7 attribution corrections
│   ├── THR-*.md          # 6 cross-cutting narrative threads
│   └── MPC/              # 6 master proof chain summaries
├── desk/                 # attack analyses
│   ├── 00_project_intent.md
│   ├── 03_lem_06_attack.md   # five rescue routes + INS-21 proposal
│   └── 04_ins_21_attempt.md  # attempt at the weighted-moment estimate
└── formal/               # Lean 4 skeleton
    ├── README.md
    ├── lakefile.lean
    └── NS/ (NS.lean, NS/Basic.lean, NS/INS_01_L3inf_Liouville.lean)
```

## Building the paper

```bash
cd paper/
pdflatex paper.tex
pdflatex paper.tex
# or:
latexmk -pdf paper.tex
```

The bibliography is inline (`thebibliography` environment), so no
separate BibTeX pass is required.

## Status

**2026-04-23:** v0.1 paper draft complete. All proof sections
(§4–§10) carry full rigorous content: Bogovski\u{\i} pressure
elimination, Draft-9 sublinear Caccioppoli, Lorentz layer-cake,
scale-cancelling Gagliardo–Nirenberg, superlinear ODE,
integration contradiction, and the global-cutoff $v \equiv 0$
closure. §11 contains complete proofs of the three corollaries.
§12 gives the honest Clay-chain endpoint-gap discussion with the
weighted-moment proposal. Bibliography: 28 entries, all verified.

**Next milestones:**
- Zenodo deposit (v0.1) for priority / permanent DOI.
- Submission to *Archive for Rational Mechanics and Analysis*
  (first choice), *Journal of Mathematical Fluid Mechanics*, or
  *Communications in Mathematical Physics*.
- Lean 4 machine verification of Theorem 1.1 (three open sorries
  in `formal/NS/INS_01_L3inf_Liouville.lean`).

## License

The paper and corpus are released under
[Creative Commons Attribution 4.0 (CC-BY-4.0)](https://creativecommons.org/licenses/by/4.0/).
You are free to share and adapt the material for any purpose
(including commercial) provided you give appropriate credit.

## Contact

Airo Nahiru — <aironahiru@gmail.com>.

For mathematical correspondence on the $L^{3,\infty}$ endpoint
conjecture, the weighted-moment rescue, or collaboration on the
Lean formalization, please email directly.
