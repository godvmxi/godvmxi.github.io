---
title: pve copy & merge VM node from old disk
date: 2023-02-13 18:50:35
tags:
    - Sysadmin
    - Nas
    - PVE
---

<!-- toc -->
# TODO
- [ ] Copy the old vm config from the disk
- [ ] Copy the lxc and config from the disk
- [ ] Add real bash log
# You can use web backup and restore always
When the old system can not boot up, it will not be a good way.   
   

NOTE:
- 1 disk
- LVM

# Let's go
## Link the old disk to your new PVE machine

## Mount old disk
### Scan your lvm disk
```bash
# vgscan 
```
You can find your new and old lvm disk, if they has same name, you may need rename the old lvm name.

#### Identify the old and new disk
record the UUID of the old disk
```bash
# vgdisplay
```

#### Rename the old one
```bash
vgrename UUID_old_disk new_vg_name
```

### Active the old pve disk
```bash
vgchange  -a y new_vg_name
```
### Locathe the disk of your old VM
you will find your vm node disk in **/dev/new_vg_name/vm_1xx_disk_0**

## Dump the old disk to qcow2 format
```bash
qemu-img convert -f -O qcow2 /dev/new_vg_name/vm_1xx_disk_0 vm_1xx_disk.qcow2
```

## Create a new VM node in your system
Do not create vm disk, and use the command to import the above disk image
```bash
qm importdisk new_vm_id  vm_1xx_disk.qcow2  local-lvm
```
## Attach the vm disk in the webgui
You may need to modify your vm setting to adjust the old disk, such as disk bus, mac and so on

## Maybe old pve setting in old_disk/var/lib/pve-cluster/config.db   

Enjoy it. 
