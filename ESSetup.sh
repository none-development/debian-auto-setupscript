#!/bin/bash

echo -e "Azusas Debian Autosetup"
read -p -r "Start in 5 Seconds...." -t 5
echo "Continuing ...."
apt update
apt upgrade -y
apt autoremove
echo -e "Start installing requirements"
apt install htop screen git ufw unattended-upgrades curl wget software-properties-common gnupg2 ca-certificates lsb-release apt-transport-https -y
echo -e "Statring check ufw..."
echo -e "===================================================================================="
ss -tupln
echo -e "===================================================================================="
read -r -e -p "Please enter your SSH port for the firewall: " port_ssh
echo -e "SSH Port: $port_ssh"
    ufw allow "$port_ssh"
read -r -e -p "Should the firewall be activated? (y/n): " value
if [ "$value" == y ];
    then
        ufw enable
        ufw reload
    else 
    ufw reload
fi 
echo -e "===================================================================================="
clear
read -r -e -p "Configure autoupdate automatically? (y/n):" update
if [ "$update" == y ];
then
dpkg-reconfigure --priority=low unattended-upgrades
else
echo -e "Autoupdate setup has been postponed. This must now be adjusted manually." ; fi 
echo -e "===================================================================================="
echo -e "Webhosting Autoconfig"
echo -e "===================================================================================="
read -r -e -p "Should the latest version of NodeJS be installed? (y/n): " nodejs
if [ "$nodejs" == y ];
then
curl -sL https://deb.nodesource.com/setup_16.x | sudo bash - 
apt install nodejs -y 
node -v  
else
echo -e "Node JS and NPM were not installed. Continue." ; fi 
echo -e "===================================================================================="
read -r -e -p "Install nginx? (y/n): " nginxdata
if [ "$nginxdata" == y ];
then
    echo "deb http://nginx.org/packages/mainline/debian $(lsb_release -cs) nginx" \ | sudo tee /etc/apt/sources.list.d/nginx.list
    curl -fsSL https://nginx.org/keys/nginx_signing.key | sudo apt-key add -
    apt install nginx
    systemctl start nginx.service
    systemctl enable nginx.service
    read -p -r "Start install php in 5 Seconds...." -t 5
    echo "Continuing ...."
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
    wget -qO - https://packages.sury.org/php/apt.gpg | sudo apt-key add -
    apt update    
    apt install php8.0 -y
else
echo -e "nginx is not installed. Continue" ; fi 
echo -e "===================================================================================="
if [ "$nginxdata" == y ];
then
    read -r -e -p "Install php extensions(mysql, cli, common)?: (y/n) " phpextensions
    if [ "$phpextensions" == y ];
    then 
        apt install php8.0-{mysql,cli,common} ; fi
    
else
    echo -e "===================================================================================="; fi 
read -r -e -p "Enabled all Web Ports?: (y/n) " webports
    if [ "$webports" == y ];
    then 
    ufw allow 80/tcp
    ufw allow 443/tcp;
    fi
read -p -r "Start cleanup 5 Seconds...." -t 5
echo "Continuing ...."
apt autoremove
clear
read -r -e -p "Show all open Ports?: (y/n) " webports
    if [ "$webports" == y ];
    then 
        ufw status;
    fi
echo -e "===================================================================================="
echo -e "===================================================================================="
echo -e "===================================================================================="
echo -e "Installation Finished"