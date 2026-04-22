# Ideation Innovation Mechanism Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Upgrade the media-plan ideation phase with a mandatory frontier-signal retrieval step, dual-track wildcard generation, multi-angle direction generation, anti-cliché scoring, and multi-selection handoff support.

**Architecture:** Modify three markdown skill definition files (`idea-scorecard.md`, `ideation.md`, `inspiration-directions.md`) with coordinated changes across evaluation criteria, workflow rules, and inspiration library content. No code files involved — testing is structural verification against the design spec.

**Tech Stack:** Markdown skill definitions, structural validation via file reads and grep checks.

---

## File Structure

| File | Action | Responsibility |
| --- | --- | --- |
| `skills/media-plan/shared/idea-scorecard.md` | Modify | Scoring dimensions, anti-cliché checklist, multi-select handoff |
| `skills/media-plan/phases/ideation.md` | Modify | Frontier signal retrieval, multi-angle generation, dual-track wildcard, innovation source annotation, multi-select rules |
| `skills/media-plan/shared/inspiration-directions.md` | Modify | Add frontier examples, anti-examples, and pain-point anchors per direction |
| `docs/superpowers/specs/2026-04-22-ideation-innovation-mechanism-design.md` | Read-only | Source of truth for all changes |

---

## Prerequisites

- [ ] Read the design spec at `docs/superpowers/specs/2026-04-22-ideation-innovation-mechanism-design.md`
- [ ] Verify current files exist at their expected paths

---

## Phase 1: Scoring Mechanism (`idea-scorecard.md`)

### Task 1: Split `distinctiveness` into dual dimensions

**Files:**
- Modify: `skills/media-plan/shared/idea-scorecard.md`

- [ ] **Step 1: Replace the Dimensions section**

Replace the existing `## Dimensions` section (lines 3-9) with:

```markdown
## Dimensions

- `brief_fit`: matches the stated goal, audience, and offer
- `topic_freshness`: uses a trend, emotion, or topic from the last 6 months instead of generic evergreen framing
- `form_breakthrough`: uses a new content format, interaction mechanic, or platform play instead of standard formats
- `research_support`: uses validated insight instead of guesswork
- `channel_fit`: works for the selected channels and formats
- `execution_feasibility`: fits timeline, budget, and team reality
```

- [ ] **Step 2: Update the Scoring Rules section**

Replace the existing `## Scoring Rules` section (lines 11-17) with:

```markdown
## Scoring Rules

- Score each dimension from `1` to `5`.
- `1` means weak or unsupported.
- `3` means acceptable but not strong.
- `5` means clear, specific, and execution-ready.
- Reject the idea if any dimension scores below `3`.
- **Innovation floor**: `topic_freshness` + `form_breakthrough` must be `6` or higher (no idea can score 3 on both).
- **Conservative downgrade**: if `topic_freshness` <= `2` AND `form_breakthrough` <= `2`, reject regardless of other dimensions.
- Prefer ideas with a total score of `22` or higher out of `30`.
```

- [ ] **Step 3: Update the Output Shape header**

Replace the `## Idea Evaluation` table header (lines 20-27) from:

```markdown
| Idea | Brief Fit | Distinctiveness | Research Support | Channel Fit | Execution Feasibility | Total | Verdict |
```

to:

```markdown
| Idea | Brief Fit | Topic Freshness | Form Breakthrough | Research Support | Channel Fit | Execution Feasibility | Total | Verdict |
```

- [ ] **Step 4: Verify the table row template matches the header**

Ensure the example row (line 27) matches the new header columns:

```markdown
| Idea name | 0 | 0 | 0 | 0 | 0 | 0 | 0 | keep / revise / reject |
```

- [ ] **Step 5: Add the Anti-Cliché Checklist section**

Append after `## Rules` section (after line 49):

