#!/bin/bash

# Define colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
purple='\033[0;35m'
cyan='\033[0;36m'
nc='\033[0m'

# Define output directory
outdir="./output/post_message"
mkdir -p $outdir

# Define target URL
url="http://example.com"

# Define postMessage-tracker command
postmessage_tracker="python3 /path/to/postMessage-tracker.py -u $url -d $outdir/postmessage_tracker.json"

# Define PostMessage_Fuzz_Tool command
postmessage_fuzz_tool="python3 /path/to/PostMessage_Fuzz_Tool.py -u $url -d $outdir/postmessage_fuzz_tool.json"

# Run postMessage-tracker
echo -e "${blue}Running postMessage-tracker...${nc}"
$postmessage_tracker

# Check if postMessage-tracker succeeded
if [ $? -eq 0 ]; then
  echo -e "${green}postMessage-tracker completed successfully!${nc}"
else
  echo -e "${red}postMessage-tracker failed.${nc}"
fi

# Run PostMessage_Fuzz_Tool
echo -e "${blue}Running PostMessage_Fuzz_Tool...${nc}"
$postmessage_fuzz_tool

# Check if PostMessage_Fuzz_Tool succeeded
if [ $? -eq 0 ]; then
  echo -e "${green}PostMessage_Fuzz_Tool completed successfully!${nc}"
else
  echo -e "${red}PostMessage_Fuzz_Tool failed.${nc}"
fi

# Print summary
echo -e "${cyan}postMessage results:${nc}"
echo -e "${yellow}postMessage-tracker:${nc} $outdir/postmessage_tracker.json"
echo -e "${yellow}PostMessage_Fuzz_Tool:${nc} $outdir/postmessage_fuzz_tool.json"
