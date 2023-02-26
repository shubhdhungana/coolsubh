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

1.	Subdomain Enumeration: Sublist3r, Amass, subfinder, assetfinder, massdns, Findomain, 
2.	Port Scanning: masscan, nmap
3.	Screenshots: EyeWitness, aquatone
4.	Technologies: wappalyzer, webanalyze, 
5.	Content Discovery: gobuster, feroxbuster, dirsearch, dirsearch (Go implementation), gospider, hakrawler, 
6.	Links: LinkFinder, JS-Scan, waybackurls, gau, 
7.	Parameters: parameth, Arjun, x8
8.	Fuzzing: wfuzz, ffuf, fuzzdb, 
9.	Command Injection: commix 
10.	CORS Misconfiguration: Corsy, CORStest, 
11.	CRLF Injection: CRLFsuite, crlfuzz, 
12.	CSRF Injection: XSRFProbe 
13.	Directory Traversal: dotdotpwn, FDsploit, off-by-slash, 
14.	File Inclusion: liffy, Burp-LFI-tests, LFI-Enum, 
15.	GraphQL Injection: inql, GraphQLmap, shapeshifter, 
16.	Header Injection: headi 
17.	Insecure Deserialization: ysoserial, GadgetProbe, ysoserial.net, 
18.	Insecure Direct Object References: Autorize 
19.	Open Redirect: Oralyzer, Injectus, dom-red, 
20.	Request Smuggling: http-request-smuggling, smuggler, h2csmuggler, 
21.	Server Side Request Forgery: SSRFmap, Gopherus, ground-control, SSRFire, 
22.	SQL Injection: sqlmap, NoSQLMap, SQLiScanner, 
23.	XSS Injection: XSStrike, xssor2, dalfox, BruteXSS 
24.	XXE Injection: ground-control, dtd-finder, 
25.	Passwords: thc-hydra, 
26.	Secrets: git-secrets, gitleaks, truffleHog, 
27.	Git: GitTools, gitjacker, git-dumper, 
28.	Buckets: S3Scanner, AWSBucketDump, 
29.	CMS: wpscan, WPSpider, wprecon, 
30.	JSON Web Token: jwt_tool, c-jwt-cracker, 
31.	postMessage: postMessage-tracker, PostMessage_Fuzz_Tool
32.	Subdomain Takeover: subjack, SubOver, autoSubTakeover, NSBrute, can-i-take-over-xyz, 
33.	Vulnerability Scanners: nuclei, Sn1per, 



# Tool Structure
read above all answers, analyse it and help me making my technologies.sh file . Update my technologies.sh file and make it more better, more efficient and more useful according to main.sh file scenario and structure.

1.	bug_bounty_automation/
2.	main.sh
3.	modules/
4.	subdomain_enumeration.sh
5.	port_scanning.sh
6.	screenshots.sh
7.	technologies.sh
8.	content_discovery.sh
9.	links.sh
10.	parameters.sh
11.	fuzzing.sh
12.	command_injection.sh
13.	cors_misconfiguration.sh
14.	crlf_injection.sh
15.	csrf_injection.sh
16.	directory_traversal.sh
17.	file_inclusion.sh
18.	graphql_injection.sh
19.	header_injection.sh
20.	insecure_deserialization.sh
21.	insecure_direct_object_references.sh
22.	open_redirect.sh
23.	race_condition.sh
24.	request_smuggling.sh
25.	server_side_request_forgery.sh
26.	sql_injection.sh
27.	xss_injection.sh
28.	xxe_injection.sh
29.	passwords.sh
30.	secrets.sh
31.	git.sh
32.	buckets.sh
33.	cms.sh
34.	json_web_token.sh
35.	post_message.sh
36.	subdomain_takeover.sh
37.	vulnerability_scanners.sh

Created By: Shubham Dhungana
Cyber Security Researcher


