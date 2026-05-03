# Insight Module: Market Environment

## Objective

Summarize the regional market environment that affects launch timing and tactics, with mandatory data granularity across both national track-level and regional-level analysis.

## Mandatory Analysis Dimensions

### A. National Track-Level Analysis (mandatory)

Must cover the vehicle category's national market context:

1. **3-year sales trend**: national annual sales volume and YoY growth rate for the past 3 years, with comparison to overall passenger car market growth rate (to show track premium).
2. **Powertrain breakdown**: split by 燃油 / 混动 / 纯电. For each powertrain type, output:

   | 动力类型 | 销量占比 | 同比增速 | 核心受众画像 | 主力价格区间 | 未来趋势研判 |
   | --- | --- | --- | --- | --- | --- |
   | 燃油 | [...] | [...] | [...] | [...] | [...] |
   | 混动 | [...] | [...] | [...] | [...] | [...] |
   | 纯电 | [...] | [...] | [...] | [...] | [...] |

### B. Regional (Target City) Analysis (mandatory)

1. **Regional track share vs national**: regional category sales share vs national average, with reason analysis for the gap.
2. **Channel trend**: regional channel structure trend (直营 / 授权 / 联营) and implications for launch deployment.
3. **Structural opportunity**: one explicit opportunity point unique to the regional market.

### C. Policy / Calendar / Hotspot (existing, retained)

- Policy and regulatory signal
- Seasonal or calendar window
- Mass-culture hotspot window (public holidays/sports/city events)

## Evidence Requirement

- Module pass requires >=2 evidence sources.
- Sources should include at least one high-trust source (government, official, or credible industry report).
- National track-level data must cite source (e.g., 乘联会 / 懂车帝 / 汽车之家).

## Output Template

```md
## 2.2 Market Environment

### 2.2.1 National Track-Level
- 3-year sales trend (volume + YoY):
  - Y-2: [...]
  - Y-1: [...]
  - Y-0: [...]
- Track vs overall passenger car growth comparison:
- Powertrain breakdown table:

| 动力类型 | 销量占比 | 同比增速 | 核心受众画像 | 主力价格区间 | 未来趋势研判 |
| --- | --- | --- | --- | --- | --- |
| 燃油 |  |  |  |  |  |
| 混动 |  |  |  |  |  |
| 纯电 |  |  |  |  |  |

### 2.2.2 Regional (City) Analysis
- Regional category share vs national average:
- Reason for gap:
- Regional channel trend:
- Structural opportunity:

### 2.2.3 Policy / Calendar / Hotspot Window
- Policy or compliance signal:
- Seasonal/calendar opportunity window:
- Mass-culture hotspot calendar (launch window +/- 15 days):
  - Public-level hotspots:
  - Sports-level hotspots:
  - City-level hotspots:
  - Priority leverage move (optional; if used, avoid industry event as primary storyline):
- Launch implications:

### Insight Data Table
| Metric | Value | Year/Window | Source |
| --- | --- | --- | --- |
| [e.g., regional NEV penetration] | [...] | [...] | [source id] |
| [e.g., target price-band demand index] | [...] | [...] | [source id] |

### Evidence
1. [source + key point]
2. [source + key point]
```

## Hotspot Grafting Rules (mandatory)

- Scan launch window +/- 15 days for public-level, sports-level, and city-level hotspots.
- Validate hotspot fit against `<primary-buyer-identity>` from customer segmentation before recommending.
- Deprioritize practitioner-only events (trade shows, insider expos) unless they overlap with target buyers.
- If hotspot directly links to target buyer world, use direct narrative graft.
- If hotspot is not direct, create metaphor bridge consistent with selected buyer identity.
- Every hotspot suggestion must declare cost tier (`zero-cost` / `low-cost` / `high-cost`), and recommendation should prioritize `zero-cost` first.
- Hotspot tie-in is optional. Delivery-first owned launch event design can be used as primary route.

## Gate

- Fail if 3-year national sales trend is missing.
- Fail if powertrain breakdown table is missing or incomplete.
- Fail if regional-vs-national comparison is missing.
- Fail if structural opportunity is not stated.
- Fail if any required dimension is missing.
- Fail if evidence count is below two sources.
