#!/usr/bin/env bash

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failed=0

while IFS= read -r file; do
  if grep -Eq '^Purpose:[[:space:]]*Placeholder\b' "${file}"; then
    rel_path="${file#"${repo_root}/"}"
    echo "发现 runtime 合同占位内容: ${rel_path}"
    failed=1
  fi
done < <(find "${repo_root}/skills" -type f \( -path '*/phases/*.md' -o -path '*/shared/*.md' \) | sort)

if [[ "${failed}" -ne 0 ]]; then
  exit 1
fi

echo "runtime 合同占位检查通过"
