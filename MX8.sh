#!/bin/bash

# Check if a domain name is provided as an argument
if [ -z "$1" ]; then
  echo "Usage: $0 domain.com"
  exit 1
fi

# Set the domain name variable
domain="$1"

# Create a directory to store the results
mkdir -p "$domain"
cd "$domain" ||exit

# Run the tools and save the output in separate files
echo "[*] Running assetfinder..."
assetfinder -subs-only "$domain" > assetfinder.txt
echo "[*] Running subfinder..."
subfinder -d "$domain" -silent > subfinder.txt
echo "[*] Running sublist3r..."
sublist3r -d "$domain" -n -o sublist3r.txt > /dev/null

# Combine the results from all tools and remove duplicates
echo "[*] Combining the results..."
cat *.txt | sort -u > subdomains.txt

# Use httpx to probe for working HTTP and HTTPS subdomains
echo "[*]Probing for working subdomains..."
httpx -l subdomains.txt -silent -o working.txt

# Save all subdomains to a separate text file
echo "[*] Saving all subdomains to subdomains_all.txt..."
cp subdomains.txt subdomains_all.txt

# Display the number of extrated subdomains
total_subdomains=$(wc -l < subdomains_all.txt)
echo "[*] Total number of extracted subdomains: $total_subdomains"

total_subdomain=$(wc -l < working.txt)
echo "[*] Total number of active and infrequent subdomains: $total_subdomain"

# Cleanup temporary files
echo "[*] Cleaning up temporary files..."
test -f assetfinder.txt && rm assetfinder.txt
test -f subfinder.txt && rm subfinder.txt
test -f sublist3r.txt && rm sublist3r.txt
test -f subdomains.txt && rm subdomains.txt

# Exit the script
exit 0
