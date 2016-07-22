#!/bin/bash
#
# Script d'installation automatique meteor + Askle application
#
echo ---------------------------DEBUT----------------------------
sudo apt-get install build-essential mongodb debian-keyring autoconf automake libtool flex bison scons nodejs npm git -y
sudo apt-get update -y && sudo apt-get upgrade -y
echo ----------------------CLONAGE_METEOR-----------------------
git clone --depth 1 -b release-1.2.1-universal --single-branch http://github.com/4commerce-technologies-AG/meteor.git /home/pi/meteor
/home/pi/meteor/meteor run
echo ---------------------CLONAGE_ASKLEWA-----------------------
git clone http://github.com/J333P/AskleWA /home/pi/AskleWA
cd /home/pi/AskleWA
npm install --save meteor-node-stubs react react-addons-pure-render-mixin
meteor add aldeed:tabular && meteor add twbs:bootstrap && meteor add react-meteor-data && meteor add meteorhacks:npm
echo -----------------------AUTOBOOT_ASKLEAPP---------------------
cp /home/pi/Script/mongodb.service /etc/systemd/system/multi-user.target.wants/
cp /home/pi/Script/asklewa.service /etc/systemd/system/multi-user.target.wants/
sudo systemctl daemon-reload
sudo systemctl enable mongodb.service
sudo systemctl enable asklewa.service
echo -----------------------fini-------------------------
sudo reboot
exit0
