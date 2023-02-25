#!/bin/bash

# Directory Traversal
echo "Directory Traversal"
echo "-------------------"

# Check if the target URL is provided
if [ -z "$1" ]
then
    echo "Target URL is not provided"
    exit 1
else
    url="$1"
fi

# Check if the output directory is provided
if [ -z "$2" ]
then
    output_dir="output"
    echo "Output directory not provided, using default 'output'"
else
    output_dir="$2"
fi

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Run dotdotpwn
echo "Running dotdotpwn..."
dotdotpwn -m http -h "$url" -o "$output_dir/dotdotpwn.txt"

# Run FDsploit
echo "Running FDsploit..."
fdsploit -u "$url" -o "$output_dir/fdsploit.txt"

# Run off-by-slash
echo "Running off-by-slash..."
off-by-slash -u "$url" -o "$output_dir/off-by-slash.txt"

# Print completion message
echo "Directory traversal scan completed."

