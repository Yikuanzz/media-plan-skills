# Media-Plan Skill TARGET_REAL Alignment Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Modify 5 files in the media-plan skill so its `auto_regional_launch` proposal output matches the strategic depth, structure, and bid-document quality of the TARGET_REAL reference (奕境品牌武汉区域上市整合营销方案).

**Architecture:** Additive enhancements across the skill workflow: research → ideation → proposal. No phase sequencing changes. Strategy derivation layer (Core value → Marketing主线 → Strategy pillars) is inserted between ideation and proposal. Proposal template is restructured from 9 sections to 6 chapters matching TARGET_REAL's bid flow.

**Tech Stack:** Markdown skill files only. No code, no dependencies, no build step. Verification is done by cross-file consistency checks and markdown syntax validation.

---

## File Map

| File | Responsibility | Change Type |
|---|---|---|
| `skills/media-plan/shared/core-strategic-idea.md` | Defines the canonical narrative block for chosen directions | Add 3 fields (Core value, Marketing主线, Strategy pillars) |
| `skills/media-plan/shared/highlight-mechanism-canvas.md` | Defines the creative mechanism canvas | Echo strategy fields; strengthen Local life map; add pillar mapping |
| `skills/media-plan/shared/research-rubric.md` | Defines research quality bar and output shape | Add 3 recommended research items; new output block; enrich ammunition |
| `skills/media-plan/phases/ideation.md` | Defines ideation workflow rules | Add 5-field validation; propagation-theme enforcement; multi-selection compatibility |
| `skills/media-plan/shared/proposal-template.md` | Defines final proposal structure | Restructure `auto_regional_launch` to 6-chapter TARGET_REAL flow; bid-gate sections; embed Blueprint Cards |

---

## Pre-implementation Setup

- [ ] **Step 0.1: Confirm working directory and git state**

  Run:
  ```bash
  cd "C:/Users/Zeng/Documents/Yikuanzz/action/media-plan-skills"
  git status
  ```
  Expected: On main branch, clean working tree (or only expected modifications). If there are unexpected uncommitted changes, commit or stash them first.

- [ ] **Step 0.2: Read design spec for reference**

  File: `docs/superpowers/specs/2026-04-24-media-plan-target-real-alignment-design.md`
  Keep this open for reference during all tasks.

---

## Task 1: Enhance `core-strategic-idea.md` with Strategy Derivation Layer

**Files:**
- Modify: `skills/media-plan/shared/core-strategic-idea.md`

- [ ] **Step 1.1: Add new fields to output shape**

  Replace the current output shape block (lines 10-20) with:

  ```markdown
  ## Output shape

  ```md
  ## Core Strategic Idea

  ### [Direction name] (or Primary / Co)
  - One-line claim: [single sentence — campaign-line / proposition level]
  - Core value: [2-4 product-truth pillars, e.g. "全尺寸 | 高智能 | 超安全"]
  - Marketing主线: [emotional narrative thread, e.g. "奕家主场 · 境享美好"]
  - Core contradiction: [what the audience does not believe, or the category default belief to break]
  - Resolution path: [how comms and experience will resolve that contradiction; must be testable in-market]
  - Strategy pillars: [2-4 strategic thrusts that organize execution, e.g. 声量饱和攻击 / 场景高频体验 / 链路高效转化]
  ```
  ```

  Exact edit:
  - `old_string`: The block starting with `## Output shape` and ending with the closing ``` of the code block
  - `new_string`: The new output shape above

- [ ] **Step 1.2: Add rules for new fields**

  Append to the end of the file (after the last rule):

  ```markdown
  - `Core value` must be **product-truth-based**, not slogans. Format: 2-4 keyword pillars separated by `|`.
  - `Marketing主线` must connect product truth to audience emotion. It should be quotable as a chapter headline.
  - `Strategy pillars` must name the **strategic thrusts** (not tactics) that organize all downstream execution. Every phase action must map to at least one pillar.
  - These three new fields are **mandatory** for `auto_regional_launch` mode; for `general_proposal`, they are strongly recommended but not blocking.
  - Downstream binding: In `proposal-template.md` Chapter 3 (营销策略), the proposal must echo:
    - `Core value` → Section 3.1
    - `Marketing主线` → Section 3.2
    - `Strategy pillars` → Section 3.3
  ```

- [ ] **Step 1.3: Verify cross-file consistency**

  Check that the new field names (`Core value`, `Marketing主线`, `Strategy pillars`) are used consistently:
  - In `core-strategic-idea.md`: `Core value`, `Marketing主线`, `Strategy pillars`
  - In `highlight-mechanism-canvas.md`: will be added in Task 2
  - In `ideation.md`: will be added in Task 4
  - In `proposal-template.md`: will be added in Task 5

  Run:
  ```bash
  grep -n "Core value\|Marketing主线\|Strategy pillars" skills/media-plan/shared/core-strategic-idea.md
  ```
  Expected: 3+ matches, all in the correct sections.

- [ ] **Step 1.4: Commit**

  ```bash
  git add skills/media-plan/shared/core-strategic-idea.md
  git commit -m "feat(core-strategic-idea): add Core value, Marketing主线, Strategy pillars fields

  Adds strategy derivation layer between research and creative execution.
  Fields are mandatory for auto_regional_launch mode.
  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Task 2: Enhance `highlight-mechanism-canvas.md`

