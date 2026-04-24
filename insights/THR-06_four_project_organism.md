---
id: THR-06
title: Four-project organism map — the upstream NS research distribution
category: THR
status: verified
confidence: 1.0
session_uuid: cross-session
author: Airo Nahiru
date: 2026-04-22
dependencies: []
supports: []
cross_citations:
  - label: insights/README.md
    ref: insights/README.md
    note: Describes the curatorial-layer role of the present repository.
verification:
  method: project-inventory cross-reference
  rounds: n/a
  adversarial_vectors: n/a
  independent_rederivation: n/a
  machine_verification: n/a
tags: [thread, cross-project, organism, landscape, narrative, curatorial-layer]
---

# THR-06 · Four-project organism map

## The four upstream NS projects

The author's NS research decomposes across four upstream
projects (plus a constraint-propagation orchestration layer
and a Lean verification server), each with a distinct role.
This repository (`finish_navier_stokes/`) is the curatorial
layer: it does not duplicate the proof work; it tracks
provenance, status, attribution, and cross-session narrative.

### 1. `navier_stokes` — March arc

- Thirteen synthesis files (`synthesis.md` through
  `synthesis_13.md`).
- Proof drafts in a `ns_proof/` subdirectory,
  `PROOF_FINAL_DRAFT{1..11}.tex/pdf`.
- **Best draft**: `PROOF_FINAL_DRAFT11.tex` (1491 lines, 28
  pages, 2026-03-28 23:35). Embodies the synthesis_11..13
  breakthrough arc.

### 2. `navier_stokes_official` — April audit-state

- `paper/PROOF_FINAL_DRAFT12.tex` (16 pages, 2026-04-09..12) +
  the audit `DRAFT_12_NOTE.md` flagging three issues (see
  CORR-07).
- `knowledge_base/ACCUMULATED_KNOWLEDGE_3.md` +
  `ACCUMULATED_ANTIKNOWLEDGE_3.md` (35 retired-anti-knowledge
  entries, the source for AK-01..AK-35).
- `lean_formalization/` ("Tree A") — 102 theorems, 9–10
  `sorry`-bodies, 6 classical axioms.
- `verification_record/VERIFICATION_LEDGER.md`.

### 3. `grand_unified_ns_proof` — GUNS (April 17)

- Clay target: `GUNS/Spine.lean` `navier_stokes_global_regularity`.
- 12 proved zero-axiom theorems (sanity + golden-ratio INS-18
  lemmas + invariant counters).
- 23 open `sorry`-bodies.
- 5 quarantined classical axioms (AX-01..AX-05).
- Five paths: `ClassicalPath` (34 Tree-A theorems inherited
  plus 4 obligations), `ObstructionLibrary` (OBS-01..OBS-09),
  `HullErgodicPath` (Translation Hull + four Forms + INS-03
  Grand Unification), `IcosahedralPath` (INS-04), `AncientExtension`
  (INS-10).

### 4. `proving_grounds/turbulent_waters` — the canon

- `canon/` 6560 lines: MPC-1..MPC-6, BRAID_1 integrated
  narrative, I..VIII Movement sequence.
- Within this project, `grand_unified_ns_proof/` holds the
  extended living `BRAID.md`, `vellum.md` cycle log, and a
  `kernel/` CUDA proof-by-computation pipeline (MPC-6
  numerical verification).

### Constraint-propagation orchestration

An external CPN (constraint-propagation network) project
orchestrates verification across Part I (14 nodes), Part II
(13 nodes), and infrastructure (15 nodes), 42 nodes total.
MPC-5 and MPC-6 are the active phase.

## Role of the present repository

**Curatorial layer over the four upstream projects.** Not a
duplicate proof project. Tracks:

- Cross-project dependency graph (DAG over entries derived from
  all four upstream projects).
- Epistemic-status ledger (scheme-verified algebraic / Lean-
  proved / Lean-`sorry`'d / canon-stated / canon-obstructed /
  informal).
- Attribution / correction ledger (CORR-01..CORR-07).
- Cross-session narrative (THR-01..THR-06 threads, MPC-1..MPC-6
  summaries).

## Timeline

- **March 12:** earliest work — proto-drafts and synthesis
  infrastructure.
- **March 18–23:** synthesis_1..9 (v0.47 → v0.77).
- **March 28:** synthesis_10..13 breakthroughs (v0.78 → v0.83);
  `PROOF_FINAL_DRAFT11.tex` submission-state.
- **March 29–30:** Draft-9 Caccioppoli fix; Drafts 7..10; KNSS
  attribution CORR-01..CORR-04.
- **April 1–9:** CPN build; HIRA-CPN scaling; Lean formalization
  begins.
- **April 9–12:** Consolidation megasession — Drafts 10/11/12 +
  `ACCUMULATED_*_3` + `VERIFICATION_LEDGER`.
- **April 14–17:** Turbulent Waters canon frozen; BRAID
  Movements I..VIII; MPC-1..MPC-6.
- **April 17:** GUNS Step-1..4 — Clay-target skeleton +
  34-theorem ClassicalPath inherit + 9 obstructions + 4 Forms +
  INS-04 + INS-10.
- **April 17–22:** GUNS Cycle 1 — CUDA kernel proof-by-
  computation ($r(x) = 0.7386$ at $\ell = 1$, $0.0466$ at
  $\ell = 4$).
- **April 22:** `finish_navier_stokes/` session-1 deep
  distillation — authored the live corpus (103 entries),
  `DRAFT_12_NOTE` audit (CORR-07), cross-project cross-reference.
- **April 23:** paper v0.1 draft complete; repo prepared for
  public release.

## Dependencies in context

Standalone macro-narrative. Supports no specific entry;
referenced throughout the corpus for cross-project context.

## History

Live corpus 2026-04-22. Authored as the macro-summary entry
during session-1 deep distillation. Revised 2026-04-23 to
remove local-filesystem paths ahead of public release.
