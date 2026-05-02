# Regional Auto Launch Plan — 持久化 + 反压缩硬闸 设计文档

- 创建日期：2026-05-02
- 影响范围：`skills/regional-auto-launch-plan/`（不动 `skills/media-plan/`）
- 触发原因：实测产出 `2026奕境DH1武汉上市传播方案.md` 经用户判定为不合格
- 目标产出对照：`3.md`（标准方案，详尽展开、零压缩）

## 1. 背景与问题诊断

### 1.1 用户三条核心诉求

1. 没有把分阶段产物（intake / insight / strategy / 各 phase 行动 / operations）落到 markdown 文件
2. 没有在结尾把整本方案落到 `proposal.md`
3. 多个章节正文出现压缩或缩略（活动卡塞成单行表格、persona 多人合表、SWOT 通用化等）

### 1.2 三个根因（与现有契约文件对应）

- **持久化缺失**：每个 phase 文件的 Output Contract 只 `emit ## XX` 到对话，没有任何 `Write` 调用；`proposal.md` 同样只在对话中拼装，需要用户手抄
- **质量闸有漏洞**：`shared/quality-self-check.md` Standard 3 仅检查"Activity Card fields follow canonical order"——只看字段名顺序、不看每个字段是否充分展开。所以 13 字段挤到一行表格也能通过 Review Pass
- **模板深度未强制**：`shared/proposal-template.md` 写"Chapters 2/3/4 必须含 Expanded"，但属注释级提示，没有任何下游闸门核对——压缩之后没人发现

### 1.3 设计目标

1. 每个 phase 完成的瞬间立即把对应章节正文落盘到独立文件
2. `proposal.md` 由 phase 文件机械拼装，不允许在拼装层做二次提炼/缩写
3. 把 `3.md` 中的 7 条结构性硬要求（C1–C7）做成可机检的硬闸，任何一项 fail 即触发 review loop

## 2. 已锁定的 4 个核心维度

| 维度 | 决定 |
|---|---|
| 改动范围 | 只改 `skills/regional-auto-launch-plan/`，不联动 `skills/media-plan/` |
| 落盘形式 | 独立目录 `<cwd>/<YYYY-MM-DD>-<project-slug>/` + 每 phase 一文件 + 独立 `proposal.md` |
| 反压缩规则强度 | C1–C7 全部硬闸，任何一项 fail 即 `Review Pass = fail`，进入 review loop |
| 装订策略 | phase 文件即 proposal 对应章节正文（含 Compact + Expanded），`proposal.md` = `cover + cat 00→09 + closing`（机械拼装，单一事实源） |

## 3. 目录架构与单一事实源（§1）

### 3.1 项目目录形状

```
<cwd>/<YYYY-MM-DD>-<project-slug>/
├── 00-intake.md                 # 第1章 任务简报
├── 01-insight.md                # 第2章 市场洞察（Compact + Expanded）
├── 02-strategy.md               # 第3章 策略规划（Compact + Expanded）
├── 03-action-overview.md        # 第4章章首 + 4.1 Stage Overview + Budget Allocation Table
├── 04-action-phase1.md          # 4.2 Phase 1 Pre-Heat（pillar 1-online + 1-offline 全卡详写）
├── 05-action-phase2.md          # 4.3 Phase 2 Launch Burst（pillar 2-offline-core/aux + 2-online 全卡详写）
├── 06-action-phase3.md          # 4.4 Phase 3 Sustain（pillar 3-offline-conv/trial + 3-online 全卡详写）
├── 07-action-alternatives.md    # 4.5 Alternative Cards（汇总各 pillar alternative）
├── 08-operations.md             # 第5章 运营保障
├── 09-service-team.md           # 第6章 服务团队（默认创建；非 bid 模式写 skipped 占位段）
└── proposal.md                  # 装订成品 = cover + cat 00→09 + closing + 可选 14/15
```

### 3.2 单一事实源（Single Source of Truth）

每个 phase 文件**直接是该章节的最终正文**：