**Files:**
- Modify: `skills/media-plan/shared/highlight-mechanism-canvas.md`

- [ ] **Step 2.1: Add Core value and Marketing主线 echo fields**

  In the output shape (after `Theme:` and before `Core tension:`), add:

  ```markdown
  - Core value: [must align with Core Strategic Idea's Core value]
  - Marketing主线: [must align with Core Strategic Idea's Marketing主线]
  ```

  Exact edit:
  - `old_string`: The line `- Theme:` followed by the next line
  - `new_string`: Add the two new lines after `Theme:`

- [ ] **Step 2.2: Add canvas-to-core-idea validation rule**

  Append to the end of the file (after the last rule):

  ```markdown
  - If canvas `Core value` or `Marketing主线` contradicts the `## Core Strategic Idea` block for the same direction, mark the direction `revise` instead of `keep`.
  ```

- [ ] **Step 2.3: Strengthen Local life map requirements**

  Replace the current `Local life map` bullet under Required Fields:

  `old_string`:
  ```markdown
  - `Local life map` (mandatory): for `geography_or_region`, list **at least three** concrete city-life slices (e.g. river/lake, core mall district, night economy, alley / "烟火", cultural landmark) that are **not** only industrial-park or "车谷-only" narrative unless the brief is explicitly B2B / cluster-only.
  ```

  `new_string`:
  ```markdown
  - `Local life map` (mandatory): for `geography_or_region`, list **at least three** concrete city-life slices (e.g. river/lake, core mall district, night economy, alley / "烟火", cultural landmark) that are **not** only industrial-park or "车谷-only" narrative unless the brief is explicitly B2B / cluster-only. At least one slice must show:
    - Audience distribution pattern (e.g. "一江两湖三极" for affluent families)
    - Local consumption behavior insight (e.g. "混动车型渗透率高于全国平均水平")
    - Or cultural/emotional anchor (e.g. "过早文化" for Wuhan)
  ```

- [ ] **Step 2.4: Add Strategy pillar mapping to Stage pillars**

  Append to the end of the file (after the last rule):

  ```markdown
  - For `auto_regional_launch`, each named pillar in `Stage pillars` must map to one of the `Strategy pillars` from `## Core Strategic Idea`. Include the mapping inline: `[name] — [role tag] — maps to Strategy pillar: [pillar name]`.
  ```

- [ ] **Step 2.5: Verify cross-file consistency**

  Run:
  ```bash
  grep -n "Core value\|Marketing主线\|Strategy pillars\|Local life map" skills/media-plan/shared/highlight-mechanism-canvas.md
  ```
  Expected: All new fields present. `Local life map` has the strengthened requirement.

- [ ] **Step 2.6: Commit**

  ```bash
  git add skills/media-plan/shared/highlight-mechanism-canvas.md
  git commit -m "feat(highlight-canvas): echo strategy fields and strengthen city map

  - Echo Core value and Marketing主线 from Core Strategic Idea
  - Strengthen Local life map with audience/consumption/culture depth
  - Require Strategy pillar mapping on Stage pillars for auto launch
  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Task 3: Enhance `research-rubric.md`

**Files:**
- Modify: `skills/media-plan/shared/research-rubric.md`

