#!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./parameters.sh <domain>"
    exit 1
fi

domain=$1
outdir="$domain/parameters"

# Create output directory
mkdir -p $outdir

# Parameth
echo "[*] Running Parameth..."
python3 /opt/Parameth/parameth.py -d $domain -o $outdir/parameth.txt > /dev/null 2>&1

# Arjun
echo "[*] Running Arjun..."
arjun -u "https://$domain" -o $outdir/arjun.txt > /dev/null 2>&1

# x8
echo "[*] Running x8..."
x8 -target https://$domain -all > $outdir/x8.txt

echo "[+] Parameter discovery complete! Output saved to: $outdir"

