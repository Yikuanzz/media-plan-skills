# Phase: Service Team (bid-only)

Generate service-team role cards only for bid briefs.

## Inputs (must be ready)

- Operations phase is complete (`Operations Gate = pass`).
- Read `../shared/service-team-template.md`.
- Read `../shared/persistence-rules.md`.
- Intake field `bid_or_tender` is resolved to `true` or `false`.

## Routing rule

### Case A: `bid_or_tender = false`

Write `09-service-team.md` exactly:

```md
## 6. Service Team

_本项目 `bid_or_tender = false`，按规范跳过服务团队章节。_

_如后续转为招投标场景，请重新触发 Service Team phase 以补齐角色卡。_
```

Set `Service Team Phase Status = skipped_non_bid` and continue to Proposal.

### Case B: `bid_or_tender = true`

Output bid-mode role cards using shared template constraints:

- Required: Client Lead, Strategy Lead, Creative Lead, Execution Supervisor
- Optional: Media Placement Lead
- Per-card required fields: background, responsibilities, numeric allocation
- On success, persist full role cards to `09-service-team.md`.

If `tender_technical_requirements` specifies qualifications or case-count constraints, map those constraints explicitly into relevant role cards.

## Gate

- Non-bid path passes only if phase is skipped and handoff state is explicit.
- Bid path passes only if all required role cards and required fields are complete.

Do not continue to Proposal assembly until this gate is pass.
