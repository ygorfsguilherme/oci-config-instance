#!/bin/bash

sudo apt update
sudo apt install -y nginx certbot python3-certbot-nginx firewalld unzip

sudo ufw disable
sudo apt remove --purge -y ufw

sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo firewall-cmd --add-service=ssh --permanent
sudo firewall-cmd --add-service=http --permanent
sudo firewall-cmd --add-service=https --permanent
sudo firewall-cmd --permanent --add-port=80/tcp
sudo firewall-cmd --reload

# Configurando Swap
sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab


