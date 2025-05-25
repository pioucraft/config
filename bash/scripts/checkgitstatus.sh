#!/bin/bash

# Usage:
#   ./check-git-status.sh [BASE_DIR] [IGNORED_PATHS...]
# Example:
#   ./check-git-status.sh . ./backup ./big_old_repo

BASE_DIR="${1:-.}"
shift
IGNORED_PATHS=("$@")

echo "📂 Scanning for Git repositories in '$BASE_DIR'..."
[[ ${#IGNORED_PATHS[@]} -gt 0 ]] && echo "🚫 Ignoring paths:"
for path in "${IGNORED_PATHS[@]}"; do
  echo "   - $path"
done

# Convert ignored paths to absolute
ABS_IGNORED=()
for p in "${IGNORED_PATHS[@]}"; do
  ABS_IGNORED+=("$(realpath "$p")")
done

# Find all .git directories and extract the parent repo dir
repos=$(find "$BASE_DIR" -type d -name ".git" | xargs -n1 dirname | sort -u)

found_changes=0

for repo_dir in $repos; do
  abs_repo_dir=$(realpath "$repo_dir")

  # Skip if it's under any ignored path
  skip_repo=0
  for ignored in "${ABS_IGNORED[@]}"; do
    if [[ "$abs_repo_dir" == "$ignored"* ]]; then
      skip_repo=1
      break
    fi
  done
  [[ $skip_repo -eq 1 ]] && continue

  if [[ -n $(git -C "$repo_dir" status --porcelain) ]]; then
    echo "⚠️  Uncommitted changes found in: $repo_dir"
    found_changes=1
  fi
done

if [[ $found_changes -eq 0 ]]; then
  echo "✅ All repositories are clean."
fi

