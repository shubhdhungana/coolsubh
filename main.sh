#!/bin/bash

# Set default values
output_dir="output"
depth=3
threads=10

# Parse command line arguments
while getopts "d:o:t:D:" opt; do
    case "${opt}" in
        d) domain="${OPTARG}" ;;
        o) output_dir="${OPTARG}" ;;
        t) threads="${OPTARG}" ;;
        D) depth="${OPTARG}" ;;
        *) exit 1 ;;
    esac
done

# Check if domain is set
if [[ -z "${domain}" ]]; then
    echo "Usage: $0 [-d domain] [-o output_dir] [-t threads] [-D depth]"
    exit 1
fi

# Create output directory if it doesn't exist
mkdir -p "${output_dir}"

# Run modules
for module in subdomain_enumeration port_scanning screenshots technologies content_discovery links parameters fuzzing command_injection cors_misconfiguration crlf_injection csrf_injection directory_traversal file_inclusion graphql_injection header_injection http_splitting sql_injection open_redirect subdomain_takeover vulnerability_scanning; do
    "./modules/${module}.sh" -i "${output_dir}/subdomains.txt" -o "${output_dir}/${module}" -t "${threads}" "${depth}" || exit 1
done

# Generate final report
"./modules/report_generator.sh" -i "${output_dir}" -o "${output_dir}/final_report.txt" || exit 1

echo "Pentesting completed successfully. Results can be found in ${output_dir}/final_report.txt."
