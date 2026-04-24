# insights/ — smart-data corpus

Structured, provenance-tracked, DAG-closed corpus covering
the stationary $L^{3,\infty}$ Liouville theorem, the
KNSS-composed Clay chain, the nine canonical obstruction
theorems, and the catalog of retired approaches.

## Categories (filename prefix)

| Prefix | Meaning | Count |
|:---|:---|:---:|
| `INS-` | Central insight / theorem statement | 20 |
| `LEM-` | Supporting / load-bearing lemma | 12 |
| `DEF-` | Definition (function space, operator, structure) | 3 |
| `OBS-` | Obstruction theorem | 9 |
| `AX-`  | Classical axiom, quarantined | 5 |
| `AK-`  | Retired anti-knowledge entry | 35 |
| `CORR-` | Attribution correction | 7 |
| `THR-` | Thread-level narrative (arc across entries) | 6 |
| `MPC/` | Master Proof Chain summary (subdir, one file per MPC) | 6 |

Total: 103 entries.

## Frontmatter schema (strict)

Every entry carries YAML frontmatter. Required fields: `id`,
`title`, `category`, `status`, `author`, `date`,
`verification.method`. Full schema:

```yaml
---
id: <CAT>-NN
title: <human title>
category: INS | LEM | DEF | OBS | AX | AK | CORR | THR | MPC
status: verified | speculative | conjectured | retired-anti-knowledge | attribution-correction | axiom-quarantined
confidence: 0.0 .. 1.0
session_uuid: <provenance identifier; optional>
author: <human name>
date: YYYY-MM-DD
dependencies: [<ID>, ...]
supports: [<ID>, ...]
supersedes: [<ID>, ...]
cross_citations:
  - label: <tag>
    ref: <DOI/arXiv/section>
    note: <optional>
verification:
  method: <string>
  rounds: <int | n/a>
  adversarial_vectors: <int | n/a>
  independent_rederivation: <source | n/a>
  machine_verification: <lean-ref | pending | n/a>
lean_ref: <proof term reference | none>
tags: [<keyword>, ...]
---
```

## Status values

- **`verified`** — Lean-proved, zero `sorry`, zero external axiom.
- **`speculative`** — informally verified but Lean has `sorry`
  body or depends on quarantined axioms.
- **`conjectured`** — stated but neither informally complete nor
  Lean-targeted.
- **`retired-anti-knowledge`** — refuted approach, reason
  documented.
- **`attribution-correction`** — literature citation error with
  corrected source.
- **`axiom-quarantined`** — classical external result trusted as
  axiom.

## Provenance discipline

Every entry carries `author` + `date` + `verification.method`
at minimum. Orphans are not accepted into the corpus.
`session_uuid` tracks the working-session in which the insight
was identified.

## DAG discipline

`dependencies` and `supports` close within the live corpus.
Edges are symmetric: `X depends_on Y` iff `Y supports X`. The
graph is acyclic. No dangling edges.

## Reading order — suggested

New reader? Start with:

1. **MPC/MPC-1_stationary_liouville.md** — the Part I
   (stationary $L^{3,\infty}$) master proof chain.
2. **INS-01_stationary_L3inf_liouville.md** — the main theorem.
3. **INS-02_caccioppoli_sublinear_restructuring.md** — the key
   methodological pivot (Draft-9 restructuring).
4. **LEM-06_L3inf_inheritance.md** — the open gap, equivalent to
   Phuc 2015's open endpoint.
5. **THR-01_four_step_proof_skeleton.md** — the narrative arc.
6. **CORR-07_draft12_audit.md** — the attribution audit that
   reshaped the paper's Clay-chain discussion.

Obstruction theorems (OBS-01..OBS-09) give the landscape of
what blocks the transition from Part I to the full Clay chain.
Retired approaches (AK-01..AK-35) document the known dead ends.
