# Insight Module: Product Value

## Objective

Build a complete product value foundation for regional launch planning in two stages:

**Stage A — Product Fact Base:** Structured spec table + tech highlights + brand endorsement, written in传播感语言（不是参数罗列，是用户能感知的价值翻译）。

**Stage B — Three-Layer Value System:**

- Functional value
- Emotional value
- Identity value

Also output one independent trust layer:

- Trust value (brand trust assets and co-creation credibility)

## Evidence Requirement

- Module pass requires >=2 evidence sources.
- At least one source should be product-fact based (official spec, launch material, or test data).

## Product Spec Table (mandatory, before value layers)

Before emitting the three-layer value system, output a structured product fact base. Language must have传播感 — translate specs into user-perceivable benefits, do not list raw parameters.

```md
### 2.1.0 Product Fact Base

#### 核心参数
| 维度 | 参数值 | 传播语言翻译 |
| --- | --- | --- |
| 尺寸 | [长/宽/高/轴距] | [例如："一台能装下全家行李的全尺寸SUV"] |
| 动力 | [功率/扭矩/加速] | [例如："红绿灯起步永远快人一步"] |
| 续航 | [CLTC/WLTC/实测] | [例如："武汉到宜昌，中途不用充电"] |
| 智能配置 | [芯片/算力/传感器] | [例如："高速上帮你开车，停车场帮你找位"] |
| 安全等级 | [碰撞评级/气囊/主动安全] | [例如："五星标准，全家人的移动堡垒"] |

#### 核心技术亮点
| 序号 | 技术亮点 | 与竞品差异点 | 传播切入角度 |
| --- | --- | --- | --- |
| 1 | [...] | [...] | [...] |
| 2 | [...] | [...] | [...] |
| 3 | [...] | [...] | [...] |

#### 品牌背书
- 母公司/合作品牌: [...]
- 核心技术来源: [...]
- 生产品质保障: [...]
- 服务渠道支撑: [...]
```

## Output Template (full)

```md
## 2.1 Product Value

### 2.1.0 Product Fact Base
(see spec table above)

### 2.1.1 Three-Layer Value System
- Functional value:
- Emotional value:
- Identity value:
- Trust value (independent paragraph, cannot be merged into functional value):
  - History/heritage trust asset:
  - Regional emotional anchor:
  - Service network confidence:
  - Quality assurance asset:
  - Dual-anchor sentence:
    - Use format `Trusted manufacturing asset [X] + frontier technology asset [Y] co-create full-chain confidence`.
- Regional relevance notes:

### Evidence
1. [source + key point]
2. [source + key point]
```

## Trust Value Rules (mandatory)

- If the brand context includes central/state-owned or major domestic industrial partner, extract and show trust assets explicitly.
- If no such partner exists, use transferable trust assets instead (for example battery, supply-chain, or manufacturing partner credibility).
- SWOT strengths must include one independent line for trust co-creation advantage.
- `Slogan Derivation Chain` in strategy must include a brand-anchor trace that references this trust value.

## Gate

- Fail if Product Spec Table is missing or has fewer than 3 tech highlights with competitor differentiation.
- Fail if any core parameter row is empty.
- Fail if language is pure spec-listing without传播感 translation.
- Fail if one of the three value layers is empty.
- Fail if Trust value is missing or merged into functional value.
- Fail if evidence count is below two sources.
