#!/bin/bash

# colors
reset="\e[1;0m"
red="\e[1;31m"
yellow="\e[1;33m"
green="\e[1;32m"
white="\e[1;37m"
blue="\e[1;34m"
biolet="\e[1;35m"
skyBlue="\e[1;36m"


function help() {
	echo -e "${yellow}Use:\n\t${biolet}./whichSystem.sh <ip-host>${reset}"
}

function main() {
	ttl=$(ping -c 1 $host | grep -oP "ttl=\d{1,3}" | cut -d "=" -f 2)
	if [ $ttl -le 64 ];then
		echo -e "${green}This system is Linux ${white}TTL ${red}-> ${white}$ttl$reset"
	elif [ $ttl -gt 64 ] && [ $ttl -lt 128 ];then
		echo -e "${green}This system is Windows ${white}TTL ${red}-> ${white}$ttl$reset"
	fi
}

if [ $1 ];then
	host=$1
	main
else
	help
fi
