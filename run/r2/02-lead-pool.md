# Lead Pool: 2026奕境DH1北京上市传播

## Cluster Summary

| # | Cluster Name | HS Lineage | RI Sources | Lead | Packaging |
|---|---|---|---|---|---|
| C1 | 世界杯移动观赛包厢 | HS-001, HS-012 | RI-001, RI-004 | L001 | direct |
| C2 | 世界杯酒吧观赛+接送 | HS-001, HS-012 | RI-003, RI-004 | L002 | reworked |
| C3 | 618品质消费叙事 | HS-002 | RI-005, RI-006, RI-008 | L003 | direct |
| C4 | 遛娃自驾京郊路书 | HS-004, HS-014 | RI-013, RI-015, RI-016 | L004 | direct |
| C5 | 安全座椅挑战 | HS-004, HS-014 | RI-014 | L005 | direct |
| C6 | 中年觉醒代际叙事 | HS-005 | RI-017, RI-020 | L006 | direct |
| C7 | 摇号8年痛点 | HS-005, HS-009 | RI-019 | L007 | reworked |
| C8 | 绿心音乐节移动客厅 | HS-006 | RI-021, RI-023 | L008 | direct |
| C9 | 央企总师IP | HS-010, HS-011 | RI-035, RI-037 | L009 | reworked |
| C10 | 央企老干部人设 | HS-010, HS-011 | RI-036 | L010 | reworked |
| C11 | 车展不等了竞品对决 | HS-008 | RI-028, RI-031 | L011 | direct |
| C12 | 父亲节换座试驾 | HS-003 | RI-011 | L012 | direct |
| C13 | 商圈白车身透明展 | HS-009 | RI-032, RI-033 | L013 | direct |
| C14 | 618反向营销(退款换车) | HS-002 | RI-007 | L014 | rejected |

**Fusion notes**:
- RI-001 + RI-004 (C1): 车内观赛包厢 + 深夜接送 → fusion into L001 (世界杯家庭观赛场景)
- RI-003 + RI-004 partial (C2): 酒吧观赛 + 接送 → L002 as reworked lead
- RI-005 + RI-006 + RI-008 (C3): 安心清单 + 定金膨胀 + 供应商直播 → fusion into L003 (618品质消费母事件)
- RI-013 + RI-015 + RI-016 (C4): 胡同到阿那亚 + 智驾实测 + 出京路书 → fusion into L004 (京郊智驾路书)
- RI-017 + RI-020 (C6): 三代人座驾 + 主TVC → fusion into L006 (代际叙事母事件)
- RI-028 + RI-031 (C11): 不等了 + 181台记住谁 → fusion into L011 (车展空窗期切入)
- RI-032 + RI-033 (C13): 最后安心一站 + 白车身透明展 → fusion into L013 (商圈品质触点)
- RI-035 + RI-037 (C9): 总师IP + 东风老员工 → fusion into L009 (央企人格化IP)
- RI-021 + RI-023 (C8): 音乐节移动客厅 + 大剧院联名 → fusion into L008

**Rejected**:
- L014 (RI-007 618退款换车): spine_friction high, tone_shift 和 dose_flip 均无法解决"蹭热点/道德绑架"摩擦, 详见下方

**Archived** (absorbed into fused leads, not rejected):
- RI-002 (车机皮肤) → absorbed into L001 世界杯场景子模块
- RI-009 (夏至最长自驾) → absorbed into L004 京郊路书
- RI-010 (安心粽子) → absorbed into L008 音乐节场景子模块
- RI-012 (六一车) → absorbed into L005 安全座椅挑战
- RI-018 (中年购物车) → absorbed into L006 代际叙事
- RI-022 (音乐节安心回家) → absorbed into L008
- RI-024 (音乐节vlog) → absorbed into L008
- RI-029 (六座盲测) → kept as concept note for Strategy Plan optional use
- RI-030 (车展错觉) → absorbed into L011
- RI-034 (DH1穿胡同) → absorbed into L004 京郊路书
- RI-038 (华为工程师直播) → kept as concept note for L009 子模块

---

## Leads

### L001: 世界杯移动观赛包厢

```yaml
id: L001
hook: "把世界杯搬进DH1后排"
concept: DH1后排大屏+鸿蒙座舱变身移动观赛包厢, 北京多地做"车内看球"体验日

hotspot_lineage: [HS-001, HS-012]
divergence_card: D-ME-1
source_raw_ideas: [RI-001, RI-004, RI-002]

public_heat_signal: "HS-001: 2026 FIFA美加墨世界杯(6/11-7/19), 全球50亿观众, 北京家庭观赛场景爆发; HS-012: 世界杯×汽车跨界空白, 现代汽车已在韩国做试驾+世界杯观赛联动"
angle_of_entry: "世界杯深夜场制造'全家抢遥控器+酒吧散场打车难'痛点 → DH1后排空间+鸿蒙娱乐屏天然变成移动观赛包厢 → 车内看球不是噱头而是真实场景解决方案"
spine_bridge: "通过'家人在DH1后排看球笑了'的画面, 实现焦虑→好奇→体验的状态迁移; 世界杯是触发时机, DH1后排是解决方案, 两者通过'全家观赛空间不足'的痛点因果连接"
shallow_stack_check: "不是'世界杯+车'并排——是用DH1后排空间解决'全家看球抢遥控器'的真实痛点, 车内观赛是功能而非噱头"

value_category: 够新鲜
execution_tier: S级

packaging_pass: direct
narrative_roles:
  primary: Ignition
  secondary:
    - Participation
    - Social Currency
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.25
    secondary_role_2: 0.15

narrative_alignment:
  serves_transition: "焦虑 → 好奇 → 体验"
  emotional_target: 好奇
  trigger_mechanism: social_proof

story_function: "用世界杯全民注意力建立'DH1后排=移动观赛包厢'的记忆锚点, 同时证明鸿蒙座舱的家庭娱乐价值"

memory_anchor:
  anchor: "工体外场20辆DH1排成露天观赛厅, 车灯全灭只剩大屏亮着, 500个家庭在车里看世界杯"
  type: visual
  memorability_test: "一年后能描述'在车里看世界杯'的画面吗? 能, 因为这不是广告而是体验"
  one_sentence_recall: "世界杯在DH1后排看, 比客厅还舒服"

lifecycle_stage: 上市期→延续期
target_audience: "北京30-40岁男性+家庭决策者, 世界杯观众, 有车或正在选车"
budget_level: "S级: 线下观赛活动(多场地)+微博直播+抖音同城+小红书内容投放"

insight_links: [PV-002, PV-005, HS-001, HS-012, CS-006, AU-001]
channels: [抖音同城, 微博直播, 小红书, 微信视频号, 线下(工体/三里屯/昌平合生汇)]
kpi_targets: "曝光3000万+, 线下参与500+家庭, 试驾预约转化2000+, 微博话题阅读5000万"

lead_status: active
lead_confidence: 88
lead_uniqueness: 92
lead_overlap_score: 10

fusion_candidates: []
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 工体外场停20辆DH1做成露天观赛包厢, 免费请500个家庭边看球边试驾, 微博直播"北京最大移动观赛厅"; 小组赛期间每场深夜比赛10辆DH1在三里屯/工体门口免费接人, 车内播回放+送早餐
- **safe_dose**: 昌平超级合生汇店内设DH1"后排观赛体验区", 周末邀请预约家庭车内看小组赛, 试驾后送世界杯周边; 决赛夜3辆DH1在合作酒吧做"安全回家"服务, 试驾预约+品牌好感

---

### L002: 世界杯酒吧观赛联盟

```yaml
id: L002
hook: "全家看球, DH1买单"
concept: 世界杯小组赛期间, 北京合作餐厅/酒吧设DH1专属观赛桌, 到店扫码抽试驾

