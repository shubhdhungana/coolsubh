#!/bin/bash

# Check for the target URL
if [[ -z "$1" ]]; then
    echo "Usage: ./file_inclusion.sh <target_url>"
    exit 1
fi

# Set the target URL
target_url="$1"

# Create the output directory
if [[ ! -d "output/file_inclusion" ]]; then
    mkdir -p "output/file_inclusion"
fi

# Run Liffy
echo "[*] Running Liffy..."
python3 /opt/liffy/liffy.py -u "$target_url" -o "output/file_inclusion/liffy.txt"

# Run Burp-LFI-Tests
echo "[*] Running Burp-LFI-Tests..."
python3 /opt/Burp-LFI-Tests/burp_lfi_tests.py "$target_url" -o "output/file_inclusion/burp_lfi_tests.txt"

# Run LFI-Enum
echo "[*] Running LFI-Enum..."
python3 /opt/LFI-Enum/lfi_enum.py -u "$target_url" -o "output/file_inclusion/lfi_enum.txt"

echo "[*] Done. Results saved in output/file_inclusion directory."

