#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1
subdomains_file="subdomains.txt"
links_file="links.txt"

echo "[*] Starting link discovery for $domain..."

# Get initial list of subdomains
if [ ! -f "$subdomains_file" ]; then
    echo "[*] Subdomains file not found. Running subdomain enumeration script first..."
    ./subdomain_enumeration.sh "$domain" || exit 1
fi

# Run LinkFinder on each subdomain
echo "[*] Running LinkFinder on subdomains..."
while read subdomain; do
    echo "[*] Running LinkFinder on $subdomain"
    python3 ~/tools/LinkFinder/linkfinder.py -i "https://$subdomain" -d -o cli >> "$links_file"
done < "$subdomains_file"

# Run JS-Scan on each subdomain
echo "[*] Running JS-Scan on subdomains..."
while read subdomain; do
    echo "[*] Running JS-Scan on $subdomain"
    ~/tools/js-scanner/scanner -u "https://$subdomain" -o cli >> "$links_file"
done < "$subdomains_file"

# Run waybackurls on each subdomain
echo "[*] Running waybackurls on subdomains..."
while read subdomain; do
    echo "[*] Running waybackurls on $subdomain"
    ~/go/bin/waybackurls "https://$subdomain" >> "$links_file"
done < "$subdomains_file"

# Run gau on each subdomain
echo "[*] Running gau on subdomains..."
while read subdomain; do
    echo "[*] Running gau on $subdomain"
    ~/go/bin/gau "https://$subdomain" >> "$links_file"
done < "$subdomains_file"

echo "[*] Link discovery for $domain is completed!"
echo "[*] Total $(cat "$links_file" | wc -l) links are found."
