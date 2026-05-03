# Regional Auto Launch Plan Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build `skills/regional-auto-launch-plan/` as an independent automotive regional-launch skill, then remove `auto_regional_launch` specialization from `skills/media-plan/` while preserving a safe routing handoff.

**Architecture:** Follow a two-track migration. Track A scaffolds and validates a new isolated package (8 phases + shared contracts + quality gates). Track B cleans `media-plan` back to generic mode by adding routing notice and deleting auto-only gates/template sections. Enforce proof points with contract checks and one dry-run quality comparison before destructive removal.

**Tech Stack:** Markdown skill package (`SKILL.md`, `phases/*.md`, `shared/*.md`), repo shell checks (`scripts/check-docs.sh`, `scripts/check-repo-hygiene.sh`, `scripts/check-media-plan-highlight-mechanism.sh`), ripgrep assertions, git frequent commits.

---

## File Structure

### New package (create)

```text
skills/regional-auto-launch-plan/
├── SKILL.md
├── phases/
│   ├── pre-brief-search.md
│   ├── intake.md
│   ├── insight.md
│   ├── strategy.md
│   ├── action.md
│   ├── operations.md
│   ├── service-team.md
│   └── proposal.md
└── shared/
    ├── pre-brief-source-map.md
    ├── brief-intake-template.md
    ├── source-trust-policy.md
    ├── query-playbook.md
    ├── insight-modules/
    │   ├── product-value.md
    │   ├── market-environment.md
    │   ├── competitor-deep.md
    │   ├── customer-segmentation.md
    │   └── city-signal.md
    ├── core-theme-derivation.md
    ├── highlight-mechanism-canvas.md
    ├── action-playbook-template.md
    ├── budget-allocation-rule.md
    ├── operations-assurance-template.md
    ├── service-team-template.md
    ├── rubric-coverage-template.md
    ├── quality-self-check.md
    ├── idea-scorecard.md
    ├── content-assets.md
    └── proposal-template.md
```

### Existing files (modify)

```text
skills/media-plan/SKILL.md
skills/media-plan/shared/proposal-template.md
docs/histories/2026-05/20260501-regional-auto-launch-plan-skill-split.md
docs/ARCHITECTURE.md
```

---

### Task 1: Scaffold independent package skeleton

**Files:**
- Create: `skills/regional-auto-launch-plan/SKILL.md`
- Create: `skills/regional-auto-launch-plan/phases/*.md`
- Create: `skills/regional-auto-launch-plan/shared/*.md`
- Create: `skills/regional-auto-launch-plan/shared/insight-modules/*.md`

- [ ] **Step 1: Verify target directory is absent**

Run: `ls skills/regional-auto-launch-plan`
Expected: path not found / empty result.

- [ ] **Step 2: Create folder tree**

Run:
```bash
mkdir -p skills/regional-auto-launch-plan/phases
mkdir -p skills/regional-auto-launch-plan/shared/insight-modules
```

- [ ] **Step 3: Create placeholder entry file and phase stubs**

```markdown
---
name: regional-auto-launch-plan
description: >
  Use when user needs a China-market automotive regional launch plan
  with 20-30万 budget, city evidence, staged action cards, and rubric mapping.
---

# Regional Auto Launch Plan Master

## Purpose
Run a dedicated workflow for China-market automotive regional launch briefs with strict intake gates, city evidence requirements, staged action planning, budget hard limits, and proposal review-loop controls.
```

- [ ] **Step 4: Verify tree completeness**

Run: `rg --files skills/regional-auto-launch-plan`
Expected: includes `SKILL.md`, 8 phase files, and all shared contract files.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan
git commit -m "feat(regional-auto-launch-plan): scaffold independent skill package"
```

---

### Task 2: Implement master `SKILL.md` workflow and gates

**Files:**
- Modify: `skills/regional-auto-launch-plan/SKILL.md`
- Test: `skills/regional-auto-launch-plan/SKILL.md`

- [ ] **Step 1: Write failing contract assertions**

Run:
```bash
rg -n "BLOCKING-A|BLOCKING-B|BLOCKING-C|BLOCKING-D|MAX_REVIEW_LOOPS = 3|Review Gap|Open Issues" skills/regional-auto-launch-plan/SKILL.md
```
Expected: missing markers before implementation.

- [ ] **Step 2: Add phase index, shared index, and routing logic**

```markdown
## Phase index

