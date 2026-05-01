# Budget Allocation Rule

Use this contract in `Phase: Action` and `Phase: Proposal` for budget validation.

## Stage Budget Bands (regional small-budget default)

Default total budget context: CNY `200k-300k` (typical midpoint `250k`).

| Stage | % of total budget | Midpoint amount (250k base) | Typical spending focus |
| --- | --- | --- | --- |
| Phase 1 Pre-heat | 25-30% | 62.5k-75k | KOL/KOC seeding, UGC incentives, lightweight offline touchpoints |
| Phase 2 Launch Burst | 50-55% | 125k-137.5k | launch-day venue and setup, key stage program, amplified live content |
| Phase 3 Sustain | 20-25% | 50k-62.5k | conversion events, referral assets, store-level follow-up activities |

## Hard Constraints (must all pass)

- 场地相关费用 <= Phase 2 预算 60% (`venue + build + on-site materials + on-site labor` as one bucket).
- 单卡 <= 总盘 30% (any single Activity Card cannot exceed 30% of total budget).
- Stage totals must stay inside the stage budget bands above.
- Online and offline costs must be split explicitly for each stage and total.

## Budget Allocation Table (required output)

```md
| Stage | Online | Offline | Total | Share |
| --- | --- | --- | --- | --- |
| Phase 1 | CNY ... | CNY ... | CNY ... | ...% |
| Phase 2 | CNY ... | CNY ... (venue-related CNY ...) | CNY ... | ...% |
| Phase 3 | CNY ... | CNY ... | CNY ... | ...% |
| Overall | CNY ... | CNY ... | CNY ... | 100% |
```

Validation rules for the table:

1. `Online + Offline = Stage Total` for every stage.
2. Sum of stage totals equals overall total.
3. Phase 2 line must expose venue-related amount for the 60% check.
