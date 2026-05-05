# Budget Allocation Rule

Use this contract in `Phase: Action` and `Phase: Proposal` for budget validation.

## Stage Budget Bands (regional small-budget default)

Default total budget context: CNY `200k-300k` (typical midpoint `250k`).

## Budget Tiering (mandatory)

Select one tier before Action design. Tier must be explicit in phase output:

| Tier | Total budget range | Use case | Constraint posture |
| --- | --- | --- | --- |
| conservative | 200k-300k | regional small-budget default | strict low-cost, lightweight production |
| standard | 300k-500k | stronger launch presence | moderate production, controlled amplification |
| flagship | 500k-1000k | high-visibility regional launch | premium production allowed with conversion guardrails |

Tier-dependent thresholds:

| Rule | conservative | standard | flagship |
| --- | --- | --- | --- |
| 场地相关费用 / Phase2 | <=60% | <=65% | <=70% |
| 单卡 / 总盘 | <=30% | <=32% | <=35% |
| 单点高成本快闪阈值 | >=30k veto | >=50k veto | >=80k veto |

## Out-of-Band Budget Handling (mandatory)

- If total budget is inside `200k-1000k`, classify it into one of the three tiers above.
- If total budget is outside `200k-1000k`, classify it as out-of-band.
- Out-of-band budget cannot be treated as default: request explicit user confirmation before Action or Proposal continues.
- When confirmed, annotate outputs with `regional-flagship` and record the confirmed total budget value.
- Keep all hard constraints below unless user explicitly approves a separate exception.
- `standard` and `flagship` tiers require explicit user confirmation and must state expected visibility objective.

| Stage | % of total budget | Midpoint amount (250k base) | Typical spending focus |
| --- | --- | --- | --- |
| Phase 1 Pre-heat | 25-30% | 62.5k-75k | KOL/KOC seeding, UGC incentives, lightweight offline touchpoints |
| Phase 2 Launch Burst | 50-55% | 125k-137.5k | launch-day venue and setup, key stage program, amplified live content |
| Phase 3 Sustain | 20-25% | 50k-62.5k | conversion events, referral assets, store-level follow-up activities |

## Hard Constraints (must all pass)

- 场地相关费用 threshold follows selected tier (`venue + build + on-site materials + on-site labor` as one bucket).
- 单卡 threshold follows selected tier (any single Activity Card cannot exceed tier cap of total budget).
- Stage totals must stay inside the stage budget bands above.
- Online and offline costs must be split explicitly for each stage and total.

## Budget Allocation Table (required output)

```md
| Stage | Online | Offline | Total | Share |
| --- | --- | --- | --- | --- |
| Phase 1 | CNY ... | CNY ... | CNY ... | ...% |
| Phase 2 | CNY ... | CNY ... (venue-related CNY ...; venue ratio ...%) | CNY ... | ...% |
| Phase 3 | CNY ... | CNY ... | CNY ... | ...% |
| Overall | CNY ... | CNY ... | CNY ... | 100% |
```

Validation rules for the table:

1. `Online + Offline = Stage Total` for every stage.
2. Sum of stage totals equals overall total.
3. Phase 2 line must expose venue-related amount (and ratio) for the 60% check.