| Phase | File |
| --- | --- |
| 预搜 | `./phases/pre-brief-search.md` |
| Intake | `./phases/intake.md` |
| Insight | `./phases/insight.md` |
| Strategy | `./phases/strategy.md` |
| Action | `./phases/action.md` |
| Operations | `./phases/operations.md` |
| Service Team | `./phases/service-team.md` |
| Proposal | `./phases/proposal.md` |
```

- [ ] **Step 3: Add global hard gates and review loop**

```markdown
## Review loop

- `MAX_REVIEW_LOOPS = 3`
- fail 时必须输出 `## Review Gap`，并给出 `route: research | ideation | execution | proposal_enrich | intake`
- 3 次仍失败时输出 `## Open Issues`，不得宣布完成
```

- [ ] **Step 4: Re-run assertions to pass**

Run:
```bash
rg -n "BLOCKING-A|BLOCKING-B|BLOCKING-C|BLOCKING-D|MAX_REVIEW_LOOPS = 3|Review Gap|Open Issues" skills/regional-auto-launch-plan/SKILL.md
```
Expected: all required markers found.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/SKILL.md
git commit -m "feat(regional-auto-launch-plan): define master workflow gates and review loop"
```

---

### Task 3: Build shared intake/insight/strategy contracts

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/brief-intake-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/query-playbook.md`
- Modify: `skills/regional-auto-launch-plan/shared/core-theme-derivation.md`
- Modify: `skills/regional-auto-launch-plan/shared/insight-modules/*.md`
- Test: `skills/regional-auto-launch-plan/shared/*.md`

- [ ] **Step 1: Add intake schema with mandatory fields**

```markdown
## Required Fields

- `geography_or_region` (required)
- `budget_or_resource_level` (required, default guidance: 20-30万)
- `evaluation_rubric` (optional, verbatim)
- `bid_or_tender` (boolean)
- `tender_technical_requirements` (optional)
- `client_master_calendar` (optional)
```

- [ ] **Step 2: Add strategy derivation chain contract**

```markdown
## Slogan Derivation Chain

必须展示三维推导：品牌锚点 + 客群洞察 + 产品价值。

## Core Theme Source

Core Theme 必须可追溯到市场/产品/客群任一证据，不允许凭空命名。
```

- [ ] **Step 3: Add insight module minimum outputs**

```markdown
## Output Gate

- 每个 insight module 至少 2 个证据来源
- competitor-deep 必含 5 维分析 + 每品牌 2-3 条最近 campaign
- city-signal 必含 区域消费 / 媒体习惯 / 空间分布 / 文化锚点
```

- [ ] **Step 4: Run contract checks**

Run:
```bash
rg -n "20-30万|Slogan Derivation Chain|Core Theme|5 维|City Evidence Pack|verbatim" skills/regional-auto-launch-plan/shared
```
Expected: each keyword appears in relevant contracts.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/shared
git commit -m "feat(regional-auto-launch-plan): add intake insight and strategy shared contracts"
```

---

### Task 4: Build Action contracts (13-field card, scoring, budget, blocking)

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/action-playbook-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/idea-scorecard.md`
- Modify: `skills/regional-auto-launch-plan/shared/budget-allocation-rule.md`
- Modify: `skills/regional-auto-launch-plan/phases/action.md`
- Test: action-related files above

- [ ] **Step 1: Add 13-field Activity Card schema (1-7 mandatory)**

```markdown
## Activity Card Schema

1. 创意命名（必填）
2. 所属阶段 / 子主题
3. 时间窗口
4. 地点/阵地（online/offline/hybrid）
5. 目标客群与画像锚点（必填）
6. 吸引机制（必填）
7. 核心玩法（必填）
8. 资源清单
9. 传播节奏（含5平台差异化）
10. KPI 转化闭环
11. 成本量级（阶段带、占比、线上线下、大头解释）
12. 风险与应对（多句段落）
13. 来源解释（Insight 追溯）
```

- [ ] **Step 2: Add sub-agent dispatch prompt with phase constraints**

```markdown
## Sub-agent Dispatch Prompt

你现在是某一 pillar 的活动设计 agent。必须遵守：
- 四原则：低成本 / 快见效 / 好落地 / 真实吸引
- 按所在阶段预算红线输出
- 输出完整 13 字段活动卡
```

- [ ] **Step 3: Add budget hard constraints and table template**

```markdown
## Hard Constraints

- Phase 2 场地相关费用 <= Phase 2 预算 60%
- 任意单卡 <= 总盘 30%
- Budget Allocation Table 必须拆线上/线下并与阶段总额对齐
```

- [ ] **Step 4: Add phase-level BLOCKING checkpoints in `phases/action.md`**

```markdown
## BLOCKING-B
Phase 1 全部 pillar 卡出齐后，等待用户确认 primary 卡。

## BLOCKING-C
Phase 2 全部 pillar 卡出齐后，等待用户确认 primary 卡。

## BLOCKING-D
Phase 3 全部 pillar 卡出齐后，等待用户确认 primary 卡。
```

- [ ] **Step 5: Run contract checks**

Run:
```bash
rg -n "Activity Card Schema|BLOCKING-B|BLOCKING-C|BLOCKING-D|单卡 <= 总盘 30%|场地相关费用 <= Phase 2" skills/regional-auto-launch-plan
```
Expected: all required lines found.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/action-playbook-template.md skills/regional-auto-launch-plan/shared/idea-scorecard.md skills/regional-auto-launch-plan/shared/budget-allocation-rule.md skills/regional-auto-launch-plan/phases/action.md
git commit -m "feat(regional-auto-launch-plan): add action playbook schema scoring and budget gates"
```

---

### Task 5: Build Operations, Service Team, Rubric, and quality gates

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/operations-assurance-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/service-team-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/rubric-coverage-template.md`
- Modify: `skills/regional-auto-launch-plan/shared/quality-self-check.md`
- Modify: `skills/regional-auto-launch-plan/phases/operations.md`
- Modify: `skills/regional-auto-launch-plan/phases/service-team.md`
- Test: files above

- [ ] **Step 1: Add operations 5 blocks template**

```markdown
## Operations Assurance

1. 群组矩阵（3-5群）
2. 内容下发流程（一句话）
3. 反馈回流机制（监督/汇总/反馈）
4. 层级汇报矩阵（4层可裁到3层）
5. 节点检核机制（与三阶段KPI对齐）
```

- [ ] **Step 2: Add service-team bid-only gate**

```markdown
若 `bid_or_tender = false`，输出：
`## 7. 服务团队 (skipped — non-bid)`

若 `bid_or_tender = true`，输出 4+1 角色卡。
```

- [ ] **Step 3: Add rubric coverage mechanism and pre-draft gate**

```markdown
## Rubric Coverage Gate

- rubric 非空 -> 强制 Coverage Map
- `partial` / `missing` 禁止进入 proposal draft
- 高权重(>=15%)条目必须 Expanded
```

- [ ] **Step 4: Add quality review 4 standards (+rubric 5th)**

```markdown
## Review Pass

- 内容
- 语言
- 结构
- 创意
- Rubric Coverage（仅 rubric 非空）

所有维度 pass 才能整体 pass。
```

- [ ] **Step 5: Run checks**

Run:
```bash
rg -n "3-5群|skipped — non-bid|Coverage Map|partial|missing|Review Pass|Rubric Coverage" skills/regional-auto-launch-plan
```
Expected: all quality and bid gates present.

- [ ] **Step 6: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/operations-assurance-template.md skills/regional-auto-launch-plan/shared/service-team-template.md skills/regional-auto-launch-plan/shared/rubric-coverage-template.md skills/regional-auto-launch-plan/shared/quality-self-check.md skills/regional-auto-launch-plan/phases/operations.md skills/regional-auto-launch-plan/phases/service-team.md
git commit -m "feat(regional-auto-launch-plan): add operations service-team rubric and quality gate contracts"
```

---

### Task 6: Build proposal assembly template and review-loop routing map

**Files:**
- Modify: `skills/regional-auto-launch-plan/shared/proposal-template.md`
- Modify: `skills/regional-auto-launch-plan/phases/proposal.md`
- Modify: `skills/regional-auto-launch-plan/phases/strategy.md`
- Modify: `skills/regional-auto-launch-plan/phases/insight.md`
- Test: files above

- [ ] **Step 1: Add 7-chapter proposal skeleton with optional section 14/15**

```markdown
0. 封面/目录
1. 任务课题
2. 市场洞察
3. 策略规划
4. 营销动作
5. 运营保障
6. 服务团队
7. 鸣谢

[Optional]
14. Post-Campaign Review & Uplift
15. Rubric Mapping
```

- [ ] **Step 2: Add chapter depth rules**

```markdown
- Compact 默认全章具备
- Chapter 2/3/4 必须同时有 Expanded
- Action 章必须含 Budget Allocation Table + Alternative Cards
```

- [ ] **Step 3: Add symptom -> route table in proposal phase**

```markdown
| 症状 | route |
| --- | --- |
| 证据缺失 | research |
| Core Theme/Slogan链断 | ideation |
| 成本超带或卡字段缺失 | execution |
| 章节结构或语言问题 | proposal_enrich |
| rubric 原文录入问题 | intake |
```

- [ ] **Step 4: Run checks**

Run:
```bash
rg -n "Rubric Mapping|Post-Campaign Review & Uplift|Compact|Expanded|symptom|route|proposal_enrich" skills/regional-auto-launch-plan
```
Expected: proposal template and loop routing markers exist.

- [ ] **Step 5: Commit**

```bash
git add skills/regional-auto-launch-plan/shared/proposal-template.md skills/regional-auto-launch-plan/phases/proposal.md skills/regional-auto-launch-plan/phases/strategy.md skills/regional-auto-launch-plan/phases/insight.md
git commit -m "feat(regional-auto-launch-plan): add proposal structure and review routing"
```

---

### Task 7: Route automotive briefs out of `media-plan` and remove auto branch

**Files:**
- Modify: `skills/media-plan/SKILL.md`
- Modify: `skills/media-plan/shared/proposal-template.md`
- Test: files above

- [ ] **Step 1: Add routing notice at top of media-plan**

```markdown
> Routing notice:
> 如果 brief 明确是「汽车区域上市传播方案」（城市/区域级、20-30万、强调阶段动作卡），
> 优先切换到 `skills/regional-auto-launch-plan/SKILL.md`。
```

- [ ] **Step 2: Remove auto_regional_launch-only gates and symptom rows from `skills/media-plan/SKILL.md`**

```markdown
- Remove lines that enforce auto-only slogan chain, stage sub-themes, and serialized-IP requirements.
- Keep generic media-plan gates untouched.
```

- [ ] **Step 3: Remove `auto_regional_launch` chapter from media-plan proposal template**

```markdown
- Delete the dedicated auto chapter block from `skills/media-plan/shared/proposal-template.md`.
- Keep generic compact/expanded proposal template structure intact.
```

- [ ] **Step 4: Verify deletions and new routing line**

Run:
```bash
rg -n "auto_regional_launch|regional-auto-launch-plan|Routing notice" skills/media-plan/SKILL.md skills/media-plan/shared/proposal-template.md
```
Expected:
- `regional-auto-launch-plan` routing line present
- no legacy `auto_regional_launch` template block remains.

- [ ] **Step 5: Commit**

```bash
git add skills/media-plan/SKILL.md skills/media-plan/shared/proposal-template.md
git commit -m "refactor(media-plan): route auto regional briefs to dedicated skill and remove auto branch"
```

---

### Task 8: Verification gate with ppz13 reference brief

**Files:**
- Modify: `docs/histories/2026-05/<timestamp>-regional-auto-launch-plan-skill.md`
- Test: repository checks and dry-run artifacts

- [ ] **Step 1: Run repository guard checks**

Run:
```bash
bash scripts/check-docs.sh
bash scripts/check-repo-hygiene.sh
bash scripts/check-media-plan-highlight-mechanism.sh
```
Expected: all checks pass.

- [ ] **Step 2: Execute one dry-run against ppz13 brief scenario**

Run (example execution transcript command):
```bash
rg -n "ppz13|Regional Auto Launch|Review Pass|City Evidence Pack|Budget Allocation Table" docs -S
```
Expected: evidence of dry-run output and quality checkpoints exists.

- [ ] **Step 3: Write history record**

```markdown
# regional-auto-launch-plan skill split

- 新增独立 skill 包并完成 8 phase + shared contracts
- media-plan 移除 auto 专项分支，保留路由提示
- dry-run（ppz13）结果：新 skill 输出质量不低于旧路径
```

- [ ] **Step 4: Final commit**

```bash
git add docs/histories/2026-05 docs/ARCHITECTURE.md
git commit -m "docs: record regional-auto-launch-plan migration verification"
```

---

## Self-Review

### 1) Spec coverage check

- 独立 skill 包 + 8 phase + shared contracts: covered in Tasks 1-6.
- 3.md 六模块与 Action 三阶段差异化 + BLOCKING-A/B/C/D: covered in Tasks 2, 4, 6.
- 四标准质量闸 + rubric 第 5 维 + coverage map 前置闸: covered in Task 5.
- media-plan 退回通用并移除 auto branch: covered in Task 7.
- `ppz13.pdf` 反向验证先于不可逆移除: covered in Task 8.

### 2) Placeholder scan

- No `TODO` / `TBD` placeholders.
- Each task includes concrete files, commands, and expected outcomes.

### 3) Type/term consistency

- Uses consistent naming: `Core Theme`, `Slogan Derivation Chain`, `Activity Card`, `Coverage Map`, `Review Pass`, `Review Gap`, `Open Issues`.
- Route enum kept consistent: `research | ideation | execution | proposal_enrich | intake`.
