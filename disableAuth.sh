#!bin/bash
#script that request site name and host from the user to disable authentication from that virtual host

#first read the sitename and host
read -p "Enter the site name : " sitename
read -p "Enter the host ip : " host

#save the full path into variable
path=/var/www/$sitename

#remove the config file and the authentication file
rm /etc/apache2/sites-available/${sitename}withAuth.conf
rm $path/.htaccess $path/.htpasswd

#restart apache2 service
service apache2 restart
echo "authentication disabled successfully on your virtual host"


