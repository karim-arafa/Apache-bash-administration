#!/bin/bash

#script that request sitename and ip from user to allow Authentication on that virtual host

#read the sitename and ip from user
read -p "Enter the site name : " sitename
read -p "Enter the host ip : " host

#save the full path into variable
path=/var/www/$sitename
#--------------------------------------------------
#install utils package to allow authentication


echo "trying to install utils to allow authentication"

sudo apt-get update
sudo apt-get install apache2-utils

#---------------------------------------------------
#create file to save authentication data
touch $path/.htpasswd

#read the username from user
#require password from user then save it in the file
read -p "Please set the user name : " username
htpasswd $path/.htpasswd $username

#copy the template configuration file content and replace the dummy name - example - with sitename and replace ip 
cp default-vhostwithAuth.conf /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s/example.local/$sitename/g" /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s/127.0.0.x/$host/g" /etc/apache2/sites-available/${sitename}withAuth.conf
sed -i "s|example.dir|$path|g" /etc/apache2/sites-available/${sitename}withAuth.conf

#copy default-htaccess into the authentication path and replace the dummy name -example- with sitename
cp default-htaccess $path/.htaccess
cd $path
sed -i "s|example.dir|$path|g" .htaccess

echo "authentication successfully enabled"
#restart apache2 service

service apache2 restart
