#!/bin/bash
ROOTPASSWD=''
DBNAME=vagrant
DBUSER=vagrant
DBPASSWD=vagrantpass
echo "Creating new db $DBNAME"
mysql -u root --password=$ROOTPASSWD -e "CREATE DATABASE $DBNAME"
mysql -u root --password=$ROOTPASSWD -e "grant all privileges on $DBNAME.* to '$DBUSER'@'%' identified by '$DBPASSWD'"
echo "Finish create db $DBNAME"
