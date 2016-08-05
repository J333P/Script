#!/bin/bash
# Author: Askle
# Script d'installation automatique Meteor + Askle application
#
#echo --------------------------------DEBUT---------------------------------
#sudo apt-get install build-essential mongodb debian-keyring autoconf automake libtool flex bison scons nodejs npm git -y
#sudo apt-get update -y && sudo apt-get upgrade -y
#echo ---------------------------CLONAGE_METEOR-----------------------------
#git clone --depth 1 -b release-1.2.1-universal --single-branch http://github.com/4commerce-technologies-AG/meteor.git
#/home/pi/meteor/meteor run
echo ---------------------------CLONAGE_ASKLEWA----------------------------
echo --------essai 1 sur 2-------
git clone http://github.com/J333P/AskleWA
echo --------essai 2 sur 2-------
git clone http://github.com/J333P/AskleWA
cd /home/pi/AskleWA
npm install --save meteor-node-stubs react react-addons-pure-render-mixin
/home/pi/meteor/meteor add aldeed:tabular && /home/pi/meteor/meteor add twbs:bootstrap && home/pi/meteor/meteor add react-meteor-data && home/pi/meteor/meteor add meteorhacks:npm
echo --------------------------AUTOBOOT_ASKLEAPP---------------------------
sudo cp /home/pi/Script/mongodb.service /etc/systemd/system/multi-user.target.wants/
sudo cp /home/pi/Script/mongodb.service /etc/systemd/system/
sudo cp /home/pi/Script/asklewa.service /etc/systemd/system/multi-user.target.wants/
sudo cp /home/pi/script/mongodb.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl start mongodb.service
sudo systemctl enable mongodb.service
sudo systemctl start asklewa.service
sudo systemctl enable asklewa.service
echo ---------------------------------FIN---------------------------------
sudo reboot
exit0
