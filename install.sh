#!/usr/bin/env bash

# Insall Docker
if [ ! -x "$(command -v docker)" ]; then
	    echo "Update docker"
	curl -fsSL https://get.docker.com -o scripts/get-docker.sh
	sh scripts/get-docker.sh
fi

# Copy docker run script to local bin
cp scripts/nvimserv_run.sh /usr/local/bin/nvimserv_run.sh

# Make executable
chmod +x /usr/local/bin/nvimserv_run.sh

# Add alias to .bashrc
grep -qxF "alias nvim=/usr/local/bin/nvimserv_run.sh" ~/.bashrc || echo "alias nvim=/usr/local/bin/nvimserv_run.sh" >> ~/.bashrc
source ~/.bashrc
