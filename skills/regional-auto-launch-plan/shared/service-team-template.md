# Service Team Template (bid-only)

Use this template only when `bid_or_tender = true`.

## Non-bid marker constant (mandatory)

When non-bid state is routed from Service Team phase, Proposal must output exactly this marker:

```md
## 7. Service Team (skipped — non-bid)
```

Do not output role cards, optional roles, or explanatory filler after the marker.

## Routing contract

- If `bid_or_tender = false`: Service Team phase is skipped logically, and Proposal emits only the non-bid marker above.
- If `bid_or_tender = true`: Service Team phase emits bid-mode role cards using this template.

## Bid-mode role cards (4+1)

When `bid_or_tender = true`, output the four required cards and one optional media card.

Required cards:

1. Client Lead
2. Strategy Lead
3. Creative Lead
4. Execution Supervisor

Optional card:

5. Media Placement Lead (include when paid media or explicit media execution exists)

Each card must include:

- Background
- Responsibilities
- Allocation (numeric value such as FTE %, days/week, or hours/week)

If `tender_technical_requirements` contains qualification or case-count constraints, map each requirement to at least one relevant role card.

```md
## Service Team

### Client Lead
- Background:
- Responsibilities:
- Allocation:

### Strategy Lead
- Background:
- Responsibilities:
- Allocation:

### Creative Lead
- Background:
- Responsibilities:
- Allocation:

### Execution Supervisor
- Background:
- Responsibilities:
- Allocation:

### Media Placement Lead (optional)
- Background:
- Responsibilities:
- Allocation:
```
