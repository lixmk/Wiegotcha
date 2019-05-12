# Wiegotcha: Long Range RFID Thieving  
Wiegotcha is the next evolution of Long Range RFID badge capturing. Based on previous work by Fran Brown and Bishop Fox (Tastic RFID Thief), Wiegotcha uses a Raspberry Pi in place of an Arduino for the added capabilities and ease of customization. One of the immediate benefits of using an RPi is quick and easy wireless communication with the badge reader.  
  
Before going any further, I want to make sure to acknowledge those who helped this project, without knowing they did so.  
1. Fran Brown and BishopFox for the original Tastic RFID Thief (https://www.bishopfox.com/resources/tools/rfid-hacking/attack-tools/). Much of the original Arduino code was ported over into wiegotcha.c.  
2. pidoorman RPi wiegand reader code (http://pidoorman.co.uk/).  
3. Kyle Mallory for his fork of the above pidoorman code (found at https://gist.github.com/hsiboy/9598741).  
4. Derek Eder for his csv to html code (https://github.com/derekeder/csv-to-html-table).  
5. Gordon Henterson for the wiringPi library (https://projects.drogon.net/raspberry-pi/wiringpi/).  
  
## Information  
Wiegotcha is a simple to build, simple to install, and simple to use tool for capturing RFID badge information from unsuspecting targets. Similar to it's predicessor, the Tastic RFID Thief, the Wiegotcha is designed to be placed inside an HID Maxiprox 5375 (125kHz ProxII cards), Indala ASR-620 (Indala), or an HID R90 (13.56mHz iClass cards). Wiegotcha improves upon previous publicly released long range RFID readers by incorporating wifi out of the box as well as hardware clock for accurate timestamps. Moving from Arduino to Raspberry Pi also means the Wiegotcha is easily customized and improved.  
  
Wiegotcha is intended to be built with a Raspberry Pi 3, but the code has been tested on an B+ and 2 (with external Wi-Fi). Testing has not been done on a RPi zero, but it should work. Check out the associated blog post at: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/.  
  
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
  
## Code Installation
### Easy Mode  
Easy mode installation is basically the same as installing Raspbian.  
1. Download the image from https://drive.google.com/file/d/0B1KiYGoUoNwGem8tZlRxeEVwRHM/  
2. Check .gz md5 sum: 7f8b0507e0b58cbc301b39550c59e33d.  
3. Decompress the image.  
4. Check .img md5 sum: b68d21f1c0e6b200985a29869491fbf0.  
5. Use dd or whatever windows uses to push the image to your sd card.  
6. Ensure ethernet cable is connected and boot.  
7. Run `/root/Wiegotcha/fixclock.sh` to set correct time to hardware clock.  
8. Proceed to Hardware Installation.  
  
### Manual (longer) Mode
"Manual" installation is still fairly straight forward. Feel free to explore install.sh and laststep.sh to fully understand what they do.  
1. Burn a fresh raspbian SD card. You can use Jessie or Jessie-lite.  
2. Run `sudo su -` to become root  
3. Run `apt-get update && apt-get -y install git #Skip this step if you're using full Jessie`  
4. In /root run `git clone https://github.com/lixmk/Wiegotcha`  
5. Run `cd Wiegotcha && ./install.sh`  
6. The install script will walk you through everything, including a reboot.  
7. After first reboot run `screen -dr install` (as root)  
8. Follow instructions to complete final steps of installation.  
9. Proceed to Hardware Installation.  
  
## Hardware Installation
Thorough instructions: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/

Short version:  
1. Place the RTC on the RPi's GPIO starting at pin 1 (top left), going down the left side to pin 9.  
2. Run RPi pin 4 to Level Shifter HV in.  
3. Run RPi pin 6 to Level Shifter LV gnd.  
4. Run RPi pin 11 to Level Shifter LV 1.  
5. Run Rpi pin 12 to Level Shifter LV 4.  
6. Run RPi pin 17 to Level Shifter LV in.  
7. Reader TB1-3 to Battery Ground (Black).  
8. Reader TB1-1 to Battery 12v (Red).  
9. Reader TB2-1 to Level Shifter HV 1  
10. Reader TB2-2 to Level Shifter HV 4  
11. Reader TB1-2 to Level Shifter HV gnd.  
12. OPTIONAL: Remove Speaker.  
13. OPTIONAL: Solder haptic motor.  

## BOM
Links change quite often but I try to keep the BOM list at the bottom of the blog post updated: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/

List:
* Raspberry Pi 3 
* RFID Reader (Maxiprox 5375, Indala ASR-620, iClass R90)
* Level Shifter
* DS3231 Real-time Clock
* Micro SD Card (8GB or larger)
* 12v Battery with 5v USB
* Jumper wires (I use 5 Female to Female and 3 Male to Female)
* Short USB Mirco Cable
* Haptic Motor (Optional)
