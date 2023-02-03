#!/bin/bash

# Check if Root

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

# Creates missing dirs

if [ ! -d "OpenVPN" ]; then
	echo "Creating VPN Directory"
	echo "[+] Creating OpenVPN"
	sudo mkdir $HOME/OpenVPN
fi

if [ ! -d "OpenVPN/HackTheBox" ]; then
	echo "[+] Creating OpenVPN/HackTheBox"
	sudo mkdir $HOME/OpenVPN/HackTheBox
fi

if [ ! -d "OpenVPN/TryHackMe" ]; then
	echo "[+] Creating OpenVPN/TryHackMe"
	sudo mkdir $HOME/OpenVPN/TryHackMe
fi

# Check if files exist on current directory - if yes move them to their folders

# HackTheBox

if [ -e starting_point_*.ovpn ]; then
	echo "[!] Moving Starting Point VPN to OpenVPN/HackTheBox/"
	sudo mv starting_point_*.ovpn $HOME/OpenVPN/HackTheBox/
fi

if [ -e lab_*.ovpn ]; then
	echo "[!] Moving Machines VPN to OpenVPN/HackTheBox/"
	sudo mv lab_*.ovpn $HOME/OpenVPN/HackTheBox/
fi

if [ -e endgames_*.ovpn ]; then
	echo "[!] Moving End Games VPN to OpenVPN/HackTheBox/"
	sudo mv endgames_*.ovpn $HOME/OpenVPN/HackTheBox/
fi

if [ -e fortress_*.ovpn ]; then
	echo "[!] Moving Fortress VPN to OpenVPN/HackTheBox/"
	sudo mv fortress_*.ovpn $HOME/OpenVPN/HackTheBox/
fi

# TryHackMe - Leaving this last because it might move all the vpns that exist to the thm folder too

if [ -e *.ovpn ]; then
	echo "[!] Moving TryHackMe VPN to OpenVPN/TryHackMe/"
	sudo mv *.ovpn $HOME/OpenVPN/TryHackMe/
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
	sudo openvpn $HOME/OpenVPN/HackTheBox/starting_point_$usrName.ovpn & disown
}

# Machine Labs VPN

machines() {
	sudo openvpn $HOME/OpenVPN/HackTheBox/lab_$usrName.ovpn & disown
}

# End Games VPN
endGames() {
	sudo openvpn $HOME/OpenVPN/HackTheBox/endgames_$usrName.ovpn & disown
}

# Release Arena VPN
releaseArena() {
	sudo openvpn $HOME/OpenVPN/HackTheBox/release_arena_$usrName.ovpn & disown
}

# Fortresses Labs VPN

fortresses() {
	sudo openvpn $HOME/OpenVPN/HackTheBox/fortresses_$usrName.ovpn & disown
}

# TryHackMe

tryhackme() {
	sudo openvpn $HOME/OpenVPN/TryHackMe/$usrName.ovpn & disown
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