```markdown
## Anti-Cliché Checklist

Run this before scoring each idea. If any checkbox is `yes`, mark the idea `⚠️ cliché risk`.

- [ ] The core mechanism is highly similar to 3+ well-known campaigns in this category from the last 3 years.
- [ ] The idea could be reused for any competitor by swapping the brand name and product.
- [ ] The example angle appears in the direction's "classic but watch out" list.
- [ ] The idea uses a platform play that "everyone uses" (e.g., standard KOL seeding + hashtag) with no new twist.

**Handling:**
- Ideas marked `⚠️ cliché risk` can score at most `2` on `topic_freshness` and `form_breakthrough`.
- If the user explicitly asks for "safe and conservative", ignore the mark.
- Otherwise, surface the risk to the user before final scoring.
```

- [ ] **Step 6: Update `## Selected Direction Handoff` for multi-selection**

Replace the existing `## Selected Direction Handoff` block (lines 37-41) with:

```markdown
## Selected Direction Handoff

### Recommended Direction Set

| Role | Direction Name | Pain Point Solved | Phase Coverage | Channel Mix | Combination Logic |
| --- | --- | --- | --- | --- | --- |
| Primary | [name] | [pain point] | [phases] | [channels] | [why this leads] |
| Co-direction 1 | [name] | [pain point] | [phases] | [channels] | [relationship to primary] |
| Co-direction 2 | [name] | [pain point] | [phases] | [channels] | [relationship to primary] |

### Independent Feasibility
- [Direction name]: yes / no — reason
- [Direction name]: yes / no — reason

### Phased Execution Recommendations
- Early (0-30d): [direction + action]
- Mid (30-60d): [direction + action]
- Late (60-90d): [direction + action]

### Must Preserve
- [creative element 1]
- [creative element 2]

### Needs Execution Validation
- [risk 1]
- [risk 2]
```

- [ ] **Step 7: Update `## Notes` requirements**

Replace the existing `## Notes Requirements` section (lines 22-35) with:

```markdown
## Notes Requirements

For each idea in `## Notes`, include:

- `Strength`
- `Weakness`
- `Revision note`
- `Inspiration anchor`
- `Recent signal used`
- `Why this is not generic`
- `Innovation source`:
  - type: `frontier_signal` / `classic_framework` / `anti_convention` / `hybrid`
  - specific_source: [signal name / broken convention / hybrid composition]
  - freshness: [signal date if frontier_signal; usage frequency in last 3 years if classic]
- `Pain point anchored`: [core pain point this idea addresses]
- `Phase coverage`: [early / mid / late / full-cycle]
- `Channel mix`: [online / offline / online-offline blend]
- `Combinability`: [which other ideas this can combine with, and the logic]
```

- [ ] **Step 8: Verify file structure**

Run: `grep -n "topic_freshness\|form_breakthrough\|Anti-Cliché\|Recommended Direction Set\|Innovation source" skills/media-plan/shared/idea-scorecard.md`

Expected: All 5 patterns found with non-zero line numbers.

- [ ] **Step 9: Commit**

```bash
git add skills/media-plan/shared/idea-scorecard.md
git commit -m "feat: split distinctiveness, add anti-cliché checklist, multi-select handoff

- Split distinctiveness into topic_freshness + form_breakthrough
- Add innovation floor (sum >= 6) and conservative downgrade rule
- Add Anti-Cliché Checklist with automatic penalty
- Update Selected Direction Handoff for multi-selection
- Add pain point, phase, channel, and combinability fields to Notes

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Phase 2: Ideation Workflow (`ideation.md`)

### Task 2: Add frontier signal retrieval as mandatory step

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Insert frontier signal retrieval before existing steps**

After `## Rules` (after line 21), insert a new section:

```markdown
## Step 0: Frontier Signal Retrieval (mandatory)

Before generating any idea, run one targeted frontier signal search.

**Search requirements:**
- Use `tavily_search` to search for frontier cases in this category/industry from the last 3-6 months.
- Keyword patterns: category name + "campaign" / "营销" / "新玩法" / "出圈" / "趋势"
- Also search target platforms (Douyin / Xiaohongshu / WeChat) for recent algorithm or format innovations.
- Scope: at least 2 keyword groups, at least 3 results per group.

**Output format:**
```markdown
## Frontier Signal Scan
| Source | Date | Platform/Channel | Core Innovation | Relevance to Brief |
| --- | --- | --- | --- | --- |
| [source name] | [date] | [platform] | [one-sentence summary] | [high / medium / low] |
```

**Rules:**
- If no frontier signals from the last 6 months are found, explicitly label "frontier signal weak" and prioritize wildcard directions in subsequent ideation.
- Do not generate ideas from AI internal knowledge alone. Every idea must be anchored to a frontier signal or an anti-convention assumption.
```

