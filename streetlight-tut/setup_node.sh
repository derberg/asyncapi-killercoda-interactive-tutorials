#!/bin/bash

echo "#####################################################"
echo "We need to install Nodejs and NPM first. Stay strong!"
echo "#####################################################"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && source ~/.bashrc && nvm install 16
echo "#####################################################"
echo "All set! Go ahead!"
echo "#####################################################"
