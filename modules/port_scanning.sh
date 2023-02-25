 #!/bin/bash

if [ -z "$1" ]
then
    echo "Usage: ./port_scanning.sh <ip_address>"
    exit 1
fi

ip_address=$1

# Create output directory
outdir=$ip_address
mkdir -p $outdir

# Masscan
echo "[*] Running Masscan..."
masscan -p1-65535 $ip_address -oL $outdir/masscan.txt --rate=10000

# Nmap
echo "[*] Running Nmap..."
nmap -sS -p- -sV -T4 -iL $outdir/masscan.txt -oA $outdir/nmap

echo "[+] Port scanning complete! Output saved to: $outdir"