hotspot_lineage: [HS-001, HS-012]
divergence_card: D-CR-1
source_raw_ideas: [RI-003, RI-004]

public_heat_signal: "HS-001: 世界杯北京家庭观赛+酒吧聚会场景爆发; HS-012: 世界杯×汽车跨界空白"
angle_of_entry: "世界杯观赛需要'出行方案'(深夜散场回家难/全家抢空间) → DH1在合作酒吧设专属观赛桌并承接深夜接送 → 出行痛点变成试驾入口"
spine_bridge: "通过'观赛→打车难→DH1接送→试驾预约'的体验链路, 将好奇推进到体验阶段; DH1不是赞助商而是解决方案"
shallow_stack_check: "观赛场景天然需要出行方案, DH1用NVH+座椅解决'凌晨回家不吵家人'——这是因果链不是并排"

value_category: 够爆
execution_tier: A级

packaging_pass: reworked
rework_note: |
  原始 crazy_dose: "承包三里屯一整条酒吧街的投影幕, DH1车队巡游"
  Spine 摩擦点: "承包酒吧街偏土豪调性, 与央企稳重有摩擦; '免费接送'有合规风险"
  采用策略: tone_shift + dose_flip
  保留: "合作酒吧观赛+DH1接送"的体验链路机制
  改写: crazy_dose降维为20家合作酒吧+决赛夜接送; safe_dose聚焦合规试驾预约通道

narrative_roles:
  primary: Converter
  secondary:
    - Amplifier
  role_weights:
    primary_role: 0.7
    secondary_role_1: 0.3

narrative_alignment:
  serves_transition: "好奇 → 体验"
  emotional_target: 体验
  trigger_mechanism: reward_unlock

story_function: "将世界杯酒吧观赛的社交场景转化为DH1到店试驾的转化链路"

memory_anchor:
  anchor: "酒吧散场, DH1停在门口等你——车里播着比赛回放, 座椅按摩已开启"
  type: interaction
  memorability_test: "一年后能描述'DH1在酒吧门口接我'的体验吗? 能, 因为那是真实的回家路"
  one_sentence_recall: "看球去酒吧, 回家坐DH1"

lifecycle_stage: 上市期→延续期
target_audience: "北京28-40岁男性, 世界杯酒吧观赛人群"
budget_level: "A级: 酒吧合作+抖音同城直播+试驾运营"

insight_links: [PV-002, HS-001, HS-012, CS-006]
channels: [抖音同城, 微博话题, 合作酒吧线下, 微信小程序(预约)]
kpi_targets: "曝光1500万+, 合作酒吧20家, 试驾预约1000+, 话题阅读3000万"

lead_status: active
lead_confidence: 78
lead_uniqueness: 80
lead_overlap_score: 25

fusion_candidates: [L001]
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 与北京20家中高端运动酒吧合作, 世界杯期间设"奕境观赛专区"; 决赛夜5辆DH1在合作酒吧做"安全回家"服务
- **safe_dose**: 与北京10家合作酒吧设DH1观赛桌, 到店扫码预约试驾; 决赛夜3辆DH1接送, 试驾预约+品牌好感

---

### L003: 618品质消费节(定金膨胀+供应商联合)

```yaml
id: L003
hook: "618不买家电, 买全家安心"
concept: 618期间做"家庭品质消费清单"H5+定金膨胀权益+供应商联合直播, DH1是清单上的终极安心选项

hotspot_lineage: [HS-002]
divergence_card: D-TA-1
source_raw_ideas: [RI-005, RI-006, RI-008]

public_heat_signal: "HS-002: 618年中购物节(6/1-6/18), 上半年最大消费节点, 汽车品类首次大规模加入"
angle_of_entry: "618的消费焦虑是'买了很多但没买到安心' → DH1做'家庭品质消费清单'把DH1定义为清单终极选项 → 定金膨胀+供应商联合直播作为转化引擎"
spine_bridge: "通过618消费焦虑→安心清单→DH1品质证明的链路, 实现好奇→体验的状态迁移; 618是触发时机, DH1的75家供应商是品质证据"
shallow_stack_check: "DH1不是618凑单品, 而是'品质消费清单'的答案; 定金膨胀是行业玩法但'华为全家桶'联动是奕境独有的华为合作叙事"

value_category: 够新鲜
execution_tier: A级

packaging_pass: direct
narrative_roles:
  primary: Converter
  secondary:
    - Proof
    - Retainer
  role_weights:
    primary_role: 0.5
    secondary_role_1: 0.3
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "好奇 → 体验"
  emotional_target: 体验
  trigger_mechanism: reward_unlock

story_function: "利用618消费节点将DH1的品质叙事转化为具体的购买行动(定金膨胀)和信任证据(供应商联合)"

memory_anchor:
  anchor: "618元定金膨胀至6180元, 买DH1送华为全家桶(手表+平板+耳机)"
  type: interaction
  memorability_test: "一年后能描述'618用买手机的钱定了一辆车'吗? 能, 因为定金数字和华为礼包有记忆点"
  one_sentence_recall: "618定金膨胀, 用买手机的钱定一辆DH1"

lifecycle_stage: 揭秘期→上市期
target_audience: "北京28-45岁网购主力, 正在选车的家庭, 比价型消费者"
budget_level: "A级: H5开发+线上投放+华为生态合作+供应商直播"

insight_links: [PV-003, PV-004, PV-005, HS-002, ME-003, AU-001]
channels: [奕境官网/小程序, 京东618专区, 抖音电商直播, B站直播, 微信社群]
kpi_targets: "H5访问50万+, 定金订单800+, 直播观看200万+, 曝光5000万"

lead_status: active
lead_confidence: 82
lead_uniqueness: 75
lead_overlap_score: 15

fusion_candidates: []
fusion_strategy: n/a
```

**Dual-dose**:
- **crazy_dose**: 618当天在京东主会场旁边搭DH1快闪体验馆; 75家供应商各出一位"品质官"做618接力直播; 定金618元膨胀至6180元+华为全家桶
- **safe_dose**: 618期间奕境官网/小程序上线"家庭品质消费清单"H5; 精选5家核心供应商(宁德时代/博世/米其林/福耀/采埃孚)做618联合直播; 定金膨胀+华为生态礼包

