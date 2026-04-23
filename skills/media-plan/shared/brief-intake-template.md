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
