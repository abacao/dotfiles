 #!/bin/bash

## Navigate your bash history - https://github.com/dvorka/hstr
#sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hh && hh --show-configuration >> ~/.bashrc

## Apt packages
sudo apt install git htop terminator shutter pluma thefuck direnv rbenv fonts-font-awesome

## Snap packages
sudo snap install atom --classic
sudo snap install slack --classic
sudo snap install telegram-desktop --classic

## things that need manual installation
echo "Installing Albert\nKeybase\nZoom\nKeepassXc\nLinuxBrew"

##KeepassXC
sudo add-apt-repository ppa:phoerious/keepassxc -y
sudo apt update
sudo apt install keepassxc -y

##Zoom
ZOOM_DEB="zoom_amd64.deb"
cd /tmp
wget https://zoom.us/client/latest/$ZOOM_DEB
sudo dpkg -i /tmp/$ZOOM_DEB
sudo apt-get install -f -y
rm /tmp/$ZOOM_DEB

## Keybase
KEYBASE_DEB="keybase_amd64.deb"
cd /tmp
curl -O https://prerelease.keybase.io/$KEYBASE_DEB
sudo dpkg -i /tmp/$KEYBASE_DEB
sudo apt-get install -f -y
run_keybase
rm /tmp/$KEYBASE_DEB

## Albert
ALBERT_DEB="albert_0.14.21_amd64.deb"
ALBERT_UBUNTU_VERSION="xUbuntu_16.04"
cd /tmp
wget https://download.opensuse.org/repositories/home:/manuelschneid3r/$ALBERT_UBUNTU_VERSION/amd64/$ALBERT_DEB
sudo dpkg -i /tmp/$ALBERT_DEB
sudo apt-get install -f -y
rm /tmp/$ALBERT_DEB

## LinuxBrew
sudo apt-get install linuxbrew-wrapper
#git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

## Dropbox
DROPBOX_DEB="dropbox_2015.10.28_amd64.deb"
cd /tmp
wget https://www.dropbox.com/download?dl=packages/ubuntu/$DROPBOX_DEB
sudo dpkg -i /tmp/$DROPBOX_DEB
sudo apt-get install -f -y
rm /tmp/$DROPBOX_DEB

## UKUU - Kernel update made easy
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo apt update
sudo apt install ukuu -y

## BAT - cat with wings
BAT_DEB="0.4.1/bat_0.4.1_amd64.deb"
cd /tmp
wget https://github.com/sharkdp/bat/releases/download/$BAT_DEB
sudo dpkg -i /tmp/$BAT_DEB
sudo apt-get install -f -i
rm /tmp/$BAT_DEB

## FZF
bew install fzf


## Google Chrome
echo ""
echo ""
echo "Install Google Chome Manually"
