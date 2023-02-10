---
title: NAS 家庭配置选择
date: 2023-02-10 17:28:11
tags:
    - NAS
---

<!-- toc -->
# TODO
- [x] CPU 90%
- [ ] motherboard
- [ ] raid
- [ ] OS

# NAS家庭选择的考虑因素
- 能耗
- 编解码能力
- 价格
# CPU
如果不考虑上独立显卡，CPU集显的解码能里就非常关键，便与emby实时转码播放,暂时没列出来AMD更多

| part | E3-1265L V3 | I3 6100T | I3-7100T   | I3-8~11100T         |  I3-12100T  | 200GE       | N5100        |
| ---  | :---:       | :---:    | :---:      | :---:               | :---:       | :---:       | :---:        |
| Power | 45W        | 35W      | 35W        | 35W                 |  35W        | 35W         |6W            |
| Cores |  4         | 2        | 2          | 4                   | 4           | 2           |:---:         |
| Hyperthreading    | Yes       | Yes        | Yes                 | Yes         | Yes         |:---:         |
| GPU  | GT1        | G530      | G630       | G630                | G730        |  Vega3      |JasperLake24  |
| H264 | dec/enc    | dec/enc   | dec/enc    | dec/enc             | dec/enc     | dec/enc     |dec/enc       |
| H265 | -          | dec/enc   | dec/enc    | dec/enc             | dec/enc     | dec/enc     |dec/enc       |
| H265/10bit | -    | dec       | dec/enc    | dec/enc             | dec/enc     | dec/enc     |dec/enc       |
| VP8  | -          | dec/enc   | dec/enc    | dec/enc             | dec/enc     | dec/enc     |dec/enc       |
| VP9  | -          | dec       | dec/enc    | dec/enc             | dec/enc     | dec/enc     |dec/enc       |
| AV1  | -          | -         | -          | -                   | dec         | -           | -            |
| DDR  | 3          | 4         | 4          | 4                   | 4           | 4           | 4            |
# 主板
# 阵列
# 系统
