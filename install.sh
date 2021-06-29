#!/usr/bin/env bash

# Insall Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# Build Image
docker build --rm -t edit .

# Copy docker run script to local bin
cp scripts/edit.sh /usr/local/bin/edit.sh

# Make executable
chmod +x /usr/local/bin/edit.sh

# Add alias to .bashrc
grep -qxF "alias nvim=/usr/local/bin/edit.sh" ~/.bashrc || echo "alias nvim=/usr/local/bin/edit.sh" >> ~/.bashrc
source ~/.bashrc