---

### L004: 京郊智驾路书(DH1的一日)

```yaml
id: L004
hook: "从胡同到阿那亚, DH1的一日"
concept: 邀请北京真实家庭做DH1京郊自驾直播, 全程记录后排孩子反应+智驾实测

hotspot_lineage: [HS-004, HS-014, HS-008]
divergence_card: D-RL-3
source_raw_ideas: [RI-013, RI-015, RI-016, RI-034]

public_heat_signal: "HS-004: 小红书#遛娃式自驾话题, 3万+笔记, 38%发自北京/河北周边; HS-014: #带娃自驾流派分类讨论(安全座椅派/后排娱乐派/后备箱露营派)"
angle_of_entry: "小红书遛娃自驾的叙事是'有了车才真正觉得当上了父母' → DH1用'胡同出发→阿那亚一日'的真实场景证明增程1200km+六座空间 → 智驾接管次数是技术证据而非参数轰炸"
spine_bridge: "通过'全家自驾→后排孩子安静了→父母安心了'的体验链路, 实现好奇→体验→确信的状态迁移; 自驾路线是DH1续航和空间的场景化载体"
shallow_stack_check: "自驾路线是DH1增程1200km+六座空间的真实场景证明, 不是旅行vlog; 智驾接管次数是技术证据而非参数对轰"

value_category: 够新鲜
execution_tier: S级

packaging_pass: direct
narrative_roles:
  primary: Proof
  secondary:
    - Participation
    - Social Currency
  role_weights:
    primary_role: 0.5
    secondary_role_1: 0.3
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "好奇 → 体验 → 确信"
  emotional_target: 确信
  trigger_mechanism: social_proof

story_function: "用真实场景证明DH1的续航/空间/智驾, 替代参数对轰, 让身体投票"

memory_anchor:
  anchor: "从胡同出发, 三小时后全家在阿那亚海滩, 孩子在DH1后排安全座椅上睡着了——全程智驾接管92%"
  type: visual
  memorability_test: "一年后能描述'从北京开到阿那亚孩子全程没闹'的画面吗? 能, 因为这是父母的日常"
  one_sentence_recall: "DH1的一日: 从胡同到阿那亚, 全家都说好"

lifecycle_stage: 揭秘期→上市期→延续期
target_audience: "北京30-40岁中产父母, 周末或小长假短途自驾"
budget_level: "S级: KOC家庭招募+直播+路书H5+抖音/小红书内容投放"

insight_links: [PV-001, PV-002, PV-003, HS-004, HS-014, CS-002, AU-005]
channels: [小红书, 抖音同城, B站, 微信视频号, DH1路书H5]
kpi_targets: "直播观看500万+, 路书H5访问30万+, 小红书笔记2000+, 试驾预约3000+"

lead_status: active
lead_confidence: 90
lead_uniqueness: 88
lead_overlap_score: 12

fusion_candidates: []
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 同时发10辆DH1从北京4个方向出发(胡同/国贸/望京/中关村), 直播哪条线最快到阿那亚; 雨夜实测: 选北京最堵+最差天气, DH1从国贸开上草原天路, 全程直播智驾接管次数; DH1穿胡同挑战窄路通过性
- **safe_dose**: 邀请3个KOC家庭做北京→阿那亚DH1自驾vlog, 小红书/抖音同步发布; 白天好天气中关村→古北水镇DH1智驾体验日, 邀请媒体+KOC全程记录; DH1路书H5上线(4条出京路线)

---

### L005: DH1后排安全座椅挑战赛

```yaml
id: L005
hook: "DH1后排安全座椅挑战赛"
concept: 小红书#DH1安全座椅挑战: 爸妈拍孩子坐进DH1后排第一反应, 3秒模板超低门槛

hotspot_lineage: [HS-004, HS-014]
divergence_card: D-CR-1
source_raw_ideas: [RI-014, RI-012]

public_heat_signal: "HS-004: 小红书#遛娃式自驾; HS-014: #带娃自驾流派(安全座椅派)"
angle_of_entry: "安全座椅是'家庭安全的最小单位' → DH1航空级座椅的具象化 → 小红书3秒挑战模板让UGC参与成本极低"
spine_bridge: "通过'拍孩子坐进DH1后排第一反应'的UGC, 实现体验→确信的迁移; 安全座椅是Spine symbolic_object的直接表达"
shallow_stack_check: "安全座椅是DH1航空级座椅的具象化, 不是'话题+卖点'——孩子坐进去的反应是真实体验"

value_category: 够亮眼
execution_tier: A级

packaging_pass: direct
narrative_roles:
  primary: Participation
  secondary:
    - Social Currency
    - Amplifier
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.2
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "体验 → 确信"
  emotional_target: 确信
  trigger_mechanism: ugc_invite

story_function: "用低门槛UGC挑战放大'全家人的后排'这一象征符号, 生成社交货币"

memory_anchor:
  anchor: "孩子坐进DH1安全座椅第一秒的表情变化——从好奇到舒服到笑"
  type: interaction
  memorability_test: "一年后能描述'孩子坐进DH1就笑了'吗? 能, 这是每个父母都见过的画面"
  one_sentence_recall: "DH1安全座椅挑战: 3秒记录孩子的第一反应"

lifecycle_stage: 揭秘期→上市期
target_audience: "北京30-40岁中产父母, 小红书活跃用户"
budget_level: "A级: 话题运营+KOC种子用户+三里屯装置(可选)+试驾店体验区"

insight_links: [PV-002, HS-004, HS-014, AU-003]
channels: [小红书, 抖音, 线下(三里屯太古里/试驾店)]
kpi_targets: "话题参与3000+, 小红书笔记5000+, 曝光5000万, 试驾引流1500+"

lead_status: active
lead_confidence: 85
lead_uniqueness: 82
lead_overlap_score: 20

fusion_candidates: [L004]
fusion_strategy: audience
```

**Dual-dose**:
- **crazy_dose**: 三里屯太古里做"巨型安全座椅"艺术装置, 路人可以坐进去拍照, DH1实车在旁边; 儿童节朝阳公园DH1"亲子移动乐园"5辆车变身5个主题游戏空间
- **safe_dose**: 线上#DH1安全座椅挑战话题+试驾店内设安全座椅体验区, 上传照片抽周边; 儿童节期间到店试驾家庭送DH1限定"安全座椅毛绒版"周边

---

### L006: 三代人座驾(主TVC+纪录片)

```yaml
id: L006
hook: "我爸的车, 我的车, DH1"
concept: 三代人座驾纪录片: 父亲的桑塔纳→我的BBA→下一辆选DH1, 北京老中青三代对谈+主TVC

hotspot_lineage: [HS-005]
divergence_card: D-SR-2
source_raw_ideas: [RI-017, RI-020]

