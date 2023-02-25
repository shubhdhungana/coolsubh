#!/bin/bash

# Function to check if a program is installed
function check_program_installed {
    command -v "$1" >/dev/null 2>&1
}

# Check if S3Scanner is installed
if check_program_installed "S3Scanner"; then
    echo "S3Scanner found."
    # Prompt user for input
    read -p "Enter the name of the bucket to scan: " bucket_name
    # Run S3Scanner and save output to a file
    S3Scanner -s $bucket_name > s3scanner_results.txt
    echo "S3Scanner scan complete. Results saved to s3scanner_results.txt."
else
    echo "S3Scanner not found. Please install S3Scanner to use this tool."
fi

# Check if AWSBucketDump is installed
if check_program_installed "AWSBucketDump"; then
    echo "AWSBucketDump found."
    # Prompt user for input
    read -p "Enter the name of the bucket to scan: " bucket_name
    # Run AWSBucketDump and save output to a file
    AWSBucketDump -b $bucket_name > awsbucketdump_results.txt
    echo "AWSBucketDump scan complete. Results saved to awsbucketdump_results.txt."
else
    echo "AWSBucketDump not found. Please install AWSBucketDump to use this tool."
fi
