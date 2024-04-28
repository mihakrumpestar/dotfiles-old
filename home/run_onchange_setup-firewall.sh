#!/bin/bash

echo -e "\n\e[1m Firewall config \e[0m\n"

sudo ufw allow 22/tcp # SSH
sudo ufw allow 1714:1764/udp # KDE connect
sudo ufw allow 1714:1764/tcp # KDE connect

sudo ufw enable
sudo ufw reload
# sudo ufw status verbose