- `01-insight.md` 内部即 `## 2. Market Insight` + `2.1`–`2.7` 全部 Compact+Expanded
- `02-strategy.md` 内部即 `## 3. Strategy Plan` + `3.1`–`3.4`
- `04/05/06-action-phaseN.md` 内部即 `## 4.<N+1> Phase <N>` 完整章节文本
- `proposal.md` = 机械拼装，不二次提炼、不缩写、不重排

修改某一章 → 只改对应 phase 文件 → 重新触发装订 → `proposal.md` 自动重写。

### 3.3 项目 slug 派生规则

Intake `status = ready` 后自动派生：

```
<brand-pinyin>-<model-pinyin>-<city-pinyin>-<YYYYMMDD>
例：yijing-dh1-wuhan-20260502
```

- `brand`：取自 intake 的 `business_goal` / `product` 字段，识别品牌名
- `model`：取自 `product` 字段，识别车型代号
- `city`：取自 `geography_or_region` 字段，去除空格、小写、拼音化（中文回退到拼音）
- `YYYYMMDD`：当日日期
- 重名冲突时自动追加 `-r2` / `-r3`，不打断流程
- 派生失败（无法识别品牌/车型/城市）→ 抛阻塞，提示用户手填项目名

## 4. 写入时机与契约（§2）

### 4.1 写入触发表

| 触发点 | 写入文件 | 写入内容 |
|---|---|---|
| Intake `status = ready` | `00-intake.md` | 第 1 章正文（intake 全字段表 + rubric/tender 原文） |
| Insight 5 模块完整 + 验收通过 | `01-insight.md` | 第 2 章正文（2.1–2.7 全部 Compact+Expanded） |
| Strategy 输出完整（BLOCKING-A 前） | `02-strategy.md` | 第 3 章正文（3.1–3.4 全部 Compact+Expanded） |
| BLOCKING-A 用户确认 | `03-action-overview.md`（占位） | 章首 + 4.1 Stage Overview 模板 + Budget Allocation Table 占位（`TBD`） |
| Phase 1 Auto-Display 触发 | `04-action-phase1.md` 全文写入 | 4.2 完整正文（同步回填 `03-action-overview.md` Phase 1 预算行） |
| Phase 2 Auto-Display 触发 | `05-action-phase2.md` 全文写入 | 4.3 完整正文 + 三段式（同步回填 `03-action-overview.md` Phase 2 行 + venue 60% 校验数据） |
| Phase 3 Auto-Display 触发 | `06-action-phase3.md` 全文写入 + `07-action-alternatives.md` 汇总写入 | 4.4 完整正文 + 4.5 Alternative Cards 汇总（同步定稿 `03-action-overview.md` Budget Table） |
| Operations 5 板块完整 | `08-operations.md` | 第 5 章正文 |
| Service Team phase 完成 | `09-service-team.md` | bid 模式写完整角色卡；非 bid 模式写 skipped 占位段 |
| Review Pass = pass | `proposal.md` | cover + cat 00→09 + closing + 可选 14/15（每次重装订全文覆盖） |

### 4.2 写入失败处理

`Write` 调用失败（目录权限、磁盘满等）→ 立即抛出阻塞异常给用户，不静默继续；不允许 phase 越过未落盘的文件。

### 4.3 章节自包含约束

每个 phase 文件落盘正文必须能独立成章：

- 包含本章 Compact 摘要 + 凡 `proposal-template.md` 要求 Expanded 的章节均含 Expanded 全文
- 不出现"详见上文"等悬挂引用（避免被 cat 拼装后语义断裂）

### 4.4 proposal.md 装订规则

