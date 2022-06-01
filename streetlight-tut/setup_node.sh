#!/bin/bash

curl --silent --output /dev/null -sL https://deb.nodesource.com/setup_14.x | bash -
apt-get install -y -q nodejs
apt-get install -y -q npm