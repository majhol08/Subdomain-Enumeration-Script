# Subdomain-Enumeration-Script
This is a bash script that uses three tools: assetfinder, subfinder,sublist3r, to extract and explore subdomains of a given domain name. It creates a directory for each domain, saves the output of each tool in separate files, collects and sorts the results, and uses httpx to verify working subdomains. Number of extracted and active subdomains





********************************************************************************************************

**Title**: Subdomain Enumeration Script
**Description**: This is a bash script that uses three tools: assetfinder, subfinder, and sublist3r, to extract and probe subdomains for a given domain name. It creates a directory for each domain, saves the output of each tool in separate files, combines and sorts the results, and uses httpx to check for working subdomains. It also displays the number of extracted and active subdomains, and cleans up the temporary files.
**Usage**: To use this script, you need to have assetfinder, subfinder, sublist3r, and httpx installed on your system. You can run the script by passing a domain name as an argument, like this:

```bash

 chmod +x MX8.sh
./MX8.sh example.com
```

The script will create a directory named example.com and store the results in two files: subdomains_all.txt and working.txt. The former contains all the subdomains extracted by the three tools, and the latter contains only the subdomains that are working with HTTP or HTTPS. You can view the results by opening these files or using the cat command.
