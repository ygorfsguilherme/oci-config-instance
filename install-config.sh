#!/bin/bash

sudo apt update
sudo apt install nginx certbot python3-certbot-nginx firewalld

sudo ufw disable
sudo apt remove --purge ufw

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --reload
