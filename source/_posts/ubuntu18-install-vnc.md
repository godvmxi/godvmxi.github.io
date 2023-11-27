---
title: ubuntu18 install vnc server and start xfce
date: 2022-01-29 10:16:44
tags:
    - VNC
    - Ubuntu
---

核心两块： xfc4 and vnc4server
# code talk
```bash
sudo apt install xfce4* vnc4server
```
# setup xstart
```
$ cat ~/.vnc/xstartup 
#!/bin/sh

xrdb $HOME/.Xresources
unset SESSION_MANAGER
unset DBUS_SESSION_BUS_ADDRESS
startxfce4 &

```
# add run exex to xstartup
```bash
chmod +x ~/.vcn/xstartup
```

# Start vcn4server
```bash
$ vnc4server 
```

# Error on Ubuntu20.04
No windows title, xfwm bugs on 

```bash
ubuntu20.04 error, 
https://askubuntu.com/questions/1242168/ubuntu-20-04-vnc-no-window-decorations-to-allow-resize-of-apps
https://launchpad.net/ubuntu/groovy/amd64/xfwm4/4.14.5-1
http://launchpadlibrarian.net/494460182/xfwm4_4.14.5-1_amd64.deb
```
# Enjoy it