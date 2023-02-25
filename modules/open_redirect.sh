#!/bin/bash

# Check if a domain was provided as an argument
if [ -z "$1" ]
then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain="$1"
output_dir="$HOME/outputs/$domain/open_redirect"
mkdir -p "$output_dir"

# Run Oralyzer
echo "[*] Running Oralyzer..."
oralyzer -i "https://$domain" -o "$output_dir/oralyzer.txt" >/dev/null

# Run Injectus
echo "[*] Running Injectus..."
injectus -u "https://$domain" -o "$output_dir/injectus.txt" >/dev/null

# Run dom-red
echo "[*] Running dom-red..."
dom-red -d "$domain" -o "$output_dir/dom-red.txt" >/dev/null

# Consolidate results
echo "[*] Consolidating results..."
cat "$output_dir/oralyzer.txt" "$output_dir/injectus.txt" "$output_dir/dom-red.txt" | sort -u > "$output_dir/results.txt"

# Check for open redirects
echo "[*] Checking for open redirects..."
grep -E "(http(s)?://)|(/)|(\.\.)" "$output_dir/results.txt" | while read url
do
    # Check if the URL is vulnerable to open redirect
    if curl -Is "$url" | grep -q "Location: $domain"
    then
        echo "[+] Open redirect vulnerability found: $url"
    fi
done

echo "[*] Open redirect scan completed!"

