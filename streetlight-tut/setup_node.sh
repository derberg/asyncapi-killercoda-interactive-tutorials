#!/bin/bash

echo "#####################################################"
echo "We need to install Nodejs and NPM first. Stay strong!"
echo "#####################################################"
curl --silent -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
bash ../tmp/nodesource_setup.sh
apt-get install -y -q nodejs
echo "#####################################################"
echo "All set! Go ahead!"
echo "#####################################################"
