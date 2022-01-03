#!/bin/bash

set -e

echo "Make sure you have exited Zoom"
pkill zoom &
wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb &&
sudo apt-get purge zoom -y
sudo apt install /tmp/zoom_amd64.deb
echo "################"
echo "# Zoom Updated #"
echo "################"
zoom &
