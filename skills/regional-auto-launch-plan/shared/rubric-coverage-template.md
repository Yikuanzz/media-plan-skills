# Rubric Coverage Template

Use this contract when `evaluation_rubric` is provided.

## Trigger and gate

- If rubric is empty: mark `Rubric Coverage: skipped` and continue with the four-standard quality check only.
- If rubric is non-empty: `Coverage Map` is mandatory before proposal drafting.
- Proposal drafting cannot start while any rubric line remains `partial` or `missing`.

## Coverage Map (mandatory when rubric non-empty)

```md
## Coverage Map
| Rubric ID | Rubric Item (verbatim) | Weight | Target Chapter | Depth | Status | Notes |
| --- | --- | --- | --- | --- | --- | --- |
| R1 |  |  |  | Compact/Expanded | covered/partial/missing |  |
| R2 |  |  |  | Compact/Expanded | covered/partial/missing |  |
```

Status rules:

- `covered`: chapter anchor and evidence path are both available.
- `partial`: chapter exists but evidence depth, specificity, or anchor precision is insufficient.
- `missing`: no valid chapter anchor or no feasible evidence path.

## Weight-to-depth enforcement

- `>=15%` high-weight items must be `Expanded`.
- `5-14.99%` items default to standard chapter depth.
- `<5%` items may remain `Compact` unless rubric text says otherwise.

## Pre-draft gate (hard)

Before proposal drafting, validate all rows:

1. Verbatim rubric capture complete.
2. `Coverage Map` exists and includes every rubric row.
3. No row is `partial`.
4. No row is `missing`.
5. Every `>=15%` row is marked `Expanded`.

If any check fails, set `Rubric Coverage Gate = fail` and route fixes upstream before drafting.

## Section 15 mapping output

When rubric is non-empty, proposal must include `Rubric Mapping` section with one line per rubric item:

```md
## 15. Rubric Mapping
| Rubric ID | Chapter Anchor | Key Evidence (1-2 lines) |
| --- | --- | --- |
| R1 |  |  |
| R2 |  |  |
```
