#!/bin/bash
########################################################################
#
# Written by Mike Kelly
# twitter.com/lixmk
# git.io/lixmk
# exfil.co
# 2016
#
########################################################################
###################                                  ###################
###################  Wiegotcha Install Script Part2  ###################
###################                                  ###################
########################################################################
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
########################################################################
########################################################################
#
#
echo -e "\e[0;31m#############################################################\e[0m"
echo -e "\e[0;31m#\e[0m                                                           \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m             Finishing Wiegotcha Installation.             \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m                                                           \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m                 Press ENTER to continue                   \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m                                                           \e[0;31m#\e[0m"
echo -e "\e[0;31m#############################################################\e[0m"
read -e NULL

echo "[*] Finishing installation."
#Checking if root. Will sudo
USER="$(whoami)"
if [ "$USER" != "root" ]
then
  echo "[!] Not running as root."
  echo -e "\e[0;31m[+] Switching to root. Enter root password.\e[0m"
  sudo su -
else
  echo "[*] cd'ing into /root/."
  cd ~
fi

echo -n "[*] Configuring Hardware Clock..."
#Enabling i2c device
modprobe i2c-bcm2708
sleep 3
echo -n "."
echo ds3231 0x68 > /sys/class/i2c-adapter/i2c-1/new_device
sleep 3
echo -n "."
#Writing current time to hardware clock
hwclock -w
sleep 3
echo "."
#Replacing temp rc.local file
echo "[*] Replacing temporary rc.local."
cd Wiegotcha
cp ./confs/rc.local /etc/rc.local
cd ~/

rm ./laststep.sh
echo -e "\e[0;31m[+] Installation almost complete.\e[0m"
echo -e "\e[0;31m[+] One more reboot needed.\e[0m"
echo -e "\e[0;31m[+] After reboot, if your hwclock time (UTC) is incorrect, run /root/Wiegotcha/fixclock.sh\e[0m"
echo ""
echo -n -e "\e[0;31m[+]Press any key to reboot.\e[0m"
read -e NULL
reboot
