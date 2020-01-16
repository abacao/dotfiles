#!/bin/bash

set -ex 

echo "Make sure you have exited Zoom"
wget https://zoom.us/client/latest/zoom_amd64.deb -O /tmp/zoom_amd64.deb
sudo apt purge zoom -y || sudo dpkg -i /tmp/zoom_amd64.deb
echo "Zoom Updated"