- [ ] **Step 3.1: Add 3 recommended items to City Evidence Pack**

  In the output shape, after `Premium venue pool:`, add:

  ```markdown
  - Audience persona: [age/income/family structure/decision drivers/pain points for target segment]
  - City localization insight: [consumption patterns, distribution maps, cultural anchors relevant to category]
  - Market trend snapshot: [category growth, technology shift, or policy window in this region]
  ```

  And add a rule after the existing City Evidence Pack rules:

  ```markdown
  - The three items above (`Audience persona`, `City localization insight`, `Market trend snapshot`) are strongly recommended but not mandatory-fail. If missing, mark them in `## Gaps` and note that proposal Chapter 2 will be weaker.
  ```

- [ ] **Step 3.2: Add Audience & Market Context output block**

  After the `## Recommendation For Next Step` block in the Required Output Shape, add:

  ```markdown
  ## Audience & Market Context
  - Target audience persona:
  - Market trend (region + category):
  - City localization insight:
  ```

- [ ] **Step 3.3: Enrich Proposal Ammunition**

  In the Required Output Shape, after `Proof assets worth carrying into proposal:`, add:

  ```markdown
  - Strategic derivation anchors: [inputs that can become Core value / Marketing主线]
  - Family/emotional scene hooks: [for auto family-SUV briefs, emotional entry points beyond tech specs]
  ```

- [ ] **Step 3.4: Verify**

  Run:
  ```bash
  grep -n "Audience persona\|City localization insight\|Market trend snapshot\|Audience & Market Context\|Strategic derivation anchors\|Family/emotional scene hooks" skills/media-plan/shared/research-rubric.md
  ```
  Expected: All 6 new items present.

- [ ] **Step 3.5: Commit**

  ```bash
  git add skills/media-plan/shared/research-rubric.md
  git commit -m "feat(research-rubric): add depth recommendations for audience, city, market

  - Add Audience persona, City localization insight, Market trend snapshot to City Evidence Pack (recommended)
  - Add Audience & Market Context output block
  - Enrich Proposal Ammunition with strategic and emotional anchors
  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Task 4: Enhance `phases/ideation.md`

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 4.1: Add mandatory 5-field rule for auto_regional_launch**

  After the existing Notes Requirements section (or in a new subsection before it), add:

  ```markdown
  ### Core Strategic Idea completeness rule (auto_regional_launch)

  For `auto_regional_launch`, a `keep` direction is **invalid** unless its `## Core Strategic Idea` block contains all of the following fields with non-placeholder content:
  1. `One-line claim`
  2. `Core value`
  3. `Marketing主线`
  4. `Core contradiction`
  5. `Resolution path`

  If any field is missing, empty, or placeholder-only (e.g. "TBD", "待定"), mark the direction `revise`, not `keep`.
  ```

- [ ] **Step 4.2: Add propagation-theme-clarity enforcement**

  In the Notes Requirements section, after the existing city/regional brief items (`One-line propagation theme`, etc.), add:

  ```markdown
  - These four items (`One-line propagation theme`, `City or regional emotional binding`, `Product-sellpoint mapping`, `Hashtag extensibility`) must also be surfaced in either the `## Core Strategic Idea` block or the `## Highlight Mechanism Canvas` for the direction. They may not exist only inside `## Notes`.
  ```

- [ ] **Step 4.3: Add Strategy pillars to Notes requirements**

  In the Notes Requirements section, after `Combinability:`, add:

  ```markdown
  - `Strategy pillars`: [2-4 strategic thrusts that organize execution; must map to Stage pillars in canvas]
  ```

- [ ] **Step 4.4: Add multi-selection compatibility rule**

  In the Multi-Selection Rules section, after the existing bullet about co-directions differentiating in phase coverage or channel mix, add:

  ```markdown
  - **Core value compatibility**: When co-directions are selected, verify that their `Core value` and `Marketing主线` are either identical or hierarchically compatible (one is a subset or natural extension of the other). If the core values are contradictory or fundamentally misaligned, reject the combination even if individual scores are high.
  ```

- [ ] **Step 4.5: Verify**

  Run:
  ```bash
  grep -n "Core Strategic Idea completeness\|Strategy pillars\|Core value compatibility" skills/media-plan/phases/ideation.md
  ```
  Expected: All 3 new rules present.

- [ ] **Step 4.6: Commit**

  ```bash
  git add skills/media-plan/phases/ideation.md
  git commit -m "feat(ideation): add strategy derivation validation rules

  - Mandate 5 Core Strategic Idea fields for auto_regional_launch keep directions
  - Require propagation theme clarity surfaced in core idea or canvas
  - Add Strategy pillars to Notes requirements
  - Add Core value compatibility check for multi-selection
  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Task 5: Restructure `proposal-template.md` for TARGET_REAL Flow

