# Method — Smart-data corpus over the Navier–Stokes program

This document describes the discipline of the `insights/`
corpus: schema, provenance, and the relationship between the
Markdown entries and the Lean machine-verification layer.

## The unit of knowledge

Each insight, anti-knowledge entry, attribution correction,
lemma, definition, obstruction theorem, classical axiom, master
proof chain, and cross-cutting narrative thread lives as a
single Markdown file under `insights/` with:

1. **Structured YAML frontmatter** — id, title, status,
   provenance, dependency graph edges, citations, and (optionally)
   a Lean proof-term reference.
2. **Human-readable mathematics** — statement, method, status
   notes, dependencies-in-context, citations, history.

The corpus is a DAG: each `supports` edge is the reverse of a
`dependencies` edge, and cycles are forbidden. A simple check
verifies symmetry and acyclicity; see `insights/README.md`.

## Schema — frontmatter

```yaml
---
id: INS-XX | AK-XX | CORR-XX | LEM-XX | DEF-XX | OBS-XX | AX-XX | MPC-XX | THR-XX
title: <human-readable title>
status: verified | speculative | conjectured | retired-anti-knowledge | attribution-correction | axiom-quarantined
confidence: 0.0 .. 1.0        # estimated; method noted in verification
session_uuid: <source session UUID, if applicable>
author: <human name>          # default: Airo Nahiru
date: YYYY-MM-DD
dependencies: [INS-XX, ...]   # upstream entries this relies on
supports: [INS-XX, ...]       # downstream entries that depend on this
cross_citations:
  - label: <short tag>
    ref: <DOI | arXiv | journal+section>
    note: <optional context>
verification:
  method: <"multi-round adversarial council" | "constructive proof" | "literature sweep" | ...>
  rounds: <integer, if adversarial>
  adversarial_vectors: <integer, if tracked>
  independent_rederivation: <source, if any>
  machine_verification: <lean-proof-ref> | pending | n/a
tags: [<keyword>, ...]
---
```

Body structure:

```markdown
# <id> · <title>

## Statement
<precise mathematical statement>

## Method
<proof sketch, argument, derivation>

## Status notes
<what was verified, what's speculative, what's still open>

## Dependencies in context
<how this uses / is used by other entries>

## Citations
<literature pointers with context>

## History
<draft progression, corrections, repairs, adversarial vectors tested>
```

## Status values

| Status | Meaning |
|:--- |:--- |
| `verified` | Multi-round independent validation + (when applicable) machine-verified Lean proof term. |
| `speculative` | Framed correctly, dependencies named, risk identified. |
| `conjectured` | Plausibly true, evidence accumulating, not yet argued rigorously. |
| `retired-anti-knowledge` | A path that does NOT work. Reason documented; future instances do not re-explore. |
| `attribution-correction` | Literature error identified, corrected with source-reading verification. |
| `axiom-quarantined` | Classical result used as assumption rather than internally proved. |

## Machine verification — the Lean pillar

`formal/` contains the Lean 4 skeleton. Every insight claiming
`verification.machine_verification: <ref>` has a Lean proof term
at that reference. Discipline:

- Pinned Lean 4 version (current candidate:
  `leanprover/lean4:v4.29.0`).
- Mathlib dependencies are minimized and justified per file.
- No `sorry`, no `partial`, no `unsafe` in any artifact claiming
  `verified`.
- Proof term naming: `NS.<ID>_<slug>` under namespace `NS` in
  `formal/NS/<ID>_<slug>.lean`.

**The one-way binding.** Lean is authoritative for soundness;
the insight body is authoritative for context. If Lean breaks
(dependency change, mathlib revision, refactor), the insight's
status falls from `verified` to `speculative` with the break
reason attached. Never silent.

## Hard invariants

- **No forward drift.** A `verified` claim never silently
  degrades. If an issue surfaces, the status moves to
  `speculative` (if the method is recoverable) or
  `retired-anti-knowledge` (if the claim itself is wrong), with
  rationale recorded.
- **Provenance at every node.** Every entry carries session
  UUID, author, date, and verification method. Orphan entries
  do not enter the corpus.
- **Anti-knowledge is first-class.** Retired approaches are
  preserved permanently with rationale, preventing re-exploration
  of dead paths.
- **Attribution before citation.** Before citing any external
  work, the cited section must be read. Paraphrasing from memory
  is prohibited. The `CORR-*` entries catch and document
  attribution errors.

## Updating entries

- **Mathematical body change.** Update the Markdown; history
  section records the change.
- **Status change** (e.g., `verified → speculative`). Update the
  Markdown; rationale in the history section.
- **Retirement.** Never delete. Status flips to
  `retired-anti-knowledge` with a rationale describing the
  obstacle and why it is structural rather than cosmetic.

## Entering new content

1. Identify the candidate as INS / AK / CORR / LEM / DEF / OBS /
   AX / MPC / THR.
2. Draft the Markdown under `insights/<ID>_<slug>.md` with
   complete frontmatter.
3. Review: does it duplicate an existing entry? If so, merge
   (preserve both histories; update the dependency graph).
4. Verify DAG closure: every `supports` edge has a matching
   `dependencies` edge in the other direction; no cycles.
5. If machine-verifiable, author the Lean file under
   `formal/NS/`; upon close, set
   `verification.machine_verification: NS.<ID>_<slug>`.

## Cross-project insight flow

The corpus welcomes insights that originate in adjacent
mathematical programs (harmonic analysis, kinetic theory,
geometric measure theory, fluid dynamics at large) when they
carry useful NS-relevant content. Provenance preserves the
non-NS origin; the entry's body frames the NS interpretation.

## The desk

`desk/` holds creative workspace — brainstorming, derivation,
open exploration, research-level writing. Desk pieces are NOT
governed by the schema above; they are working documents where
insights are formed before being promoted to the `insights/`
corpus. When a desk piece stabilizes into a claim, it is
transferred to `insights/` with full frontmatter and provenance.