```
proposal.md 内容顺序：
  1. Cover（项目名 / 客户 / 日期 / 版本）
  2. TOC（自动生成）
  3. 逐字 cat 00-intake.md
  4. 逐字 cat 01-insight.md
  5. 逐字 cat 02-strategy.md
  6. 逐字 cat 03-action-overview.md
  7. 逐字 cat 04-action-phase1.md
  8. 逐字 cat 05-action-phase2.md
  9. 逐字 cat 06-action-phase3.md
 10. 逐字 cat 07-action-alternatives.md
 11. 逐字 cat 08-operations.md
 12. 逐字 cat 09-service-team.md
 13. Closing / Thanks
 14. （可选）Post-Campaign Review
 15. （可选）Rubric Mapping
```

`proposal.md` 是纯派生产物，不允许在装订过程中修改任何上游 phase 文件正文。

### 4.5 非 bid 模式下 09-service-team.md 占位文本

```md
## 6. Service Team

_本项目 `bid_or_tender = false`，按规范跳过服务团队章节。_

_如后续转为招投标场景，请重新触发 Service Team phase 以补齐角色卡。_
```

## 5. 反压缩硬闸 C1–C7（§3）

### 5.1 落点：`shared/quality-self-check.md` 新增 Standard 6

现有 4 项标准（Content / Language / Structure / Creativity）+ 条件第 5（Rubric Coverage）保持不变；新增 **Standard 6: Anti-Compression Coverage**，永远启用、不可跳过。任何一项 fail → 整体 `Review Pass = fail`，进入 review loop。

### 5.2 七条硬闸的可机检形态

| 编号 | 内容 | 责任文件 | 可机检标志（fail 触发条件） |
|---|---|---|---|
| **C1** | 每个核心/重点竞品独立小节，5 维度 + 2–3 条近期 campaign | `01-insight.md` §2.4 | `### 2.4.<n> <竞品名>` ≥ 1；每个 2.4.<n> 必须含 `#### 核心定位` / `#### 营销打法` / `#### 渠道策略` / `#### 用户信任路径` / `#### 应对策略` 五个固定子标题；并含 `#### 近期 Campaign` 子段、其下列出 ≥2 条 |
| **C2** | 每个 persona 独立小节，7 区域维度 | `01-insight.md` §2.6 | `### 2.6.<n> <persona 名>` ≥ 1；每个 2.6.<n> 必须含 `#### 消费趋势` / `#### 触媒习惯` / `#### 空间分布` / `#### 心态` / `#### 消费习惯` / `#### 出行习惯` / `#### 文化情感归因` 七个固定子标题 |
| **C3** | 每张 primary card 独立小节，8 字段全展开（**禁止以表格行替代**） | `04/05/06-action-phaseN.md` | 每张 primary card 落为 `### <pillar>.primary <创意命名>`；其下必须有 8 个固定 `####` 子标题；任一缺失或正文 < **120 字** → fail |
| **C4** | Phase 2 三段式：现场核心 / 现场集客 / 上市会传播 各自多段落 | `05-action-phase2.md` | 必须含 `### 4.3.A 现场核心` / `### 4.3.B 现场集客` / `### 4.3.C 上市会传播` 三个固定子标题；每段对应 Phase 2 的一个 pillar（A↔`2-offline-core` / B↔`2-offline-aux` / C↔`2-online`），落 1 张 primary card + 1 张 alternative card 详写，primary 必须满足 C3 8 子标题与字数要求 |
| **C5** | 5 平台内容矩阵 + 标题示例 | `04/05/06-action-phaseN.md` 各 online pillar primary card 内 `#### 媒介平台矩阵` 子段 | 必须出现 5 行平台：抖音 / 小红书 / 懂车帝 / 视频号 / 微博；每行附 ≥1 条具体标题示例（带《》或引号） |
| **C6** | KOL 三层结构 | 各 online pillar primary card 内 `#### KOL 矩阵` 子段 | 必须含 `**头部 KOL**` / `**腰部 KOL**` / `**KOC**` 三个固定标记；每层下至少 2 条具体合作策略 |
| **C7** | SWOT 区域化 | `01-insight.md` §2.7 | SWOT 四象限每项 ≥ **60 字**且至少 1 处直接引用 §2.5/2.6 城市级证据来源标签；不允许"市场需求大""消费升级"这类纯通用词 |

