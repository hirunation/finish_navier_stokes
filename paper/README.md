# paper/

The paper accompanying the
`finish_navier_stokes` corpus.

## Title

*A Liouville theorem for stationary Navier–Stokes in
$L^{3,\infty}(\mathbb{R}^3)$, and the endpoint gap in the Clay
regularity chain.*

## Author

Airo Nahiru (independent researcher).

## Content

- `paper.tex` — LaTeX source (AMS article class, ~25-30 pages).
- `paper.pdf` — compiled PDF (build with `pdflatex paper.tex`
  twice, then `bibtex paper`, then `pdflatex` twice more; or
  use `latexmk -pdf paper.tex`).

## Structure

§1 Introduction · §2 Notation · §3–§9 Proof of Part I (8 steps)
· §10 Extensions (4D Liouville, $W^{1,2}_\mathrm{loc}$,
quantitative bound) · §11 Application to the Clay chain +
$L^{3,\infty}$ endpoint gap · §12 Obstruction landscape ·
§13 Discussion.

Bibliography: ~27 entries, all verified.

## Current state

**v0.1 draft complete** 2026-04-23. All sections written in full;
compiles cleanly to 22 pages via pdflatex.

- [x] Abstract, §1 Introduction, §2 Notation, §3 Hat-function
  iteration target.
- [x] §4 Pressure elimination via Bogovskii (Lemma + Proposition
  + scaling corollary + the master identity).
- [x] §5 Caccioppoli inequality on annuli (sublinear Draft-9
  restructuring, 4 term bounds + AK-28 remark).
- [x] §6 Lorentz layer-cake embedding on annuli (layer-cake
  proof + annulus corollary + endpoint failure remark).
- [x] §7 Gagliardo–Nirenberg + scale cancellation (reference GN,
  rescaled proposition, scale-invariance check, main estimate
  theorem).
- [x] §8 Superlinear differential inequality (α, β derivation
  with algebraic verification for $p \in (3/2, 3)$).
- [x] §9 Integration and contradiction (finite Dirichlet energy
  theorem).
- [x] §10 From finite Dirichlet to $v \equiv 0$ (upgraded
  regularity lemma + three-term global cutoff argument).
- [x] §11 Extensions (proofs of Corollaries 1.2, 1.3, 1.4).
- [x] §12 Clay chain + endpoint gap.
- [x] §13 Obstruction landscape.
- [x] §14 Discussion + acknowledgments.
- [x] 28-entry verified bibliography (27 cited papers + Bogovskii
  1979).
- [x] PDF compiles cleanly: `paper.pdf` 22 pages, no undefined
  references.

## Build

```bash
cd paper/
pdflatex paper.tex
bibtex paper     # (if .bib external; currently inline thebibliography)
pdflatex paper.tex
pdflatex paper.tex
# or:
latexmk -pdf paper.tex
```

## Cross-links

- Companion corpus at the project root: `../insights/` (103
  entries, 9 categories, DAG-closed).
- Desk analyses: `../desk/*.md`.
- Lean 4 skeleton: `../formal/` (main theorem statement with
  `sorry` body, ready for mechanization).

## Citation errors fixed vs prior drafts

This paper corrects three attribution issues flagged during the
audit of prior internal drafts (CORR-05, CORR-08, CORR-09 in
the `insights/` corpus):

1. **CORR-05**: ESS03 citations now reference Russian Math.
   Surveys 58 (2003) §4.1 (spatial continuation) and §5.1
   (backward uniqueness), not ARMA 169 Thms 1.1/1.2 (which do
   not exist).
2. **CORR-08**: No reference to "KNSS §3 Proposition 3.1" (which
   does not exist in KNSS 2009). The only KNSS citation is for
   the §6 rescaling machinery with an honest scope note.
3. **CORR-09**: Brandolese citations (Brandolese–Meyer 2002,
   Brandolese 2004) are invoked only where their hypotheses
   actually apply — the weighted-moment proposal §11.4 cites
   Brandolese–Meyer for local-existence-interval decay, not for
   uniform-in-$t$ pointwise bounds under $L^2$-only control.

## Submission plan

1. **Zenodo deposit (v0.1)** upon completion of the detailed
   proof sections: PDF + LaTeX source + tarball snapshot of the
   companion repository. Gets a permanent DOI. Priority
   established.
2. **GitHub push** with `CITATION.cff` at the repository root
   citing the Zenodo DOI. README cross-links both directions.
3. **Journal submission** (parallel track):
   - First choice: *Archive for Rational Mechanics and Analysis*
     (ARMA).
   - Second choice: *Journal of Mathematical Fluid Mechanics*
     (JMFM).
   - Third: *Communications in Mathematical Physics* (CMP).
4. **Upon acceptance**: Zenodo v1.0 deposit of the journal
   version.

*Not* targeted: Annals of Mathematics (expects the full Clay
resolution, not Part I + honest gap).
