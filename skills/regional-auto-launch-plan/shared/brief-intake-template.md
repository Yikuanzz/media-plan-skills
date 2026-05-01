# Brief Intake Template

Use this contract in `Phase: Intake` to normalize brief inputs and decide `ready` or `blocked`.

## Required Fields To Reach Intake Status: ready

- `business_goal`
- `target_audience`
- `timeline`
- `budget_or_resource_level`
- `geography_or_region`
- `channel_constraints`
- `deliverables_needed`
- `constraints`
- `success_metric`
- `bid_or_tender`
- `evaluation_rubric`
- `tender_technical_requirements`
- `client_master_calendar`

## Field-Specific Rules

- `budget_or_resource_level`: default guidance is `20-30万` (regional small-budget context, including online + offline + venue).
- `evaluation_rubric`: capture verbatim when provided, keep item numbering, and do not paraphrase scoring clauses.
- `bid_or_tender`: boolean, mandatory at intake because it controls bid-only sections.
- `tender_technical_requirements`: required as explicit content or explicit `N/A`.
- `client_master_calendar`: required as explicit content or explicit `N/A`.
- Required means either a concrete value or explicit `N/A`; placeholders like `tbd` do not pass.

## Intake Output Format

```md
## Intake Summary
- Business goal:
- Target audience:
- Timeline:
- Geography / region:
- Budget / resources:
- Channel constraints:
- Deliverables needed:
- Constraints:
- Success metric:
- Bid / tender (true/false):
- Evaluation rubric (verbatim):
- Tender technical requirements:
- Client master calendar:

## Missing Fields
-

## Open Questions
-

## Intake Status
- ready | blocked
```

## Gate Logic

- Mark `ready` only when every required field is resolved (value or explicit `N/A`).
- If any required field is unresolved, mark `blocked` and ask targeted follow-up questions only for missing fields.
- Never backfill required intake fields from pre-brief hints or assumptions.