### 5.3 活动卡 8 子标题结构（C3 配套）

```
### <pillar>.primary <创意命名>
#### 活动目的           （≥120 字）
#### 核心创意亮点       （≥120 字）
#### 活动玩法           （≥120 字）
#### 执行流程           （≥120 字）
#### 媒介平台矩阵       （C5：online pillar 必含 5 平台 + 标题示例；offline pillar 写邀约/直播媒介）
#### KOL 矩阵           （C6：online pillar 必含三层；offline pillar 写本地达人/经销商达人）
#### 转化闭环           （≥120 字）
#### 话题标签           （≥120 字）
```

C5/C6 的硬闸只对 **online pillar primary card** 生效；offline pillar 同名子标题保留但内容侧重邀约/线下传播链路。

### 5.4 责任分摊

- **执行期防御（fail-fast）**：每个 phase 文件 Output Contract 写明"该 phase 不允许 emit Auto-Display 直到子标题齐全"，错误不流向下游
- **拼装期复核（last-mile）**：proposal phase 的 quality self-check 在装订前重读 00–09，按 C1–C7 复核一次；任一 fail → 不装订 `proposal.md`，进入 review loop

### 5.5 Review Pass 块新增段

```md
### Anti-Compression Coverage
- verdict: pass/fail
- failed_items:
  - C1: 2.4.2 缺少 "应对策略" 子标题
  - C3: 04-action-phase1.md 1-online.primary 卡 #### 转化闭环 字段 56 字 < 120 字阈值
```

### 5.6 阈值集中管理

`shared/quality-self-check.md` 顶部新增 `## Anti-Compression Thresholds` 段：

```md
- C3 每个字段最小字数：120
- C7 SWOT 每项最小字数：60
- C1 近期 campaign 最少条数：2
- C5 平台标题示例最少：每平台 1 条
- C6 KOL 每层合作策略最少：2 条
- C4 Phase 2 每段最少：1 张 primary card + 1 张 alternative card
```

参数明文集中，便于后续复盘调参。

## 6. 各 Phase 文件 Output Contract 改造（§4）

### 6.1 `phases/intake.md`

- Output Contract 新增：`status = ready` 时立即写 `00-intake.md`，正文为 `## 1. Task Brief` + intake 全字段表 + rubric/tender 原文
- 新增：派生并落盘项目目录路径（`<cwd>/<YYYY-MM-DD>-<project-slug>/`），所有后续 phase 引用同一路径变量
- 新增：写入失败 → 抛阻塞，不进 insight

### 6.2 `phases/insight.md`

- Output Contract 改为：除 `Insight Handoff Pack` 仍 emit 到对话外，落盘 `01-insight.md` = `## 2. Market Insight` 章节正文（2.1–2.7 全部 Compact+Expanded）
- 强约束：§2.4 必须按 C1 结构产出；§2.6 必须按 C2 结构产出；§2.7 必须按 C7 标准
- 验收前置闸：上述结构性子标题缺失 → 不允许 emit Insight pass，先内部补齐再落盘

### 6.3 `phases/strategy.md`

- Output Contract 改为：除 `Strategy Handoff Pack` 仍 emit 到对话外，落盘 `02-strategy.md` = `## 3. Strategy Plan`（3.1–3.4 全部 Compact+Expanded）
- BLOCKING-A 仍保留；用户确认后才允许进入 action

### 6.4 `phases/action.md`（重大改造）

拆 5 个写入事件：

