# Hermes - VPN Connection Simplifier

## About This Tool
A VPN Launcher to connect to HackTheBox and TryHackMe machines quickly.

<b> Please put all of your vpn files into /opt/Hermes. </b>
The tool will create a directory called OpenVPN in your home directory then move all of your VPNs to their respective folders (If they are in the current directory)

*You will have to put the VPNs in the folders manually otherwise for this to work*

Based on the [HTB Quick VPN](https://github.com/tux3d0/HTB_Quick_VPN) Repo from tux3do

## Installation

```bash
git clone https://github.com/Lavender-exe/Hermes.git
bash install.sh
```

## Usage 

1. Run the tool using `hermes` 
3. Insert your username and select your platform
4. Press enter then `Option 0` to close the application - your VPN should be running in the background.
5. To check, do `ps aux | grep 'openvpn'`
