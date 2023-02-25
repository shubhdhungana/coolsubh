#!/bin/bash

# Usage: ./csrf_injection.sh <target_url> <csrf_token>
# Example: ./csrf_injection.sh https://example.com/ abcdef1234567890

target_url=$1
csrf_token=$2

if [[ -z "$target_url" || -z "$csrf_token" ]]; then
  echo "Usage: ./csrf_injection.sh <target_url> <csrf_token>"
  exit 1
fi

echo "Checking if CSRF token is valid..."
xsrfprobe -u "$target_url" -p "POST" --csrf-token "$csrf_token" --crawl "0" -v

echo "Done."

