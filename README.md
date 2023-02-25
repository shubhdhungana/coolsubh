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

•	Subdomain Enumeration: Sublist3r, Amass, subfinder, assetfinder, massdns, Findomain, 
•	Port Scanning: masscan, nmap
•	Screenshots: EyeWitness, aquatone
•	Technologies: wappalyzer, webanalyze, 
•	Content Discovery: gobuster, feroxbuster, dirsearch, dirsearch (Go implementation), gospider, hakrawler, 
•	Links: LinkFinder, JS-Scan, waybackurls, gau, 
•	Parameters: parameth, Arjun, x8
•	Fuzzing: wfuzz, ffuf, fuzzdb, 
•	Command Injection: commix 
•	CORS Misconfiguration: Corsy, CORStest, 
•	CRLF Injection: CRLFsuite, crlfuzz, 
•	CSRF Injection: XSRFProbe 
•	Directory Traversal: dotdotpwn, FDsploit, off-by-slash, 
•	File Inclusion: liffy, Burp-LFI-tests, LFI-Enum, 
•	GraphQL Injection: inql, GraphQLmap, shapeshifter, 
•	Header Injection: headi 
•	Insecure Deserialization: ysoserial, GadgetProbe, ysoserial.net, 
•	Insecure Direct Object References: Autorize 
•	Open Redirect: Oralyzer, Injectus, dom-red, 
•	Request Smuggling: http-request-smuggling, smuggler, h2csmuggler, 
•	Server Side Request Forgery: SSRFmap, Gopherus, ground-control, SSRFire, 
•	SQL Injection: sqlmap, NoSQLMap, SQLiScanner, 
•	XSS Injection: XSStrike, xssor2, dalfox, BruteXSS 
•	XXE Injection: ground-control, dtd-finder, 
•	Passwords: thc-hydra, 
•	Secrets: git-secrets, gitleaks, truffleHog, 
•	Git: GitTools, gitjacker, git-dumper, 
•	Buckets: S3Scanner, AWSBucketDump, 
•	CMS: wpscan, WPSpider, wprecon, 
•	JSON Web Token: jwt_tool, c-jwt-cracker, 
•	postMessage: postMessage-tracker, PostMessage_Fuzz_Tool
•	Subdomain Takeover: subjack, SubOver, autoSubTakeover, NSBrute, can-i-take-over-xyz, 
•	Vulnerability Scanners: nuclei, Sn1per, 



# Tool Structure
read above all answers, analyse it and help me making my technologies.sh file . Update my technologies.sh file and make it more better, more efficient and more useful according to main.sh file scenario and structure.

•	bug_bounty_automation/
•	main.sh
•	modules/
o	subdomain_enumeration.sh
o	port_scanning.sh
o	screenshots.sh
o	technologies.sh
o	content_discovery.sh
o	links.sh
o	parameters.sh
o	fuzzing.sh
o	command_injection.sh
o	cors_misconfiguration.sh
o	crlf_injection.sh
o	csrf_injection.sh
o	directory_traversal.sh
o	file_inclusion.sh
o	graphql_injection.sh
o	header_injection.sh
o	insecure_deserialization.sh
o	insecure_direct_object_references.sh
o	open_redirect.sh
o	race_condition.sh
o	request_smuggling.sh
o	server_side_request_forgery.sh
o	sql_injection.sh
o	xss_injection.sh
o	xxe_injection.sh
o	passwords.sh
o	secrets.sh
o	git.sh
o	buckets.sh
o	cms.sh
o	json_web_token.sh
o	post_message.sh
o	subdomain_takeover.sh
o	vulnerability_scanners.sh



