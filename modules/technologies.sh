#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./technologies.sh <domain>"
    exit 1
fi

domain=$1
outdir=$domain/technologies

# Create output directory
mkdir -p $outdir

# wappalyzer
echo "[*] Running wappalyzer..."
docker run --rm -v "$(pwd)":/mnt/app wappalyzer/cli https://$domain > $outdir/wappalyzer.json

# webanalyze
echo "[*] Running webanalyze..."
webanalyze -host $domain -crawl 1 -output $outdir/webanalyze.json

echo "[+] Technology detection complete! Output saved to: $outdir"

