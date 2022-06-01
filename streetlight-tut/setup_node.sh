#!/bin/bash

echo "We need to install Nodejs and NPM first. Stay strong!"
curl --silent --output /dev/null -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y -q nodejs
apt install npm