public_heat_signal: "HS-005: 知乎'中年觉醒'高赞讨论, 35-45岁北京中产男性对'换车=换人生阶段'的集体反思"
angle_of_entry: "中年觉醒的核心情绪不是焦虑而是'终于知道自己要什么了'的释然 → 三代人座驾叙事用桑塔纳→BBA→DH1的代际演进表达跨代信任 → DH1是'央企×华为'的跨代共识"
spine_bridge: "通过'父辈信任+自己认可=DH1'的代际叙事, 实现体验→确信→归属的迁移; 这是Spine core_tension'家人坐进去那一秒'的情感前置"
shallow_stack_check: "代际叙事是DH1'央企×华为'跨代信任的产品真相, 不是情怀绑架; 桑塔纳→BBA→DH1是北京中产家庭的真实换车轨迹"

value_category: 够新鲜
execution_tier: S级

packaging_pass: direct
narrative_roles:
  primary: Ignition
  secondary:
    - Proof
    - Retainer
  role_weights:
    primary_role: 0.5
    secondary_role_1: 0.3
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "体验 → 确信 → 归属"
  emotional_target: 归属
  trigger_mechanism: social_proof

story_function: "建立DH1的品牌情感锚点——跨代信任, 用真实家庭故事替代参数对轰"

memory_anchor:
  anchor: "父亲坐进DH1后排说'这车比我当年开的桑塔纳舒服多了', 孩子在旁边笑了"
  type: visual
  memorability_test: "一年后能描述'三代人座驾'的画面吗? 能, 因为每个北京中年男人都有这个故事"
  one_sentence_recall: "我爸的桑塔纳, 我的BBA, 下一辆DH1"

lifecycle_stage: 悬念期→揭秘期→上市期
target_audience: "北京35-45岁中年男性(二胎父亲), 经历过至少一次换车"
budget_level: "S级: TVC制作+纪录片拍摄+户外大屏投放(可选)+视频号/B站投放"

insight_links: [PV-004, PV-006, HS-005, CS-005, AU-002, AU-004]
channels: [微信视频号, B站, 抖音, 知乎, 户外大屏(国贸/三里屯-可选)]
kpi_targets: "TVC播放1000万+, 纪录片完播率40%+, 知乎讨论500+, 情感共鸣指数8.5+"

lead_status: active
lead_confidence: 87
lead_uniqueness: 90
lead_overlap_score: 8

fusion_candidates: []
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 邀请北京真实家庭拍"三代人的车"短片, 在国贸/三里屯户外大屏轮播, 征集100个家庭故事; 主TVC投北京所有户外大屏连续7天, 配合微博话题#终于知道了#
- **safe_dose**: 奕境官微发布1支3分钟"三代人座驾"纪录片, 微信视频号+B站投放; 主TVC线上发布(微信视频号+B站+抖音), 朋友圈定向投放北京30-45岁人群

---

### L007: 摇号8年车主故事

```yaml
id: L007
hook: "摇号8年, 终于等到你"
concept: 北京"摇号8年"真实车主故事, DH1给这批最焦虑的购车者专属权益

hotspot_lineage: [HS-005, HS-009]
divergence_card: D-SR-1
source_raw_ideas: [RI-019]

public_heat_signal: "HS-005: 中年觉醒讨论; HS-009: 北京摇号+限行政策制造'一步到位'购车心理"
angle_of_entry: "北京摇号8年是独有痛点 → DH1'一步到位'旗舰定位是真实解药 → 用真实车主故事+专属试驾通道建立情感共鸣"
spine_bridge: "通过'等了8年终于不用再将就'的叙事, 实现焦虑→好奇→体验的迁移; DH1不是趁火打劫而是'终于等到的答案'"
shallow_stack_check: "摇号焦虑是北京独有痛点, DH1'一步到位'是真实解药——不是蹭热点而是承接8年等待的情绪出口"

value_category: 够爆
execution_tier: A级

packaging_pass: reworked
rework_note: |
  原始 crazy_dose: "在北京地铁10号线包一列地铁做'摇号8年专列'"
  Spine 摩擦点: "包地铁可能触碰'央企铺张'红线, 与Spine'不端着但有温度'调性冲突"
  采用策略: dose_flip + tone_shift
  保留: "摇号8年"的真实痛点和"终于等到"的情绪出口
  改写: 从包地铁降维为线上精准投放(微信朋友圈+视频号); 调性从"土豪包场"转为"一封给摇号8年的你的公开信"

narrative_roles:
  primary: Amplifier
  secondary:
    - Converter
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.4

narrative_alignment:
  serves_transition: "焦虑 → 好奇 → 体验"
  emotional_target: 好奇
  trigger_mechanism: social_proof

story_function: "用北京独有摇号痛点制造共鸣话题, 将焦虑转化为DH1试驾行动"

memory_anchor:
  anchor: "一封给摇号8年的你的公开信——8年了, 这次不用再选错了"
  type: slogan
  memorability_test: "一年后能描述'摇号8年终于等到DH1'吗? 能, 因为8年是北京车主的共同记忆"
  one_sentence_recall: "摇号8年, 终于等来一步到位的DH1"

lifecycle_stage: 悬念期→揭秘期
target_audience: "北京摇号8年以上的购车者, 30-45岁中产家庭"
budget_level: "A级: 内容制作+微信朋友圈定向投放+专属试驾通道运营"

insight_links: [CS-001, HS-005, HS-009, AU-001, AU-002]
channels: [微信视频号, 微信朋友圈定向, 微信公众号, 抖音同城, 知乎]
kpi_targets: "公开信阅读50万+, 朋友圈点击率5%+, 专属试驾预约2000+, 话题讨论5000+"

lead_status: active
lead_confidence: 75
lead_uniqueness: 85
lead_overlap_score: 18

fusion_candidates: [L006]
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 北京地铁10号线包列"摇号8年专列"(已否决, 央企铺张红线)
- **safe_dose**: 奕境官微发"给摇号8年的你"公开信+专属试驾通道, 微信朋友圈定向投放北京30-45岁人群

---

### L008: 绿心音乐节移动客厅

```yaml
id: L008
hook: "DH1是音乐节的移动客厅"
concept: 绿心森林音乐节现场DH1"家庭观演包厢": 车外是音乐节, 车内是孩子午睡+老人休息

hotspot_lineage: [HS-006, HS-003]
divergence_card: D-ME-3
source_raw_ideas: [RI-021, RI-023, RI-022, RI-024, RI-010]

public_heat_signal: "HS-006: 2026北京绿心森林音乐节(5/29-6/7), 国家大剧院主办, 户外艺术+露营+市集; HS-003: 端午/夏至双节"
angle_of_entry: "音乐节带娃痛点(孩子午睡/老人休息/散场挤地铁) → DH1六座+空调+娱乐变成移动客厅 → 音乐节露营场景直接暴露DH1家庭出行价值"
spine_bridge: "通过'音乐节→DH1车内休息→散场安心回家'的体验链路, 实现好奇→体验的迁移; DH1不是赞助商而是音乐节家庭的移动客厅"
shallow_stack_check: "音乐节露营场景直接暴露DH1'六座+空调+娱乐'的家庭出行真相, 不是logo贴; 国家大剧院品质背书×央企品质是品牌契合"

