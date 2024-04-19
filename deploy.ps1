# Prompt user to enter the domain
$domain = Read-Host "Enter your domain (e.g., yourdomain.com)"

# Define the content of the Caddyfile based on user input
$caddyfileContent = @"
$domain {
    reverse_proxy django_app:5000
}
"@

# Set the path where you want to save the Caddyfile
$caddyfilePath = "./caddyfile"

# Write the content to the Caddyfile
$caddyfileContent | Set-Content -Path $caddyfilePath

# Check if the file was created successfully
if (Test-Path $caddyfilePath) {
    Write-Output "Caddyfile created successfully."
} else {
    Write-Error "Failed to create Caddyfile."
}

# Set the GitHub repository URL and file path
$githubfileUrl =  "https://github.com/soniakashyap2002/test/raw/main/docker-compose.yml"

# Download the compose file from GitHub
Invoke-WebRequest -Uri $githubfileUrl -OutFile "docker-compose.yml"

# Start Docker containers defined in the compose file
docker-compose up -d
