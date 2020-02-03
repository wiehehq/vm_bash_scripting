#!/bin/bash

# Update/Upgrade Ubuntu
sudo apt update
sudo apt upgrade

# Install UFW
sudo apt install ufw

# Install Apache
sudo apt install apache2

# Check UFW app list
sudo ufw app list

# SAMPLE OUTPUT
# Output
# Available applications:
#   Apache
#   Apache Full
#   Apache Secure
#   OpenSSH

# Check UFW app info
sudo ufw app info "Apache Full"
# SAMPLE OUTPUT
# Output
# Profile: Apache Full
# Title: Web Server (HTTP,HTTPS)
# Description: Apache v2 is the next generation of the omnipresent Apache web
# server.
#
# Ports:
#   80,443/tcp

# Allow incoming HTTP and HTTPS traffic for this profile
sudo ufw allow in "Apache Full"

# You can do a spot check right away to verify that everything went as planned
# by visiting your server’s public IP address in your web browser (see the note
# under the next heading to find out what your public IP address is if you do
# not have this information already):
# http://your_server_ip

# I already see this when I visit "LOCALHOST" in the browser, so it stands to
# reason that the previous commands are unnecessary when starting from this
# snapshot. Whether or not that is the case, continue on...

# Install MySQL
sudo apt install mysql-server
# [y]
sudo mysql_secure_installation
# [y]
# [0]
# [Enter strong password]
# [Re-Enter strong password]
# [y]
# [y]
# [y]
# [y]
# [y]

sudo mysql

# Next, check which authentication method each of your MySQL user accounts use
# with the following command:
SELECT user,authentication_string,plugin,host FROM mysql.user;

# In this example, you can see that the root user does in fact authenticate using
# the auth_socket plugin. To configure the root account to authenticate with a
# password, run the following ALTER USER command. Be sure to change password to a
# strong password of your choosing:
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';

# Then, run FLUSH PRIVILEGES which tells the server to reload the grant tables
# and put your new changes into effect:
FLUSH PRIVILEGES;

# Check the authentication methods employed by each of your users again to
# confirm that root no longer authenticates using the auth_socket plugin:
SELECT user,authentication_string,plugin,host FROM mysql.user;

# At this point, you should be in the mysql terminal, in order to exit, type the
# word "exit", and then type the word "exit" again
exit

# Installing PHP