value_category: 够新鲜
execution_tier: A级

packaging_pass: direct
narrative_roles:
  primary: Participation
  secondary:
    - Social Currency
    - Amplifier
  role_weights:
    primary_role: 0.5
    secondary_role_1: 0.3
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "好奇 → 体验"
  emotional_target: 体验
  trigger_mechanism: ugc_invite

story_function: "用音乐节场景证明DH1的家庭出行价值, 同时建立与国家大剧院的品质关联"

memory_anchor:
  anchor: "音乐节露营区, DH1围成半圆——车里孩子睡着了, 车外是音乐会直播"
  type: visual
  memorability_test: "一年后能描述'DH1在音乐节当移动客厅'吗? 能, 因为带娃逛音乐节的人都懂"
  one_sentence_recall: "音乐节不用带帐篷, 开DH1就行"

lifecycle_stage: 悬念期→揭秘期(5/29音乐节开幕即启动)
target_audience: "北京25-40岁文艺青年+亲子家庭, 有车且愿意为文化消费买单"
budget_level: "A级: 音乐节现场体验区+小红书/抖音KOL内容+国家大剧院联名权益"

insight_links: [PV-002, PV-004, HS-006, HS-003, CS-003, AU-003]
channels: [小红书, 抖音同城, 大麦, 北京本地宝, 音乐节现场]
kpi_targets: "现场体验1000+家庭, 小红书笔记3000+, 曝光2000万, 试驾预约1500+"

lead_status: active
lead_confidence: 83
lead_uniqueness: 85
lead_overlap_score: 15

fusion_candidates: []
fusion_strategy: scene
```

**Dual-dose**:
- **crazy_dose**: 音乐节露营区设"DH1专属观演位", 10辆DH1围成半圆, 车外投影放音乐会直播; 开幕式DH1车队灯光秀; 每组亲子KOL同一天做DH1音乐节vlog集中引爆
- **safe_dose**: 音乐节入口设DH1静态体验区, 逛完音乐节的家庭可以坐进DH1休息+拍照; 音乐节门票+DH1试驾联合权益, 购票即可预约DH1优先试驾; 邀请2组北京本地亲子KOL做音乐节体验vlog

---

### L009: 央企总师IP(汪俊君)

```yaml
id: L009
hook: "央企总师的抖音首秀"
concept: 奕境总师汪俊君开抖音号, 用"老干部"人设讲造车故事, 对标雷军/李斌

hotspot_lineage: [HS-010, HS-011, HS-012]
divergence_card: D-TP-2
source_raw_ideas: [RI-035, RI-037, RI-038]

public_heat_signal: "HS-010: 北京车展车企高管串门meme(雷军送T恤/李斌骑车); HS-011: '央企老干部'人格化营销趋势"
angle_of_entry: "车企CEO'接地气'已成社交货币 → 央企总师的反差感更强('没想到央企也这么会玩') → 用'老干部'人设讲DH1造车故事, 不是模仿雷军而是央企版的真诚"
spine_bridge: "通过总师IP人格化'央企品质'这一抽象概念, 实现焦虑→好奇的迁移; 消费者从'央企=老旧'转为'央企=靠谱+真诚'"
shallow_stack_check: "总师IP是'双重品控'中'央企'一面的真人化, 不是蹭meme; 东风56年造车历史是真实根基"

value_category: 够新鲜
execution_tier: A级

packaging_pass: reworked
rework_note: |
  原始 crazy_dose: "汪总师直播'晚高峰坐DH1绕二环', 边看智驾边聊'央企为什么敢和华为一起造车'"
  Spine 摩擦点: "央企总师做IP可能被质疑'不务正业'; 直播智驾有安全风险"
  采用策略: tone_shift
  保留: 总师人格化+品质叙事的核心机制
  改写: 从直播降维为每周一条3分钟短视频(录播可控); 内容聚焦"DH1一个安全/品质细节"而非炫技; 人设定为"老干部的认真"而非"发疯文学"

narrative_roles:
  primary: Proof
  secondary:
    - Social Currency
    - Retainer
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.2
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "焦虑 → 好奇"
  emotional_target: 好奇
  trigger_mechanism: social_proof

story_function: "将央企品质这个抽象概念人格化为一个真实的人, 建立品牌信任锚点"

memory_anchor:
  anchor: "央企总师汪俊君对着镜头说: '我爸造车56年, 我第一次想买自己家的车'"
  type: visual
  memorability_test: "一年后能描述'那个央企总师讲造车故事'吗? 能, 因为反差感+真诚是记忆点"
  one_sentence_recall: "央企总师的抖音首秀: 造车56年, 第一次想买自己家的车"

lifecycle_stage: 悬念期→揭秘期→上市期→长尾期
target_audience: "全国25-40岁网民, 关注车企高管人设"
budget_level: "A级: 短视频制作+抖音/B站/视频号投放+长期运营"

insight_links: [PV-004, PV-006, HS-010, HS-011, TR-006, CS-005]
channels: [抖音, B站, 微信视频号, 微博]
kpi_targets: "粉丝10万+, 单条视频播放200万+, 品牌好感度提升15%, 持续运营8周+"

lead_status: active
lead_confidence: 72
lead_uniqueness: 80
lead_overlap_score: 22

fusion_candidates: [L010]
fusion_strategy: topic
```

**Dual-dose**:
- **crazy_dose**: 汪总师直播"晚高峰坐DH1绕二环"(降维为录播); 华为乾崑工程师在北京晚高峰直播DH1智驾实测; "东风56年第一辆"北京户外大屏系列海报
- **safe_dose**: 汪总师每周一条3分钟短视频讲DH1品质细节, 投B站+微信视频号; 华为工程师录制"北京通勤智驾指南"系列短视频; 微信视频号发布"东风老员工说DH1"纪录片

---

### L010: 央企老干部官微人设

```yaml
id: L010
hook: "央企老干部学会用表情包"
concept: 奕境官微用"央企老干部"反差人设运营, 发安全座椅表情包+老干部选车笔记

hotspot_lineage: [HS-010, HS-011]
divergence_card: D-CM-1
source_raw_ideas: [RI-036]

public_heat_signal: "HS-010: 车企高管串门meme; HS-011: '央企老干部'人格化营销趋势(老乡鸡/多邻国先例)"
angle_of_entry: "央企身份天然有'端着'的刻板印象 → 用'老干部学会用表情包'的反差制造社交货币 → 内容载体是DH1产品细节(安全座椅表情包/选车笔记)"
spine_bridge: "通过官微人格化建立品牌记忆和好感, 实现焦虑→好奇的迁移; 不是'发疯文学'而是'老干部的认真与反差'"
shallow_stack_check: "反差人格化是建立品牌记忆, 不是蹭meme; 内容锚定在DH1产品细节上(安全座椅/品质)"

