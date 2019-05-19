# Extra configs

### i3 stuff
  i3-msg reload <-relad i3 configuration  
  **mod+d** <-App launcher  
  **mod+1** <-Jumps to Desktop1  
  **mod+Shif+1** <-Moves app to Desktop1  
  **mod+m** <-Music Desktop  
  **mod+q** <-Quit App  
  **mod+r** <-Resize the App  
  **mod+Enter** <-Opens Terminal  
  **mod+w** <-Horizontal tabbed  
  **mod+s** <-Vertical tabbed  
  **mod+h** <-Horizontal Layout  
  **mod+v** <-Vertical Layout  
  **mod+Shift+Spacebar** <-activate or deactivate float mode  
  **mod+-** <- activate always on top  
  **mod+backspace** <-Password Manager  
  **mod+x** <-Move workspace to the other screen  

### i3 Alias
  laptop <-Alias to have only the laptop screen working  
  monitor <-Alias to have only a extra-monitor working  
  dual <-Laptop and Monitortogueter (laptop on the left)  

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
`sudo apt-get install fonts-emojione` - colored icons on i3statusbar
`sudo apt-get install fonts-emojione` - pdf reader
`curl https://cli-assets.heroku.com/install-ubuntu.sh`- heroku cli
`sudo apt install tldr` - quick howto use a tool
`sudo add-apt-repository ppa:yubico/stable && sudo apt install scdaemon yubikey-manager-qt yubioath-desktop yubikey-personalization-gui` - yubikey stuff
