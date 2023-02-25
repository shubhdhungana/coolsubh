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
1)	bug_bounty_automation/
2)	main.sh
3)	modules/
a)	subdomain_enumeration.sh
b)	port_scanning.sh
c)	screenshots.sh
d)	technologies.sh
e)	content_discovery.sh
f)	links.sh
g)	parameters.sh
h)	fuzzing.sh
i)	command_injection.sh
j)	cors_misconfiguration.sh
k)	crlf_injection.sh
l)	csrf_injection.sh
m)	directory_traversal.sh
n)	file_inclusion.sh
o)	graphql_injection.sh
p)	header_injection.sh
q)	insecure_deserialization.sh
r)	insecure_direct_object_references.sh
s)	open_redirect.sh
t)	race_condition.sh
u)	request_smuggling.sh
v)	server_side_request_forgery.sh
w)	sql_injection.sh
x)	xss_injection.sh
y)	xxe_injection.sh
z)	passwords.sh
aa)	secrets.sh
bb)	git.sh
cc)	buckets.sh
dd)	cms.sh
ee)	json_web_token.sh
ff)	post_message.sh
gg)	subdomain_takeover.sh
hh)	vulnerability_scanners.sh


