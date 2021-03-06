#!/bin/bash -xev 

#########################################################################################################
#
# Name mysql.sh
#
# Script to auto install the mysql database service, confuration of users must be done manually @ this time
# Author: Mark B.
# December 3 2016
#########################################################################################################



echo “Installing MariaDB”

sudo yum -y install mariadb-server mariadb

wait

sudo systemctl start mariadb

sudo systemctl enable mariadb


echo “Now Installing PhP”

sudo yum -y install php php-mysql

echo “Now Installing FirewallD”

sudo yum -y install firewalld

wait

systemctl start firewalld

echo “Setting firewall rules”

sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

echo “Your IP Address is”
ip a | grep 10.33*

echo “Restarting the httpd Service”
sudo systemctl restart httpd

wait

echo “Set a password for MariaDB”

#sudo mysql_secure_installation

exit 0
