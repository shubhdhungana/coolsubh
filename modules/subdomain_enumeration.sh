#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

domain=$1

subdomains_file="$domain/subdomains.txt"

echo "[*] Starting subdomain enumeration for $domain..."

# First-degree enumeration
echo "[*] Running subfinder for first-degree enumeration..."
subfinder -d $domain -silent > $subdomains_file
echo "[*] Running assetfinder for first-degree enumeration..."
assetfinder --subs-only $domain >> $subdomains_file
echo "[*] Running Amass for first-degree enumeration..."
amass enum -silent -d $domain -o $subdomains_file
echo "[*] Running massdns for first-degree enumeration..."
massdns -r ~/tools/massdns/lists/resolvers.txt -t A -o S -w subdomains_massdns.txt $subdomains_file
awk '{print $1}' subdomains_massdns.txt | sort -u >> $subdomains_file
rm subdomains_massdns.txt

# Second to fourth-degree enumeration
for (( i=2; i<=4; i++ ))
do
  level=$((i-1))
  echo "[*] Running subfinder for $i-degree enumeration..."
  subfinder -d $domain -silent -recursive -t $i > subdomains_$i.txt
  echo "[*] Running assetfinder for $i-degree enumeration..."
  assetfinder --subs-only $domain | subfinder -d $domain -silent -recursive -t $i >> subdomains_$i.txt
  echo "[*] Running Amass for $i-degree enumeration..."
  amass enum -silent -d $domain -recursive -max-dns-depth $level -o subdomains_$i.txt
  echo "[*] Running massdns for $i-degree enumeration..."
  massdns -r ~/tools/massdns/lists/resolvers.txt -t A -o S -w subdomains_${i}_massdns.txt subdomains_$i.txt
  awk '{print $1}' subdomains_${i}_massdns.txt | sort -u >> subdomains_$i.txt
  rm subdomains_${i}_massdns.txt
done

# Subdomain enumeration of obtained subdomains up to fourth degree
for (( i=2; i<=4; i++ ))
do
  for (( j=1; j<=i; j++ ))
  do
    echo "[*] Running subfinder for $i-degree enumeration of subdomains obtained in $j-degree enumeration..."
    subfinder -d $domain -silent -recursive -t $i -dL subdomains_$j.txt >> subdomains_${i}_tmp.txt
    mv subdomains_${i}_tmp.txt subdomains_$i.txt
    echo "[*] Running assetfinder for $i-degree enumeration of subdomains obtained in $j-degree enumeration..."
    assetfinder --subs-only -dL subdomains_$j.txt | subfinder -d $domain -silent -recursive -t $i >> subdomains_${i}_tmp.txt
    mv subdomains_${i}_tmp.txt subdomains_$i.txt
    echo "[*] Running Amass for $i-degree enumeration of subdomains obtained in $j-degree enumeration..."
    amass enum -silent -d $domain -recursive -max-dns-depth $((i-j)) -dL subdomains_$j.txt -o subdomains_${i}_tmp.txt
    mv subdomains_${i}_tmp.txt subdomains_$i.txt
    echo "[*] Running massdns for $i-degree enumeration of subdomains obtained in $j-degree enumeration..."
massdns -r ~/tools/massdns/lists/resolvers.txt -t A -o S -w subdomains_${i}massdns.txt -L subdomains$j.txt
awk '{print $1}' subdomains_${i}massdns.txt | sort -u >> subdomains$i.txt
rm subdomains_${i}_massdns.txt
done
done

echo "[*] Subdomain enumeration completed for $domain. Results are saved in $subdomains_file."