1. **BLOCKING-A 确认后** → 写 `03-action-overview.md` 占位（章首 + 4.1 模板，预算行 `TBD`）
2. **Phase 1 Auto-Display 触发** → 写 `04-action-phase1.md`（4.2 全文，含 1-online + 1-offline 两张 primary + 两张 alternative，每张 primary 严格按 C3 8 子标题 + C5/C6 矩阵）；同步回填 `03-action-overview.md` Phase 1 预算行
3. **Phase 2 Auto-Display 触发** → 写 `05-action-phase2.md`（4.3 全文，三段式 4.3.A/B/C 按 C4 + 三张 primary + 三张 alternative + venue 60% 校验数据）；回填 `03-action-overview.md` Phase 2 行
4. **Phase 3 Auto-Display 触发** → 写 `06-action-phase3.md`（4.4 全文，三 pillar primary+alternative 全卡）+ 同步写 `07-action-alternatives.md`（4.5 alternatives 汇总）+ 定稿 `03-action-overview.md` 完整 Budget Allocation Table
5. **Output Contract** 末尾追加：所有 7 张 primary card 必须通过 C3 自检；任一缺子标题或字段 < 120 字 → 不允许触发该 phase Auto-Display（fail-fast）

### 6.5 `phases/operations.md`

- Output Contract 改为落盘 `08-operations.md` = `## 5. Operations Assurance`（5 板块全文）

### 6.6 `phases/service-team.md`

- 默认创建 `09-service-team.md`：
  - `bid_or_tender = true` → 写完整角色卡（按 `service-team-template.md`）
  - `bid_or_tender = false` → 写 §4.5 给出的 skipped 占位段

### 6.7 `phases/proposal.md`（重大改造）

不再"在对话里拼 Proposal Draft"。改为：

1. 读取 00–09 全部文件内容
2. 跑 `quality-self-check`（含 Standard 6 反压缩硬闸）
3. `Review Pass = pass` → `Write` 装订 `proposal.md`（cover + cat 00→09 + closing + 可选 14/15）
4. `Review Pass = fail` → 不装订 `proposal.md`，emit Review Gap，进入 review loop（路由对应见 §7）

### 6.8 `shared/proposal-template.md`

顶部追加"装订模式"段：明示 `proposal.md` 是机械拼装产物，章节顺序固定，各章正文以对应 phase 文件为准。

### 6.9 `shared/quality-self-check.md`

- 新增 Standard 6（§5 内容）+ Anti-Compression Thresholds 段
- 现有 Standard 3 保留"Activity Card fields follow canonical order"，但语义升级为"必须出现 8 个 `####` 子标题且字数达标"

### 6.10 `shared/action-playbook-template.md`

- Activity Card Schema 升级为 `### 创意命名` + 8 个 `####` 子标题；每字段最小 120 字
- 保留原 13 字段表作"字段语义对照"附录（与 8 子标题做语义映射，便于理解 KPI/budget/risk/dealer-link 等隐含字段在哪些子段中体现）

## 7. Review Loop 路由 → 文件映射（§5）

### 7.1 路由表

`MAX_REVIEW_LOOPS = 3` 不变，每次 loop 只允许命中**一条**路由、改**一个**文件（除非该路由本身跨文件）。

| 症状 | Route | 改写文件 | 复核范围 |
|---|---|---|---|
| C1 fail / 竞品压缩 / 缺 5 维度 / 缺近期 campaign | `research` | `01-insight.md` §2.4 | C1 + Insight verdict |
| C2 fail / persona 压缩 / 缺 7 维度 | `research` | `01-insight.md` §2.6 | C2 |
| C7 fail / SWOT 通用化 | `research` | `01-insight.md` §2.7 | C7 |
| 城市证据来源断裂 | `research` | `01-insight.md` §2.5 | Insight verdict |
| Core Theme 来源不清 / slogan chain 断 / 子主题冲突 | `ideation` | `02-strategy.md` | Strategy verdict |
| C3 fail / 活动卡缺 `####` 子标题 / 字段 <120 字 | `execution` | `04/05/06-action-phaseN.md`（指明 N 与 pillar） | C3 + 该 Phase Auto-Display 重跑 |
| C4 fail / Phase 2 三段式不齐 | `execution` | `05-action-phase2.md` | C4 |
| C5 fail / 5 平台矩阵不全 | `execution` | `04/05/06-action-phaseN.md` online pillar primary card 内 `#### 媒介平台矩阵` | C5 |
| C6 fail / KOL 三层不齐 | `execution` | 同上位置 `#### KOL 矩阵` | C6 |
| 预算红线违反（单卡 >30% / Phase 2 venue >60% / 越带） | `execution` | 失败 phase 文件 + 同步更新 `03-action-overview.md` | `budget-allocation-rule.md` 复核 |
| 章节顺序 / 用词 / 拼写 / 装订错位 / TOC 缺失 | `proposal_enrich` | **仅** `proposal.md` 重装订，不改 phase 文件 | Quality Self-Check 全标准复跑 |
| Rubric 抓取非逐字 / intake 强制条款缺失 | `intake` | `00-intake.md` | Intake ready + 下游引用复核 |

