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

## Optional Fields (Non-Blocking For Intake Readiness)

- `evaluation_rubric`
- `tender_technical_requirements`
- `client_master_calendar`

## Field-Specific Rules

- `budget_or_resource_level`: default guidance is `20-30万` (regional small-budget context, including online + offline + venue).
- `evaluation_rubric`: optional; capture verbatim when provided, keep item numbering, and do not paraphrase scoring clauses. Explicit `N/A` is allowed.
- `bid_or_tender`: boolean, mandatory at intake because it controls bid-only sections.
- `tender_technical_requirements`: optional and non-blocking; explicit `N/A` is allowed when absent.
- `client_master_calendar`: optional and non-blocking; explicit `N/A` is allowed when absent.
- Required fields must be concrete values (or explicit `N/A` only when the field contract allows it); placeholders like `tbd` do not pass.

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
- Evaluation rubric (optional, verbatim or `N/A`):
- Tender technical requirements (optional or `N/A`):
- Client master calendar (optional or `N/A`):

## Missing Fields
-

## Open Questions
-

## Intake Status
- ready | blocked
```

## Gate Logic

- Mark `ready` only when every required field is resolved.
- If any required field is unresolved, mark `blocked` and ask targeted follow-up questions only for missing fields.
- Optional fields (`evaluation_rubric`, `tender_technical_requirements`, `client_master_calendar`) must not block `ready`; keep explicit `N/A` when absent.
- Never backfill required intake fields from pre-brief hints or assumptions.
