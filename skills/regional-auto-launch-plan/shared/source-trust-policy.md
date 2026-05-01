# Source Trust Policy

Use this policy in `Phase: Insight` and any evidence-sensitive repair loop.

## Trust Levels

- High trust: government or regulator releases, brand official releases, platform official reports, established research institutions.
- Medium trust: mainstream business media, established industry media, structured commercial datasets.
- Low trust: repost chains, anonymous summaries, untraceable screenshots, opinion-only self-media pages.
- Disallowed: undated, unattributed, unverifiable, or fabricated-looking sources.

## Evidence Rules

- Each insight module needs at least two sources with at least one medium-or-higher trust source.
- High-stakes claims (budget sizing, strategic positioning, city investment priorities, competitor judgments) require high trust or two independent medium-trust sources.
- Low-trust signals can trigger a hypothesis but cannot be the only support for conclusions.
- If only low-trust evidence exists, mark the claim as `weak_signal` and route it for validation or downgrade.

## Output Marking

Use explicit tags in evidence lines:

```md
- E1: <source> | trust: high|medium|low | role: primary|supporting
```

If a critical claim has no valid support, mark module gate as `fail` and repair before continuing.
