#!/bin/bash

# Fuzzing script using wfuzz, ffuf, and fuzzdb

# Function to check if the tool is installed
check_installed() {
  if ! command -v $1 &> /dev/null
  then
      echo "$1 could not be found. Please install it and try again."
      exit
  fi
}

# Create output directory
outdir=$(date '+%Y-%m-%d_%H-%M-%S')_fuzzing
mkdir $outdir

# Check if tools are installed
check_installed wfuzz
check_installed ffuf

# Run wfuzz
echo "[*] Running wfuzz..."
wfuzz -w /usr/share/seclists/Discovery/Web_Content/common.txt -u http://$domain/FUZZ -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0" --hc 404 -t 50 -o $outdir/wfuzz.txt

# Run ffuf
echo "[*] Running ffuf..."
ffuf -w /usr/share/seclists/Discovery/Web_Content/common.txt -u http://$domain/FUZZ -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0" -fc 404 -c -t 50 -o $outdir/ffuf.txt

# Check if fuzzdb is installed and clone it if not
if [ ! -d "fuzzdb" ]
then
    echo "[*] Cloning fuzzdb repository..."
    git clone https://github.com/fuzzdb-project/fuzzdb.git
fi

# Run fuzzdb
echo "[*] Running fuzzdb..."
fuzzdb_dir=$(pwd)/fuzzdb/
ffuf -w $fuzzdb_dir/attack-payloads/Injections/SQL.txt -u http://$domain/FUZZ -H "User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0" -fc 404 -c -t 50 -o $outdir/fuzzdb.txt
