# Why Finish Navier–Stokes Exists

Authored 2026-04-22 at project inception; revised 2026-04-23
for the public release. This is the vision piece. It records
the methodological motivation behind the smart-data corpus; it
is not a specification — for that, see `METHOD.md`.

---

## The open problem

Navier–Stokes regularity has been open since Leray 1934. Global
smooth existence versus finite-time singularity — either answer
would be a Clay Millennium Prize. The problem is technically
difficult AND culturally embedded: generations of mathematicians
have produced partial results, scaling arguments, conditional
regularity, and cautious conjectures. The field has a shape.

What has been missing: a **structured memory of what has been
learned**. Not in papers — papers fragment knowledge across
hundreds of citations in diverse notations. Not in textbooks —
textbooks curate to pedagogy, not research. Not in Mathlib —
Mathlib formalizes what's settled, not what's in progress. Not
in any single researcher's head — researchers forget, move,
retire. Not in hand-notes — hand-notes do not survive
decades.

## The commitment of this project

Every verified insight, every retired dead-end, every
attribution correction, every literature pointer — committed to
a single addressable substrate, with provenance, with
machine-verified certificates where possible, with cross-
citations linking every node to every other node.

The commitment is **accumulation**, not publication. Papers
come as a byproduct — but the primary artifact is the living
corpus. A paper is a static snapshot of the corpus. The corpus
is the organism.

## Why not Mathlib alone

Mathlib (+ Lean 4) is the machine-verification layer, used here
in `formal/`. It does not index informal reasoning,
anti-knowledge, attribution corrections, speculative insights,
or provenance-tagged partial progress. Mathlib captures the
monolithic final state of a theorem; the smart-data corpus
captures the *history and context* that produced it.

The two are complementary. Mathlib verifies the mathematics.
The corpus holds the epistemology. Without the epistemology,
the next researcher re-solves already-solved problems and
re-falls into already-retired traps. With the epistemology, the
accumulated work is reusable.

## Anti-knowledge as first-class content

A major insight from the seed session (2026-03-29): **the
retired Case A/B Young-absorption analysis is a permanent
entry** (AK-01). Not because it is useful in the forward
direction — it is not, it is broken — but because any future
attempt to reason about Caccioppoli + Young absorption on this
kind of ODE needs to know that path is closed, and why it
closed.

Eight anti-knowledge entries from one session. That is high
yield. Without explicit tracking, these lessons evaporate and
are re-attempted. With explicit tracking, they accumulate into
a **refutation corpus** that narrows the solution space from
both sides: what works (INS) and what cannot work (AK).

AK-04 is worth its own note. Thirteen directions were tested
to see whether exceptional algebras (E8, G$_2$, octonions)
could illuminate the NS proof. All thirteen were superficial
coincidences. The deep reason: the proof works by *dimensional
reduction* to a 1D scale variable $\rho$, and any proof
succeeding by such reduction has at most A$_1$ rank. Exceptional
algebras describe structures **resisting** dimensional reduction.
So the proof's success is antithetical to exceptional complexity.

This kind of negative insight is how research communities
develop taste. The corpus makes it inheritable.

## Attribution as epistemic hygiene

CORR-01..CORR-04 from the seed session represent a major
attribution correction: three drafts misattributed KNSS §4 as
containing backward uniqueness. It does not. ESS03 is the
source of backward uniqueness. KNSS §4 supplies regularity of
bounded ancient solutions — a different tool doing a different
job. The drafts conflated them for two revisions before a
literature sweep caught the error.

CORR-07..CORR-09 (added in the deep-distillation session) catch
a separate cluster: Draft 12's phantom citation to "KNSS
Proposition 3.1" (which does not exist), its misattribution of
ESS03 backward uniqueness to ARMA 169 instead of Russian
Math. Surveys 58, and its incorrect invocation of
Brandolese–Meyer where their hypotheses do not apply.

Without tracking attribution corrections as first-class entries,
the next instance has no protection against repeating the
conflation. With them in the corpus, the corrected attribution
is the first thing a search for "KNSS backward uniqueness"
surfaces.

CORR-03 contains a stronger positive claim, buried in the
correction: the general (non-axisymmetric) 3D case has no KNSS
Liouville theorem. **Part I supplies exactly what was missing.**
The proof is the *completion* of the KNSS program for the
general case, not a reassembly of KNSS. Getting that framing
right is load-bearing for submission.

## The horizon

Months, not days. The corpus accumulates session over session.
Cross-session memory means session $N+1$ starts with session
$N$'s output as premises. The accumulation loop closes.

The horizon is not "hit deadline X with paper Y." The horizon
is: the corpus converges to a state where the NS question is
resolved, or specifically and provably reduced to a narrower
open question, and a submission-quality document compiles out
of the corpus.

Windfalls absorb into the corpus. Setbacks produce
anti-knowledge entries. The corpus advances monotonically — no
deletion, only retirement with rationale.

## Posture

Density. Directness. First-principles derivation. Provenance
discipline. No hand-waving. No silent deletion. No uncorrected
attribution. No stub verification.

Errors are discoveries. Publish the correction into the corpus.
The next reader consumes it as context.