value_category: 够亮眼
execution_tier: B级

packaging_pass: reworked
rework_note: |
  原始 crazy_dose: "奕境官微模仿多邻国'发疯文学'"
  Spine 摩擦点: "'发疯文学'与央企调性冲突, 违背'不端着但有温度'的品牌调性"
  采用策略: tone_shift + dose_flip
  保留: "央企老干部"反差人设的核心机制
  改写: 从"发疯文学"降维为"老干部说车"图文; 用北京话/老北京梗讲DH1品质, 反差适度

narrative_roles:
  primary: Social Currency
  secondary:
    - Retainer
  role_weights:
    primary_role: 0.7
    secondary_role_1: 0.3

narrative_alignment:
  serves_transition: "焦虑 → 好奇"
  emotional_target: 好奇
  trigger_mechanism: social_proof

story_function: "用官微人格化建立日常社交货币, 降低品牌距离感"

memory_anchor:
  anchor: "央企官微发了一张DH1安全座椅表情包, 配文: '您家那位首席安全官, 坐得还舒坦?'"
  type: interaction
  memorability_test: "一年后能描述'那个央企老干部官微'吗? 能, 因为反差感是天然记忆点"
  one_sentence_recall: "央企老干部的官微: 会发表情包, 但聊的都是正经事"

lifecycle_stage: 悬念期→长尾期(持续运营)
target_audience: "全国22-35岁年轻网民, 关注品牌人格化营销"
budget_level: "B级: 官微日常内容运营"

insight_links: [HS-010, HS-011, CS-005, PV-002]
channels: [微博官微, 小红书, B站]
kpi_targets: "官微粉丝5万+, 单条互动500+, 品牌好感度提升10%"

lead_status: active
lead_confidence: 70
lead_uniqueness: 72
lead_overlap_score: 30

fusion_candidates: [L009]
fusion_strategy: topic
```

**Dual-dose**:
- **crazy_dose**: 官微模仿多邻国"发疯文学"(已否决, 与央企调性冲突)
- **safe_dose**: 官微每周2条"老干部说车"图文, 用北京话/老北京梗讲DH1品质; 发"DH1安全座椅表情包""老干部的选车笔记"

---

### L011: 不等了(车展空窗期切入)

```yaml
id: L011
hook: "不等了, 现在就要试"
concept: 车展后竞品都在"等交付", DH1做"不等了"反向叙事——现在就能试

hotspot_lineage: [HS-008, HS-009]
divergence_card: D-TA-3
source_raw_ideas: [RI-028, RI-031, RI-030]

public_heat_signal: "HS-008: 2026北京车展余温, 181台首发车创纪录但展后各家进入'等价格/等交付'空窗期; HS-009: 北京商圈新能源战场"
angle_of_entry: "车展后消费者陷入'参数看晕了+交付等不及'的焦虑 → DH1用'不等了'切入竞品空窗期 → '现在就能试'是时间优势的真实表达"
spine_bridge: "通过'不等了→现在试→家人坐进去'的体验链路, 实现焦虑→好奇→体验的迁移; 不等是DH1上市时间优势, 试驾是Spine'身体投票'的直接执行"
shallow_stack_check: "'不等'是DH1上市时间优势的真实表达, 不是攻击竞品; '181台车我只记住了它'是家庭体验的情感记忆"

value_category: 够新鲜
execution_tier: A级

packaging_pass: direct
narrative_roles:
  primary: Ignition
  secondary:
    - Converter
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.4

narrative_alignment:
  serves_transition: "焦虑 → 好奇 → 体验"
  emotional_target: 好奇
  trigger_mechanism: social_proof

story_function: "利用车展后竞品空窗期切入, 将DH1的时间优势转化为试驾行动"

memory_anchor:
  anchor: "车展后H5: 竞品交付时间表vs DH1即刻试驾——'别等了, 现在就能开'"
  type: interaction
  memorability_test: "一年后能描述'车展后那辆不等了的车'吗? 能, 因为'不等了'是车展观众的共同感受"
  one_sentence_recall: "车展后别等了, DH1现在就能试"

lifecycle_stage: 悬念期→揭秘期
target_audience: "全国+北京25-50岁汽车关注人群, 正在犹豫选哪款六座SUV"
budget_level: "A级: H5开发+微博话题+抖音内容+知乎/B站内容"

insight_links: [HS-008, HS-009, ME-001, CL-005, CL-006, AU-001]
channels: [微博话题, 抖音, 知乎, B站, H5, 昌平超级合生汇]
kpi_targets: "H5访问30万+, 话题阅读3000万+, 试驾预约2500+"

lead_status: active
lead_confidence: 80
lead_uniqueness: 85
lead_overlap_score: 12

fusion_candidates: []
fusion_strategy: narrative
```

**Dual-dose**:
- **crazy_dose**: 北京车展最后一天DH1车队在展馆外"截胡"(已否决, 可能不体面); 买断B站UP主做"我被车展骗了"吐槽视频(已否决, 标题党风险)
- **safe_dose**: 车展后一周奕境发"不等的理由"H5: 竞品交付时间表vs DH1即刻试驾预约; 奕境官方在知乎/B站发"车展后该怎么选车"理性分析+DH1试驾引导; 官微发"车展观众最难忘Top5"图文

---

### L012: 父亲节换座试驾

```yaml
id: L012
hook: "父亲节: 爸, 这次换我开车"
concept: 父亲节做"带爸爸试驾DH1"活动, 子女预约父母一起试乘, 爸爸坐后排孩子开车

hotspot_lineage: [HS-003]
divergence_card: D-SR-2
source_raw_ideas: [RI-011]

public_heat_signal: "HS-003: 端午(6/3)+夏至(6/21)+父亲节(6/21附近)双节连档"
angle_of_entry: "父亲节情感触发 → '换座'(爸爸坐后排孩子开车)直接展示DH1后排航空座椅体验 → 父亲节不是问候而是体验契机"
spine_bridge: "通过'换座试驾'让父亲体验DH1后排, 实现体验→确信→归属的迁移; 这是Spine'家人坐进去那一秒'的直接实现"
shallow_stack_check: "'换座'直接展示DH1后排航空座椅体验, 父亲节是情感触发点——不是节日海报而是真实体验"

value_category: 够爆
execution_tier: A级

packaging_pass: direct
narrative_roles:
  primary: Converter
  secondary:
    - Participation
    - Social Currency
  role_weights:
    primary_role: 0.5
    secondary_role_1: 0.3
    secondary_role_2: 0.2

narrative_alignment:
  serves_transition: "体验 → 确信"
  emotional_target: 确信
  trigger_mechanism: social_proof

story_function: "用父亲节契机实现全家共同试驾, 让后排体验成为决策锚点"

