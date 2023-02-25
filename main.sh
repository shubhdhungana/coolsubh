 #!/bin/bash

# set default values
domain=""
output_dir="output"
depth=3
threads=10

# print usage information
usage() {
    echo "Usage: $0 [-d domain] [-o output_dir] [-t threads] [-D depth]"
    echo ""
    echo "Options:"
    echo "  -d  target domain"
    echo "  -o  output directory (default: output)"
    echo "  -t  number of threads (default: 10)"
    echo "  -D  subdomain discovery depth (default: 3)"
    exit 1
}

# parse command line arguments
while getopts "d:o:t:D:" opt; do
    case "${opt}" in
        d) domain=${OPTARG};;
        o) output_dir=${OPTARG};;
        t) threads=${OPTARG};;
        D) depth=${OPTARG};;
        *) usage;;
    esac
done

# check if domain is set
if [ -z "${domain}" ]; then
    usage
fi

# create output directory
mkdir -p ${output_dir}

# create a function for each module to make it more readable and maintainable

run_subdomain_enumeration() {
    ./modules/subdomain_enumeration.sh -d ${domain} -o ${output_dir}/subdomains.txt -D ${depth} -t ${threads}
}

run_port_scanning() {
    ./modules/port_scanning.sh -d ${domain} -o ${output_dir}/ports.txt -t ${threads}
}

run_screenshots() {
    ./modules/screenshots.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/screenshots -t ${threads}
}

run_technologies_detection() {
    ./modules/technologies.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/technologies -t ${threads}
}

run_content_discovery() {
    ./modules/content_discovery.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/content -t ${threads}
}

run_links_discovery() {
    ./modules/links.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/links -t ${threads}
}

run_parameters_discovery() {
    ./modules/parameters.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/parameters -t ${threads}
}

run_fuzzing() {
    ./modules/fuzzing.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/fuzzing -t ${threads}
}

run_command_injection() {
    ./modules/command_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/command_injection -t ${threads}
}

run_cors_misconfiguration() {
    ./modules/cors_misconfiguration.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/cors_misconfiguration -t ${threads}
}

run_crlf_injection() {
    ./modules/crlf_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/crlf_injection -t ${threads}
}

run_csrf_injection() {
    ./modules/csrf_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/csrf_injection -t ${threads}
}

run_directory_traversal() {
    ./modules/directory_traversal.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/directory_traversal -t ${threads}
}

# run file inclusion
./modules/file_inclusion.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/file_inclusion -t ${threads}

# run GraphQL injection
./modules/graphql_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/graphql_injection -t ${threads}

# run header injection
./modules/header_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/header_injection -t ${threads}

# run HTTP splitting
./modules/http_splitting.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/http_splitting -t ${threads}

# run XSS injection
./modules/xss_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/xss_injection -t ${threads}

# run SQL injection
./modules/sql_injection.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/sql_injection -t ${threads}

# run open redirect
./modules/open_redirect.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/open_redirect -t ${threads}

# run subdomain takeover
./modules/subdomain_takeover.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/subdomain_takeover -t ${threads}

# run vulnerability scanning
./modules/vulnerability_scanning.sh -i ${output_dir}/subdomains.txt -o ${output_dir}/vulnerability_scanning -t ${threads}

# run final report
./modules/report_generator.sh -i ${output_dir} -o ${output_dir}/final_report.txt

echo "Pentesting completed successfully. Results can be found in ${output_dir}/final_report.txt."
