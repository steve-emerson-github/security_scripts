#!/bin/bash
# Author: 
# Date: 04-05-2022
# Description:

# Color variables 

RED="\033[1;31m"
GREEN="\033[1;32m"
NOCOLOR="\033[0m"


if [ $# -eq 0 ] 
  then
       echo "${GREEN}No arguments: Please provide an IP address${NOCOLOR}"
       exit
fi

ip=$1
date=$(date +%h%YT%H%M)

mkdir -p ~/reconnaissance/nmap/$date 2> /dev/null

echo "${GREEN}Search using provided IP address: $ip${NOCOLOR}"
echo ""
echo "${GREEN}Results will be output to: ${NOCOLOR}" ~/reconnaissance/nmap/$date/
echo ""
echo "Select an option:"
echo "${GREEN}1 =${NOCOLOR} sudo nmap -sC -A -oA nmap $ip"
echo "${GREEN}2 =${NOCOLOR} sudo nmap -p- $ip"
echo "${GREEN}3 =${NOCOLOR} sudo nmap --script smb-vuln* -p 445 -A $ip"
echo ""
read -p "${GREEN}Options${NOCOLOR} (e.g. 1, 3) >" input

case "$input" in 
  1) sudo nmap -sC -A -oA ~/reconnaissance/nmap/$date/nmap-Option1 $ip ;;
  2) sudo nmap -p- -oA ~/reconnaissance/nmap/$date/nmap-Option2 $ip ;;
  3) sudo nmap --script smb-vuln* -p 445 -A -oA ~/reconnaissance/nmap/$date/nmap-Option3 $ip ;;
  *) exit 
esac