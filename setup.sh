#!/bin/bash



#
# Copy the hosts and hostname file to replace them
#
echo "copy the nessesary files to /etc/*"
echo ""
cp /etc/hosts /etc/hosts_org
cp /etc/hostname /etc/hostname_org
cp /data/persist_custom_settings_venusos-master/files/hostname /etc/hostname
cp /data/persist_custom_settings_venusos-master/files/hosts /etc/hosts
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
clear