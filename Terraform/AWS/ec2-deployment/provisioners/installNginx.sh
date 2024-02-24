#!/bin/bash

# Install Nginx using amazon-linux-extras
echo "Installing Nginx..."
sudo yum install -y nginx

# Check if Nginx is installed
if ! rpm -q nginx &> /dev/null
then
    echo "Nginx installation failed."
    exit 1
else
    echo "Nginx has been installed."
fi

# Start Nginx service
sudo systemctl start nginx

# Check if Nginx service is running
if ! systemctl is-active --quiet nginx
then
    echo "Nginx is not running."
    exit 1
else
    echo "Nginx is running."
fi
