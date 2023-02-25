#!/bin/bash

# Usage: ./server_side_request_forgery.sh <target-url>

target="$1"
output_dir="output/server_side_request_forgery"
mkdir -p "$output_dir"

echo "[] Running SSRFmap..."
ssrfmap -r "$output_dir/ssrfmap.xml" -u "$target" --timeout 3 --delay 1 --skip --level 3 --prefix "http://127.0.0.1" > "$output_dir/ssrfmap.txt"

echo "[] Running Gopherus..."
gopherus -u "$target" -p "80" -g "true" -o "$output_dir/gopherus.txt"

echo "[] Running ground-control..."
ground-control --url "$target" --mode full > "$output_dir/ground-control.txt"

echo "[] Running SSRFire..."
ssrfire -u "$target" -p GET -d "127.0.0.1" -o "$output_dir/ssrfire.txt"

echo "[] Server Side Request Forgery completed!"

