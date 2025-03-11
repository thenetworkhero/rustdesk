#!/bin/bash

# Define the RustDesk download URL
RUSTDESK_URL="https://github.com/rustdesk/rustdesk/releases/download/1.3.8/rustdesk-1.3.8-x86_64.deb"

# Define the output file name
DEB_FILE="rustdesk-1.3.8-x86_64.deb"

# Download RustDesk
echo "Downloading RustDesk..."
curl -L -o "$DEB_FILE" "$RUSTDESK_URL"

# Check if download was successful
if [ $? -ne 0 ]; then
    echo "Download failed. Please check the URL and try again."
    exit 1
fi

# Install RustDesk using dpkg
echo "Installing RustDesk..."
sudo dpkg -i "$DEB_FILE"

# Fix missing dependencies if any
sudo apt-get install -f -y

# Remove the downloaded .deb file
rm "$DEB_FILE"

echo "RustDesk installation completed."
