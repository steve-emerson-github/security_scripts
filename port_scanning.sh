#!/bin/bash
if [ $# -eq 0 ] 
  then
       echo "No arguments: Please provide an IP address"
       exit
  fi

ip=$1
date=$(date +%h%YT%H%M)

mkdir -p ~/reconnaissance/nmap/$date 2> /dev/null

echo "Search using provided IP address: $ip"
echo ""
echo "Results will be output to: " ~/reconnaissance/nmap/$date/
echo ""
echo "Select an option:"
echo "1 = sudo nmap -sC -A -oA nmap $ip"
echo "2 = sudo nmap -p- $ip"
echo "3 = sudo nmap --script smb-vuln* -p 445 -A $ip"
echo ""
read -p "Options (e.g. 1, 3) >" input

for option in $input
do
  if [[ "$option" == "1" ]]; then
   sudo nmap -sC -A -oA ~/reconnaissance/nmap/$date/nmap-Option1 $ip
  fi
  if [[ "$option" == "2" ]]; then
   sudo nmap -p- -oA ~/reconnaissance/nmap/$date/nmap-Option2 $ip
  fi
  if [[ "$option" == "3" ]]; then
   sudo nmap --script smb-vuln* -p 445 -A -oA ~/reconnaissance/nmap/$date/nmap-Option3 $ip
  fi
done
