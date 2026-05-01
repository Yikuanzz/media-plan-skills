# Phase: Service Team (bid-only)

Generate service-team role cards only for bid briefs.

## Inputs (must be ready)

- Operations phase is complete (`Operations Gate = pass`).
- Read `../shared/service-team-template.md`.
- Intake field `bid_or_tender` is resolved to `true` or `false`.

## Routing rule

### Case A: `bid_or_tender = false` (logical skip)

Do not run this phase. Set handoff state and continue to Proposal:

- `Service Team Phase Status = skipped_non_bid`
- Proposal must render the exact non-bid marker from `../shared/service-team-template.md`.

No role cards, no optional role section, no extra text generated in this phase.

### Case B: `bid_or_tender = true`

Output bid-mode role cards using shared template constraints:

- Required: Client Lead, Strategy Lead, Creative Lead, Execution Supervisor
- Optional: Media Placement Lead
- Per-card required fields: background, responsibilities, numeric allocation

If `tender_technical_requirements` specifies qualifications or case-count constraints, map those constraints explicitly into relevant role cards.

## Gate

- Non-bid path passes only if phase is skipped and handoff state is explicit.
- Bid path passes only if all required role cards and required fields are complete.

Do not continue to Proposal assembly until this gate is pass.
