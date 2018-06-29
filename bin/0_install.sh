#!/bin/bash

## Navigate your bash history - https://github.com/dvorka/hstr
#sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hh && hh --show-configuration >> ~/.bashrc

## Apt packages
sudo apt install git htop terminator shutter pluma 

## Snap packages
sudo snap install atom --classi
sudo snap install slack --classic
sudo snap install telegram-desktop --classic

## things that need manual installation
echo "Installing Albert\nKeybase\nZoom\nKeepassXc\nLinuxBrew"

##KeepassXC
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo apt update
sudo apt install keepassxc -y

##Zoom
cd /tmp
wget https://zoom.us/client/latest/zoom_amd64.deb
sudo dpkg -i /tmp/zoom_amd64.deb
sudo apt-get install -f

## Keybase
cd /tmp
curl -O https://prerelease.keybase.io/keybase_amd64.deb
sudo dpkg -i keybase_amd64.deb
sudo apt-get install -f
run_keybase

## Albert
cd /tmp
wget https://download.opensuse.org/repositories/home:/manuelschneid3r/xUbuntu_16.04/amd64/albert_0.14.21_amd64.deb
sudo dpkg -i albert_0.14.21_amd64.deb
sudo apt-get install -f

## LinuxBrew
git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

## Google Chrome
echo "Install Google Chome Manually"
