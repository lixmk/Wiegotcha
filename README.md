#Wiegotcha: Long Range RFID Thieving  
TODO: SPELLCHECK THIS SHIT  
The Wiegotcha is the next evolution of Long Range RFID badge capturing. Based on previous work by Fran Brown and Bishop Fox (Tastic RFID Thief), Wiegotcha uses a Raspberry Pi in place of Arduino for the added capability as ease of customization. One of the immediate benefits of using an RPi is quick an easy wifi communication with the badge reader.  
  
Before going any further, I want to make sure to acknowledge those who helped this project, without knowing they did so.  
1. Fran Brown and BishopFox for the original Tastic RFID Thief (https://www.bishopfox.com/resources/tools/rfid-hacking/attack-tools/). Much of the original Arduino code was ported over into wiegotcha.c.  
2. pidoorman RPi wiegand reader code (http://pidoorman.co.uk/).  
3. Kyle Mallory for his fork of the above pidoorman code (found at https://gist.github.com/hsiboy/9598741).  
4. Derek Eder for his csv to html code (https://github.com/derekeder/csv-to-html-table).  
5. Gordon Henterson for the wiringPi library (https://projects.drogon.net/raspberry-pi/wiringpi/).  
  
##Information  
Wiegotcha is a simple to build, simple to install, and simple to use tool for capturing RFID badge information from unsuspecting targets. Similar to it's predicessor, the Tastic RFID Thief, the Wiegotcha is designed to be placed inside an HID Maxiprox 5375 (125kHz ProxII cards), Indala ASR-620 (Indala), or an HID R90 (13.56mHz iClass cards). Wiegotcha improves upon previous publicly released long range RFID readers by incorporating wifi out of the box as well as hardware clock for accurate timestamps. Moving from Arduino to Raspberry Pi also means the Wiegotcha is easily customized and improved.  
  
Wiegotcha is intended to be built with a Raspberry Pi 3, but the code has been tested on an B+ and 2 (with external wifi). Testing has not been done on a pi zero, but it should work.    
  
Default Passwords:  
* root:Wiegotcha  
* pi:Wiegotcha  
  
IP Addressing:  
* eth0 = DHCP  
* wlan0 = 192.168.150.1  
  
Access Point:  
* ESSID: Wiegotcha  
* Pass: Wiegotcha  
* (See a pattern yet?)  
  
**Do not forget to change default passwords!**  
  
Future Plans (I should say hopes):  
* GPS Integration?  
* Proxmark3 Integration (auto- or semi-auto cloning via web app)  
* Push notifications?  
* Camera?    
  
##Code Installation
###Easy Mode  
Easy mode installation is basically the same as installing raspbian.  
1. Download the image from http://exfil.co/Wiegotcha.img.gz  
2. Decompress the image   
3. Use dd or whatever windows uses to push the image to your sd card.  
5. Ensure ethernet cable is connected and boot.  
6. After boot `screen -dr install`  
7. Follow instructions to complete final steps of installation.  
8. Install RPi instal RFID Reader.  
  
###Manual (longer) Mode
"Manual" installation is still fairly straight forward. Feel free to explore install.sh and laststep.sh to fully understand what they do.  
1. Burn a fresh raspbian SD card. You can use Jessie or Jessie-lite.  
2. `apt-get update && apt-get -y install git #Skip this step if you're using full Jessie`  
3. `git clone https://github.com/lixmk/Wiegotcha`  
4. `cd Wiegotcha && ./install.sh`  
5. The install script will walk you through everything, including a reboot.  
6. After first reboot `screen -dr install`  
7. Follow instructions to complete final steps of installation.  
8. Install RPi instal RFID Reader.  

##BOM: TODO  
Not much. Like a reader, a pi, a hwclock, a level shifter and a battery. And like 8 jumper wires. Simple. And it's all on Amazon.
