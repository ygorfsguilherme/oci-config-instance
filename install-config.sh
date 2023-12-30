#!/bin/bash

sudo apt update
sudo apt install -y nginx certbot python3-certbot-nginx firewalld

sudo ufw disable
sudo apt remove --purge -y ufw

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload
