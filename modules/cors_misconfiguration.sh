#!/bin/bash

# Colors
GREEN='\033[0;32m'
NC='\033[0m'

# Output directory
outdir="cors_misconfiguration"

# Create output directory if it doesn't exist
if [ ! -d "$outdir" ]
then
    mkdir "$outdir"
fi

# Target domain
domain="$1"

# Check if a target domain was provided
if [ -z "$domain" ]
then
    echo "Usage: $0 <target-domain>"
    exit 1
fi

# Corsy
echo -e "${GREEN}[*] Running Corsy...${NC}"
python3 /opt/Corsy/corsy.py -u $domain -o $outdir/corsy.txt > /dev/null 2>&1

# CORStest
echo -e "${GREEN}[*] Running CORStest...${NC}"
python3 /opt/CORStest/corstest.py -t $domain -o $outdir/corstest.txt > /dev/null 2>&1

