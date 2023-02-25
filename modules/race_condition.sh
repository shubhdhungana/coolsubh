#!/bin/bash

# Define variables
domain="$1"
output_dir="$2"
http_options="--silent --max-time 5 --insecure"

# Create output directory
if [[ ! -d "$output_dir" ]]; then
  mkdir "$output_dir"
fi

echo "[] Starting race condition testing..."

# razzer
echo "[] Running razzer..."
razzer --url "$domain" --cookie "sessionid=1" --threads 10 -o "$output_dir/razzer.txt"

# racepwn
echo "[] Running racepwn..."
racepwn -u "$domain" -o "$output_dir/racepwn.txt"

echo "[] Race condition testing completed!"

