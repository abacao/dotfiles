#!/bin/bash

set -e

if [ $# -ne 1 ]; then
  printf "%s\n" "usage: gh_updater.sh 0.9.0"
  exit 1
fi

echo "Check version to Download"
# https://github.com/cli/cli/releases/download/v0.9.0/gh_0.9.0_linux_amd64.deb
wget https://github.com/cli/cli/releases/download/v$1/gh_$1_linux_amd64.deb -O /tmp/gh_amd64.deb
echo "Purge old version"
sudo apt purge gh -y
echo "Install downloaded version"
sudo dpkg -i /tmp/gh_amd64.deb
echo "Github CLI Updated"
