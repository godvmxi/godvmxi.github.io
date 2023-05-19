---
title: cmake tips
date: 2023-02-24 19:36:23
tags:
---
<!-- toc -->
# cmake build in MS toolchains


## config
### generater

```bash
"Ninja"
"Unix Makefiles"
"Visual Studio 16 2019"
"Visual Studio 16 2019 Win64"
"Visual Studio 16 2019 ARM"
"Visual Studio 15 2017"
"Visual Studio 15 2017 Win64"
"Visual Studio 15 2017 ARM"
"Visual Studio 14 2015"
"Visual Studio 14 2015 Win64"
"Visual Studio 14 2015 ARM"
Visual Studio 6
Visual Studio 7
Visual Studio 7 .NET 2003
Visual Studio 8 2005
Visual Studio 9 2008
Visual Studio 10 2010
Visual Studio 11 2012
Visual Studio 12 2013
Visual Studio 17 2022
"Green Hills MULTI"
```

### Win32 Example
Use **-A** to specific the arch
```bash
cmake -G "Visual Studio 15 2017 64"
#<===>
cmake -G "Visual Studio 15 2017" -A x64

#others 
cmake -G "Visual Studio 15 2017" -A Win32
cmake -G "Visual Studio 15 2017" -A ARM
cmake -G "Visual Studio 17 2022" -A ARM64

$ cmake -G "Visual Studio 15 2017" -A x64  ../src/
-- Selecting Windows SDK version 10.0.18362.0 to target Windows 10.0.19044.
-- The CXX compiler identification is MSVC 19.16.27048.0
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: C:/Program Files (x86)/Microsoft Visual Studio/2017/Enterprise/VC/Tools/MSVC/14.16.27023/bin/Hostx86/x64/cl.exe - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: D:/Work/Code/pcap_tool_master/build

```
Use **-T** to specific the toolchain   

### Green Hills MULTI
[Green Hills MULTI](https://cmake.org/cmake/help/latest/generator/Green%20Hills%20MULTI.html#generator:Green%20Hills%20MULTI)

```bash
cmake -G "Green Hills MULTI" -T comp_201754 for /usr/ghs/comp_201754.
cmake -G "Green Hills MULTI" -T comp_201754 -D GHS_TOOLSET_ROOT=/opt/ghs for /opt/ghs/comp_201754.
cmake -G "Green Hills MULTI" -T /usr/ghs/comp_201554
cmake -G "Green Hills MULTI" -T C:/ghs/comp_201754

```

### Android Example
```bash
cmake ../src \
  -DCMAKE_SYSTEM_NAME=Android \
  -DCMAKE_SYSTEM_VERSION=21 \
  -DCMAKE_ANDROID_ARCH_ABI=arm64-v8a \
  -DCMAKE_ANDROID_NDK=/path/to/android-ndk \
  -DCMAKE_ANDROID_STL_TYPE=gnustl_static
```
## Build
```bash
$ cmake --build . --config Release --target ALL_BUILD
Microsoft (R) Build Engine version 15.9.21+g9802d43bc3 for .NET Framework
Copyright (C) Microsoft Corporation. All rights reserved.

  Checking Build System
  Building Custom Rule D:/Work/Code/pcap_tool_master/rmu_tool/fw_tool/CMakeLists.txt

  fw_parser.vcxproj -> D:\Work\Code\pcap_tool_master\build\Release\fw_parser.exe
  Building Custom Rule D:/Work/Code/pcap_tool_master/rmu_tool/fw_tool/CMakeLists.txt

```
