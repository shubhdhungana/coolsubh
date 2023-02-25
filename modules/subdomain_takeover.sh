#!/bin/bash

# Input validation
if [[ $# -eq 0 || ! -f "$1" ]]; then
  echo "Usage: ./subdomain_takeover.sh <subdomains_file>"
  exit 1
fi

# Tools required
subjack_path="/opt/subjack/subjack"
subover_path="/opt/SubOver/subover.py"
autosubtakeover_path="/opt/autosubtakeover/autosubtakeover.py"
can_i_take_over_xyz_path="/opt/can-i-take-over-xyz/can-i-take-over-xyz.py"

# Output file
output_file="subdomain_takeover_results.txt"

# Create output file or clear its contents
> $output_file

# Subdomain Takeover using subjack
echo "[*] Running subjack..."
$subjack_path -w $1 -t 50 -ssl -c /opt/subjack/fingerprints.json -v -o $output_file

# Subdomain Takeover using SubOver
echo "[*] Running SubOver..."
python3 $subover_path -l $1 -t 20 >> $output_file

# Subdomain Takeover using autosubtakeover
echo "[*] Running autosubtakeover..."
python3 $autosubtakeover_path -w $1 -o $output_file -t 20

# Subdomain Takeover using can-i-take-over-xyz
echo "[*] Running can-i-take-over-xyz..."
python3 $can_i_take_over_xyz_path -d $1 -o $output_file

echo "[+] Subdomain takeover scan completed. Results saved to $output_file"

