---
title: build 7yuv snap package, run 7yuv in no-qt4 system
date: 2021-11-23 15:00:53
tags:
    - 7yuv
    - Snap
    - Qt4
    - Ubuntu
---
<!-- toc -->
# 7YUV
As a video software developer, 7yuv is a nice YUV sequence analysis tool(Of course, Vooya is another good option), but the developer of 7YUV does not punish the Qt5 version and the latest Linux system has removed the support of Qt4. So I chose to build a snap package for 7yuv to make sure it can works well in any snap supported system. 
# About Snap
Snaps are app packages for desktop, cloud and IoT that are easy to install, secure, cross‐platform and dependency‐free. Snaps are discoverable and installable from the Snap Store, the app store for Linux with an audience of millions.
# My snap build file for 7yuv
You can find my full code in [LINK](https://github.com/godvmxi/7yuv_snap_wrap)

# Snap build instructions
## snap base
The qt4 is still support on snap core18, so I choose the core18 as the base system
## build plugin
I have the raw 7yuv binnary, so I choose the dump plugin to install the 7yuv to my snap packge, the plugin will install all source dirtory to the system and keep the origin directory layout.
```bash
parts:
  7yuv:
    # See 'snapcraft plugins'
    plugin: dump
    source: 7yuv-2.5_x64_pre_build/
```
## add Qt4 runtime to snap
```bash
parts:
  7yuv:
------------
    stage-packages:
      - libqtcore4
      - libqtgui4
      - libstdc++6
      - libqt4-opengl
      - libalglib3.11
      - libgcc1
      - libgl1
      - libgl1-mesa-glx
      - libgl2ps1.4
      - libglu1
      - libglu1-mesa
      - libgsl23
      - libgslcblas0
      - libmuparser2v5
      - libqt4-network
      - libqt4-qt3support
      - libqt4-svg
      - libqt4-xml
      - libqtassistantclient4
      - libqtexengine1
      - libtamuanova-0.2
      - zlib1g
      - sip-api-12.3
```
## Add dbus and slot
Do not ask why, I do not know, you can check the snap doc for it.
```bash
slots:
  dbus-daemon:
    interface: dbus
    bus: session
    name: de.datahammer.7yuv

plugs:
  config-7yuv:
    interface: system-files
    read:
      - /
    write:
      - /
```

# manual build snap from code
## I will ignore steps about installing snap and snapcrash
## build snap package -- with lxd
I use the lxd to replace the multpass, the multipass has a lot trouble in ubuntu20, so I give up it.
```bash
snapcraft --debug --use-lxd
```
you will find the target snap file in build directory.
## Install your snap
```bash
snap install --devmode --dangerous   7yuv_0.1_amd64.snap
```
Now you can run 7yuv from any snap system
