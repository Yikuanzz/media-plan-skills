# Brief Intake Template

Intake is the **single source of project-specific variables**. Every downstream phase and shared file resolves placeholders (`{target_city}` / `{brand}` / `{product}` / `{launch_window}` / etc.) by reading this document. Do **not** hardcode the previous brief's city, brand, calendar, or rubric into any skill file — change them here, and the entire workflow re-targets.

## Required Fields (research-start)

These must be present before Insight starts.

| Field | Description | Example values |
|---|---|---|
| `business_goal` | Campaign objective | "首款车在某重点城市的上市传播声量与到店转化" |
| `brand` | Brand name (used in copy and `{brand}` placeholder) | "奕境 / 蔚来 / 极氪 / 智界 / 阿维塔 / ..." |
| `product` | Product / model name (`{product}` placeholder) | "DH1 / ET9 / 9X / S7 / ..." |
| `category` | Product category (`{category}` placeholder for queries) | "新能源旗舰 SUV / 中大型 MPV / 高端轿车 / ..." |
| `target_city` | Primary launch city (`{target_city}` placeholder) | "北京 / 上海 / 成都 / 杭州 / 武汉 / 深圳 / ..." |
| `target_audience` | Primary and secondary audiences | "30-45 岁中产家庭决策者 / 一线高净值人群 / ..." |
| `launch_window` | Concrete launch month or week (`{launch_window}` placeholder) | "2026-06 / 2026-09 / 2026 暑期" |
| `timeline` | Start and end dates, key milestones | preheat / launch / post-launch dates |
| `budget_or_resource_level` | Budget range or resource constraints | "高 / 中 / 低 / 具体 ¥ 区间" |
| `geography_or_region` | Target cities/regions (full set; `target_city` is the lead one) | ["北京", "上海"] / ["华东"] |
| `channel_constraints` | Preferred or excluded channels | "线下偏重 / 仅线上 / 不投短视频 / ..." |

## Tender / Procurement Fields (when `bid_or_tender = true`)

These drive `./shared/scoring-rubric-binding.md` so the workflow can self-check against any procurement rubric, not a hardcoded one.

| Field | Description |
|---|---|
| `bid_or_tender` | true / false |
| `evaluation_rubric_breakdown` | List of scoring dimensions with weight and pass criteria. Free-form per tender. See structure below. |
| `tender_technical_requirements` | Mandatory technical submission requirements |
| `client_master_calendar` | Client-side events to avoid or align with |

### `evaluation_rubric_breakdown` shape

```yaml
evaluation_rubric_breakdown:
  - dim_id: D1
    name: "创新性"
    weight: 5
    criteria:
      excellent: "有较多的创新点，具备优秀的创意方案或营销思路，方案可行性高"
      good: "有少量创新点, 方案或营销思路虽具备可行性"
      ok: "创新点不足, 且未考虑招标人的整体营销节奏安排"
      fail: "投标文件中未提供相关材料"
  - dim_id: D2
    name: "可落地性"
    weight: 5
    criteria: { ... }
  # ... add as many dimensions as the tender specifies
```

The workflow does **not** assume a fixed 5-dimension rubric. Tenders vary — `scoring-rubric-binding.md` reads whatever dimensions appear here and binds them.

## Later-Stage Fields

- `deliverables_needed`: Expected outputs (PPT / docx / 电子标 / 音视频 / 路演 etc.)
- `constraints`: Hard constraints (legal, brand, central-SOE etiquette, regulatory)
- `success_metric`: KPIs and measurement approach

## Optional Fields

- `competitor_set`: Competitors to benchmark against (`{competitor_set}` for queries)
- `brand_tonality_anchors`: Brand voice / personality anchors that bound `crazy_dose` permission (e.g. 央企调性 / 极客调性 / 烟火气)
- `client_master_calendar`: Client events to align with

## Variable Reference (resolved during workflow)

When skill files reference `{target_city}` / `{brand}` / `{product}` / `{launch_window}` / `{category}` / `{competitor_set}` / `{evaluation_rubric}` etc., the runtime resolves them by reading **this document only**. Skill files must never hardcode a specific city, brand, or rubric — those leak previous-brief context into the next brief.

## Output Shape

```markdown
## Intake Summary
- business_goal: ...
- brand: ...
- product: ...
- category: ...
- target_city: ...
- target_audience: ...
- launch_window: ...
- timeline: ...
- budget_or_resource_level: ...
- geography_or_region: ...
- channel_constraints: ...
- deliverables_needed: ...
- constraints: ...
- success_metric: ...
- bid_or_tender: ...
- competitor_set: ...
- brand_tonality_anchors: ...

## Evaluation Rubric (when bid_or_tender = true)
- D1 创新性 (weight 5):
    excellent: ...
    good: ...
    ok: ...
    fail: ...
- D2 ...

## Intake Status
ready / blocked
```
