# Media Plan Skill Pressure Tests

## Purpose

This spec defines failure modes the media plan skill must catch before it returns a final proposal.

## Pass Condition

- The skill blocks forward progress when required inputs or evidence are weak.
- The skill uses a lightweight pre-brief search to sharpen intake questions when the prompt contains enough identifiable signal.
- The skill asks for missing information instead of guessing.
- The skill ties recommendations back to the brief, research, and execution constraints.

## Scenario 1: Sparse But Searchable Brief

- Trigger: The user provides only a rough brief, but includes identifiable signals such as a brand, category, campaign topic, platform, or geography.
- Expected behavior: The skill performs one lightweight pre-brief search, returns a concise pre-search context block with known signals plus items to confirm, and then asks only for the still-missing intake fields.
- Failure signal: The skill skips the search entirely, asks generic questions that ignore obvious public context, or silently treats searched context as confirmed brief input.

## Scenario 2: Missing Brief Fields

- Trigger: The user request is missing one or more required intake fields.
- Expected behavior: The skill produces a concise intake-gap list, asks only for the missing fields, and does not draft a plan until the gaps are resolved.
- Failure signal: The skill invents audience, channel, budget, timeline, or deliverable assumptions.

## Scenario 3: Weak Research Evidence

- Trigger: Research claims are generic, stale, unsupported, or sourced from opinion-only material.
- Expected behavior: The skill marks the research step as failed, names which claims lack evidence, and requests stronger sources or narrower claims.
- Failure signal: The skill presents unsupported market claims as facts or uses vague statements to justify strategy.

## Scenario 4: Cliche Ideation

- Trigger: Proposed ideas are interchangeable, trend-chasing, or could fit any brand with minor wording swaps.
- Expected behavior: The skill scores the ideas against the scorecard, rejects low-differentiation concepts, and explicitly loops back to research or asks the user for sharper brand, audience, or offer inputs before proposing new ideas.
- Failure signal: The skill accepts generic slogans, formats, or campaign themes without explaining why they are distinctive.

## Scenario 5: Strategy-Execution Mismatch

- Trigger: The strategy recommends channels, assets, or pacing that do not match the available team, budget, timeline, or brief goals.
- Expected behavior: The skill flags the mismatch, revises the recommendation to fit constraints, or explicitly asks the user to change scope.
- Failure signal: The skill outputs an ambitious strategy that cannot be executed from the provided inputs.

## Scenario 6: Late-Stage Execution Gate

- Trigger: Research and ideation pass, but execution-critical fields such as deliverables, constraints, success metrics, or the validated execution handoff are still missing or blocked.
- Expected behavior: The skill stops before execution planning or final proposal drafting, asks only for the missing late-stage fields or fixes the blocked handoff, and does not guess execution details.
- Failure signal: The skill drafts execution recommendations or a final proposal while execution-critical fields remain open, placeholder-only, or explicitly blocked.

## Review Reminder

- Every final proposal should show a visible chain from brief -> research -> ideas -> recommendation.
- If any pressure test fails, the skill should stop and surface the issue before writing the proposal.
