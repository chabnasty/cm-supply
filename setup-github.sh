#!/bin/bash
# Create GitHub repo and push for Vercel deployment
# Run: ./setup-github.sh

set -e
cd "$(dirname "$0")"

# Use local gh if available, otherwise system gh
GH="./gh"
[ ! -f "$GH" ] && GH="gh"

echo "Checking GitHub authentication..."
if ! $GH auth status &>/dev/null; then
  echo ""
  echo "You need to log in to GitHub first. Run:"
  echo "  $GH auth login"
  echo ""
  echo "Choose: GitHub.com → HTTPS → Login with a web browser"
  echo "Then run this script again."
  exit 1
fi

echo "Creating repository and pushing..."
$GH repo create cm-supply --public --source=. --remote=origin --push --description "C&M Supply Company - Plumbing supplies landing page"

echo ""
echo "✓ Done! Your repo is live at: https://github.com/chabnasty/cm-supply"
echo ""
echo "Deploy on Vercel:"
echo "  1. Go to https://vercel.com/new"
echo "  2. Import the cm-supply repository"
echo "  3. Click Deploy"
