# Extra configs

## Process after cloning
Install `stow` and run the following command from inside the dotfiles folder

`dotfiles $ stow -v -t ~ . --ignore="README.md" --ignore=".config/*"`

### i3 stuff
  i3-msg reload <-relad i3 configuration  
  **mod+space** <-App Name launcher 
  **mod+shift+space** <-App binary launcher 
  **mod+1** <-Jumps to Desktop1  
  **mod+Shif+1** <-Moves app to Desktop1   
  **mod+q** <-Quit App  
  **mod+r** <-Resize the App  
  **mod+Enter** <-Opens Terminal with tmux
  **mod+Shift+Enter** <-Opens Terminal without tmux
  **mod+w** <-Horizontal tabbed  
  **mod+s** <-Vertical tabbed  
  **mod+h** <-Horizontal Layout  
  **mod+v** <-Vertical Layout  
  **mod+backslash** <-activate or deactivate float mode  
  **mod+-** <- activate always on top  
  **mod+backspace** <-Password Manager  
  **mod+x** <-Move workspace to the scren on the right
  **mod+z** <-Move workspace to the scren on the left
  **mod+w** Wifi
  **mod+c** Control Panel
  **mod+p** Power
  **mod+s** Sound
  **mod+d** Display
  **mod+w** Wifi
  **mod+n** Network
  **mod+b** Bluetooth
  **mod+f** Full Screen
  **mod+l** Lock
  


### i3 Alias
  laptop <-Alias to have only the laptop screen working  
  monitor <-Alias to have only a extra-monitor working  
  dual <-Laptop and Monitor togueter (laptop on the left)  
  triple <-Laptop, Ultrawide, vertical  

### i3 laptop light
git clone https://github.com/haikarainen/light


### Old Devices Name (eth0 vs ens33)

`sudo nano /etc/default/grub`

`GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"`

`sudo grub-mkconfig -o /boot/grub/grub.cfg`

---
### Disable IPV6

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
### Remember stuff
The alias "laptop, monitor, dual" will help you manage your desktop with single or dual monitor (dual is considering extra monitor on the right).

pavucontrol - to manage your sound source
pasystray - another form of change the sound source

### Things Usefull to install
- `sudo apt-get install fonts-emojione` - colored icons on i3statusbar
- `sudo apt-get install fonts-emojione` - pdf reader
- `curl https://cli-assets.heroku.com/install-ubuntu.sh`- heroku cli
- `sudo apt install tldr` - quick howto use a tool
- `sudo add-apt-repository ppa:yubico/stable && sudo apt install scdaemon yubikey-manager-qt yubioath-desktop yubikey-personalization-gui` - yubikey stuff
- `https://github.com/haikarainen/light` - To control backlight

# GPG

`$ gpg --list-secret-keys`
`$ export KEYID=$(gpg --list-secret-keys | grep sec | awk '{print $2}' | cut -d "/" -f 2)`
`$ gpg --export --armor --export-options export-minimal $KEYID`
$ `echo -e "5\ny\n" | gpg --command-fd 0 --expert --edit-key $KEYID trust`


keybase team list-members talkdesk.sre | awk '{print $3}' | xargs -I '{}' sh -c "curl -s https://keybase.io/{}/key.asc | gpg --import"


# Keybase
`$ keybase pgp select`


# GOPASS - https://woile.github.io/gopass-cheat-sheet/
`gopass init`
`gopass --yes setup --remote <git@github.com:ORGANIZATION/REPO.git> --alias <GOPASS_MOUNT_NAME> --name "Jane Doe" --email "jane.doe@talkdesk.com"`
`gopass clone git@github.com:Talkdesk/gopass.git sre`


# GITHUB
`gpg --export --armor --export-options export-minimal $KEYID`
