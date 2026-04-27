#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  "skills/media-plan/shared/highlight-mechanism-canvas.md"
  "skills/media-plan/shared/core-strategic-idea.md"
  "skills/media-plan/shared/content-assets.md"
  "skills/media-plan/shared/competitor-actionable.md"
  "skills/media-plan/shared/research-modules/competitor-deep.md"
  "skills/media-plan/shared/research-modules/city-signal.md"
)

required_patterns=(
  "skills/media-plan/shared/highlight-mechanism-canvas.md::## Highlight Mechanism Canvas"
  "skills/media-plan/shared/highlight-mechanism-canvas.md::Stage pillars"
  "skills/media-plan/shared/highlight-mechanism-canvas.md::## Required Fields"
  "skills/media-plan/phases/ideation.md::highlight-mechanism-canvas.md"
  "skills/media-plan/phases/execution.md::highlight-mechanism-canvas.md"
  "skills/media-plan/phases/proposal.md::highlight-mechanism-canvas.md"
  "skills/media-plan/shared/proposal-template.md::Highlight Mechanism Overview"
  "skills/media-plan/shared/proposal-template.md::Phased Event Menu"
  "skills/media-plan/shared/idea-scorecard.md::Mechanism"
  "skills/media-plan/shared/proposal-template.md::Mechanism Design"
  "skills/media-plan/shared/proposal-template.md::Cognitive focus"
  "skills/media-plan/shared/proposal-template.md::auto_regional_launch"
  "skills/media-plan/shared/proposal-template.md::Market And Competitor Insights"
  "skills/media-plan/shared/proposal-template.md::Execution Action Playbook"
  "skills/media-plan/shared/proposal-template.md::Program Blueprint Card"
  "skills/media-plan/shared/research-rubric.md::City / Regional Mandatory Evidence"
  "skills/media-plan/phases/research.md::## City Evidence Pack"
  "skills/media-plan/phases/ideation.md::Propagation Theme Clarity"
  "skills/media-plan/shared/idea-scorecard.md::Propagation Theme Clarity"
  "skills/media-plan/phases/proposal.md::Review Pass"
  "skills/media-plan/phases/proposal.md::no framework-only language"
  "docs/product-specs/2026-04-21-media-plan-skill-pressure-tests.md::主机制"
)

failed=0

for path in "${required_files[@]}"; do
  if [[ ! -f "${repo_root}/${path}" ]]; then
    echo "缺少亮点机制关键文件: ${path}"
    failed=1
  fi
done

for rule in "${required_patterns[@]}"; do
  file="${rule%%::*}"
  pattern="${rule##*::}"

  if [[ ! -f "${repo_root}/${file}" ]]; then
    echo "缺少待检查文件: ${file}"
    failed=1
    continue
  fi

  if ! grep -q "${pattern}" "${repo_root}/${file}"; then
    echo "文件 ${file} 缺少关键内容: ${pattern}"
    failed=1
  fi
done

if [[ "${failed}" -ne 0 ]]; then
  exit 1
fi

echo "media-plan 亮点机制检查通过"
