# Script to install drivers for Iris Xe Graphics into Fujitsu on Ubuntu based linux
#
# link: https://dgpu-docs.intel.com/installation-guides/ubuntu/ubuntu-focal.html
#
#!/bin/bash

sudo apt-get install -y gpg-agent wget
wget -qO - https://repositories.intel.com/graphics/intel-graphics.key | sudo apt-key add -
sudo apt-add-repository 'deb [arch=amd64] https://repositories.intel.com/graphics/ubuntu focal main'

sudo apt-get update
sudo apt-get install \
  intel-opencl-icd \
  intel-level-zero-gpu level-zero \
  intel-media-va-driver-non-free \
  libmfx1

# Setting permission
stat -c "%G" /dev/dri/render*
groups ${USER}

sudo gpasswd -a ${USER} render
newgrp render

# Reboot
