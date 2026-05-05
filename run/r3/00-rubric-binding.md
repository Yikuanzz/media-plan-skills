# Rubric Binding: 奕境汽车DH1北京区域上市传播方案

## Source Rubric (from intake)
- D1 创新性 (weight 5): 
  - excellent: 有较多的创新点，具备优秀的创意方案或营销思路，方案可行性高
  - good: 有少量创新点, 方案或营销思路虽具备可行性
  - ok: 创新点不足, 且未考虑招标人的整体营销节奏安排
  - fail: 投标文件中未提供相关材料
- D2 可落地性 (weight 5):
  - excellent: 有完整的上市传播计划，考虑到关键节点，充分考虑招标人的整体营销节奏安排
  - good: 有上市传播计划但不够完整，不完全契合招标人的整体营销节奏安排
  - ok: 对招标人的整体营销节奏安排考虑欠缺，上市传播计划可操作性不强
  - fail: 可操作性差或未提供相关材料，或无法完成招标人整体营销计划
- D3 竞品对标 (weight 5):
  - excellent: 对重点城市市场、客户、本品、竞品有全面和深入分析
  - good: 对重点城市市场、客户、本品、竞品有一定分析但不够深入
  - ok: 对重点城市市场、客户、本品、竞品仅有基础分析，可执行性欠缺
  - fail: 投标文件中未对此项内容进行分析
- D4 品牌契合度 (weight 5):
  - excellent: 方案与品牌调性、车型定位完美契合
  - good: 方案与品牌调性、车型定位大部分契合
  - ok: 方案与品牌调性、车型定位少部分契合
  - fail: 方案与品牌调性、车型定位完全不契合
- D5 方案逻辑性 (weight 5):
  - excellent: 方案完整、逻辑严密
  - good: 方案比较完整、逻辑比较严密
  - ok: 方案不完整、逻辑较为混乱
  - fail: 投标文件中未对此项内容进行分析

## Binding Map

| Tender Dim | Weight | Internal Evidence | Surface in Proposal | Gap |
|---|---|---|---|---|
| D1 创新性 | 5 | idea-scorecard.Freshness avg ≥ 7; Divergence Quality avg ≥ 6; ≥3 S-tier leads with HS lineage; crazy_dose 双剂量创意标记 | 提案 §2 "创新引爆点"章节 / Lead 活动卡的创新标签 / 每个核心活动的差异化亮点说明 | 无 |
| D2 可落地性 | 5 | safe_dose 全覆盖; Hotspot Timeline 每条 lead 有明确窗口落点; 北京本地渠道资源矩阵完整; KPI可量化; 活动复盘机制明确 | 提案 §3 "上市前中后执行方案" / 时间线甘特图 / §5 "后效提升与复盘体系" / 北京本地执行资源清单 | 无 |
| D3 竞品对标 | 5 | Insight CL-* 竞品原子 ≥5 条; 北京区域竞品具体营销动作拆解 ≥3 家; 同期竞品 HS-* 热点借势分析; 本品差异化定位对比 | 提案 §1 "北京市场与竞品对标分析" / 竞品营销策略矩阵 / 本品差异化优势对照表 | 待补 CL 原子与北京区域竞品具体案例 |
| D4 品牌契合度 | 5 | Narrative Spine core_tension 与"华系车的技术极客"对齐; ≥80% leads 的包装标注 direct 或 reworked alignment; brand_tonality_anchors (技术极客/央企品质/家庭责任/华为背书) 全覆盖 | 提案 §0 "方案核心策略与品牌契合度说明" / 每个活动的品牌调性匹配标签 / 华为技术×东风品质双背书贯穿设计 | 无 |
| D5 方案逻辑性 | 5 | 端到端逻辑链完整: Insight → Hotspot → Spine → Cards → Pool → Strategy; Energy Curve 强度分布符合传播规律; Review Pass 全部章节自检通过 | 提案全文逻辑架构: 市场洞察 → 策略定位 → 创新引爆 → 执行节奏 → 竞品对标 → 复盘提升 / 每个章节过渡有逻辑衔接段 | 无 |

## Gap Resolution

- Gaps must be closed before declaring `## Rubric Binding complete`.
- Each gap lists the upstream phase to return to.

### Current Gaps
1. **D3 竞品对标**: 需要补充北京区域竞品（问界/理想/蔚来）的具体营销动作案例，将在 Insight 阶段收集 CL-* 竞品原子时一并补充。
   - Return route: Insight (CL 竞品模块) + Hotspot Harvest (竞品同期热点动作交叉分析)

## Surface Guidance

The proposal writing must explicitly **name** which tender dimension each chapter / section serves. Procurement evaluators search by their rubric — chapters that don't surface the rubric language risk being scored as missing.

### Proposal Chapter Rubric Tagging Plan
- 第一章 北京市场与竞品对标分析 → **D3 竞品对标**
- 第二章 方案核心策略与品牌契合度 → **D4 品牌契合度**
- 第三章 创新营销引爆点 → **D1 创新性**
- 第四章 上市前中后全周期执行方案 → **D2 可落地性**
- 第五章 后效提升与活动复盘机制 → **D2 可落地性**
- 全文逻辑架构与衔接说明 → **D5 方案逻辑性**

---

## Quality Gate
- [x] Every tender dimension in `intake.evaluation_rubric_breakdown` appears in the binding map.
- [x] Every binding entry has at least one **internal evidence** source plus a **surface in proposal** location.
- [x] Gaps are listed with upstream-phase return route.
- [x] No tender dimension is left as "待补" without a return route.

## Rubric Binding Status
complete (1 gap tracked with return route to Insight phase)
