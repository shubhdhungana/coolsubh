#!/bin/bash

# Input validation
if [ $# -lt 1 ]; then
    echo "Usage: $0 <target_url>"
    exit 1
fi

# Variables
target_url=$1
output_dir="xxe_injection_scan"

# Create output directory if it does not exist
if [ ! -d "$output_dir" ]; then
    mkdir "$output_dir"
fi

# Run ground-control
echo "[*] Running ground-control..."
python3 ~/tools/ground-control/ground-control.py "$target_url" > "$output_dir/ground-control.txt"

# Run dtd-finder
echo "[*] Running dtd-finder..."
dtd-finder "$target_url" > "$output_dir/dtd-finder.txt"

echo "[*] XXE Injection scan completed!"

