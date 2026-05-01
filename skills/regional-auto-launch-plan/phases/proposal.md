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
  - `../shared/rubric-coverage-template.md`

## Assembly contract

1. Build sections `0-7` from template order.
2. Enforce depth rules:
   - `Compact` appears before `Expanded` in each chapter.
   - Chapters `2`, `3`, `4` must include `Expanded` depth.
3. In chapter `4`, include both:
   - `Budget Allocation Table`
   - `Alternative Cards`
4. Conditionally include:
   - section `6. Service Team` as bid-only; when non-bid, output exactly `## 6. Service Team (skipped - non-bid)`.
   - section `14. Post-Campaign Review & Uplift` when tender requirements request post-campaign review/optimization.
   - section `15. Rubric Mapping` when rubric is non-empty.

## Review Pass and loop

- Run `Review Pass` using the four standards; enable rubric standard when rubric is non-empty.
- If verdict is `fail`, emit `Review Gap` with exactly one route, run minimal upstream repair, then re-assemble proposal.
- Keep loop cap aligned with skill root contract: `MAX_REVIEW_LOOPS = 3`.

### Symptom -> route table

| Symptom | route |
| --- | --- |
| Evidence missing, weak source grounding, city signal gaps, competitor support incomplete | research |
| Core Theme source unclear, slogan derivation chain broken, stage sub-themes inconsistent | ideation |
| Action cards incomplete, KPI not quantifiable, budget red-line violations | execution |
| Compact/Expanded mismatch, chapter relation confusion, wording quality issues, mapping anchor errors | proposal_enrich |
| Rubric capture not verbatim, mandatory intake clauses missing, unresolved bid compliance clause | intake |

Allowed routes are fixed: `research | ideation | execution | proposal_enrich | intake`.

## Output contract

Emit:

```md
## Proposal Draft
<sections 0-7, optional 14/15 according to triggers>

## Review Pass
<quality verdict by dimension>

## Review Gap
- route: research|ideation|execution|proposal_enrich|intake
- required_fixes: [...]
- estimated_loops: 1|2|3
```
