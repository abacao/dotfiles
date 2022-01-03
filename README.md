# Extra configs

## Symlinks to dotfiles
Install `stow` and run the following command from inside the dotfiles folder

`dotfiles $ stow -v -t ~ . --ignore="README.md" --ignore=".config/*"`

## Use old Devices Name (eth0 vs ens33)

`sudo nano /etc/default/grub`

`GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"`

`sudo grub-mkconfig -o /boot/grub/grub.cfg`

---
## Disable IPV6

`sudo nano /etc/sysctl.d/99-sysctl.conf`  

Copy and paste the following 3 lines at the bottom of the file.

```
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
net.ipv6.conf.lo.disable_ipv6 = 1
```

`sudo sysctl -p`

Check:  `cat /proc/sys/net/ipv6/conf/all/disable_ipv6`

---
### PPAs

`add-apt-repository ppa:alessandro-strada/google-drive-ocamlfuse-beta`
`add-apt-repository ppa:apandada1/brightness-controller`
`curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg`
`add-apt-repository ppa:obsproject/obs-studio`
`add-apt-repository ppa:phoerious/keepassxc`
`add-apt-repository ppa:regolith-linux/release`
`add-apt-repository ppa:slimbook/slimbook`
`echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" | \\n sudo tee -a /etc/apt/sources.list.d/virtualbox.list`
`add-apt-repository ppa:yktooo/ppa`
`add-apt-repository ppa:yktooo/ppa`
`add-apt-repository ppa:yubico/stable`

---
## Remember stuff
### Tips on alias
The alias "laptop, monitor, dual" will help you manage your desktop with single or dual monitor (dual is considering extra monitor on the right).

### Tips on sound
pavucontrol - to manage your sound source
pasystray - another form of change the sound source

### Things Usefull to install:
#### Colored Icons Statusbar - `sudo apt-get install fonts-emojione fonts-font-awesome fonts-fork-awesomei jq tldr`
#### Heroku cli - `curl https://cli-assets.heroku.com/install-ubuntu.sh`
#### Yubikey stuff- `sudo add-apt-repository ppa:yubico/stable && sudo apt install scdaemon yubikey-manager-qt yubioath-desktop yubikey-personalization-gui`
#### Screen Brightness Control- `https://github.com/haikarainen/light`

## GPG
```
$ gpg --list-secret-keys # gpg -K or gpg -k
$ export KEYID=$(gpg --list-secret-keys | grep sec | awk '{print $2}' | cut -d "/" -f 2)
$ gpg --export --armor --export-options export-minimal $KEYID
$ echo -e "5\ny\n" | gpg --command-fd 0 --expert --edit-key $KEYID trust
```
#### GPG Import Team
keybase team list-members talkdesk.sre | awk '{print $3}' | xargs -I '{}' sh -c "curl -s https://keybase.io/{}/key.asc | gpg --import"


## Keybase
`$ keybase pgp select`


# GOPASS - https://woile.github.io/gopass-cheat-sheet/
```
wget https://github.com/gopasspw/gopass/releases/download/v1.8.6/gopass-1.8.6-linux-amd64.deb
sudo dpkg -i gopass-1.8.6-linux-amd64.deb
```

```
gopass init
gopass --yes setup --remote <git@github.com:ORGANIZATION/REPO.git> --alias <GOPASS_MOUNT_NAME> --name "Jane Doe" --email "jane.doe@talkdesk.com"
gopass clone git@github.com:Talkdesk/gopass.git sre
```

## GITHUB
```
gpg --import gpg.key
gpg --export --armor --export-options export-minimal $KEYID
```

## VPN
```
git clone https://github.com/jonathanio/update-systemd-resolved.git
cd update-systemd-resolved
make
 
systemctl enable systemd-resolved.service
systemctl start systemd-resolved.service
sudo systemctl status systemd-resolved.service
```

`sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf`

## ASDF

asdf plugin-add terraform && 
asdf list-all terraform && 
asdf install terraform 0.12.21 && 
asdf global terraform 0.12.21 


## Wireguard Network-Manager GUI

```
sudo apt install wireguard git dh-autoreconf libglib2.0-dev intltool build-essential libgtk-3-dev libnma-dev libsecret-1-dev network-manager-dev resolvconf

```

```
git clone https://github.com/max-moser/network-manager-wireguard
cd network-manager-wireguard
./autogen.sh --without-libnm-glib

./configure --without-libnm-glib --prefix=/usr --sysconfdir=/etc --libdir=/usr/lib/x86_64-linux-gnu --libexecdir=/usr/lib/NetworkManager --localstatedir=/var

make   
sudo make install
```

## Dual Boot - Boot last booted OS

`sudo vim /etc/default/grub`

Add the following lines
```bash
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```

`sudo update-grub`

