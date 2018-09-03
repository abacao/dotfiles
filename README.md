# Extra configs

### i3 stuff
i3-msg reload #-relad i3 configuration
mod+d #-App launcher
mod+1 #-Jumps to Desktop1
mod+Shif+1 #-Moves app to Desktop1
mod+m #-Music Desktop
mod+q #-Quit App
mod+r #-Resize the App
mod+Enter #-Opens Terminal
mod+w #-Horizontal tabbed
mod+s #-Vertical tabbed
mod+h #-Horizontal Layout
mod+v #-Vertical Layout
mod+Shift+Spacebar #-activate or deactivate float mode
mod+backspace #-Password Manager
mod+x #-Move workspace to the other screen

laptop #-Alias to have only the laptop screen working
monitor #-Alias to have only a extra-monitor working
dual #-Laptop and Monitortogueter (laptop on the left)

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


