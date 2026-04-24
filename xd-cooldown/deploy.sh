#!/usr/bin/env bash
# XD Cooldown — one-command deploy script
# Pushes to GitHub + deploys to Vercel in one go.
#
# Prerequisites (install once):
#   - GitHub CLI:  brew install gh   (then: gh auth login)
#   - Vercel CLI:  npm i -g vercel   (then: vercel login)
#
# Usage:
#   ./deploy.sh

set -e

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  XD Cooldown — deploy to GitHub + Vercel"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Check prerequisites
command -v git >/dev/null 2>&1 || { echo "❌ git not installed. brew install git"; exit 1; }
command -v gh >/dev/null 2>&1 || { echo "❌ GitHub CLI not installed. brew install gh && gh auth login"; exit 1; }
command -v vercel >/dev/null 2>&1 || { echo "❌ Vercel CLI not installed. npm i -g vercel && vercel login"; exit 1; }

# 1. Initialize git if not already
if [ ! -d .git ]; then
  echo "→ Initializing git repo..."
  git init -q
  git branch -M main
fi

# 2. Commit any changes
if [ -n "$(git status --porcelain)" ]; then
  echo "→ Staging and committing..."
  git add -A
  git commit -q -m "XD Cooldown deploy $(date +'%Y-%m-%d %H:%M')"
fi

# 3. Create or push to GitHub repo
if ! git remote get-url origin >/dev/null 2>&1; then
  echo "→ Creating GitHub repo..."
  gh repo create xd-cooldown --public --source=. --push --description "A 15-min end-of-tax-season reflection for TurboTax XD"
else
  echo "→ Pushing to existing GitHub remote..."
  git push -u origin main
fi

REPO_URL=$(gh repo view --json url -q .url)
echo "✓ GitHub: $REPO_URL"

# 4. Deploy to Vercel (production)
echo ""
echo "→ Deploying to Vercel..."
VERCEL_URL=$(vercel --prod --yes 2>&1 | tail -1)

echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "  ✦ Deployed"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Live URL:  $VERCEL_URL"
echo "  Repo:      $REPO_URL"
echo ""
echo "  Share the live URL with your team."
echo ""