**Files:**
- Modify: `skills/media-plan/shared/proposal-template.md`

- [ ] **Step 5.1: Read current auto_regional_launch template**

  Read the current `auto_regional_launch` template section (lines 122-199) to understand what needs to change.

- [ ] **Step 5.2: Replace auto_regional_launch structure**

  Replace the entire `## Auto Regional Launch Template` section (from line 122 to the end of the template block) with the new 6-chapter structure:

  ```markdown
  ## Auto Regional Launch Template (`auto_regional_launch`, single output)

  ```md
  # Proposal Title

  ## 1. 任务课题 / Mission & Key Questions

  - Core mission: [single sentence — what this campaign must achieve]
  - Key questions: [2-3 strategic questions this proposal answers]

  > **Bid-gating**: If `bid_or_tender` is false or absent, this section may be collapsed to a one-paragraph brief snapshot.

  ## 2. 市场洞察 / Market & Consumer Insights

  ### 2.1 Market trend snapshot
  - Category growth / technology shift / policy window in this region.

  ### 2.2 Competitor local benchmark (last 12 months)
  - Core competitor: [name, local actions, trust path, our break]
  - Key competitor: [name, local actions, trust path, our break]
  - Extended competitor: [name, local actions, trust path, our break]

  ### 2.3 Target audience persona
  - Demographics: [age, income, family structure]
  - Decision drivers: [what they care about]
  - Pain points: [what frustrates them]

  ### 2.4 City localization insight
  - Distribution pattern: [where they live / gather]
  - Consumption behavior: [category-specific local habits]
  - Cultural anchors: [emotional / cultural touchstones]

  ### 2.5 SWOT (brand + model in this city)
  - Strengths:
  - Weaknesses:
  - Opportunities:
  - Threats:

  ## 3. 营销策略 / Core Marketing Strategy

  ### 3.1 Core value
  - [Echo from Core Strategic Idea's Core value]

  ### 3.2 Marketing主线
  - [Echo from Core Strategic Idea's Marketing主线]

  ### 3.3 Core strategy
  - [2-4 strategic thrusts / pillars from Core Strategic Idea's Strategy pillars]

  ### 3.4 Brand fit table
  | Brand tone | In this proposal |
  | --- | --- |
  | [tone 1] | [how the strategy expresses it] |
  | [tone 2] | [how the strategy expresses it] |

  ## 4. 行动规划 / Phased Action Plan

  ### Phase 1: 预热造势期 / Pre-Heat Momentum
  #### Online Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Offline Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Program Blueprint Card: [Program name]
  - Program name and role: (awareness / circle / lead / conversion)
  - Objective and audience slice:
  - Theme and hooks: (include one-line theme and example hashtags)
  - Mechanism design: (e.g., track setup, grouping logic, or participation routes)
  - Execution flow: (step-by-step such as launch → creation → voting → award)
  - Deliverables and asset pack: (content templates, creator assets, event materials)
  - Owner and partner model:
  - Lead capture and conversion action:
  - KPI linked to this program:
  - Fallback plan:

  ### Phase 2: 上市引爆期 / Launch Burst
  #### Online Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Offline Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Launch Event Plan
  - Venue:
  - Core agenda:
  - On-site traffic collection:

  #### Program Blueprint Card: [Program name]
  - [same structure as Phase 1]

  ### Phase 3: 延续转化期 / Sustain And Conversion
  #### Online Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Offline Actions
  | Time | Action | Output | Key node |
  | --- | --- | --- | --- |

  #### Program Blueprint Card: [Program name]
  - [same structure as Phase 1]

  ## 5. 运营检核 / Operations & Review

  - Matrix management and reporting mechanism:
  - Content uniformity controls:
  - Effect tracking cadence:

  > **Bid-gating**: If `bid_or_tender` is false or absent, output `n/a — not required for non-bid proposals`.

  ## 6. 服务团队 / Service Team

  - Project team configuration and roles:

  > **Bid-gating**: If `bid_or_tender` is false or absent, output `n/a — not required for non-bid proposals`.

  ---

  ## Appendix A. 评分对应 / Rubric Mapping

  | Scoring item (from RFP) | Where addressed in this proposal | Proof or artifact | Self-assessment |
  | --- | --- | --- | --- |

  > **Bid-gating**: Include only if `bid_or_tender` is true and `evaluation_rubric` is non-empty. Otherwise omit.

  ## Appendix B. 风险应对 / Risk Playbook

  | Risk | Stage | Impact | Mitigation | Trigger owner |
  | --- | --- | --- | --- | --- |

  ## Appendix C. 预算分配 / Budget Split

  | Module | KPI | Budget ratio | Measurement cadence |
  | --- | --- | --- | --- |
  ```
  ```

- [ ] **Step 5.3: Update writing rules for auto_regional_launch**

  After the existing Writing Rules section, add:

  ```markdown
  - `auto_regional_launch` mode must output a **single PPT-ready document** using the 6-chapter structure above. No dual-document split.
  - `auto_regional_launch` chapters 5 and 6 (运营检核, 服务团队) are gated behind `bid_or_tender=true`. When false, collapse to `n/a`.
  - `auto_regional_launch` Appendix A (评分对应) is gated behind `bid_or_tender=true` **and** `evaluation_rubric` non-empty.
  - Program Blueprint Cards are **embedded inside Chapter 4 phases**, not a standalone section. Minimum one card per phase.
  - Phase tables in Chapter 4 must include columns: 时间 / 动作 / 产出物 / 关键节点.
  - `auto_regional_launch` mode must reject framework-only writing. Pure KPI lists or abstract verbs (e.g., "strengthen communication", "boost awareness") are insufficient unless mapped to named program actions with concrete execution flow.
  ```

- [ ] **Step 5.4: Update Review Pass checklist for new structure**

  In the Review Pass section, replace the auto_regional_launch checklist items with:

  ```markdown
  - [ ] if auto regional launch: all six chapters present (1-任务课题, 2-市场洞察, 3-营销策略, 4-行动规划, 5-运营检核, 6-服务团队)
  - [ ] if auto regional launch: bid-gated chapters (5, 6) are present when `bid_or_tender=true`, collapsed when false
  - [ ] if auto regional launch: Chapter 4 includes at least 1 Program Blueprint Card per phase
  - [ ] if auto regional launch: each Program Blueprint Card has mechanism + step flow + owner + lead capture + KPI link
  - [ ] if auto regional launch: Chapter 4 phase tables use 时间/动作/产出物/关键节点 columns
  - [ ] if auto regional launch: Chapter 3 echoes Core value, Marketing主线, and Strategy pillars from Core Strategic Idea
  - [ ] if auto regional launch: Chapter 2 includes audience persona, city localization insight, and market trend
  ```

- [ ] **Step 5.5: Verify cross-file consistency**

  Run:
  ```bash
  grep -n "任务课题\|市场洞察\|营销策略\|行动规划\|运营检核\|服务团队\|评分对应\|Program Blueprint Card" skills/media-plan/shared/proposal-template.md
  ```
  Expected: All 6 chapter names present. Blueprint Cards mentioned in Chapter 4 context.

  Run:
  ```bash
  grep -n "bid_or_tender" skills/media-plan/shared/proposal-template.md
  ```
  Expected: Bid-gating logic present for chapters 5, 6, and Appendix A.

- [ ] **Step 5.6: Commit**

  ```bash
  git add skills/media-plan/shared/proposal-template.md
  git commit -m "feat(proposal-template): restructure auto_regional_launch to TARGET_REAL 6-chapter flow

  - Restructure from 9 sections to 6 chapters matching bid-document structure
  - Add bid-gating for 任务课题/运营检核/服务团队/评分对应
  - Embed Program Blueprint Cards inside Chapter 4 phases
  - Add 时间/动作/产出物/关键节点 phase table columns
  - Update Review Pass checklist for new structure
  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Task 6: Final Verification and Consistency Check

**Files:** All 5 modified files

- [ ] **Step 6.1: Cross-file field name consistency check**

  Run:
  ```bash
  cd "C:/Users/Zeng/Documents/Yikuanzz/action/media-plan-skills"
  echo "=== core-strategic-idea.md ==="
  grep -c "Core value\|Marketing主线\|Strategy pillars" skills/media-plan/shared/core-strategic-idea.md
  echo "=== highlight-mechanism-canvas.md ==="
  grep -c "Core value\|Marketing主线\|Strategy pillars" skills/media-plan/shared/highlight-mechanism-canvas.md
  echo "=== research-rubric.md ==="
  grep -c "Audience persona\|City localization insight\|Market trend snapshot" skills/media-plan/shared/research-rubric.md
  echo "=== ideation.md ==="
  grep -c "Core value\|Marketing主线\|Strategy pillars" skills/media-plan/phases/ideation.md
  echo "=== proposal-template.md ==="
  grep -c "Core value\|Marketing主线\|Strategy pillars\|任务课题\|市场洞察\|营销策略\|行动规划\|运营检核\|服务团队" skills/media-plan/shared/proposal-template.md
  ```
  Expected: All counts > 0. If any count is 0, the corresponding file was not modified correctly.

- [ ] **Step 6.2: Markdown syntax check**

  Run:
  ```bash
  for f in skills/media-plan/shared/core-strategic-idea.md skills/media-plan/shared/highlight-mechanism-canvas.md skills/media-plan/shared/research-rubric.md skills/media-plan/phases/ideation.md skills/media-plan/shared/proposal-template.md; do
    echo "=== $f ==="
    # Check for unclosed code blocks
    python3 -c "
import sys
with open('$f', 'r', encoding='utf-8') as file:
    content = file.read()
backticks = content.count('\`\`\`')
if backticks % 2 != 0:
    print('ERROR: Unclosed code block')
    sys.exit(1)
else:
    print('OK')
"
  done
  ```
  Expected: All files print `OK`.

- [ ] **Step 6.3: Git diff review**

  Run:
  ```bash
  git diff --stat HEAD~5
  ```
  Expected: 5 files changed, all in `skills/media-plan/`.

  Run:
  ```bash
  git log --oneline -5
  ```
  Expected: 5 commits, one per task, with descriptive messages.

- [ ] **Step 6.4: Final commit (if needed)**

  If any fixes were made in Step 6.1 or 6.2:
  ```bash
  git add -A
  git commit -m "fix: address verification findings in media-plan skill alignment

  Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
  ```

---

## Plan Self-Review

### Spec coverage check

| Spec section | Plan task |
|---|---|
| Proposal template restructure to 6 chapters | Task 5 |
| Bid-gating for 任务课题/运营检核/服务团队/评分对应 | Task 5, Steps 5.2-5.4 |
| Embed Program Blueprint Cards in phases | Task 5, Step 5.2 |
| Core value / Marketing主线 / Strategy pillars in core idea | Task 1 |
| Core value / Marketing主线 echo in canvas | Task 2 |
| Strategy pillar mapping on Stage pillars | Task 2, Step 2.4 |
| Strengthened Local life map | Task 2, Step 2.3 |
| Audience persona / City insight / Market trend in research | Task 3 |
| 5-field validation in ideation | Task 4, Step 4.1 |
| Propagation-theme enforcement | Task 4, Step 4.2 |
| Multi-selection compatibility | Task 4, Step 4.4 |

**No gaps found.**

### Placeholder scan

- No `TBD`, `TODO`, `implement later`, or `fill in details` found.
- No "add appropriate error handling" without specifics.
- No "similar to Task N" references.
- All file paths are exact.
- All edit operations use `old_string`/`new_string` or show complete blocks.

### Type consistency check

- Field names are consistent across all 5 files:
  - `Core value` — same in core-strategic-idea, highlight-canvas, ideation, proposal-template
  - `Marketing主线` — same in all 4 files
  - `Strategy pillars` — same in all 4 files
  - `Auto Regional Launch` / `auto_regional_launch` — consistent casing

---

## Execution Options

**Plan complete and saved to `docs/superpowers/plans/2026-04-24-media-plan-target-real-alignment.md`.**

**Two execution options:**

**1. Subagent-Driven (recommended)** — I dispatch a fresh subagent per task, review between tasks, fast iteration

**2. Inline Execution** — Execute tasks in this session using executing-plans, batch execution with checkpoints

Which approach?
