#!/bin/bash

# xss_injection.sh - a script for automated XSS injection testing

# Required tools: XSStrike, xssor2, dalfox, BruteXSS

# Usage: ./xss_injection.sh <target-url>

if [ -z "$1" ]
then
  echo "Usage: ./xss_injection.sh <target-url>"
  exit 1
fi

target_url="$1"
output_dir="output/xss_injection"
mkdir -p "$output_dir"

# XSStrike
echo "[*] Running XSStrike on $target_url ..."
xsser -u "$target_url" -o "$output_dir/xsser-output.txt"

# xssor2
echo "[*] Running xssor2 on $target_url ..."
xssor2 -u "$target_url" -o "$output_dir/xssor2-output.txt"

# dalfox
echo "[*] Running dalfox on $target_url ..."
dalfox url "$target_url" -o "$output_dir/dalfox-output.txt"

# BruteXSS
echo "[*] Running BruteXSS on $target_url ..."
brutexss -u "$target_url" -o "$output_dir/brutexss-output.txt"

echo "[*] XSS injection testing completed."

