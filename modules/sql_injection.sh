#!/bin/bash

# SQL Injection Scanning Script

# Required tools: sqlmap, NoSQLMap, SQLiScanner

# Usage: ./sql_injection.sh <target_url>

# Get the target URL from command line argument
target_url="$1"

# Create a directory for storing the scan results
output_dir="$HOME/sql_injection_scan"
mkdir -p "$output_dir"

# Run sqlmap for basic SQL injection detection
echo "[*] Running sqlmap for basic SQL injection detection..."
sqlmap -u "$target_url" --batch --level 1 --risk 1 -o -f -a | tee "$output_dir/sqlmap-basic.txt"

# Run sqlmap for more advanced SQL injection detection
echo "[*] Running sqlmap for advanced SQL injection detection..."
sqlmap -u "$target_url" --batch --level 5 --risk 3 -o -f -a | tee "$output_dir/sqlmap-advanced.txt"

# Run NoSQLMap for NoSQL injection detection
echo "[*] Running NoSQLMap for NoSQL injection detection..."
nosqlmap -u "$target_url" --batch | tee "$output_dir/nosqlmap.txt"

# Run SQLiScanner for SQL injection detection
echo "[*] Running SQLiScanner for SQL injection detection..."
sqliscanner -u "$target_url" -o "$output_dir/sqliscanner.txt"

echo "[*] SQL injection scanning completed!"