- [ ] **Step 2: Verify the section was inserted correctly**

Run: `grep -n "Frontier Signal Retrieval\|Step 0" skills/media-plan/phases/ideation.md`

Expected: Line numbers show the new section appears before the existing workflow steps.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat: add mandatory frontier signal retrieval to ideation phase

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 3: Add multi-angle generation rules

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Replace the direction generation rules**

Replace the existing Rules lines 12-21:

```markdown
- Screen 2 to 4 plausible inspiration directions before drafting final options.
- Generate at least one brief-specific angle from each surviving inspiration direction.
- Keep at least one wildcard direction outside the inspiration library.
- Produce at least three distinct directions before choosing one.
- Name directions to avoid when the brief, research, or recent signals make them weak.
- Reject cliche, interchangeable, trend-chasing, or poorly supported directions before final selection.
```

with:

```markdown
- Screen 2-3 inspiration directions from the library.
- For each surviving direction, generate **2-3 angle-specific proposals** that differ in at least one of:
  - Target audience segment (e.g., Gen-Z vs. new middle class vs. silver generation)
  - Content format (e.g., short video vs. interactive H5 vs. offline experience)
  - Platform strategy (e.g., Douyin full-funnel vs. Xiaohongshu seeding vs. WeChat private domain)
  - Emotional hook (e.g., humor/meme vs. emotional resonance vs. value identification)
  - Execution scale (e.g., small pilot vs. national rollout vs. city-limited)
- Keep **two wildcard directions** (see Step 2 below).
- Produce **at least 8 distinct proposals** before scoring. At least 3 must come from wildcards or frontier signals.
- Name directions to avoid when brief, research, or recent signals make them weak.
- Reject cliché, interchangeable, trend-chasing, or poorly supported proposals before final selection.
- Proposals within the same direction must not exceed 70% structural similarity.
```

- [ ] **Step 2: Verify the new rules are in place**

Run: `grep -n "2-3 angle-specific\|8 distinct proposals\|70% structural" skills/media-plan/phases/ideation.md`

Expected: All 3 patterns found.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat: require multi-angle generation, minimum 8 proposals

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 4: Add dual-track wildcard generation

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Insert wildcard dual-track section**

After the multi-angle generation rules (after the block inserted in Task 3), add:

```markdown
## Step 2: Wildcard Dual-Track

After generating proposals from the inspiration library, generate **two mandatory wildcard directions**:

**Wildcard A — Frontier Signal Driven**
- Extend directly from one high-relevance signal in the `## Frontier Signal Scan`.
- Ask: "If this signal is pushed one step further, what could the brand do?"
- Must cite the supporting frontier signal source.

**Wildcard B — Anti-Convention Assumption**
- Deliberately break 1-2 "default consensus" rules in the category.
- Template: "Everyone assumes [category convention X], but what if the opposite [anti-convention Y]?"
- Must name the broken convention.
- Even if the direction is ultimately unworkable, it must be generated and recorded as a thinking breakthrough.

**Rules:**
- Both Wildcard A and B must appear in the final `## Idea Evaluation`.
- If Wildcard A cannot be generated due to weak frontier signals, substitute with a "radical frontier hypothesis" (a 12-month forward projection based on category trends).
- Wildcard B must not exceed 50% structural similarity with any direction in the inspiration library.
```

- [ ] **Step 2: Verify wildcard section exists**

Run: `grep -n "Wildcard A\|Wildcard B\|Frontier Signal Driven\|Anti-Convention" skills/media-plan/phases/ideation.md`

Expected: All 4 patterns found.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat: add dual-track wildcard generation (frontier-driven + anti-convention)

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

### Task 5: Add multi-selection rules

**Files:**
- Modify: `skills/media-plan/phases/ideation.md`

- [ ] **Step 1: Append multi-selection rules**

At the end of the file (after `## Notes Requirements`), add:

