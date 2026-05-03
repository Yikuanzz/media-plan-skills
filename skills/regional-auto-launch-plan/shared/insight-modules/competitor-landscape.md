# Insight Module: Competitor Landscape

## Objective

Build a three-tier competitor classification framework for the regional launch, providing the strategic landscape context before the per-competitor deep dive in `2.4`.

## Mandatory Scope

### Three-Tier Classification

| 分类 | 定义 | 研判标准 | 应对策略方向 |
| --- | --- | --- | --- |
| 核心竞品 | 价格带重叠、目标客群高度相似 | 价格带重叠率 >= 70%，客群画像匹配度 >= 60% | 贴身肉搏，正面硬刚 |
| 重点竞品 | 有交叉客群，存在明显分流威胁 | 客群有 30-60% 交叉，购车对比清单高频出现 | 凸显差异价值，抢声量 |
| 延展竞品 | 客群有潜在迁移可能 | 不同价格带但客群向上/向下迁移趋势明显 | 错位竞争，潜在拦截 |

### Image Benchmark (形象对标)

Select one traditional luxury/premium brand as an image benchmark. Purpose: use "智能 + 品质" for upward brand-grabbing against traditional luxury positioning.

- Brand name:
- Why this benchmark:
- Key borrowing angle (what we claim parity or superiority on):

### Competitor Landscape Map

Output a text-described positioning map with competitors placed on dimensions:

- X-axis: 价格 (低 → 高)
- Y-axis: 智能化程度 (低 → 高)
- Bubble size: 品牌势能 (小 → 大)

Each competitor must have a coordinate description and a 1-2 sentence position rationale.

## Evidence Requirement

- Module pass requires >=2 evidence sources.
- At least one source should include pricing and configuration data.

## Output Template

```md
## 2.3 Competitor Landscape

### Three-Tier Classification

#### 核心竞品 (2-3 brands)
| 品牌/车型 | 价格带 | 重叠逻辑 | 核心威胁点 |
| --- | --- | --- | --- |
| [...] | [...] | [...] | [...] |

#### 重点竞品 (2-3 brands)
| 品牌/车型 | 价格带 | 交叉逻辑 | 分流风险点 |
| --- | --- | --- | --- |
| [...] | [...] | [...] | [...] |

#### 延展竞品 (1-2 brands)
| 品牌/车型 | 价格带 | 迁移逻辑 | 拦截机会点 |
| --- | --- | --- | --- |
| [...] | [...] | [...] | [...] |

### Image Benchmark
- Brand:
- Rationale:
- Upward-grabbing angle:

### Competitor Landscape Map
| 竞品 | 价格定位 | 智能化定位 | 品牌势能 | 坐标描述 |
| --- | --- | --- | --- | --- |
| [our brand] | [...] | [...] | [...] | [...] |
| [competitor 1] | [...] | [...] | [...] | [...] |
| [competitor 2] | [...] | [...] | [...] | [...] |
| ... | [...] | [...] | [...] | [...] |

### Strategic Implications for Our Launch
- ...
- ...

### Evidence
1. [source + key point]
2. [source + key point]
```

## Gate

- Fail if three-tier classification is missing any tier.
- Fail if image benchmark is missing.
- Fail if landscape map has fewer than 4 competitors placed.
- Fail if evidence count is below two sources.
