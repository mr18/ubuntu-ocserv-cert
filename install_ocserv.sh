#!/bin/bash

# Script to install and configure ocserv on Ubuntu

# Update package list
sudo apt-get update

# Install OpenSSH server and client
sudo apt-get install openssh-server openssh-clients

# Generate public and private keys
ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

# Copy public key to authorized_keys file in root directory
cat ~/.ssh/id_rsa.pub | ssh root@your_server_ip 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'

# Copy private key to id_rsa file in root directory
cat ~/.ssh/id_rsa | ssh root@your_server_ip 'chmod 600 ~/.ssh/id_rsa'

# Install Cisco AnyConnect client
sudo apt-get install cisco-anyconnect-cli

# Add line to /etc/openssh/sshd_config file for AllowUsers and PasswordAuthentication
echo "AllowUsers your_username@your_server_ip" | sudo tee -a /etc/ssh/sshd_config
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
echo "X11Forwarding no" | sudo tee -a /etc/ssh/sshd_config

# Install and configure Ocserv
sudo apt-get install ocserv
sudo systemctl enable ocserv
sudo systemctl start ocserv
