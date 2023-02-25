# coolsubh
This is the ultimate bug bounty automation &amp; web hacking script that I've created

# Features

- [Recon](#Recon)
    - [Subdomain Enumeration](#Subdomain-Enumeration)
    - [Port Scanning](#Port-Scanning)
    - [Screenshots](#Screenshots)
    - [Technologies](#Technologies)
    - [Content Discovery](#Content-Discovery)
    - [Links](#Links)
    - [Parameters](#Parameters)
    - [Fuzzing](#Fuzzing)

- [Exploitation](#Exploitation)
    - [Command Injection](#Command-Injection)
    - [CORS Misconfiguration](#CORS-Misconfiguration)
    - [CRLF Injection](#CRLF-Injection)
    - [CSRF Injection](#CSRF-Injection)
    - [Directory Traversal](#Directory-Traversal)
    - [File Inclusion](#File-Inclusion)
    - [GraphQL Injection](#GraphQL-Injection)
    - [Header Injection](#Header-Injection)
    - [Insecure Deserialization](#Insecure-Deserialization)
    - [Insecure Direct Object References](#Insecure-Direct-Object-References)
    - [Open Redirect](#Open-Redirect)
    - [Race Condition](#Race-Condition)
    - [Request Smuggling](#Request-Smuggling)
    - [Server Side Request Forgery](#Server-Side-Request-Forgery)
    - [SQL Injection](#SQL-Injection)
    - [XSS Injection](#XSS-Injection)
    - [XXE Injection](#XXE-Injection)

- [Miscellaneous](#Miscellaneous)
    - [Passwords](#Passwords)
    - [Secrets](#Secrets)
    - [Git](#Git)
    - [Buckets](#Buckets)
    - [CMS](#CMS)
    - [JSON Web Token](#JSON-Web-Token)
    - [postMessage](#postMessage)
    - [Subdomain Takeover](#Subdomain-Takeover)
    - [Uncategorized](#Uncategorized)

---

# Tools Used

### All tools used below are available on github

Subdomain Enumeration: Sublist3r, Amass, subfinder, assetfinder, massdns, Findomain, 
Port Scanning: masscan, nmap
Screenshots: EyeWitness, aquatone
Technologies: wappalyzer, webanalyze, 
Content Discovery: gobuster, feroxbuster, dirsearch, dirsearch (Go implementation), gospider, hakrawler, 
Links: LinkFinder, JS-Scan, waybackurls, gau, 
Parameters: parameth, Arjun, x8
Fuzzing: wfuzz, ffuf, fuzzdb, 
Command Injection: commix 
CORS Misconfiguration: Corsy, CORStest, 
CRLF Injection: CRLFsuite, crlfuzz, 
CSRF Injection: XSRFProbe 
Directory Traversal: dotdotpwn, FDsploit, off-by-slash, 
 File Inclusion: liffy, Burp-LFI-tests, LFI-Enum, 
GraphQL Injection: inql, GraphQLmap, shapeshifter, 
Header Injection: headi 
Insecure Deserialization: ysoserial, GadgetProbe, ysoserial.net, 
Insecure Direct Object References: Autorize 
Open Redirect: Oralyzer, Injectus, dom-red, 
 Request Smuggling: http-request-smuggling, smuggler, h2csmuggler, 
Server Side Request Forgery: SSRFmap, Gopherus, ground-control, SSRFire, 
SQL Injection: sqlmap, NoSQLMap, SQLiScanner, 
XSS Injection: XSStrike, xssor2, dalfox, BruteXSS 
XXE Injection: ground-control, dtd-finder, 
Passwords: thc-hydra, 
Secrets: git-secrets, gitleaks, truffleHog, 
Git: GitTools, gitjacker, git-dumper, 
Buckets: S3Scanner, AWSBucketDump, 
CMS: wpscan, WPSpider, wprecon, 
JSON Web Token: jwt_tool, c-jwt-cracker, 
postMessage: postMessage-tracker, PostMessage_Fuzz_Tool
Subdomain Takeover: subjack, SubOver, autoSubTakeover, NSBrute, can-i-take-over-xyz, 
Vulnerability Scanners: nuclei, Sn1per, 

# Tool Structure

bug_bounty_automation/
    main.sh
    modules/
        subdomain_enumeration.sh
        port_scanning.sh
        screenshots.sh
        technologies.sh
        content_discovery.sh
        links.sh
        parameters.sh
        fuzzing.sh
        command_injection.sh
        cors_misconfiguration.sh
        crlf_injection.sh
        csrf_injection.sh
        directory_traversal.sh
        file_inclusion.sh
        graphql_injection.sh
        header_injection.sh
        insecure_deserialization.sh
        insecure_direct_object_references.sh
        open_redirect.sh
        race_condition.sh
        request_smuggling.sh
        server_side_request_forgery.sh
        sql_injection.sh
        xss_injection.sh
        xxe_injection.sh
        passwords.sh
        secrets.sh
        git.sh
        buckets.sh
        cms.sh
        json_web_token.sh
        post_message.sh
        subdomain_takeover.sh
        vulnerability_scanners.sh


