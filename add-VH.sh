#!/bin/bash

#script that request sitename and ip from user to add that virtual host

#read the sitename and ip from user
read -p "Enter the site name : " sitename #just a name
read -p "Enter the host ip : " host #127.0.0.X

# Create and configure folder in /var/www if option selected
path=/var/www/$sitename
mkdir /var/www/$sitename
echo "Folder /var/www/$sitename created"
# Creating dummy landing page
cp default-index.html /var/www/$sitename/index.html
echo "Intitialized with index page"

# Creating configuration file and replace the dummy name - example - with sitename and replace ip
cp default-vhost.conf /etc/apache2/sites-available/$sitename.conf
cd /etc/apache2/sites-available/
sed -i "s/example.local/$sitename/g" $sitename.conf
sed -i "s/127.0.0.x/$host/g" $sitename.conf
sed -i "s|example.dir|$path|g" $sitename.conf
echo "Configuration files created"

# Enabling virtual host and restarting the server
cd /etc/apache2/sites-available
a2ensite $sitename.conf
service apache2 reload
echo " apache Restarted"
echo "All done! Visit your newly created virtual host at https://$sitename"

