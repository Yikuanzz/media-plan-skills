# Insight Module: City Signal

## Objective

Produce a `City Evidence Pack` for the target geography.

## Mandatory Dimensions

- Consumption signal (where and how people spend)
- Media habits (platform behavior and format preference)
- Spatial distribution (key districts, venues, traffic clusters)
- Cultural anchors (festivals, sports, local identity events)
- City battlefield map (3-pole battlefield with named anchors)

## Evidence Requirement

- Module pass requires >=2 evidence sources.
- At least one evidence item should be city-specific (not national-only).

## Output Template

```md
## 2.6 City Signal

### City Evidence Pack
- Consumption:
- Media habits:
- Spatial distribution:
- Cultural anchors:

### City Battlefield Map
| Battlefield | Core area | Named anchors (3-5) | Audience profile | Phase action mapping | Scene tag |
| --- | --- | --- | --- | --- | --- |
| Pole A |  |  |  |  |  |
| Pole B |  |  |  |  |  |
| Pole C |  |  |  |  |  |

Notes:
- `Named anchors` must be explicit places (mall/building/community/park/office cluster), not generic wording like `core business district`.
- If exact place names are unavailable, use placeholders like `[CITY-ANCHOR-A1]` and request user supplement before final proposal.
- `Scene tag` should show real usage moment (for example: commute path, weekend family outing, business dinner).

### Evidence
1. [source + key point]
2. [source + key point]
```

## Gate

- Fail if any City Evidence Pack dimension is missing.
- Fail if `City Battlefield Map` table is missing.
- Fail if any battlefield row has fewer than 3 named anchors.
- Fail if evidence count is below two sources.

## Source label requirement

Each evidence item must include reusable label format:

- `[CITY-EV-<short-id>] <source + key point>`

SWOT (`2.7`) must quote at least one label per quadrant.
