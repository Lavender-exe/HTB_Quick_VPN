#!/bin/bash

# This script will create a folder for you to put your VPNs in so you can run them using this tool.

# Creates missing dirs (Before root cause file permissions)

if [ ! -d "OpenVPN" ]; then
	echo "Creating VPN Directory"
	echo "[+] Creating OpenVPN"
	mkdir ./OpenVPN
fi

if [ ! -d "OpenVPN/HackTheBox" ]; then
	echo "[+] Creating OpenVPN/HackTheBox"
	mkdir ./OpenVPN/HackTheBox
fi

if [ ! -d "OpenVPN/TryHackMe" ]; then
	echo "[+] Creating OpenVPN/TryHackMe"
	mkdir ./OpenVPN/TryHackMe
fi

# Check if files exist on current directory - if yes move them to their folders

# HackTheBox

if [ -e starting_point_*.ovpn ]; then
	echo "[!] Moving Starting Point VPN to OpenVPN/HackTheBox/"
	mv starting_point_*.ovpn OpenVPN/HackTheBox/
fi

if [ -e lab_*.ovpn ]; then
	echo "[!] Moving Machines VPN to OpenVPN/HackTheBox/"
	mv lab_*.ovpn OpenVPN/HackTheBox/
fi

if [ -e endgames_*.ovpn ]; then
	echo "[!] Moving End Games VPN to OpenVPN/HackTheBox/"
	mv endgames_*.ovpn OpenVPN/HackTheBox/
fi

if [ -e fortress_*.ovpn ]; then
	echo "[!] Moving Fortress VPN to OpenVPN/HackTheBox/"
	mv fortress_*.ovpn OpenVPN/HackTheBox/
fi

# TryHackMe - Leaving this last because it might move all the vpns that exist to the thm folder too

if [ -e *.ovpn ]; then
	echo "[!] Moving TryHackMe VPN to OpenVPN/TryHackMe/"
	mv *.ovpn OpenVPN/TryHackMe/
fi

# Check if Root

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo "Done!"

clear

echo "

██╗  ██╗███████╗██████╗ ███╗   ███╗███████╗███████╗
██║  ██║██╔════╝██╔══██╗████╗ ████║██╔════╝██╔════╝
███████║█████╗  ██████╔╝██╔████╔██║█████╗  ███████╗
██╔══██║██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══╝  ╚════██║
██║  ██║███████╗██║  ██║██║ ╚═╝ ██║███████╗███████║
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝
                                                   

"

echo ""
echo -n "[+] Enter your username:" 
read usrName
echo "[?] What VPN would you like to connect to, $usrName ?"
echo " "

# Starter labs VIP VPN

startingPoint() {
	sudo openvpn OpenVPN/HackTheBox/starting_point_$usrName.ovpn &
}

# Machine Labs VPN

machines() {
	sudo openvpn OpenVPN/HackTheBox/lab_$usrName.ovpn &
}

# End Games VPN
endGames() {
	sudo openvpn OpenVPN/HackTheBox/endgames_$usrName.ovpn &
}

# Release Arena VPN
releaseArena() {
	sudo openvpn OpenVPN/HackTheBox/release_arena_$usrName.ovpn &
}

# Fortresses Labs VPN

fortresses() {
	sudo openvpn OpenVPN/HackTheBox/fortresses_$usrName.ovpn &
}

# TryHackMe

tryhackme() {
	sudo openvpn OpenVPN/TryHackMe/$usrName.ovpn &
}

# Case Options 

press_enter() {
	  echo ""
	  echo -n "[!] Press Enter to continue "
	  read
	  clear
}

# Error handling

bad_option() {
	echo "[-] Incorrect Option - Please choose another on from the list."
	clear
}

until [ "$selection" = "0" ]; do
	echo ""
	echo " 	1 )	Starting Point	"
	echo "	2 )	Machines	"
	echo "	3 )	End Games	"
	echo "	4 )	Release Arena	"
	echo "	5 )	Fortresses 	"
	echo " 	6 ) 	TryHackMe	"
	echo "	0 )	Exit		"
	echo ""
	echo -n "[+] Enter your selection : "
	read selection
	echo ""
	case $selection in
		1 ) clear ; startingPoint ;;
		2 ) clear ; machines ;;
		3 ) clear ; endGames;;
		4 ) clear ; releaseArena;;
		5 ) clear ; fortresses;;
		6 ) clear ; tryhackme;;
		0 ) clear ; exit;;
		* ) clear ; bad_option ;press_enter ;
	esac
done
