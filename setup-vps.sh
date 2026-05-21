#!/bin/bash
set -e

echo "Updating system..."
sudo apt-get update -y

echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

echo "Adding user ab to docker group..."
sudo usermod -aG docker ab

echo "Disabling password authentication..."
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo sed -i 's/^#*PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

echo "Docker installed and password authentication disabled successfully."
