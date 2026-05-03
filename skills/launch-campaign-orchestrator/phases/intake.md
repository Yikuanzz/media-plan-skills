# Phase: Intake

## Purpose

Normalize the brief into a structured intake document. Block until
research-start fields are present and non-placeholder.

## Required Reads

- `./shared/brief-intake-template.md`

## Action

1. Normalize user input into `## Intake Summary`.
2. Set `## Intake Status` to `ready` or `blocked`.
3. If blocked, list only the missing research-start fields.

## Output Shape

```markdown
## Intake Summary
- business_goal: ...
- target_audience: ...
- timeline: ...
- budget_or_resource_level: ...
- geography_or_region: ...
- channel_constraints: ...
- deliverables_needed: ...
- constraints: ...
- success_metric: ...

## Intake Status
ready / blocked

## Open Questions
- ...
```

## Checkpoint

```markdown
## Intake complete
- [x] All research-start fields present or explicitly N/A
- [x] Intake Status is explicit
- [ ] Next: Insight (when ready)
```
