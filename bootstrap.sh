#!/usr/bin/env bash

## Change this to the PS version you'd like to use
PS_VERSION=prestashop_1.6.1.1.zip

## Setup and basic tools
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y unzip

## Apache
sudo apt-get install -y apache2 libapache2-mod-php5

## MySQL and PHP
echo "mysql-server-5.5 mysql-server/root_password password abc123" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password abc123" | sudo debconf-set-selections
sudo apt-get install -y mysql-server php5-mysql
sudo apt-get install -y php5 php5-mcrypt

## phpMyAdmin
sudo apt-get install -y phpmyadmin
sudo cp /etc/phpmyadmin/apache.conf /etc/apache2/conf-available/phpmyadmin.conf
sudo a2enconf phpmyadmin 
sudo service apache2 reload

## Download Prestashop
cd /vagrant
wget http://www.prestashop.com/download/old/$PS_VERSION
unzip -o $PS_VERSION
sudo rm ./$PS_VERSION

## Create a database
mysql -uroot -pabc123 -e 'create database prestashop'

## Restart Apache to get config changes
sudo apachectl -k restart
