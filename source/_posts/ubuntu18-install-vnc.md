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

# Enjoy it