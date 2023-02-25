#!/bin/bash

domain=$1
outdir=$2

if [[ -z "$domain" || -z "$outdir" ]]; then
    echo "Usage: ./command_injection.sh <domain> <outdir>"
    exit 1
fi

# Commix
echo "[*] Running Commix..."
commix --url "$domain" --batch --output-dir "$outdir/commix" > /dev/null 2>&1

echo "[*] Command Injection scan completed."