memory_anchor:
  anchor: "爸爸第一次坐进DH1后排, 孩子从后视镜看到他的表情变了"
  type: visual
  memorability_test: "一年后能描述'父亲节带爸爸试驾'的画面吗? 能, 因为那是每个家庭的真实时刻"
  one_sentence_recall: "父亲节, 换爸爸坐DH1后排"

lifecycle_stage: 上市期(6/21父亲节)
target_audience: "北京30-45岁中产家庭, 子女+父母两代人"
budget_level: "A级: 试驾活动运营+微信朋友圈投放+视频号内容"

insight_links: [PV-002, HS-003, CS-001, AU-003, AU-004]
channels: [微信视频号, 微信朋友圈, 抖音, 线下试驾店]
kpi_targets: "父亲节试驾预约500组, 曝光1500万, 转化率15%+"

lead_status: active
lead_confidence: 82
lead_uniqueness: 78
lead_overlap_score: 18

fusion_candidates: [L006]
fusion_strategy: emotional
```

**Dual-dose**:
- **crazy_dose**: 北京100组父子/父女"换座试驾": 爸爸坐后排, 孩子开车, 记录爸爸的表情变化
- **safe_dose**: 父亲节期间DH1试驾预约送"父亲节安心礼包"(车内按摩体验+保温杯)

---

### L013: 商圈品质透明站(白车身+最后安心一站)

```yaml
id: L013
hook: "DH1白车身透明展"
concept: 商圈做DH1"白车身透明展"+"逛完15家店最后一站"体验, 让逛街的人亲眼看到央企品质

hotspot_lineage: [HS-009]
divergence_card: D-TP-3
source_raw_ideas: [RI-032, RI-033]

public_heat_signal: "HS-009: 北京商圈新能源车超级战场, 昌平超级合生汇15+品牌门店扎堆"
angle_of_entry: "商圈看车疲劳('逛完一圈还是不知道买哪辆') → DH1做'最后安心一站'+白车身透明展 → 用看得见的品质终结看车焦虑"
spine_bridge: "通过'逛累了→坐进DH1→看到白车身→安心了'的体验链路, 实现好奇→体验的迁移; 白车身是央企品质的可视化证明"
shallow_stack_check: "白车身是'央企品质'的可视化证明不是噱头; '逛累了'是北京商圈真实痛点, DH1做终点站不是蹭流量"

value_category: 够亮眼
execution_tier: B级

packaging_pass: direct
narrative_roles:
  primary: Proof
  secondary:
    - Converter
  role_weights:
    primary_role: 0.6
    secondary_role_1: 0.4

narrative_alignment:
  serves_transition: "好奇 → 体验"
  emotional_target: 体验
  trigger_mechanism: social_proof

story_function: "在竞争最激烈的商圈用透明品质建立信任, 终结看车焦虑"

memory_anchor:
  anchor: "合生汇中庭, DH1白车身旁边是75家供应商零件墙——逛街的人可以触摸"
  type: visual
  memorability_test: "一年后能描述'在合生汇看到的那辆拆开来的DH1'吗? 能, 因为白车身很少见"
  one_sentence_recall: "逛完15家店, 最后一站看DH1的白车身"

lifecycle_stage: 揭秘期→上市期
target_audience: "北京30-45岁中产家庭, 周末逛商圈看车人群"
budget_level: "B级: 店内展示+零件墙制作(安全版在DH1体验店内)"

insight_links: [PV-003, PV-004, HS-009, CS-004, AU-001, AU-002]
channels: [线下(昌平超级合生汇/国贸SKP), 小红书打卡, 抖音同城]
kpi_targets: "到店客流提升30%, 白车身打卡笔记1000+, 试驾预约1000+"

lead_status: active
lead_confidence: 76
lead_uniqueness: 70
lead_overlap_score: 20

fusion_candidates: []
fusion_strategy: scene
```

**Dual-dose**:
- **crazy_dose**: 在国贸SKP中庭放DH1白车身+75家供应商零件墙, 逛街的人可以触摸; 合生汇DH1店门口放"你已逛了15家店"计数牌
- **safe_dose**: 在DH1体验店设"品质透明角", 展示关键零件和安全结构图; 合生汇DH1体验店做"全家到店半日游": 儿童区+试驾+午餐一站式

---

### L014: [Rejected] 618反向营销(退款换车)

```yaml
id: L014
hook: "618退款不如换车"
concept: 借618退货退款痛点, 做"退了那么多, 不如换辆不让你后悔的车"反向营销

hotspot_lineage: [HS-002]
divergence_card: D-CM-1
source_raw_ideas: [RI-007]

value_category: 够爆
execution_tier: B级

packaging_pass: n/a
lead_status: rejected
rejection_reason: |
  spine_friction: high — "退款换车"可能被骂蹭热点/道德绑架
  Rework尝试: tone_shift(改为理性分析)仍与"央企稳重"调性冲突; dose_flip(安全版官微发文)降级后与L003(618品质消费)高度重叠
  5种rework策略均无法在保持爆点的同时解决调性问题
  保留为"反证"——说明团队探索了边界, 最终选择L003(正向品质叙事)替代
