# Phase: Service Team (bid-only)

Control whether service-team role cards are generated based on tender mode.

## Inputs (must be ready)

- Operations phase is complete (`Operations Gate = pass`).
- Read `../shared/service-team-template.md`.
- Intake field `bid_or_tender` is resolved to `true` or `false`.

## Routing rule

### Case A: `bid_or_tender = false`

Output exactly this marker and stop this phase:

```md
## 7. Service Team (skipped — non-bid)
```

No role cards, no optional role section, no extra text.

### Case B: `bid_or_tender = true`

Output bid-mode role cards using shared template constraints:

- Required: Client Lead, Strategy Lead, Creative Lead, Execution Supervisor
- Optional: Media Placement Lead
- Per-card required fields: background, responsibilities, numeric allocation

If `tender_technical_requirements` specifies qualifications or case-count constraints, map those constraints explicitly into relevant role cards.

## Gate

- Non-bid path passes only if the marker string is exact.
- Bid path passes only if all required role cards and required fields are complete.

Do not continue to Proposal assembly until this gate is pass.
