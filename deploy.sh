#!/bin/bash

# Prompt user to enter the domain
read -p "Enter your domain (e.g., yourdomain.com): " domain

# Define the content of the Caddyfile based on user input
caddyfileContent="$domain {
    reverse_proxy django_app:5000
}"

# Set the path where you want to save the Caddyfile
caddyfilePath="./caddyfile"

# Write the content to the Caddyfile
echo "$caddyfileContent" > "$caddyfilePath"

# Check if the file was created successfully
if [ -f "$caddyfilePath" ]; then
    echo "Caddyfile created successfully."
else
    echo "Failed to create Caddyfile."
    exit 1
fi

# Download the compose file from GitHub
curl -LJO "https://github.com/soniakashyap2002/test/raw/main/docker-compose.yml"

# Start Docker containers defined in the compose file
docker-compose up -d