```

---

## Scorecard

| Lead | Fresh | Visual | Buzz | Trend | Insight | Memo | Trans | Tier | Budget | Hotspot | Divergence | Total |
|---|---|---|---|---|---|---|---|---|---|---|---|---|
| L001 世界杯移动包厢 | 9 | 9 | 9 | 9 | 8 | 9 | 8 | S | 6 | 8 | 9 | 8.4 |
| L002 世界杯酒吧联盟 | 7 | 7 | 8 | 8 | 7 | 7 | 7 | A | 7 | 8 | 7 | 7.3 |
| L003 618品质消费节 | 8 | 6 | 7 | 7 | 9 | 8 | 8 | A | 7 | 4 | 7 | 7.2 |
| L004 京郊智驾路书 | 9 | 9 | 8 | 9 | 9 | 9 | 9 | S | 6 | 9 | 9 | 8.6 |
| L005 安全座椅挑战 | 8 | 8 | 8 | 7 | 8 | 8 | 8 | A | 7 | 8 | 8 | 7.9 |
| L006 三代人座驾 | 8 | 9 | 7 | 6 | 9 | 9 | 9 | S | 6 | 4 | 7 | 7.4 |
| L007 摇号8年 | 8 | 6 | 8 | 6 | 9 | 8 | 7 | A | 7 | 6 | 7 | 7.2 |
| L008 音乐节移动客厅 | 9 | 9 | 7 | 8 | 8 | 8 | 8 | A | 7 | 8 | 8 | 8.0 |
| L009 央企总师IP | 8 | 7 | 7 | 7 | 8 | 8 | 7 | A | 7 | 8 | 8 | 7.6 |
| L010 央企老干部门 | 7 | 6 | 7 | 7 | 6 | 7 | 7 | B | 8 | 8 | 7 | 6.9 |
| L011 不等了 | 9 | 7 | 8 | 7 | 9 | 8 | 9 | A | 8 | 6 | 8 | 7.9 |
| L012 父亲节换座试驾 | 7 | 8 | 7 | 6 | 8 | 8 | 9 | A | 7 | 4 | 7 | 7.1 |
| L013 商圈品质透明站 | 7 | 8 | 6 | 5 | 8 | 7 | 7 | B | 7 | 4 | 6 | 6.5 |

**Scoring notes**:
- High-weight dimensions (Fresh, Visual, Buzz, Trend, Insight, Memo, Trans, Hotspot) ×2 in total calc; Medium (Divergence, Tier) ×1; Low (Budget) ×1
- L001 (S-tier): HS-001+HS-012 cross-bucket → Hotspot 8; crazy/safe张力清晰 → Divergence 9
- L004 (S-tier): HS-004+HS-014+HS-008三原子3 bucket → Hotspot 9; 雨夜实测vs白天 → Divergence 9
- L006: HS-005单一原子(公共情绪bucket) → Hotspot 4; 但Insight/Memo/Trans强
- L003: HS-002单一原子(节庆bucket) → Hotspot 4; 但Insight强(75家供应商)
- L012: HS-003单一原子 → Hotspot 4; 但Trans强(父亲节→换座→确信)
- L002 reworked: +1 Divergence bonus for substantive rework_note

**Pool-wide Hotspot Coverage**: 平均 6.6 (≥7 = healthy, 6.6 = acceptable with flag)
- 2-HS+ leads: L001(8), L002(8), L004(9), L005(8), L007(6), L008(8), L009(8), L010(8), L011(6) = 9 leads with multi-HS or strong single-HS
- Single-HS leads: L003(4), L006(4), L012(4), L013(4) = 4 leads with single HS atom (acceptable — these carry strong Insight/Memo scores)

---

## Quality Gate Check

- [x] **≥10 valid leads**: 12 active leads (L001-L013, excl. L014 rejected)
- [x] **≥3 Value Categories**: 够新鲜 6 / 够亮眼 3 / 够爆 3 / 够热 0
  - 注: 够热类别在Activity Card Draw中RI-004/RI-008/RI-012/RI-016/RI-020/RI-024/RI-027/RI-031/RI-034/RI-038均为"够热"原始想法, 但在聚类融合过程中被吸收进其他category的lead中(如RI-004→L001够新鲜, RI-020→L006够新鲜)。这是融合的自然结果 — 够热的机制已融入leads中。
- [x] **≥2 Execution Tiers**: S级 3 (L001/L004/L006) / A级 7 (L002/L003/L005/L007/L008/L009/L011/L012) / B级 2 (L010/L013)
- [x] **Every active Lead has narrative_alignment and memory_anchor**: ✓
- [x] **HS coverage ≥60%**: 12/12 = 100% of active leads have ≥1 HS-* in hotspot_lineage
- [x] **Hotspot-density gate**: N=12, max(4, ⌈0.4×12⌉) = max(4,5) = 5; 9 leads carry traceable public_heat_signal with substantive angle_of_entry + spine_bridge + shallow_stack_check ✓
- [x] **Packaging mix**: direct 7 (L001/L003/L004/L005/L006/L008/L011/L012/L013) / reworked 4 (L002/L007/L009/L010) / rejected 1 (L014) ✓
- [x] **Rework integrity**: 4 reworked leads all have substantive rework_note (friction point + strategy + preserved + changed) ✓
- [x] **Anti–1+1 pass**: 全部leads的shallow_stack_check为机制声明而非营销话术 ✓
- [x] **Scorecard filled**: 包含Hotspot Coverage + Divergence Quality列 ✓
- [x] **Pool-wide Hotspot Coverage average ≥6**: 6.6 ✓ (acceptable, flagged for proposal review)

## Compression Check

- Active leads: 12 (well under 40 cap)
- Highest overlap pairs:
  - L009 ↔ L010: overlap 30 (央企人格化同一topic, 但L009=总师IP(A级), L010=官微人设(B级), 不同execution level, 可保留)
  - L006 ↔ L007: overlap 18 (代际叙事vs摇号故事, 不同emotional angle, 可保留)
  - L001 ↔ L002: overlap 25 (世界杯场景, 但L001=车内观赛(Ignition), L002=酒吧联盟(Converter), 不同role, 可保留)
- No pair exceeds 70 threshold — no fusion required at this stage
- L014 rejected保留为透明证据

---

## Pool by Narrative Transition

### 焦虑 → 好奇
| Lead | Hook | Tier | Mechanism |
|---|---|---|---|
| L006 | 三代人座驾 | S | 代际叙事→跨代信任 |
| L011 | 不等了 | A | 竞品空窗期→现在就能试 |
| L007 | 摇号8年 | A | 北京独有痛点→终于等到 |
| L009 | 央企总师IP | A | 人格化→央企品质可信 |
| L010 | 央企老干部 | B | 官微反差→品牌好感 |

### 好奇 → 体验
| Lead | Hook | Tier | Mechanism |
|---|---|---|---|
| L001 | 世界杯移动包厢 | S | 车内观赛→家人体感 |
| L003 | 618品质消费节 | A | 安心清单+定金→购买行动 |
| L008 | 音乐节移动客厅 | A | 音乐节场景→DH1体验 |
| L013 | 商圈品质透明站 | B | 白车身→看得见的品质 |
| L002 | 世界杯酒吧联盟 | A | 酒吧观赛→试驾预约 |

### 体验 → 确信
| Lead | Hook | Tier | Mechanism |
|---|---|---|---|
| L004 | 京郊智驾路书 | S | 真实自驾→续航/空间/智驾证明 |
| L005 | 安全座椅挑战 | A | UGC→社交证明 |
| L012 | 父亲节换座试驾 | A | 换座→爸爸体验后排 |

### 确信 → 归属
| Lead | Hook | Tier | Mechanism |
|---|---|---|---|
| L006 | 三代人座驾 | S | 跨代共识→身份认同 |
| L009 | 央企总师IP | A | 持续运营→品牌归属 |

---

## Lead Pool complete
- [x] ≥10 valid leads (12 active)
- [x] ≥3 Value Categories (够新鲜6/够亮眼3/够爆3; 够热机制融入其他leads)
- [x] ≥2 Execution Tiers (S×3/A×7/B×2)
- [x] All leads narrative-aligned (direct or reworked)
- [x] HS coverage ≥60% (100%)
- [x] Hotspot-density gate met (9/12 = 75%)
- [x] Packaging mix has both direct(7) and reworked(4)
- [x] Rework integrity verified (4 reworked leads with substantive rework_note)
- [x] Scorecard filled with Hotspot Coverage + Divergence Quality
- [x] Pool-wide Hotspot Coverage average ≥6 (6.6, flagged for proposal review)
- [x] Compression check passed (12 leads, no pair >70 overlap)
- [ ] Next: Strategy Plan (when user confirms)
