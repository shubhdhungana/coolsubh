#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1
subdomains_file="$domain/subdomains.txt"

echo "Starting subdomain enumeration for $domain..."

# First-degree enumeration
echo "Running subfinder..."
subfinder -d $domain -silent > $subdomains_file
echo "Running assetfinder..."
assetfinder --subs-only $domain >> $subdomains_file
echo "Running Amass..."
amass enum -silent -d $domain -o $subdomains_file
echo "Running massdns..."
massdns -r ~/tools/massdns/lists/resolvers.txt -t A -o S -w subdomains_massdns.txt $subdomains_file
awk '{print $1}' subdomains_massdns.txt | sort -u >> $subdomains_file
rm subdomains_massdns.txt
