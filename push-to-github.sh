#!/bin/bash
# Push C&M Supply to GitHub for Vercel deployment
# 1. Create a new repo at https://github.com/new named "cm-supply" (or your preferred name)
# 2. Run this script: ./push-to-github.sh

cd "$(dirname "$0")"

if ! git remote get-url origin &>/dev/null; then
  echo "Adding remote origin..."
  git remote add origin https://github.com/chabnasty/cm-supply.git
fi

echo "Pushing to GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
  echo ""
  echo "✓ Success! Deploy on Vercel:"
  echo "  1. Go to https://vercel.com/new"
  echo "  2. Import the cm-supply repository"
  echo "  3. Vercel will auto-detect the static HTML site"
fi
