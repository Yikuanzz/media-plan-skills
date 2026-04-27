# Brief Intake Template

## Reproducibility note

Outputs from client workshops, oral commitments, or internal references are **not** available to the skill at runtime. Only what appears in the normalized intake, research, and public evidence can be reflected in the proposal. When those inputs are missing, use `Open Questions` instead of backfilling from unstated client preferences. For alignment with a human “TARGET-style” plan, use the optional fields below when the user can supply them.

## Required Fields To Start Research

- `business_goal`
- `target_audience`
- `timeline`
- `budget_or_resource_level`
- `geography_or_region`
- `channel_constraints`

## Optional Or Later-Stage Fields

- `project_background`
- `project_name`
- `primary_offer`
- `channels_in_scope`
- `deliverables_needed`
- `constraints`
- `success_metric`
- `key_message`
- `campaign_line_or_master_proposition` — optional; client-fixed one-line campaign theme or candidate lines (e.g. “home pitch” master line).
- `must_include_activations` — optional; activity types the proposal must feature (e.g. regional AI contest, sports hotspot tie-in, private salon).
- `references_and_taboos` — optional; reference cases to echo, topics or tones to avoid, or non-negotiable channels.
- `bid_or_tender` — optional; `true` if the deliverable is a bid / tender response. Default or absent = general proposal / internal deck (no mandatory `## Rubric Mapping` unless the user also supplies `evaluation_rubric`).
- `evaluation_rubric` — optional; paste or summary of scoring dimensions / weights / knockout rules (can be redacted). When both `bid_or_tender` is true **and** this field is non-empty, proposal must include `## Rubric Mapping` and align sections to these dimensions.
- `deliverable_format` — optional; e.g. formal bid, pitch deck, internal memo, or other.
- `client_master_calendar` or `stakeholder_marketing_rhythm` — optional; the client’s master campaign cadence, national launches, or timing constraints. If unknown, use `Open Questions` — do not invent.
- `tender_technical_requirements` — optional; explicit tender clauses (e.g. “must include post-campaign review and uplift”). When set, hard-require matching proposal sections even if `evaluation_rubric` is empty.

## Required Before Execution Or Proposal

- `deliverables_needed`
- `constraints`
- `success_metric`

## Intake Output Format

```md
## Intake Summary
- Project background:
- Project:
- Goal:
- Audience:
- Geography / region:
- Channel constraints:
- Offer:
- Message:
- Campaign line / master proposition (if any):
- Must-include activations (if any):
- References and taboos (if any):
- Channels:
- Deliverables:
- Timeline:
- Budget / resources:
- Success metric:
- Bid / tender (yes/no):
- Evaluation rubric (if any, yes/no or summary):
- Deliverable format:
- Client master calendar / marketing rhythm (if any):
- Tender technical requirements (if any, e.g. 复盘/后效):

## Constraints
-

## Missing Fields
-

## Open Questions
-

## Intake Status
- ready | blocked
```

## Rules

- Treat every field under `Required Fields To Start Research` as mandatory before research starts.
- Allow fields under `Optional Or Later-Stage Fields` to remain open during intake if they are not yet needed to start research.
- Treat `deliverables_needed`, `constraints`, and `success_metric` as later-stage gates: they may remain open during intake and research, but execution planning and proposal drafting must stop until they are all provided.
- Preserve `project_background` whenever the user provides it, and mark it as open if it is still unknown.
- Allow `key_message` to remain open during intake when messaging still needs to be developed from research.
- If the user provides `campaign_line_or_master_proposition`, `must_include_activations`, or `references_and_taboos`, carry them into `## Intake Summary` verbatim in concise form; do not drop them. If not provided, leave them as `—` or `n/a` without inventing.
- Do not invent missing details.
- Do not treat `unknown`, `tbd`, or similar placeholders as satisfying a required field.
- Collapse verbose user input into concise, decision-useful language.
- Keep open questions specific and answerable.
- Mark intake as `blocked` if any research-start field is missing or unknown.
- If the later-stage gate fails, route back for clarification on only the missing execution-critical fields instead of guessing.
- When `bid_or_tender` is false or absent and `evaluation_rubric` is empty, do **not** require bid-only artifacts (`## Rubric Mapping`, mandatory post-campaign section) unless `tender_technical_requirements` or the user explicitly demands them.
- When `bid_or_tender` is true and `evaluation_rubric` is non-empty, treat bid scoring dimensions as the review checklist in addition to the default [proposal-template.md](proposal-template.md) review (see [../SKILL.md](../SKILL.md) Review loop).
