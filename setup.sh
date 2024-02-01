#!/bin/bash

####################################################################################
# CHANGE HOSTNAME - Copy the hosts and hostname file to replace them
####################################################################################
echo "copy the nessesary files to /etc/*"
echo ""
# Backup the original files
cp /etc/hosts /etc/hosts_org
cp /etc/hostname /etc/hostname_org
# Copy the 2 new customized files
cp /data/persist_custom_settings_venusos-master/files/hostname /etc/hostname
cp /data/persist_custom_settings_venusos-master/files/hosts /etc/hosts
# force change the hostname so it is active now without reboot
hostname venus
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

####################################################################################
# INSTALL TAILSCALE - change this variable to match the tailescale latest version
####################################################################################
TAILSCALE_VERSION="1.58.2"
TAILSCALE_TGZ="tailscale_""$TAILSCALE_VERSION""_arm.tgz"

clear

# move into home directory of the user root.
echo "move into home directory of the user root."
echo ""
cd /home/root
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear


# download the latest tailscale package.
echo "download the latest tailscale package."
echo ""
curl -o tailscale_loc.tgz https://pkgs.tailscale.com/stable/$TAILSCALE_TGZ
echo "done."
echo ""
sleep 1
echo $TAILSCALE_TGZ
echo "press any key to continue"
echo ""
read -s -n 1
clear

# uncompress the package.
echo "uncompress the package."
echo ""
tar -xvf tailscale_loc.tgz
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# remove compressed file.
echo "remove compressed file."
echo ""
rm -r tailscale_loc.tgz
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# copy the nessesary files to /usr/bin.
echo "copy the nessesary files to /usr/bin."
echo ""
cp /home/root/tailscale_"$TAILSCALE_VERSION"_arm/tailscale /home/root/tailscale_"$TAILSCALE_VERSION"_arm/tailscaled /usr/bin/
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# Remove the uncompressed folder.
echo "Remove the uncompressed folder."
echo ""
rm -r /home/root/tailscale_"$TAILSCALE_VERSION"_arm
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# copy the nessesary file to /etc/init.d.
echo "copy the nessesary file to /etc/init.d."
echo ""
cp /data/persist_custom_settings_venusos-master/files/tailscaled /etc/init.d/
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# make init script executable
echo "make init script executable"
echo ""
chmod +x /etc/init.d/tailscaled
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# test the init script
echo "test the init script"
echo ""
/etc/init.d/tailscaled start
/etc/init.d/tailscaled stop
/etc/init.d/tailscaled start
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# configure tailscale init script to start automatically on boot
echo "configure tailscale init script to start automatically on boot"
echo ""
update-rc.d tailscaled defaults
echo "done."
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# enable ip-forward
echo "enable ip-forward"
echo ""
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear

# connect to your tailscale account
# Theese settings are custom for my setup, change the ip address to match your system!
echo "connect to your tailscale account"
echo ""
echo 'run "tailscale up -ssh --advertise-routes=192.168.77.0/24"'
echo ""
echo "if there was no errors, tailscale should be installed and ready!"
echo ""
