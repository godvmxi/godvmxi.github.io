---
title: Yocto Tips
date: 2023-10-23 11:17:17
tags:
    - yocto
    - Linux
    - Tips
---

# Add GDB to target

conf/local.conf
```bash
EXTRA_IMAGE_FEATURES += " tools-debug"
WHITELIST_GPL-3.0 += "gdb"
WHITELIST_GPL-3.0 += "gdbserver"
```
Do add the licence to whitelist, other wise it will report license error:
```bash
Parsing of 1108 .bb files complete (0 cached, 1108 parsed). 1771 targets, 268 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'gdb' (but /srv/build-autolinux/poky/meta/recipes-core/packagegroups/packagegroup-core-tools-debug.bb RDEPENDS on or otherwise requires it)
gdb was skipped: it has incompatible license(s): GPL-3.0 LGPL-3.0
```

# Resize root file system size
```bash
diff --git a/recipes-xxx-subcore/images/xxx-subcore-image.bb b/recipes-xxx-subcore/images/xxx-subcore-image.bb
index 63cfb05..d7a817f 100644
--- a/recipes-xxx-subcore/images/xxx-subcore-image.bb
+++ b/recipes-xxx-subcore/images/xxx-subcore-image.bb
@@ -6,7 +6,7 @@ inherit core-image chk_security ${@bb.utils.contains('INVITE_PLATFORM', 'fw-upda
 IMAGE_FSTYPES ?= "ext4"
 IMAGE_FSTYPES_xxxxxx= "ext4"
 IMAGE_FSTYPES_xxxxxx = "cpio"
-IMAGE_ROOTFS_SIZE = "10240"
+IMAGE_ROOTFS_SIZE = "409600"
```


# Yocto command

| Useful  |  commands  |
| ---     |   ---      |
| bitbake-layers show-recipes | 	Show all recipes |
| bitbake linux-xxx -c do_listtasks	| Show all task of a package	 |
| bitbake-layers show-appends	| Show bbappends are used	|
| bitbake linux-xxx -c menuconfig	| Enter the menuconfig of kernel	|
| bitbake linux-xxx -c devshell	| Enter the devshell of a package	|
| bitbake-layers show-recipes "*-image-*"	| Show all support target images	|
| bitbake <image > -g -u depexp | Show the package dependency for image. <p>Example: To show all packages included on fsl-image-gui <p>$ bitbake fsl-image-gui -g -u depexp <p>NOTE: This command will open a UI window, so it must be execute on a console inside the host machine (either virtual or native).  |

[More](https://community.nxp.com/t5/i-MX-Processors-Knowledge-Base/Useful-bitbake-commands/ta-p/1128559)


