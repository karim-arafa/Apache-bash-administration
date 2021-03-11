#!/bin/bash

#script that request sitename from user to delete that virtual host

#read sitename from user
read -p "Enter the site name : " sitename

#move to sites-available/ directory to delete the virtual host conf file
cd /etc/apache2/sites-available/
rm $sitename.conf

#move to /var/www directory to delete the virtual host folder and its children
cd /var/www
rm -R $sitename

echo "Deleted Successfully"

#restart apache2 service
service apache2 restart
