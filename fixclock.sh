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
####################                                ####################
####################     Wiegotcha fixclock.sh      ####################
####################                                ####################
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
echo -e "\e[0;31m#\e[0m      This script will fix the hardware clock and set      \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m          the correct time and date for Wiegotcha          \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m                                                           \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m Ensure ethernet is connected then press ENTER to continue \e[0;31m#\e[0m"
echo -e "\e[0;31m#\e[0m                                                           \e[0;31m#\e[0m"
echo -e "\e[0;31m#############################################################\e[0m"
read -e NULL

#Shutting down ntp
echo "[*] Stopping ntp"
/etc/init.d/ntp stop
sleep 2

#Setting correct time
echo "[*] Setting correct time/date"
ntpd -q -g
sleep 2

#Starting ntp
echo "[*] Restarting ntp"
/etc/init.d/ntp start
sleep 2

#Setting clock time
echo "[*] Setting hardware clock"
hwclock -w
sleep 1

#Double check
echo "[*] Clock should be fixed now."
echo "[*] Confirm the following times match and that they are correct."
hwclock -r && date
exit 1


