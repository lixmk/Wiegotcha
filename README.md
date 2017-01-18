#Wiegotcha: Long Range RFID Thieving  
TODO: SPELLCHECK THIS SHIT #This is a perpetual need.  
  
Wiegotcha is the next evolution of Long Range RFID badge capturing. Based on previous work by Fran Brown and Bishop Fox (Tastic RFID Thief), Wiegotcha uses a Raspberry Pi in place of Arduino for the added capability as ease of customization. One of the immediate benefits of using an RPi is quick an easy wifi communication with the badge reader.  
  
Before going any further, I want to make sure to acknowledge those who helped this project, without knowing they did so.  
1. Fran Brown and BishopFox for the original Tastic RFID Thief (https://www.bishopfox.com/resources/tools/rfid-hacking/attack-tools/). Much of the original Arduino code was ported over into wiegotcha.c.  
2. pidoorman RPi wiegand reader code (http://pidoorman.co.uk/).  
3. Kyle Mallory for his fork of the above pidoorman code (found at https://gist.github.com/hsiboy/9598741).  
4. Derek Eder for his csv to html code (https://github.com/derekeder/csv-to-html-table).  
5. Gordon Henterson for the wiringPi library (https://projects.drogon.net/raspberry-pi/wiringpi/).  
  
##Information  
Wiegotcha is a simple to build, simple to install, and simple to use tool for capturing RFID badge information from unsuspecting targets. Similar to it's predicessor, the Tastic RFID Thief, the Wiegotcha is designed to be placed inside an HID Maxiprox 5375 (125kHz ProxII cards), Indala ASR-620 (Indala), or an HID R90 (13.56mHz iClass cards). Wiegotcha improves upon previous publicly released long range RFID readers by incorporating wifi out of the box as well as hardware clock for accurate timestamps. Moving from Arduino to Raspberry Pi also means the Wiegotcha is easily customized and improved.  
  
Wiegotcha is intended to be built with a Raspberry Pi 3, but the code has been tested on an B+ and 2 (with external wifi). Testing has not been done on a pi zero, but it should work. Check out the associated blog post at: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/  
  
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
1. Download the image from https://drive.google.com/open?id=0B9S4W-e61-A7SElWUU1POVBiUEU  
2. Decompress the image   
3. Check the md5 sums: .gz = 7ef8867d5bcb97956bbb2d77653d8adf, .img = 635b19d7c6d34a40aa461a71089910c3  
4. Use dd or whatever windows uses to push the image to your sd card.  
5. Ensure ethernet cable is connected and boot.  
6. Run `/root/Wiegotcha/fixclock.sh` to set correct time to hardware clock.  
7. Proceed to Hardware Installation. 
  
###Manual (longer) Mode
"Manual" installation is still fairly straight forward. Feel free to explore install.sh and laststep.sh to fully understand what they do.  
1. Burn a fresh raspbian SD card. You can use Jessie or Jessie-lite.  
2. `apt-get update && apt-get -y install git #Skip this step if you're using full Jessie`  
3. `git clone https://github.com/lixmk/Wiegotcha`  
4. `cd Wiegotcha && ./install.sh`  
5. The install script will walk you through everything, including a reboot.  
6. After first reboot `screen -dr install`  
7. Follow instructions to complete final steps of installation.  
8. Proceed to Hardware Installation.  
  
##Hardware Installation
Thorough instructions: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/

Short version:  
1. Place the RTC on the RPi's GPIO starting at pin 1 (top left), going doing the left side to pin 9.  
2. Run RPi pin 4 to Level Shifter HV in    
3. Run RPi pin 6 to Level Shifter LV gnd  
4. Run RPi pin 11 to Level Shifter LV 1  
5. Run Rpi pin 12 to Level Shifter LV 4  
6. Run RPi pin 17 to Level Shifter LV in  
7. Reader TB1-3 to Battery Ground (Black)  
8. Reader TB1-1 to Battery 12v (Red)  
9. Reader TB1-2 to Level Shifter HV gnd


##BOM
* Raspberry Pi 3: https://www.amazon.com/dp/B01CD5VC92/  
* RFID Reader (Maxiprox 5375, Indala ASR-620, iClass R90): https://www.amazon.com/dp/B002I15F90/ (Maxiprox 5375. Check eBay for better prices)  
* Level Shifter: https://www.amazon.com/dp/B00RT03GSC/, https://www.sparkfun.com/products/12009 (Many option exist, some may come presoldered for the extra lazy)  
* DS3231 Real-time Clock: https://www.amazon.comdp/B00HF4NUSS/  
* Micro SD Card (Faster the better): https://www.amazon.com//dp/B017NT8PNE/ (Just an example)  
* 12v Battery with 5v USB: https://www.amazon.com/dp/B00ME3ZH7C/  
* Jumper wires (I use 5 Female to Female and 3 Male to Female): https://www.amazon.com/dp/B01EV70C78/  
* Short USB Mirco Cable: https://www.amazon.com/dp/B00VXH697W/  