### 7.2 链路完整性副检查（linkage check）

每次定向改写完成后，除复跑该文件相关闸门外，还要做下游引用扫描：

- `01-insight.md` 改写后：扫 `02-strategy.md` / `03-action-overview.md` / 04–06 是否引用了被删除/重命名的竞品名、persona 名、城市证据来源标签
- `02-strategy.md` 改写后：扫 04–06 是否引用了已不存在的 stage sub-theme 名
- `04/05/06-action-phaseN.md` 改写后：扫 `08-operations.md` 是否引用了已不存在的活动卡名

引用断裂 → Open Issues 登记 "linkage gap"，本次 loop 视为 fail，下一次 loop 必须先修复 linkage 才能继续。

### 7.3 Loop 耗尽规则

3 次 loop 全部用完且仍未通过 Quality Self-Check：

- **不**写 `proposal.md`
- 在项目目录下生成 `OPEN-ISSUES.md`，逐项列出未解决的 fail 项 + 已尝试的路由 + 卡点说明
- 显式向用户报告"未达完成态"，不假装成功

### 7.4 路由命中通报格式

```md
## Review Gap (loop 1/3)
- route: execution
- target_file: 05-action-phase2.md
- target_section: ### 4.3.B 现场集客 / pillar 2-offline-aux primary
- failed_items:
  - C3: `#### 转化闭环` 字段 73 字 < 120 字阈值
  - C5: `#### 媒介平台矩阵` 缺"懂车帝"行
- repair_action: 重写该 primary card 的两个 #### 子段；保留其余 6 个子段不动
```

## 8. 改动清单（§6）

### 8.1 修改现有文件（11 个）

| 文件 | 改动要点 |
|---|---|
| `SKILL.md` | ① 新增全局硬闸 "PERSISTENCE": 每个 phase 必须按 `shared/persistence-rules.md` 落盘；② Phase Switch Protocol 增加"落盘 path"行；③ 各 Step 段补 write trigger；④ 路由表替换为 §7 文件映射版；⑤ Completion Gate 新增"proposal.md 已落盘"判定 |
| `phases/intake.md` | 新增 Output Contract → 写 `00-intake.md` + 派生项目目录 + slug 派生 |
| `phases/insight.md` | Output Contract 改为落盘 `01-insight.md` 全章正文；新增 C1/C2/C7 fail-fast 结构闸 |
| `phases/strategy.md` | Output Contract 改为落盘 `02-strategy.md` 全章正文 |
| `phases/action.md` | **重大改造**：拆 5 个写入事件；Phase N Auto-Display 触发前先做 C3/C4/C5/C6 自检 |
| `phases/operations.md` | Output Contract 改为落盘 `08-operations.md` |
| `phases/service-team.md` | Output Contract 改为默认落盘 `09-service-team.md`（bid 模式写完整角色卡，非 bid 写 skipped 占位段） |
| `phases/proposal.md` | **重大改造**：删除"对话里拼 Proposal Draft"流程；改为"读 00–09 → 跑 quality self-check → pass 则装订 proposal.md / fail 则进 review loop" |
| `shared/quality-self-check.md` | ① 新增 Standard 6: Anti-Compression Coverage（C1–C7 机检规则）；② 新增 `## Anti-Compression Thresholds` 段；③ Standard 3 语义升级 |
| `shared/proposal-template.md` | 顶部追加"装订模式"段 |
| `shared/action-playbook-template.md` | Activity Card Schema 升级为 `### 创意命名` + 8 个 `####` 子标题；每字段最小 120 字；保留原 13 字段表作附录 |

