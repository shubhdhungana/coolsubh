#!/bin/bash

# Set up variables
DOMAIN=$1
OUTPUT_DIR="$HOME/results/$DOMAIN/vulnerability_scanners"
NUCLEI_TEMPLATES="$HOME/tools/nuclei-templates"
SNIPER_REPORT="$OUTPUT_DIR/sniper_report.txt"

# Create output directory
mkdir -p $OUTPUT_DIR

# Run Nuclei
echo "Running Nuclei..."
nuclei -update-templates -silent -t $NUCLEI_TEMPLATES -o $OUTPUT_DIR/nuclei_report.txt $DOMAIN

# Run Sn1per
echo "Running Sn1per..."
sniper --dns $DOMAIN --disable-web --noreport --disable-recon --exclude recon --no-colour > $SNIPER_REPORT

# Print results
echo -e "\nVulnerability Scanners Results\n"
echo "Nuclei Report:"
cat $OUTPUT_DIR/nuclei_report.txt

echo -e "\nSn1per Report:"
cat $SNIPER_REPORT
