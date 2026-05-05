# Activity Form Constraints

Central contract for activity-type exclusions and preferences in `regional-auto-launch-plan`. All upstream and downstream contracts reference this file; do not duplicate its contents elsewhere.

## Exclude List (hard veto)

The following activity forms are **prohibited** in any Activity Card. A card proposing any of these must be rejected automatically.

- 大型车展（conservative tier: 面积 >= 5000㎡ 或单场地费用 >= CNY 100k）
- 国际发布会（含海外嘉宾、跨国直播、双语物料）
- 高成本线下快闪（conservative tier: 单点位 >= CNY 30k，or 不含可追踪转化链路）
- 纯品牌曝光无转化链路的活动（无法归因到线索/试驾/订单）
- 需要 >4 周筹备周期的重搭建项目
- 高成本 3D 动画主导内容（conservative tier: 单条制作 >= CNY 20k 且无明确转化链路）
- 复杂设备重搭建（大型互动装置、沉浸式光影空间、重硬件调试依赖）
- 传统高投入车展打法（豪华展台、明星站台、重舞美发布会）
- 高门槛线下活动（赛车/极限驾驶/专业资质依赖，导致大众参与门槛显著升高）

Tier note:

- Apply exclusion thresholds by budget tier from `./budget-allocation-rule.md` (`conservative` / `standard` / `flagship`).
- When tier is upgraded with user confirmation, exclusion thresholds can relax according to tier table; core conversion-traceability requirements still apply.

## Preference List (positive signals)

When generating Activity Cards, **prioritize** the following forms. Preference does not mean mandatory; it means these forms score higher during idea-scorecard evaluation.

| Category | Preferred Forms | Rationale |
|---|---|---|
| 低成本线下快闪 | 商场中庭静态展、社区入口微型展位、加油站/充电站联动展示 | 低搭建、快落地、区域精准 |
| 区域化精准投放 | 本地生活平台（美团/大众点评开屏、信息流）、城市交通广播早晚高峰段、社区电梯广告 | 可按 geo 定向、成本可控、效果可追踪 |
| 数字营销为主 | 短视频平台挑战赛（Douyin）、本地 KOL 试驾直播、朋友圈定向广告（LBS 3km 圈选） | 数据回流完整、A/B 测试友好、dealer 可复用素材 |
| 可执行用户互动 | 城市试驾巡游、社区体验日、线上预约试驾抽奖 | 用户参与门槛低、线索收集直接 |
| 经销商联动闭环 | 线索分配 SOP、门店承接话术包、转化追踪看板 | 从曝光到订单的完整归因 |
| 用户共创征集 | 车主证言征集、试驾日记征集、家庭安全故事征集、话题挑战赛 | 内容成本低、信任感强、传播可裂变 |
| 轻量地标联动 | 地标 AR 扫码互动、城市既有场景轻量灯光/视觉联动 | 借势公共资源，避免重资产搭建 |
| 深度试驾促单 | 48 小时深度试驾、圈层专场试驾日（老车主/企业员工） | 真实场景说服力更强，转化效率更高 |
| 私域裂变留客 | 车主联盟计划、推荐码裂变、本地腰部 KOL/KOC 共创 | 留资到转化到复购链路更完整 |
| 大众文化热点借势 | 体育赛事、音乐节、AI/科技热点、城市级节日联动 | 非汽车圈层破圈，提升传播外溢 |
| AI/科技热点共创 | AI短视频大赛、AI海报共创、AI脚本挑战 | 降低创作门槛，扩大UGC参与 |

PREFERENCE - Circle infiltration over passive invitation (identity-conditional):

- If target buyer is family-oriented -> parent/community/school circles.
- If target buyer is family-oriented -> parent/community/school circles + high-net-worth family private scenes (private salons, art/philanthropy evenings, premium clubs).
- If target buyer is business elite -> chamber of commerce/golf/private clubs.
- If target buyer is adventure-oriented -> outdoor clubs/camping groups.
- Rationale: high-ticket buyers rarely walk into dealerships spontaneously; activities should enter their existing life circles.

PREFERENCE - Cultural moment tie-in matches buyer world (identity-conditional):

- Mass-market family buyers -> national sports events, family holidays.
- Young performance enthusiasts -> music festivals, motorsport events.
- Business elite -> art/philanthropy/finance forums.
- Forbidden for any type: industry trade shows as primary tie-in event (they attract practitioners, not buyers).

PREFERENCE - Launch event has self-propagation potential (vehicle-agnostic):

- Test question: would an attendee spontaneously photograph and share this moment?
- If no, redesign at least one element until the answer becomes yes.

## Activity Design Orientation (mandatory)

Treat the team as an organizer/orchestrator, not a heavy producer:

- Prefer leverage of existing resources (city events, partner venues, landmark traffic, owner base).
- Prefer low-cost and high-propagation user participation over heavy one-off production.
- Every activity must include measurable path: lead capture, conversion handoff, and attribution key.

## Validation Rules

When evaluating an Activity Card, apply these rules in order:

1. **Exclude check first**: If the card's core form matches any Exclude List item, mark `non-compliant` and reject.
2. **Preference scoring**: If compliant, count how many Preference List categories the card touches. More categories = higher preference score.
   - Add `+1` bonus for each of these categories when present: `大众文化热点借势`, `AI/科技热点共创`.
3. **Dealer-linkage mandatory**: Any offline card must explicitly describe dealer involvement (venue, staff, or lead handoff). Cards without this are `partial`.
4. **Traceability mandatory**: Any online card must describe how leads/orders are tracked (UTM, unique code, CRM tag). Cards without this are `partial`.
5. **Complexity sanity check**: If a card relies on high-production heavy assets (3D-heavy, complex hardware, long setup), mark `non-compliant` unless user explicitly approved exception.
6. **Industry-event-primary ban**: If an industry trade show/expo is used as the primary launch storyline event, mark `non-compliant`.

## Field Definition

In Activity Card Schema, add field `14`:

- **14. Activity Form Compliance** (`mandatory`)
  - Value: `compliant` | `partial` | `non-compliant`
  - Determined by applying Validation Rules 1-4 above.
  - Cards with `non-compliant` cannot be selected as `primary` or `alternative`.
  - Cards with `partial` require a note explaining which rule triggered it and a mitigation plan.
  - For hybrid cards, evaluate both Rule 3 and Rule 4. If both trigger `partial`, list both reasons in the note (e.g., "partial: missing dealer-linkage and missing traceability").
