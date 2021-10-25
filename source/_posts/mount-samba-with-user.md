---
layout: post
title: "Mount samba with current user"
subtitle: 'Samba'
author: "Godvmxi"
header-style: text
hidden: false
date: 2021-10-25 15:35:08
tags:
  - Linux
  - Samba
---

When you want to mount a samba to modify the file , there are always some issues :

- all kind of file permission issues
- how to auto mount samba
- Samba server setting

## file permission 

gid=1000,uid=1000,`you can use id command to find your current user info `

```bash
$ id
uid=1000(user) gid=1000(user) groups=1000(user),4(adm),
24(cdrom),27(sudo),30(dip),46(plugdev),112(lpadmin),128(sambashare)

```


## how to auto mount samba

here is my /etc/fstab

```bash
//dbs-04/data /nfs/data/ cifs credentials=/home/.smbcredentials,uid=1000,gid=1000 0 0
//dbs-04/home /nfs/home/ cifs credentials=/home/.smbcredentials,uid=1000,gid=1000 0 0
```

the client user info is in /home/user/.smbcredentials,

```bash
$ cat /home/user/.smbcredentials
username=smbuser
password=smbuserpasswd

```

## my server setting


```bash
[data]
    comment = user
    path = /data/user
    browseable = yes
    writeable = yes
    guest ok = yes
    force user = jbright
```

remember add your samba user into your server 








