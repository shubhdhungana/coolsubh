#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./screenshots.sh <domain>"
    exit 1
fi

domain=$1

# Create output directory
outdir="$domain/screenshots"
mkdir -p $outdir

# EyeWitness
echo "[*] Running EyeWitness..."
eyewitness -f $domain/subdomains.txt -d $outdir/eyewitness --web --no-prompt

# aquatone
echo "[*] Running aquatone..."
cat $domain/subdomains.txt | aquatone -out $outdir/aquatone -http-timeout 10000 -scan-timeout 300

echo "[+] Screenshots complete! Output saved to: $outdir"

