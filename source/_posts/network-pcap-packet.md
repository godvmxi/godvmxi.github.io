---
title: Tips to packet different network frame
date: 2022-11-07 09:59:50
tags:
    - network
    - pcap
---

# Some usefull tools for playing network frame 

Some tools can send pcap file packets on NIC


## tcpreplay
```bash
# tcpreplay -l 0 -i eth1 path-to-your-captured-file.pcap

// -l loop how many times, 0 for infinite
// -i interface where you want to send out
```

## bittwist
```bash
# bittwist -i eth0 pcap-file.pcap 
```

## playcap
The tool can play back Wireshark, tcpdump, and libpcap captures.   
Maybe too old.

# Packing and Decoding networking frame library

## ryu (python)

[https://osrg.github.io/ryu-book/en/html/index.html](https://osrg.github.io/ryu-book/en/html/index.html)  

## libtins (c++)
[http://libtins.github.io/](http://libtins.github.io/)


## dpkt
[https://doc.dpdk.org/guides/index.html](https://doc.dpdk.org/guides/index.html)
