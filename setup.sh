#!/bin/bash

####################################################################################
# VARIABLES
####################################################################################
HOSTNAME="doris-venusos"

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
hostname $HOSTNAME
echo "done."
echo ""
sleep 1
echo "press any key to continue"
echo ""
read -s -n 1
cd /home/root
clear
echo "You need to logout and back in again for the promt to change"
echo ""

####################################################################################
# ADD Aliases
####################################################################################
echo "Add your prefered ALIASES"
echo ""

echo "Add to your .bash_aliases file"
echo ""

cat > /home/root/.bash_aliases <<'endmsg'
alias ll="ls -alhF"
alias cl="ls -alhF /data/dbus-shelly-em-smartmeter/current.log /data/dbus-shellyPlug/current.log"
endmsg

echo "Add to your .bashrc file"
echo ""
cat > /home/root/.bashrc <<'endmsg'
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
endmsg

echo "Add to your .profile file"
echo ""
cat > /home/root/.profile <<'endmsg'
if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi
endmsg

echo "Reload to activate"
echo ""
source ~/.bashrc
####################################################################################