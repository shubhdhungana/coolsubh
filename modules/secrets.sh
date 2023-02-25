#!/bin/bash

# Usage message
function usage {
    echo "Usage: $0 [target]"
    echo "  target: the target directory to scan for secrets (default: current directory)"
}

# Check if target is provided, else use current directory
if [ $# -eq 0 ]; then
    target="."
else
    target="$1"
fi

# Check if target directory exists
if [ ! -d "$target" ]; then
    echo "Error: Target directory not found"
    usage
    exit 1
fi

# Scan for secrets using git-secrets
echo "Scanning for secrets using git-secrets..."
git-secrets scan --no-hints "$target"

# Scan for secrets using gitleaks
echo "Scanning for secrets using gitleaks..."
gitleaks --path="$target"

# Scan for secrets using truffleHog
echo "Scanning for secrets using truffleHog..."
trufflehog --regex --entropy=False --max_depth 30 "$target"

