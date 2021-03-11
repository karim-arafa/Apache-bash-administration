#!/bin/bash
#script for installing apache2 web server for the first time
# exit : success code 0

sudo apt update
sudo apt install apache2

sudo service apache2 start
echo "apache2 installed successfully"

exit 0
