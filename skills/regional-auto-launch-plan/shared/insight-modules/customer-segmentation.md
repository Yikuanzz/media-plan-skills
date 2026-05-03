# Insight Module: Customer Segmentation

## Objective

Define decision-useful customer segments for the regional launch, including local distribution patterns.

## Mandatory Scope

- Segment definitions with full 5-dimension profile: `基本画像` (age/occupation/income/family structure), `用车场景`, `核心痛点`, `关注要点` (3-5 decision factors), `情感诉求`.
- Purchase motivation and barrier per segment.
- Regional distribution notes (which segments are stronger in which local contexts).
- Derive and rank `<primary-buyer-identity>` by purchase-decision weight.
- Suggested segmentation reference (adjust per product): 核心客群 (e.g. high-net-worth family users), 转化客群 (e.g. BBA brand upgrade/switchers), 潜力客群 (e.g. tech elite / young professionals).

## Evidence Requirement

- Module pass requires >=2 evidence sources.
- Evidence should combine behavior signal + market/context signal when possible.

## Output Template

```md
## 2.5 Customer Segmentation

### Insight Data Table
| Segment | Core signal | Regional concentration | Decision implication | Source |
| --- | --- | --- | --- | --- |
| Segment A | [...] | [...] | [...] | [source id] |
| Segment B | [...] | [...] | [...] | [source id] |

### Segment A
- 基本画像 (age / occupation / income / family structure):
- 用车场景 (daily commuting / family trips / business / long-distance self-drive):
- 核心痛点 (key unmet needs from current vehicle or transport solution):
- 关注要点 (3-5 dimensions most weighted in purchase decision):
- 情感诉求 (emotional motivation and identity connection behind this purchase):
- Motivation:
- Barrier:
- Regional distribution:

### Segment B
- 基本画像 (age / occupation / income / family structure):
- 用车场景 (daily commuting / family trips / business / long-distance self-drive):
- 核心痛点 (key unmet needs from current vehicle or transport solution):
- 关注要点 (3-5 dimensions most weighted in purchase decision):
- 情感诉求 (emotional motivation and identity connection behind this purchase):
- Motivation:
- Barrier:
- Regional distribution:

### Primary Buyer Identity (for downstream phases)
- primary_buyer_identity:
- supporting segment refs:
- decision-weight rationale:

### Evidence
1. [source + key point]
2. [source + key point]
```

## Gate

- Fail if segment profiles exist but any of `用车场景`, `核心痛点`, `关注要点`, or `情感诉求` is missing.
- Fail if motivations/barriers are missing.
- Fail if regional distribution is not described.
- Fail if evidence count is below two sources.
- Fail if `primary_buyer_identity` is missing or has no supporting segment rationale.

## 2.6 Audience Regional Depth

### 2.6.<n> <persona name>
#### 消费趋势
#### 触媒习惯
#### 空间分布
#### 心态
#### 消费习惯
#### 出行习惯
#### 文化情感归因
