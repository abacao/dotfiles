#!/bin/bash

## Apt packages
sudo apt install -y stow git htop terminator flameshot curl apt-transport-https wget tmux jq yamllint tldr fzf \
    fonts-font-awesome fonts-noto-color-emoji fonts-font-awesome fonts-emojione \
    i3status hardinfo ripgrep pulsemixer guvcview iftop simplescreenrecorder deja-dup tig delta powertop httpie \
    python3 awscli s3cmd grep ldap-utils powertop guake remmina tree ncat suckless-tools iperf dunst inxi solaar \
    nextcloud-desktop cups ethtool barrier blanket codium nfs-common

for i in vscode_extensions_list;
do
    codium --install-extension $i
done
echo "-------------------------------------------------------vscode extensions"

#ASDF
asdf plugin-add terraform
asdf install terraform latest

asdf plugin-add consul
asdf install consul latest

asdf plugin-add vault
asdf install vault latest

asdf plugin-add packer
asdf install packer latest

asdf plugin-add terragrunt
asdf install terragrunt latest

asdf plugin-add yq
asdf install yq latest

echo "-------------------------------------------------------ASDF ended"

## Snap packages
sudo snap install slack --classic
sudo snap install telegram-desktop --classic
sudo snap install ngrok --classic

# Install most updated Lynis
sudo wget -O - https://packages.cisofy.com/keys/cisofy-software-public.key | sudo apt-key add -
echo 'Acquire::Languages "none";' | sudo tee /etc/apt/apt.conf.d/99disable-translations
echo "deb https://packages.cisofy.com/community/lynis/deb/ stable main" | sudo tee /etc/apt/sources.list.d/cisofy-lynis.list
sudo apt update
sudo apt install lynis

## things that need manual installation
echo "Installing Keybase\nZoom\nKeepassXc\nLinuxBrew"

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

## LinuxBrew
yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="$(brew --prefix)/share/man:$MANPATH"
export INFOPATH="$(brew --prefix)/share/info:$INFOPATH"

## BAT - cat with wings
BAT_DEB="0.18.3/bat_0.18.3_amd64.deb"
cd /tmp
wget https://github.com/sharkdp/bat/releases/download/$BAT_DEB
sudo dpkg -i /tmp/$BAT_DEB
sudo apt-get install -f -i
rm /tmp/$BAT_DEB

## PlayerCTL - multimedia in i3
PLAYERCTL_DEB="playerctl-2.4.1_amd64.deb"
PLAYERCTL_VERSION="v2.4.1"
cd /tmp
wget https://github.com/acrisci/playerctl/releases/download/$PLAYERCTL_VERSION/$PLAYERCTL_DEB
sudo dpkg -i /tmp/$PLAYERCTL_DEB
sudo apt-get install -f -y
rm /tmp/$PLAYERCTL_DEB

## Google Chrome
echo ""
echo ""
echo "Install Google Chome Manually"