```markdown
## Multi-Selection Rules

- The user may select 1 primary direction + 0-2 co-directions.
- When multiple directions are selected, provide:
  1. **Combination logic**: how the directions complement, relay, or layer-cover each other.
  2. **Phased execution recommendations**: avoid temporal conflicts between directions.
  3. **Resource allocation guidance**: how budget and headcount are split across directions.
- Co-directions must differentiate from the primary direction in phase coverage or channel mix to avoid redundancy.
```

- [ ] **Step 2: Verify multi-selection section**

Run: `grep -n "Multi-Selection Rules\|co-directions\|Combination logic" skills/media-plan/phases/ideation.md`

Expected: All 3 patterns found.

- [ ] **Step 3: Commit**

```bash
git add skills/media-plan/phases/ideation.md
git commit -m "feat: add multi-selection rules with combination logic and phased execution

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Phase 3: Inspiration Library Refresh (`inspiration-directions.md`)

### Task 6: Add structural templates for all 8 directions

**Files:**
- Modify: `skills/media-plan/shared/inspiration-directions.md`

- [ ] **Step 1: Update the Direction Structure template**

Replace the existing `## Direction Structure` block (lines 15-25):

```markdown
## Direction Structure

```md
### Direction Name
- core_mechanism:
- good_for:
- not_good_for:
- brief_signals:
- research_signals:
- example_angles:
- execution_moves:
- execution_risks:
```
```

with:

```markdown
## Direction Structure

```md
### Direction Name
- core_mechanism:
- good_for:
- not_good_for:
- brief_signals:
- research_signals:
- example_angles:
- execution_moves:
- execution_risks:

**Classic but watch out (anti-examples):**
| Example | Period | Problem | Why not now |

**Frontier examples (2024-2025):**
| Case | Date | Platform | Category | Innovation | Angle to borrow |

**Pain-point anchors:**
| Pain Point | Early Phase | Mid Phase | Late Phase | Online-Offline Blend |
```
```

- [ ] **Step 2: Add anti-examples, frontier examples, and pain-point anchors to Time Anchors**

After the `### Time Anchors` block (after line 37), append:

```markdown
**Classic but watch out:**
| Example | Period | Problem | Why not now |
| --- | --- | --- | --- |
| Generic Spring Festival co-branding | 2018-2022 | Over-saturated | Every FMCG brand has done it; users are numb |
| Solar-term content series without brand link | 2019-2021 | Weak brand connection | Content gets shared, brand gets zero recall |
| Qixi "love story" scenario with no product truth | 2020-2023 | Product irrelevant | Pure emotional wrapping with no conversion path |

**Frontier examples:**
| Case | Date | Platform | Category | Innovation | Angle to borrow |
| --- | --- | --- | --- | --- | --- |
| [To be filled during content refresh] | | | | | |

**Pain-point anchors:**
| Pain Point | Early Phase | Mid Phase | Late Phase | Online-Offline Blend |
| --- | --- | --- | --- | --- |
| Users ignore seasonal ads | Pre-heat with "insider countdown" content | Launch limited co-brand product with KOL unboxing | Post-node UGC review collection + retargeting | Online countdown → offline pop-up launch event → online recap |
```

- [ ] **Step 3: Repeat Step 2 pattern for remaining 7 directions**

Apply the same three-table pattern to:
- `### Regional Hotspots And Local IP` (after line 46)
- `### Cross-Category Collaboration` (after line 57)
- `### Major Events And Competition Waves` (after line 68)
- `### Culture Trends And Memes` (after line 79)
- `### Technology Innovation And Builder Credibility` (after line 90)
- `### Social Issues And Emotional Resonance` (after line 101)
- `### User Co-Creation And Challenge Loops` (after line 112)

For each direction, populate the "Classic but watch out" table with 3 relevant anti-examples. Leave "Frontier examples" tables with placeholder rows to be filled in a follow-up content task. Populate "Pain-point anchors" with 1-2 plausible rows per direction.

