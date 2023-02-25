#!/bin/bash

# Request Smuggling

# Check if a domain was provided as an argument
if [ -z "$1" ]; then
  echo "Please provide a domain to test as an argument."
  exit 1
fi

domain="$1"
output_dir="output/$domain/request_smuggling"
mkdir -p "$output_dir"

# http-request-smuggling
echo "[] Running http-request-smuggling..."
http-request-smuggling -q -t 10 -w "$output_dir/http-request-smuggling.txt" "$domain"
echo "[+] Finished running http-request-smuggling. Results saved to $output_dir/http-request-smuggling.txt"

# smuggler
echo "[] Running smuggler..."
smuggler -q -t 10 -w "$output_dir/smuggler.txt" "$domain"
echo "[+] Finished running smuggler. Results saved to $output_dir/smuggler.txt"

# h2csmuggler
echo "[] Running h2csmuggler..."
h2csmuggler -q -t 10 -w "$output_dir/h2csmuggler.txt" "$domain"
echo "[+] Finished running h2csmuggler. Results saved to $output_dir/h2csmuggler.txt"

echo "[] Request smuggling tests completed!"

