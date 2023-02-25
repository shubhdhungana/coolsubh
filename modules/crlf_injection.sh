#!/bin/bash

# set default values
input_file=""
output_dir="output"
threads=10

# print usage information
usage() {
    echo "Usage: $0 -i input_file [-o output_dir] [-t threads]"
    echo ""
    echo "Options:"
    echo "  -i  input file containing a list of subdomains"
    echo "  -o  output directory (default: output)"
    echo "  -t  number of threads (default: 10)"
    exit 1
}

# parse command line arguments
while getopts "i:o:t:" opt; do
    case "${opt}" in
        i) input_file=${OPTARG};;
        o) output_dir=${OPTARG};;
        t) threads=${OPTARG};;
        *) usage;;
    esac
done

# check if input file is set
if [ -z "${input_file}" ]; then
    usage
fi

# create output directory
mkdir -p ${output_dir}/crlf_injection

# loop through each subdomain in the input file and run CRLF injection
while read subdomain; do
    # run crlfuzz
    crlfuzz -u ${subdomain} -t ${threads} -o ${output_dir}/crlf_injection/${subdomain}.txt
    
    # run CRLFsuite
    crlfsuite -u ${subdomain} -o ${output_dir}/crlf_injection/${subdomain}_crlfsuite.txt
    
done < ${input_file}

echo "CRLF injection completed successfully. Results can be found in ${output_dir}/crlf_injection directory."

