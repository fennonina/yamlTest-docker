#!/bin/bash
# Script to add a user to Linux system
# -------------------------------------------------------------------------
# Copyright (c) 2007 nixCraft project <http://bash.cyberciti.biz/>
# This script is licensed under GNU GPL version 2.0 or above
# Comment/suggestion: <vivek at nixCraft DOT com>
# -------------------------------------------------------------------------
# See url for more info:
# http://www.cyberciti.biz/tips/howto-write-shell-script-to-add-user.html
# -------------------------------------------------------------------------
if [ $(id -u) -eq 0 ]; then
	read -p "Enter username : " usrname
	read -s -p "Enter password : " passwrd
	egrep "^$usrname" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$usrname exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $passwrd)
		useradd -m -p $pass $usrname
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi
