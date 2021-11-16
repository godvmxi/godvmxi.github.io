---
title: generate different yuv in different formats
date: 2021-11-16 15:44:02
tags:
   - FFMPEG
   - H264
   - YUV
---
Index:
<!-- toc -->


ffmpeg can be used to generate many kinds of format. just enum it and record it.
# FFMPEG convet basic usage
## Show all support formats by ffmpeg
```bash
ffmpeg -pix_fmts
```
use "-pix_fmt " to define the output formats in ffmpeg

| name | format | bit depth | Note |
| ---  | ---    | --- | --- |
| yuv420p |	YUV420 | 8 | NV12	|
| yuv420p16le| YUV420	|10 |  P0101? |
| yuv444p  | YUV444 | 8 | |
| yuv444p10le | YUV444 | 10 |  	|

## FFMPEG convert mp4 to yuv with resolution and format
```bash
ffmpeg -y -i ${file_name}_${in_res}.mp4 -pix_fmt yuv420p -s $out_res ${file_name}_${out_res}.yuv
```

## Convert yuv to H264/mp4
```bash
ffmpeg -f rawvideo -pix_fmt yuv420p -s:v 720x480 -r 25 -i Mix_BostonHarbor_MainStreet_GrandBendPatio_720x480.yuv -c:v libx264 output.mp4
```



# How to generate RGB444 FP16 file

Here is the guideline from Osman




## Install ffmpeg and imagemagick.
```bash
sudo apt install imagemagick ffmpeg
```


## First convert the image to RGB format from YUV420.
```bash
ffmpeg -pix_fmt yuv420p -s 1920x1080 -i BostonHarbor_1920x1080.yuv -frames:v 10 -pix_fmt rgb48le BostonHarbor_1920x1080-rgb48le.rgb
```

## Convert more formats
Then use the following imagemagick command to convert from RGB to RGBA FP16 format.
```bash
convert -size 1920x1080 -depth 16 -colorspace rgb rgb:BostonHarbor_1920x1080-rgb48le.rgb -size 1920x1080 -depth 16 -define quantum:format=floating-point -colorspace rgb rgba:BostonHarbor_1920x1080-rgbafp16.rgb
```


## Display the RGBA FP16 image
```bash
display -size 1920x1080 -depth 16 -define quantum:format=floating-point -endian lsb rgba:BostonHarbor_1920x1080-rgbafp16.rgb
```




# My work flow to generate custom yuv formats
> 1. Get some reference yuv files with ffmpeg or from web
> 2. Manual split and combine your custom YUV files with split\cat\>> commond.
> 3. Encode your custom yuv to h264 with FFMPEG
> 4. Add number watermarker to your custom yuv file
> 5. Decode your custom bitstreams to different resolutions and formats.


# YUV view tools
> vooya
> 7yuv
