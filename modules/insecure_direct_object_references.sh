#!/bin/bash

# Variables
domain=$1
output_dir=$2

# Create output directory
mkdir -p "$output_dir"

# Insecure Direct Object References

echo "[] Running Autorize for insecure direct object references..."
echo "[] Finding all URLs from $domain ..."
gau -subs "$domain" | grep -E '\.json$|\.yaml$|\.xml$|\.action$|\.ashx$|\.aspx$|\.php$|\.phtml$|\.do$|\.jsp$|\.jspx$|\.wss$|\.do$|\.action$|\.htm$|\.html$|\.xhtml$|\.rss$|\.atom$|\.ics$|\.csv$|\.tsv$|\.pdf$|\.swf$|\.svg$|\.woff$|\.eot$|\.woff2$|\.tif$|\.tiff$|\.bmp$|\.png$|\.gif$|\.jpg$|\.jpeg$|\.webp$|\.ico$|\.svgz$|\.ttf$|\.otf$|\.mid$|\.midi$|\.mp3$|\.wav$|\.avi$|\.mov$|\.mpeg$|\.mpg$|\.mkv$|\.webm$|\.ogg$|\.ogv$|\.m4a$|\.m4v$|\.mp4$|\.flv$|\.wmv$' > "$output_dir/all_urls.txt"
echo "[] Running Autorize for all URLs..."
autorize -i "$output_dir/all_urls.txt" -t 60 -c 100 -o "$output_dir/autorize-results.txt"

echo "[] Insecure Direct Object References scan completed!"

