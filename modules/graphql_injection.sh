#!/bin/bash

echo "Starting GraphQL Injection Scanning..."

# Read input parameters
url="$1"
output_dir="$2"
inql_opts="$3"
graphqlmap_opts="$4"
shapeshifter_opts="$5"

# Create output directory
mkdir -p "$output_dir"

# Run inql
echo "Running inql..."
inql -t "$url" -o "$output_dir/inql_results.txt" $inql_opts

# Run GraphQLmap
echo "Running GraphQLmap..."
python3 /opt/GraphQLmap/graphqlmap.py -u "$url" -o "$output_dir/graphqlmap_results.txt" $graphqlmap_opts

# Run shapeshifter
echo "Running shapeshifter..."
shapeshifter -url "$url" -output "$output_dir/shapeshifter_results.txt" $shapeshifter_opts

echo "GraphQL Injection Scanning finished."
