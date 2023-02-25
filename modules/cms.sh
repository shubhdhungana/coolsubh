#!/bin/bash

# Define variables
target=$1
output_dir="cms_scan"
today_date=$(date +"%Y-%m-%d")

# Define functions
run_wpscan() {
    echo "Running WPScan..."
    wpscan --url $target -o $output_dir/wpscan-$today_date.txt
    echo "WPScan finished. Results saved to $output_dir/wpscan-$today_date.txt"
}

run_wpspider() {
    echo "Running WPSpider..."
    wpspider -u $target -o $output_dir/wpspider-$today_date.txt
    echo "WPSpider finished. Results saved to $output_dir/wpspider-$today_date.txt"
}

run_wprecon() {
    echo "Running Wprecon..."
    wprecon --url $target -o $output_dir/wprecon-$today_date.txt
    echo "Wprecon finished. Results saved to $output_dir/wprecon-$today_date.txt"
}

# Main script
if [ $# -eq 0 ]
  then
    echo "No arguments supplied. Please provide a target URL."
    exit 1
fi

if [ ! -d "$output_dir" ]
  then
    mkdir "$output_dir"
fi

run_wpscan
run_wpspider
run_wprecon

echo "CMS scan completed."