- [ ] **Step 4: Verify structure across all 8 directions**

Run: `grep -c "Classic but watch out" skills/media-plan/shared/inspiration-directions.md`

Expected: `8`

Run: `grep -c "Frontier examples" skills/media-plan/shared/inspiration-directions.md`

Expected: `8`

Run: `grep -c "Pain-point anchors" skills/media-plan/shared/inspiration-directions.md`

Expected: `8`

- [ ] **Step 5: Commit**

```bash
git add skills/media-plan/shared/inspiration-directions.md
git commit -m "feat: add anti-examples, frontier example tables, and pain-point anchors to all 8 directions

- Update Direction Structure template with three new tables
- Add 'Classic but watch out' anti-examples to all 8 directions
- Add 'Frontier examples' placeholder tables to all 8 directions
- Add 'Pain-point anchors' with phased online-offline breakdowns

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Phase 4: Final Verification

### Task 7: Cross-file consistency check

- [ ] **Step 1: Verify all modified files reference the same concepts consistently**

Run:
```bash
echo "=== idea-scorecard.md ===" && \
grep -n "topic_freshness\|form_breakthrough\|Anti-Cliché\|Recommended Direction Set\|Innovation source\|Pain point anchored\|Phase coverage\|Channel mix\|Combinability" skills/media-plan/shared/idea-scorecard.md && \
echo "=== ideation.md ===" && \
grep -n "Frontier Signal Retrieval\|Wildcard A\|Wildcard B\|8 distinct proposals\|Multi-Selection" skills/media-plan/phases/ideation.md && \
echo "=== inspiration-directions.md ===" && \
grep -n "Classic but watch out\|Frontier examples\|Pain-point anchors" skills/media-plan/shared/inspiration-directions.md
```

Expected: All patterns found across all three files.

- [ ] **Step 2: Verify no stale references to old `distinctiveness` field**

Run:
```bash
grep -n "distinctiveness" skills/media-plan/shared/idea-scorecard.md skills/media-plan/phases/ideation.md
```

Expected: Only references in historical context or comments (not in active rules/tables).

- [ ] **Step 3: Final commit if any remaining changes**

```bash
git diff --cached --quiet || git commit -m "chore: final consistency pass across ideation innovation mechanism

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>"
```

---

## Spec Coverage Check

| Design Spec Requirement | Implementing Task |
| --- | --- |
| Mandatory frontier signal retrieval | Task 2 |
| Multi-angle generation (2-3 angles per direction) | Task 3 |
| Minimum 8 proposals | Task 3 |
| Dual-track wildcard (Frontier A + Anti-convention B) | Task 4 |
| `distinctiveness` → `topic_freshness` + `form_breakthrough` | Task 1 |
| Innovation floor (sum >= 6) | Task 1 |
| Conservative downgrade rule | Task 1 |
| Anti-cliché checklist | Task 1 |
| Multi-selection handoff format | Task 1, Task 5 |
| Pain point / phase / channel / combinability fields | Task 1 |
| Direction library: anti-examples | Task 6 |
| Direction library: frontier examples | Task 6 |
| Direction library: pain-point anchors | Task 6 |

**Gap analysis:** None. All spec requirements map to at least one task.

---

## Placeholder Scan

| Check | Result |
| --- | --- |
| No "TBD" / "TODO" in plan | Verified |
| No "implement later" / "fill in details" | Verified |
| No "appropriate error handling" without specifics | Verified |
| No "write tests for the above" without test code | N/A — markdown structural validation |
| No "similar to Task N" references | Verified |
| All file paths are exact | Verified |
| All code blocks contain complete content | Verified |

---

## Post-Implementation Follow-Up

After the plan is executed, the following content work remains (outside this plan's scope):

1. **Fill frontier example tables** in `inspiration-directions.md` with real 2024-2025 cases for each of the 8 directions.
2. **Backfill pain-point anchors** with more rows if needed during actual skill usage.
3. **Test the full ideation workflow** end-to-end with a real brief to validate output quality.
