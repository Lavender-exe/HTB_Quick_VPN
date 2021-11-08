#!/bin/bash

# Script for connecting to different HTB VPNs
# the current version of the script assumes that you store your VPN config files in $HOME/vpm
#it also assumes that you have not renamed your ovpn config files

#Future version will create the missing dir and check for any ovpn files to be moved to the vpn folder

#this was a quick 10min script that I hope others on the HTB community or any others find usefull when dealing with multiple VPNs

# Created by Tuxnix

#Banner
clear
echo "
 ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄▄    ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄    ▄
█  █ █  █       █  ▄    █  █  █ █  █       █  █  █ █
█  █▄█  █▄     ▄█ █▄█   █  █  █▄█  █    ▄  █   █▄█ █
█       █ █   █ █       █  █       █   █▄█ █       █
█   ▄   █ █   █ █  ▄   █   █       █    ▄▄▄█  ▄    █
█  █ █  █ █   █ █ █▄█   █   █     ██   █   █ █ █   █
█▄▄█ █▄▄█ █▄▄▄█ █▄▄▄▄▄▄▄█    █▄▄▄█ █▄▄▄█   █▄█  █▄▄█

"

echo ""
echo " "
echo " This will require Sudo access "
echo " "
echo -n " Enter your HTB username: " 
read usrName
echo " What VPN would you like to connect to $usrName ?"
echo " "

# Starter labs VIP VPN
starterPoint() {
	sudo openvpn $HOME/vpn/starting_point_$usrName.ovpn
}

#Machine Labs VPN

labs() {
	sudo openvpn $HOME/vpn/lab_$usrName.ovpn
}
#End Games VPN
endGames() {
	sudo openvpn $HOME/vpn/endgames_$usrName.ovpn
}
#Release Arena VPN
releaseArena() {
	sudo openvpn $HOME/vpn/release_arena_$usrName.ovpn
}

press_enter() {
	  echo ""
	  echo -n "	Press Enter to continue "
	  read
	  clear
}

bad_option() {
	echo " you have choosen an incorrect menu option....try again"
	clear
}

until [ "$selection" = "0" ]; do
	echo ""
	echo " 	1 )	Starter Labs	"
	echo "	2 )	Machines	"
	echo "	3 )	End Games	"
	echo "	4 )	Release Arema	"
	echo "	0 )	Exit		"
	echo ""
	echo -n " Emter your selection : "
	read selection
	echo ""
	case $selection in
		1 ) clear ; starterPoint ;;
		2 ) clear ; labs ;;
		3 ) clear ; endGames;;
		4 ) clear ; releaseArena;;
		0 ) clear ; exit;;
		* ) clear ; bad_option ;press_enter ;
	esac
done
