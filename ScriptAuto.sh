#!/bin/bash
#
# Script d'installation automatique meteor + Askle application
#
echo ----------------------debut-----------------------
sudo apt-get install build-essential debian-keyring autoconf automake libtool flex bison scons nodejs npm git -y
sudo apt-get update -y && sudo apt-get upgrade -y
echo ----------------------meteor-----------------------
git clone --depth 1 -b release-1.2.1-universal --single-branch http://github.com/4commerce-technologies-AG/meteor.git /home/pi/meteor
cd /home/pi/meteor
meteor run
echo ----------------------askleWA-----------------------
git clone http://github.com/J333P/AskleWA /home/pi/AskleWA
cd /home/pi/AskleWA
npm install --save meteor-node-stubs react react-addons-pure-render-mixin
meteor add aldeed:tabular && meteor add twbs:bootstrap && meteor add react-meteor-data && meteor add meteorhacks:npm
echo ----------------------fini-----------------------
exit0
