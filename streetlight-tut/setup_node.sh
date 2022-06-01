#!/bin/bash

echo "#####################################################"
echo "We need to install Nodejs and NPM first. Stay strong!"
echo "#####################################################"
curl --silent --output /dev/null -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y -q nodejs
echo "#####################################################"
echo "All set! Go ahead!"
echo "#####################################################"