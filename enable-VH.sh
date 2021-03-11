#!/bash/bash

#script that request sitename from user to inable that virtual host

#read sitename from user
read -p "Enter the site name : " sitename

#change the directory to /etc/apache2/sites-available and then enable the virtual host
cd /etc/apache2/sites-available
a2ensite $sitename.conf

echo "virtual host enabled Successfully"

#restart apache2 service
service apache2 restart
