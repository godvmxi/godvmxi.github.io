---
title: 关于
description: 个人简介
layout: about
comments: false
sidebar: custom
---
个人详细介绍
知识体系
```json
{
  name: "Ball Virtual"
  gender: "male",
  title: "Senior Firmware Engineer",
  experience: 10.5,
  address: "Shanghai",
  education: "Bachelor",
  github: "https://github.com/godvmxi",
  email: "godvmxi@gmail.com",
  description: "Better life, more challenging, more fun",

  skills: [
    ["VCodec", "C++", "Python", "H264", "HEVC", "VP9","FFmpeg","RTP"],
    ["Linux", "Kernel" "C", "Bash","Buildroot","Uboot", "Buildroot"],
    ["Asic", "RTL", "Verlog","ARM"],
    ["Router","Network", "CCNA", "Flask","ARM", "VUE"],
    ["Git","Gerrit","Github"],
    ["PCB","MCU","BT","OBD","CAN","GPRS","Rs232","SPI"],
    ["Unity","C#"]
  ],

  devTools: [
    ["VIM","Vscode","GCC","GDB"],
    ["Elecard", "FFmpeg"],
    ["Source Insight"],
    ["Unity"],
    ["Protel","Logic Analyzer","Oscilloscope"]
  ]
}

```

```mermaid
graph LR
    IASIC[Asic Verification]
    ITOOLS[uboot/buildroot]
    ISDK[Video SDK]
    CTools[uboot/buildroot/driver]
    ATools[Diag]
    CRouter[C,C++]
    CFlask[Python,Flask]
    CJS[Javascript,Jquery,CSS]
    COBD[OBD,CAN,BT]
    CMCU[MCU,C]
    IVCodec1[Ffmpeg,H264,H265]
    IVCodec2[FFmpeg,RTP,H264,H265]
    PWEB[VUE,Flask]
    PUnity[Unity,C#]
    PMusic[DrumSet Tool]
    PZigbee[Smart Family]
    PZigbeeL[C,C++,Python,Protel]
    PZigbeeT[Zigbee,BT,CC2430]
    School --> Cisco
    School --> Infotmic
    School --> AMD
    School --> Personal
    Cisco --> Router
    Cisco --> Car
    Router --> CRouter
    Router --> CFlask
    Router --> CJS
    Router --> CTools
    Car --> COBD
    Car --> CMCU
    Infotmic --> IASIC
    Infotmic --> ISDK
    IASIC --> ITOOLS
    IASIC -->IVCodec1
    ISDK --> IVCodec2

    AMD --> GPU
    GPU --> ATools
    Personal --> PMusic
    Personal --> PZigbee
    PMusic --> PWEB
    PMusic --> PUnity
    PZigbee --> PZigbeeL
    PZigbee --> PZigbeeT
```
