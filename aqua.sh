#!/usr/bin/env bash

#text colors:
none="\033[0m"
red="\033[31;40m"
#------------------------
threading="--threads ${2}"
#Aquatone-takover helper; By OffXec.
#Lazybones coding ;P.
if [[ "$1" == "help" ]]; then
	echo "USAGE: bash "$0" target.com THREADS"
	exit 0
fi

if [[ "$1" -eq 0 ]]; then
	echo $red" ERROR: No domain supplied, exiting"$none
	exit 0
fi
if [[ "$2" -eq 0 ]]; then
	echo "No threads set. Using single/default threading!"
	threading="--threads 10"
else
	threading="$2"
	echo "Thread count set to "$2". Starting proccess."	
fi
SECONDS=0
echo -e "Mode:" $red" DISCOVER"$none"("$red" Enumerating sub-domains"$none")"
(aquatone-discover --domain "${1}" "$threading")
clear;echo
sleep 1
echo -e "Next Mode:"$red" SCANNING"$none
clear;echo
echo -e "-Enumerating open ports from our"$red" discovered"$none" hosts."
(aquatone-scan --domain "${1}" --ports large "$threading") 
sleep 1
clear;echo
echo -e "Final Mode:"$red" GATHERING"$none"("$red" Gathering HTTP-Screenshots, etc."$none")"
(aquatone-gather --domain "${1}" "$threading")
sleep 1
if [[ $? -ne 1 ]]; then
	clear
	echo
	echo -e "I've finished with all proccesses,"$red"Discovering, Scanning & Gathering"$none" information from"$red"${domain}"$none
fi
echo -e "Would you like to continue and attempt a"$red" sub-domain takeover"$none"?"
read takeover
if [[ $takeover -eq "yes" ]]; then
	(aquatone-takeover --domain "${1}")
else
	echo -e "No problem! Your results are stored at: ~/aquatone/"${domain}"/"
ELAPSED="Elapsed: $(($SECONDS / 3600))hrs $((($SECONDS / 60) % 60))min $(($SECONDS % 60))sec"
	echo -e "Enumeration finished in"$red"${ELAPSED}"$none
fi
