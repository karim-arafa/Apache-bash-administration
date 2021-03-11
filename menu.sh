#!/bin/bash
# Bash Menu Script to navigate with your options to help you manage your apache and Virtual Hosts

#check if the user root or not 
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#take the user option
PS3='please enter your choice: '

#list all options
options=("install apache2" 
 "uninstall apache2"
"list" "add" "delete" "disable site" "enable site"
"enable authentication" "disable authentication" "Quit")

#loop on all options and make switch case on it to detect the file needed to run it to satisfy user need
select opt in "${options[@]}"; do
	case $opt in
	"install apache2")
		echo "installing ..."
		bash install-apache.sh
		;;
	"uninstall apache2")
		echo "uninstalling ..."
		bash uninstall-apache.sh
		;;
	"list")
		echo "List of all Virtual hosts"
		bash list-all-VH.sh
		;;
	"add")
		echo "trying to add new host"
		bash add-VH.sh
		;;
	"delete")
		echo "deleting virtual host ..."
		bash delete-VH.sh
		;;
	"disable site")
		echo "disabling site of a virtual host"
		bash disable-VH.sh
		;;
	"enable site")
		echo "enabling site of a virtual host"
		bash enable-VH.sh
		;;
	"enable authentication")
		echo "enabling authentication on a virtual host"
		bash allowAuth.sh
		;;
	"disable authentication")
		echo "disabling authentication on a virtual host"
		bash disableAuth.sh
		;;
	"Quit")
		break
		;;
	*) echo "invalid option $REPLY" ;;
	esac
done
