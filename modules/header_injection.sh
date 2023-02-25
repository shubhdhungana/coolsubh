#!/bin/bash

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -f|--file)
        FILE="$2"
        shift # past argument
        shift # past value
        ;;
        -H|--header)
        HEADER="$2"
        shift # past argument
        shift # past value
        ;;
        *)    # unknown option
        echo "Unknown option: $1"
        exit 1
        ;;
    esac
done

# Check if required arguments are present
if [ -z "$FILE" ] || [ -z "$HEADER" ]; then
    echo "Usage: headi -f <file> -H <header>"
    exit 1
fi

# Check if file exists
if [ ! -f "$FILE" ]; then
    echo "File not found: $FILE"
    exit 1
fi

# Check if file is writable
if [ ! -w "$FILE" ]; then
    echo "File is not writable: $FILE"
    exit 1
fi

# Add header to file
if [[ "$(head -n 1 $FILE)" != "$HEADER" ]]; then
    sed -i "1i$HEADER" "$FILE"
fi

echo "Header added to $FILE"

