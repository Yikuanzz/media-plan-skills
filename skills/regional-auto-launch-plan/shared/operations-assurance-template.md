# Operations Assurance Template

Use this template in `Phase: Operations`. All five blocks are mandatory.

## Block 1: Group Matrix (3-5 groups)

- Required range: `3-5群`.
- For each group, specify role, ownership, and response window.
- If the design needs fewer than 3 or more than 5 groups, stop and request user confirmation before continuing.

```md
## Group Matrix
| Group | Role | Owner | SLA / Response Window |
| --- | --- | --- | --- |
| Group A |  |  |  |
| Group B |  |  |  |
| Group C |  |  |  |
```

## Block 2: Content Dispatch Flow

- Provide one sentence that describes the full dispatch route from central planning to frontline delivery.
- The sentence must include trigger, delivery channel, and completion signal.

```md
## Content Dispatch Flow
<one-sentence flow>
```

## Block 3: Feedback Loop

- Output exactly three steps in order: `monitor -> aggregate -> feedback`.
- Each step must name one owner and one artifact.

```md
## Feedback Loop
1. monitor: <owner + artifact>
2. aggregate: <owner + artifact>
3. feedback: <owner + artifact>
```

## Block 4: Reporting Matrix

- Default structure is 4 levels; 3 levels are allowed when brief simplicity justifies it.
- For each level, define audience, cadence, and escalation trigger.

```md
## Reporting Matrix
| Level | Audience | Cadence | Escalation Trigger |
| --- | --- | --- | --- |
| L1 |  |  |  |
| L2 |  |  |  |
| L3 |  |  |  |
| L4 (optional) |  |  |  |
```

## Block 5: Node Checkpoints

- Must align to Action Phase 1 / 2 / 3.
- KPI definitions must match Action card field `10` semantics (quantified conversion loop / KPI).
- Every stage needs checkpoint owner, checkpoint date, and pass/fail threshold.

```md
## Node Checkpoints
| Stage | KPI (aligned to Action field 10) | Owner | Check Date | Pass Threshold |
| --- | --- | --- | --- | --- |
| Phase 1 |  |  |  |  |
| Phase 2 |  |  |  |  |
| Phase 3 |  |  |  |  |
```

## Operations Gate

`Operations Gate = pass` only when:

1. All 5 blocks are present and complete.
2. Group Matrix uses `3-5群`.
3. Node Checkpoints are stage-aligned and KPI-aligned to Action field `10`.

If any condition fails, set `Operations Gate = fail` and repair before entering `Phase: Service Team`.
