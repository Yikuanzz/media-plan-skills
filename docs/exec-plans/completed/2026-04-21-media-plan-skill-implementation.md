# Media Plan Skill Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build the first usable version of the China-market media planning skill system, including an orchestrator, four stage skills, shared templates/rubrics, pressure-test scenarios, and repo docs that reflect the new capability.

**Architecture:** Keep the implementation small and explicit: one orchestrator skill routes work, stage skills hold domain-specific rules, and shared markdown files define intake, research, ideation, and proposal structure. Verification relies on baseline pressure scenarios plus existing repo hygiene commands, so the first release proves the loop behavior instead of only adding prose.

**Tech Stack:** Markdown skills, repo docs, the current Agent environment's interactive clarification capability, `websearch`, `webfetch`, `read`, `glob`, existing repo shell checks.

---

This worktree copy mirrors the approved implementation plan in the main workspace so subagents can execute against the same spec. Use the canonical archived plan at `docs/exec-plans/completed/2026-04-21-media-plan-skill-implementation.md` in this worktree.

## Status / Progress

- Overall status: complete
- [x] Task 1
- [x] Task 2
- [x] Task 3
- [x] Task 4
- [x] Task 5
- [x] Task 6

## Verification

- Passed: `bash scripts/check-docs.sh`
- Passed: `bash scripts/ci.sh`
- Passed: all five pressure scenarios at the contract/rules level after the skills were implemented
