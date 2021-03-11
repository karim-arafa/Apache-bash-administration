#!/bin/bash
#script for uninstalling apache2 web server
# exit : success code 0


sudo apt remove apache2
sudo autoremove

echo "apache2 removed successfully"

exit 0