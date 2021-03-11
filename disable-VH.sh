#!/bash/bash

#script that request sitename from user to disable that virtual host

#read sitename from user
read -p "Enter the site name : " sitename

#change the directory to /etc/apache2/sites-available and then disable virtual host
cd /etc/apache2/sites-available
a2dissite $sitename.conf

echo "virtual host disabled Successfully"

#restart apache2 service
service apache2 restart
