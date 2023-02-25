#!/bin/bash

# Set output directory and file name prefix
OUTPUT_DIR="./output"
OUTPUT_FILE_PREFIX="insecure_deserialization"

# Create output directory if it doesn't exist
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
fi

# Run GadgetProbe to identify vulnerable libraries
echo "Running GadgetProbe..."
java -jar GadgetProbe.jar --target ./target/ --output "$OUTPUT_DIR/$OUTPUT_FILE_PREFIX-GadgetProbe.txt"

# Run ysoserial.net to generate payloads for identified libraries
echo "Running ysoserial.net..."
while read -r line; do
  lib=$(echo "$line" | awk '{print $1}')
  gadget=$(echo "$line" | awk '{print $2}')
  java -jar ysoserial.net-master.jar "$gadget" "echo $lib >> $OUTPUT_DIR/$OUTPUT_FILE_PREFIX-ysoserial.txt"
done < "$OUTPUT_DIR/$OUTPUT_FILE_PREFIX-GadgetProbe.txt"

echo "Finished. Results saved in $OUTPUT_DIR/$OUTPUT_FILE_PREFIX-GadgetProbe.txt and $OUTPUT_DIR/$OUTPUT_FILE_PREFIX-ysoserial.txt"

