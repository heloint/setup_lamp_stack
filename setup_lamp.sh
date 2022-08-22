#!/bin/bash

# Get update from the apt repository
sudo apt-get update

# Install Curl
sudo apt install -y curl

# Install the base requirements for VirtualBox guest addition
sudo apt install build-essential gcc make perl dkms -y

# Install Apache2
sudo apt install -y apache2 apache2-utils

# Install MariaDB
sudo apt install -y mariadb-server mariadb-client

# Install the MySQL Secure Installation
sudo mysql_secure_installation

# For the following settings I use the followings:
	# Enter current password for root (enter for none): *enter*
	# Switch to unix_socket authentication [Y/n] n
	# Change the root password? [Y/n] n
	# Change the root password? [Y/n] n
	# Remove anonymous users? [Y/n] y
	# Disallow root login remotely? [Y/n] y
	# Remove test database and access to it? [Y/n] y
	# Reload privilege tables now? [Y/n] y

# Install PHP and the MySQL and Apache dependencies
sudo apt install -y php8.1 php8.1-mysql libapache2-mod-php8.1 php8.1-curl php8.1-xml

# Install Net-Tools for ifconfig
sudo apt install -y net-tools

# Print out the versions of the installed packages
printf "\n The following packages have been installed:\n"
printf "#################################################"
gcc --version
printf "#################################################"
make --version
printf "#################################################"
perl --version
printf "#################################################"
dkms --version
printf "#################################################"
mariadb --version
printf "#################################################"
php -v
printf "#################################################"
ifconfig --version
printf "#################################################"

# Open ports in the UFW firewall
sudo ufw allow 80/tcp
sudo ufw allow 43/tcp


# Test the LAMP stack installation within the browser
echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/phpinfo.php
firefox localhost:80 localhost:80/phpinfo.php &

# Install a better terminal text editor as alternative for Nano 
curl https://getmic.ro | bash
sudo mv ./micro /usr/local/bin/
