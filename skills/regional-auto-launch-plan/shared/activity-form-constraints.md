# Activity Form Constraints

Central contract for activity-type exclusions and preferences in `regional-auto-launch-plan`. All upstream and downstream contracts reference this file; do not duplicate its contents elsewhere.

## Exclude List (hard veto)

The following activity forms are **prohibited** in any Activity Card. A card proposing any of these must be rejected automatically.

- 大型车展（面积 >= 5000㎡ 或单场地费用 >= CNY 100k）
- 国际发布会（含海外嘉宾、跨国直播、双语物料）
- 高成本线下快闪（单点位 >= CNY 30k 或不含可追踪转化链路）
- 纯品牌曝光无转化链路的活动（无法归因到线索/试驾/订单）
- 需要 >4 周筹备周期的重搭建项目

## Preference List (positive signals)

When generating Activity Cards, **prioritize** the following forms. Preference does not mean mandatory; it means these forms score higher during idea-scorecard evaluation.

| Category | Preferred Forms | Rationale |
|---|---|---|
| 低成本线下快闪 | 商场中庭静态展、社区入口微型展位、加油站/充电站联动展示 | 低搭建、快落地、区域精准 |
| 区域化精准投放 | 本地生活平台（美团/大众点评开屏、信息流）、城市交通广播早晚高峰段、社区电梯广告 | 可按 geo 定向、成本可控、效果可追踪 |
| 数字营销为主 | 短视频平台挑战赛（Douyin）、本地 KOL 试驾直播、朋友圈定向广告（LBS 3km 圈选） | 数据回流完整、A/B 测试友好、dealer 可复用素材 |
| 可执行用户互动 | 城市试驾巡游、社区体验日、线上预约试驾抽奖 | 用户参与门槛低、线索收集直接 |
| 经销商联动闭环 | 线索分配 SOP、门店承接话术包、转化追踪看板 | 从曝光到订单的完整归因 |

## Validation Rules

When evaluating an Activity Card, apply these rules in order:

1. **Exclude check first**: If the card's core form matches any Exclude List item, mark `non-compliant` and reject.
2. **Preference scoring**: If compliant, count how many Preference List categories the card touches. More categories = higher preference score.
3. **Dealer-linkage mandatory**: Any offline card must explicitly describe dealer involvement (venue, staff, or lead handoff). Cards without this are `partial`.
4. **Traceability mandatory**: Any online card must describe how leads/orders are tracked (UTM, unique code, CRM tag). Cards without this are `partial`.

## Field Definition

In Activity Card Schema, add field `14`:

- **14. Activity Form Compliance** (`mandatory`)
  - Value: `compliant` | `partial` | `non-compliant`
  - Determined by applying Validation Rules 1-4 above.
  - Cards with `non-compliant` cannot be selected as `primary` or `alternative`.
  - Cards with `partial` require a note explaining which rule triggered it and a mitigation plan.
