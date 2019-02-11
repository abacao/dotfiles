#!/bin/bash

## Navigate your bash history - https://github.com/dvorka/hstr
#sudo add-apt-repository ppa:ultradvorka/ppa && sudo apt-get update && sudo apt-get install hh && hh --show-configuration >> ~/.bashrc

## Apt packages
REPO=$PWD
sudo apt install -y git htop terminator pluma thefuck direnv rbenv fonts-font-awesome playerctl firefox thunderbird kdeconnect pavucontrol pasystray vlc vim

## Snap packages
sudo snap install atom --classic
sudo snap install slack --classic
sudo snap install telegram-desktop --classic

## things that need manual installation

##KeepassXC
if [ ! -f /usr/bin/keepassxc ]; then
  echo "Installing KeepassXC"
  sudo add-apt-repository ppa:phoerious/keepassxc -y
  sudo apt update
  sudo apt install keepassxc -y
else
  echo "............................................KeepassXC already installed"
fi

##Zoom
if [ ! -f /opt/zoom/zoom ]; then
  echo "Installing Zoom"
  ZOOM_DEB="zoom_amd64.deb"
  cd /tmp
  wget https://zoom.us/client/latest/$ZOOM_DEB
  sudo dpkg -i /tmp/$ZOOM_DEB
  sudo apt-get install -f -y
  rm /tmp/$ZOOM_DEB
else
  echo ".................................................Zoom already installed"
fi

## Keybase
if [ ! -f /opt/keybase/Keybase ]; then
  echo "Installing Keybase"
  KEYBASE_DEB="keybase_amd64.deb"
  cd /tmp
  curl -O https://prerelease.keybase.io/$KEYBASE_DEB
  sudo dpkg -i /tmp/$KEYBASE_DEB
  sudo apt-get install -f -y
  run_keybase
  rm /tmp/$KEYBASE_DEB
else
  echo "......................................................Keybase Installed"
fi

## Albert
echo "Installing Albert Launcher"
ALBERT_DEB="albert_0.14.21_amd64.deb"
ALBERT_UBUNTU_VERSION="xUbuntu_16.04"
cd /tmp
wget https://download.opensuse.org/repositories/home:/manuelschneid3r/$ALBERT_UBUNTU_VERSION/amd64/$ALBERT_DEB
sudo dpkg -i /tmp/$ALBERT_DEB
sudo apt-get install -f -y
rm /tmp/$ALBERT_DEB

## LinuxBrew
echo "Installing LinuxBrew"
sudo apt-get install linuxbrew-wrapper -y
#git clone https://github.com/Linuxbrew/brew.git ~/.linuxbrew
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

## Dropbox
echo "Installing Dropbox"
DROPBOX_DEB="dropbox_2015.10.28_amd64.deb"
cd /tmp
wget https://www.dropbox.com/download?dl=packages/ubuntu/$DROPBOX_DEB
sudo dpkg -i /tmp/$DROPBOX_DEB
sudo apt-get install -f -y
rm /tmp/$DROPBOX_DEB

## UKUU - Kernel update made easy
echo "Installing UKUU"
sudo add-apt-repository ppa:teejee2008/ppa -y
sudo apt update
sudo apt install ukuu -y

## BAT - cat with wings
if [ ! -f /usr/bin/bat ]; then
  echo "Installing BAT - Cat with wings"
  BAT_VERSION="0.10.0"
  BAT_DEB="bat_0.10.0_amd64.deb"
  cd /tmp
  #wget wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb
  wget https://github.com/sharkdp/bat/releases/download/v$BAT_VERSION/$BAT_DEB
  sudo dpkg -i /tmp/$BAT_DEB
  sudo apt-get install -f -y
  rm /tmp/$BAT_DEB
else
  echo "..........................................................Bat Installed"
fi

## FZF
echo "Installing FZF"
brew install fzf

# ## PlayerCTL - multimedia in i3
# PLAYERCTL_DEB="playerctl-0.6.1_amd64.deb"
# PLAYERCTL_VERSION="v0.6.1"
# cd /tmp
# wget https://github.com/acrisci/playerctl/releases/download/$PLAYERCTL_VERSION/$PLAYERCTL_DEB
# sudo dpkg -i /tmp/$PLAYERCTL_DEB
# sudo apt-get install -f -y
# rm /tmp/$PLAYERCTL_DEB

## Google Chrome
echo ""
echo ""
echo "Install Google Chome Manually"

###################################################
#read -n1 -r -p "Press any key to continue..." key

cd $REPO
# Install dotfiles
# VIM
rm -rf ~/.vimrc
ln -s $PWD/.vimrc $HOME/.vimrc

# TMUX
var2=".tmux.conf"
rm -rf $HOME/$var2
ln -s $PWD/$var2 $HOME/$var2

# GIT CONFIG
var3=".gitconfig"
rm -rf $HOME/$var3
ln -s $PWD/$var3 $HOME/$var3

# GIT Ignore
var4=".gitignore"
rm -rf $HOME/$var4
ln -s $PWD/$var4 $HOME/$var4

# BASH RC
var5=".bashrc"
rm -rf $HOME/$var5
ln -s $PWD/$var5 $HOME/$var5

# BASH PROFILE
var6=".bash_profile"
rm -rf $HOME/$var6
ln -s $PWD/$var6 $HOME/$var6

# BASHRC.D
var7=".bashrc.d"
rm -rf $HOME/$var7
ln -s $PWD/$var7 $HOME/$var7
echo $var7
echo $PWD/$var7
echo $HOME/$var7

# BIN
var8="bin"
rm -rf $HOME/$var8
ln -s $PWD/$var8 $HOME/$var8

# i3
var9="i3"
rm -rf $HOME/.config/$var9
ln -s $PWD/$var9 $HOME/.config/$var9

sudo apt-get autoclean -y
