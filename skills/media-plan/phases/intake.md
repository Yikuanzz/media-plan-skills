# Intake Phase

## Goal

Normalize the user brief with the intake contract, preserve only decision-useful wording, and stop the workflow if the research-start fields are still missing.

## Required Read

- `../shared/brief-intake-template.md`

## Rules

- Use the shared intake output shape exactly.
- Return `## Pre-Brief Search Context` and `## Inspiration Hints` before `## Intake Summary` when pre-search ran.
- Ask only for missing research-start fields when intake is blocked.
- Allow later-stage fields to remain open until execution or proposal work requires them.
- When the user offers a fixed campaign line, must-have activations, or references/taboos, capture them using the optional fields in `../shared/brief-intake-template.md`.
- Do not invent details, even if pre-search suggests a likely answer.
