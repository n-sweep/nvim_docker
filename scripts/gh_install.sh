#!/bin/env sh

# Get Latest Version No.
VERSION=`curl  "https://api.github.com/repos/cli/cli/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/' | cut -c2-` 

# Download Latest Binary
curl -sSL https://github.com/cli/cli/releases/download/v${VERSION}/gh_${VERSION}_linux_amd64.tar.gz -o gh_${VERSION}_linux_amd64.tar.gz

# Unpack & Install
tar xvf gh_${VERSION}_linux_amd64.tar.gz
cp gh_${VERSION}_linux_amd64/bin/gh /usr/local/bin/

# Authenticate
gh auth login --with-token < gh_token.txt

