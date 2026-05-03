# Phase: Proposal

Assemble final proposal chapters from upstream outputs, run quality checks, and enforce review-loop routing.

## Inputs (must be ready)

- Insight output is complete and includes chapter anchors for sections `2.1-2.7`.
- Strategy output is complete and includes chapter anchors for sections `3.1-3.4`.
- Action output is complete and includes `Action Playbook`, `Alternative Cards`, and `Budget Allocation Table`.
- Operations output is complete and gate is `pass`.
- Service Team state is resolved (`pass` in bid mode or `skipped_non_bid` in non-bid mode).
- Read:
  - `../shared/proposal-template.md`
  - `../shared/quality-self-check.md`
  - `../shared/3md-alignment-checklist.md`
  - `../shared/rubric-coverage-template.md`
  - `../shared/persistence-rules.md`

## Assembly contract

1. Read persisted files from project directory in fixed order:
   `00-intake.md` -> `01-insight.md` -> `02-strategy.md` -> `03-action-overview.md` -> `04-action-phase1.md` -> `05-action-phase2.md` -> `06-action-phase3.md` -> `07-action-alternatives.md` -> `08-operations.md` -> `09-service-team.md`.
2. Build `proposal.md` by concatenation only:
   `cover + toc + cat 00->09 + closing + visual-anchor-list + optional 14/15`.
3. Do not rewrite or summarize chapter text during assembly.
4. Run `Review Pass` before writing final `proposal.md`.
5. Apply output style constraints before writing final `proposal.md`:
   - All section headings must be Chinese punchy phrases; English labels and academic terminology are not permitted as headings.
   - Competitor response in `2.4` must be expressed as specific marketing-action sentences, not attribute comparison tables.
   - Each primary Activity Card description must include at least two sentences of atmospheric/emotional language describing participant experience, not only execution steps.
   - KPI data is consolidated in Chapter 5 Operations; do not scatter numeric targets inside activity card descriptions in Chapter 4.
   - Evidence citation markers (e.g. `[E1]`, `[E2]`) are permitted in Insight chapter only; remove from Strategy and Action chapters before final assembly.
6. Run `3md-alignment-checklist.md` and repair missing items before final write.

## Review Pass and loop

- Run `Review Pass` using the four standards; enable rubric standard when rubric is non-empty.
- If verdict is `fail`, emit `Review Gap` with exactly one route, run minimal upstream repair, then re-assemble proposal.
- Keep loop cap aligned with skill root contract: `MAX_REVIEW_LOOPS = 3`.

### Symptom -> route table

| Symptom | route | target_file |
| --- | --- | --- |
| Evidence missing, weak source grounding, city signal gaps, competitor support incomplete | research | `01-insight.md` |
| Core Theme source unclear, slogan derivation chain broken, stage sub-themes inconsistent | ideation | `02-strategy.md` |
| Action cards incomplete, KPI not quantifiable, budget red-line violations | execution | `03-07 action chapter files` |
| Compact/Expanded mismatch, chapter relation confusion, wording quality issues, mapping anchor errors | proposal_enrich | `proposal.md` |
| Output style violations (English headings, attribute-only competitor tables, KPI scattered in action cards) | proposal_enrich | `proposal.md` style pass |
| Rubric capture not verbatim, mandatory intake clauses missing, unresolved bid compliance clause | intake | `00-intake.md` |

Allowed routes are fixed: `research | ideation | execution | proposal_enrich | intake`.

## Output contract

Emit:

```md
## Review Pass
...

## Anti-Compression Coverage
- verdict: pass/fail
- failed_items: [...]

## Persistence Result
- proposal_written: true/false
- proposal_path: <project_dir>/proposal.md|null
- open_issues_path: <project_dir>/OPEN-ISSUES.md|null

## Review Gap
- route: research|ideation|execution|proposal_enrich|intake|null
- target_file: <file>|null
- required_fixes: [...]
```

## Persistence behavior

- If `Review Pass = pass`: write `proposal.md` by full overwrite.
- If `Review Pass = fail`: do not write `proposal.md`; emit `Review Gap` and route loop repair.
- If loop cap exhausted (`MAX_REVIEW_LOOPS = 3`): write `OPEN-ISSUES.md` in project directory and explicitly report incomplete state.
