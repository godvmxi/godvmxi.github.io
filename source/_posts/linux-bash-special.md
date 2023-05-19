---
title: bash tool advanced usage
date: 2023-02-24 19:33:12
tags:
    - Linux
    - Bash
---
<!-- toc -->
# hexdump with ascii

```bash
root@soc1:/build# hexdump -C Makefile 
00000000  23 20 43 4d 41 4b 45 20  67 65 6e 65 72 61 74 65  |# CMAKE generate|
00000010  64 20 66 69 6c 65 3a 20  44 4f 20 4e 4f 54 20 45  |d file: DO NOT E|
00000020  44 49 54 21 0a 23 20 47  65 6e 65 72 61 74 65 64  |DIT!.# Generated|
00000030  20 62 79 20 22 55 6e 69  78 20 4d 61 6b 65 66 69  | by "Unix Makefi|
```


