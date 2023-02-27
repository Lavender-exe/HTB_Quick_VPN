#!/bin/bash

if (( $EUID != 0 )); then
    echo "Please run as root"
    exit
fi

echo "

██╗  ██╗███████╗██████╗ ███╗   ███╗███████╗███████╗
██║  ██║██╔════╝██╔══██╗████╗ ████║██╔════╝██╔════╝
███████║█████╗  ██████╔╝██╔████╔██║█████╗  ███████╗
██╔══██║██╔══╝  ██╔══██╗██║╚██╔╝██║██╔══╝  ╚════██║
██║  ██║███████╗██║  ██║██║ ╚═╝ ██║███████╗███████║
╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝╚══════╝
                                                   
Install Script
"

echo "Making Directory"
sudo mkdir /opt/Hermes

echo "Adding Permissions"
chmod +x /opt/Hermes/Hermes.sh

echo "Adding shortcut as 'hermes'"
echo "alias hermes='sudo bash /opt/Hermes/Hermes.sh'" >> ~/.zshrc
echo "alias hermes='sudo bash /opt/Hermes/Hermes.sh'" >> ~/.bashrc

echo "Done!"
exit
