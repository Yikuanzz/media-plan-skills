#!/bin/bash
set -e

SKILL_DIR="skills/launch-campaign-orchestrator"
ERRORS=0

declare -a REQUIRED_FILES=(
  "$SKILL_DIR/SKILL.md"
  "$SKILL_DIR/phases/intake.md"
  "$SKILL_DIR/phases/insight.md"
  "$SKILL_DIR/phases/narrative-spine.md"
  "$SKILL_DIR/phases/lead-pool.md"
  "$SKILL_DIR/phases/strategy-plan.md"
  "$SKILL_DIR/phases/proposal-assembly.md"
  "$SKILL_DIR/shared/brief-intake-template.md"
  "$SKILL_DIR/shared/source-trust-policy.md"
  "$SKILL_DIR/shared/query-playbook.md"
  "$SKILL_DIR/shared/narrative-spine-template.md"
  "$SKILL_DIR/shared/lead-template.md"
  "$SKILL_DIR/shared/fusion-rules.md"
  "$SKILL_DIR/shared/idea-scorecard.md"
  "$SKILL_DIR/shared/energy-curve-template.md"
  "$SKILL_DIR/shared/proposal-template.md"
  "$SKILL_DIR/shared/quality-self-check.md"
)

for f in "${REQUIRED_FILES[@]}"; do
  if [ ! -f "$f" ]; then
    echo "MISSING: $f"
    ERRORS=$((ERRORS + 1))
  fi
done

if [ -f "$SKILL_DIR/SKILL.md" ]; then
  grep -q "Narrative Spine" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Narrative Spine"; ERRORS=$((ERRORS + 1)); }
  grep -q "Lead Pool" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Lead Pool"; ERRORS=$((ERRORS + 1)); }
  grep -q "Energy Curve" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing Energy Curve"; ERRORS=$((ERRORS + 1)); }
  grep -q "BLOCKING" "$SKILL_DIR/SKILL.md" || { echo "SKILL.md missing BLOCKING gates"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/narrative-spine-template.md" ]; then
  grep -q "narrative_transitions" "$SKILL_DIR/shared/narrative-spine-template.md" || { echo "narrative-spine-template.md missing transitions"; ERRORS=$((ERRORS + 1)); }
  grep -q "memory_anchor" "$SKILL_DIR/shared/narrative-spine-template.md" || { echo "narrative-spine-template.md missing memory_anchor"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/lead-template.md" ]; then
  grep -q "narrative_roles" "$SKILL_DIR/shared/lead-template.md" || { echo "lead-template.md missing narrative_roles"; ERRORS=$((ERRORS + 1)); }
  grep -q "memory_anchor" "$SKILL_DIR/shared/lead-template.md" || { echo "lead-template.md missing memory_anchor"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/idea-scorecard.md" ]; then
  grep -q "Memorability" "$SKILL_DIR/shared/idea-scorecard.md" || { echo "idea-scorecard.md missing Memorability"; ERRORS=$((ERRORS + 1)); }
fi

if [ -f "$SKILL_DIR/shared/quality-self-check.md" ]; then
  grep -q "Narrative drift" "$SKILL_DIR/shared/quality-self-check.md" || { echo "quality-self-check.md missing Narrative drift"; ERRORS=$((ERRORS + 1)); }
  grep -q "Creative density" "$SKILL_DIR/shared/quality-self-check.md" || { echo "quality-self-check.md missing Creative density"; ERRORS=$((ERRORS + 1)); }
fi

if [ $ERRORS -eq 0 ]; then
  echo "PASS: All files present and content checks passed."
  exit 0
else
  echo "FAIL: $ERRORS error(s) found."
  exit 1
fi
