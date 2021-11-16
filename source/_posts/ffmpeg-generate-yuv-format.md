---
title: generate different yuv in different formats
date: 2021-11-16 15:44:02
tags:
---
ffmpeg can be used to generate many kinds of format. just enum it and record it.








## How to generate RGB444 FP16 file

Here is the guideline from Osman




### You will need ffmpeg and imagemagick.
```bash
sudo apt install imagemagick ffmpeg
```


### First convert the image to RGB format from YUV420.
```bash
ffmpeg -pix_fmt yuv420p -s 1920x1080 -i BostonHarbor_1920x1080.yuv -frames:v 10 -pix_fmt rgb48le BostonHarbor_1920x1080-rgb48le.rgb
```

### Then use the following imagemagick command to convert from RGB to RGBA FP16 format.
```bash
convert -size 1920x1080 -depth 16 -colorspace rgb rgb:BostonHarbor_1920x1080-rgb48le.rgb -size 1920x1080 -depth 16 -define quantum:format=floating-point -colorspace rgb rgba:BostonHarbor_1920x1080-rgbafp16.rgb
```


## Helpful command to display the RGBA FP16 image
```bash
display -size 1920x1080 -depth 16 -define quantum:format=floating-point -endian lsb rgba:BostonHarbor_1920x1080-rgbafp16.rgb
```

## YUV view tools
> vooya
> 7yuv