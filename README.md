# VPN Launcher
A VPN Launcher to connect to HackTheBox and TryHackMe machines quickly.

<b> Please put all of your vpn files into $HOME/vpn. </b>
If you have a different dir you have your files stored in, you can simply change the paths and or file name in the script.

Based on the [HTB Quick VPN](https://github.com/tux3d0/HTB_Quick_VPN) Repo from tux3do

# Customisation:

You can select the VPNs from your current working directory by removing `$HOME/vpn`

```sh
[-] starterPoint() {
	sudo openvpn $HOME/vpn/starting_point_$usrName.ovpn
}
[+] starterPoint() {
	sudo openvpn starting_point_$usrName.ovpn
}
```
This can also be used to select any folder you want instead of the home directory.
