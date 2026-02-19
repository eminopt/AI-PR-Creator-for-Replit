#!/usr/bin/env bash
set -e

# ===== CONFIG =====
BRANCH_PREFIX="ai"

# ===== INPUT =====
BASE_BRANCH="$1"
FEATURE_NAME="$2"
PR_TITLE="$3"

if [ -z "$BASE_BRANCH" ] || [ -z "$FEATURE_NAME" ] || [ -z "$PR_TITLE" ]; then
  echo "Usage: $0 <base-branch> <feature-name> <pr-title>"
  exit 1
fi

BRANCH_NAME="$BRANCH_PREFIX/$BASE_BRANCH/$FEATURE_NAME"

echo "🚀 Initiating AI Feature Branch Creation..."
echo "Feature name: $FEATURE_NAME"
echo "PR title: $PR_TITLE"
echo "Target branch: $BRANCH_NAME"
echo "──────────────────────────────"

# ===== CREATE FEATURE BRANCH =====
echo "🌿 Creating feature branch: '$BRANCH_NAME'"
git checkout -B "$BRANCH_NAME"

# ===== STAGE & COMMIT CHANGES IF ANY =====
git add .

if git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
  echo "✅ Branch already contains the latest commit from '$BASE_BRANCH'."
else
  git commit -m "AI: $PR_TITLE"
  echo "✅ Committed changes on branch '$BRANCH_NAME'."
fi

# ===== FINAL STATUS =====
echo "==== DONE ===="
echo "🦄 Branch '$BRANCH_NAME' is ready to publish. Open the Git tab and publish the branch (push branch as origin/$BRANCH_NAME)."
