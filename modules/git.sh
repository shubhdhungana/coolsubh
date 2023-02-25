#!/bin/bash

echo "---------------------"
echo "Starting Git Scanning"
echo "---------------------"

# check if git is installed
command -v git >/dev/null 2>&1 || { echo >&2 "Git is not installed. Aborting."; exit 1; }

# check if the target directory exists
if [ ! -d "$1" ]; then
  echo "Target directory does not exist. Aborting."
  exit 1
fi

# navigate to the target directory
cd "$1"

# run git-secrets
echo "Running git-secrets..."
git secrets --scan -r . || true

# run gitleaks
echo "Running gitleaks..."
gitleaks --path=. --verbose || true

# run truffleHog
echo "Running truffleHog..."
trufflehog --entropy=False --regex --max_depth 20 . || true

echo "---------------------"
echo "Git Scanning Complete"
echo "---------------------"