### 8.2 新增文件（1 个）

| 文件 | 作用 |
|---|---|
| `shared/persistence-rules.md`（新增） | 集中放写盘契约：目录形状 / 文件命名 / slug 派生算法 / 写入触发表 / 写入失败处理 / linkage check 规则。被所有 phase 文件 `Required reads` 引用 |

### 8.3 微调的支撑模块（3 个，影响小）

| 文件 | 微调 |
|---|---|
| `shared/insight-modules/competitor-deep.md` | 把"5 维度 + 近期 campaign"从建议升级为**必填**；明示对应 §2.4 的 `### 2.4.<n>` 结构 |
| `shared/insight-modules/customer-segmentation.md` | 把"7 区域维度"从建议升级为**必填**；明示对应 §2.6 的 `### 2.6.<n>` 结构 |
| `shared/insight-modules/city-signal.md` | 明示输出要直接被 §2.7 SWOT 的"城市级证据引用"消费，给来源标签命名规范 |

### 8.4 改动半径汇总

- **重大改造**：`phases/action.md`、`phases/proposal.md`、`shared/quality-self-check.md`
- **结构性新增**：`shared/persistence-rules.md`
- **schema 升级**：`shared/action-playbook-template.md`
- **小补丁**：`SKILL.md` + 5 个 phase 文件 + 3 个 insight-module + `shared/proposal-template.md`

合计：**修改 11 + 新增 1 + 微调 3 = 15 个文件触动**

## 9. 验收标准

实施完成后再跑一次 2026 奕境 DH1 武汉上市传播方案，必须满足：

1. 项目目录 `<cwd>/2026-05-02-yijing-dh1-wuhan-20260502/` 自动创建，10 个章节文件 + `proposal.md` 全部落盘
2. `01-insight.md` §2.4 每个核心竞品独立小节（≥1）+ 5 个固定 `####` 维度 + ≥2 条近期 campaign
3. `01-insight.md` §2.6 每个 persona 独立小节（≥1）+ 7 个固定 `####` 维度
4. `01-insight.md` §2.7 SWOT 四象限每项 ≥60 字 + 至少 1 处城市级证据引用
5. `04/05/06-action-phaseN.md` 中所有 7 张 primary card 各自独立小节，8 个 `####` 子标题齐全，每字段 ≥120 字
6. `05-action-phase2.md` 含 4.3.A/B/C 三段式，每段对应一个 Phase 2 pillar 并含 1 张 primary card + 1 张 alternative card
7. 所有 online pillar primary card 内 `#### 媒介平台矩阵` 含抖音/小红书/懂车帝/视频号/微博 5 行 + 每行 ≥1 条标题示例
8. 所有 online pillar primary card 内 `#### KOL 矩阵` 含头部 KOL / 腰部 KOL / KOC 三层 + 每层 ≥2 条策略
9. `proposal.md` 内容 = cover + cat 00→09 + closing；与各 phase 文件 byte-by-byte 一致（不允许装订层二次提炼）
10. Review Pass 块出现 `Anti-Compression Coverage` 段且 verdict 为 pass

## 10. 非目标

- 本次不改 `skills/media-plan/`
- 本次不改 `pre-brief-search.md` 和与之相关的 shared 文件
- 本次不改 `idea-scorecard.md` / `budget-allocation-rule.md` / `operations-assurance-template.md` 等已工作良好的支撑模块
- 本次不引入图片资产管理、PDF 导出、版本控制（这些可在后续单独立项）
- 本次不改 BLOCKING-A 的语义（仍保留 Strategy 后的用户确认）
- 本次不改 Auto-Display Checkpoint 的语义（Phase 1/2/3 仍自动推进）
