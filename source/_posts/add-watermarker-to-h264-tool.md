---
title: add watermarker to bitstream tool
date: 2021-11-16 15:58:29
tags:
  - Python
  - Opencv
  - Freetype
  - Font
---
Index:
<!-- toc -->
## Usage
In daily test, I need to add number watermarker to the bitstream, then dump it to different yuv formats.

### read and write bitstream by frames with opencv2
```python
    cap = cv2.VideoCapture(args.input)
    total_frames = int( cap.get(cv2.CAP_PROP_FRAME_COUNT) )
    input_width = int(cap.get(3))
    input_height = int(cap.get(4))
    video_info = 'video : {0}x{1} frames:{2}'.format(input_width, input_height, total_frames)
    print(video_info)
    print("total frames :", total_frames)

    fourcc = cv2.VideoWriter_fourcc(*'X264')
    video_output = cv2.VideoWriter(args.output, fourcc, 30.0, (input_width, input_height))
    if args.frame_number > 0 and args.frame_number < total_frames:
        total_frames = args.frame_number
        print("processing frame number is : ", total_frames)
    for index in range(total_frames):
        # set frame position
        #cap.set(cv2.CAP_PROP_POS_FRAMES,index)
        ret, frame = cap.read()
        marker_text = '{0}{1:0>2}'.format(args.prefix, index)
        add_watermark_to_frame(frame, marker_text,args.text_height, (args.offset_x, args.offset_y))
        video_output.write(frame)
        if args.show:
            cv2.imshow("Video", frame)
            if cv2.waitKey(5000) & 0xFF == ord('q'):
                break
    cap.release()
    video_output.release()
    cv2.destroyAllWindows()
```
### use freetype to render the string and add to frame
```python
def add_watermark_to_frame(frame, txt, text_height,offset):
    ft = cv2.freetype.createFreeType2()
    ft.loadFontData(fontFileName='UbuntuMono-Regular.ttf',
                    id=0)
    ft_size, baseline= ft.getTextSize(txt, text_height, -1)
    #print("Msg: {0} {1} dat: {2}".format(ft_size, baseline, txt))
    magin_pixel = 5
    rectangle_start = (offset[0] + baseline - magin_pixel, offset[1] - ft_size[1] - baseline - magin_pixel )
    rectangle_end = (offset[0] + ft_size[0] + magin_pixel ,  offset[1] + baseline + magin_pixel) #
    #print("start: {0} -> end: {1}".format(rectangle_start, rectangle_end))
    cv2.rectangle(frame,
        rectangle_start,
        rectangle_end,
        (250,240,240),
        -1
        )
    ft.putText(img=frame,
            text=txt,
            org=(offset[0], offset[1]),
            fontHeight=text_height,
            color=(255,  10, 10),
            thickness=-1,
            line_type=cv2.LINE_AA,
            bottomLeftOrigin=True)
    return frame
```
### Show new frame with opencv2
```python
cv2.imshow("Video", frame)
```

### font load note
1. the code will auto load "UbuntuMono-Regular.ttf" to render the picture with freetype, please put this font to the script dir
2. the code need opencv2 support, install it by yourself


## Usage Guide
### Code Help:
![usage](image2021-4-26_16-44-37.png)
### Basic Usage:
It will get first 10 frames and add number watermarker in each frame, then save to output.mp4 file.
```bash
python3 cv_watermark.py -i origin.mp4 -o output.mp4 -n 10
```
![usage](image2021-4-26_16-48-17.png)
### Advanced Usage:
It will get first 10 frames and add number watermarker in each frame, then save to output.mp4 file.
```bash
python3 ./cv_watermark.py -i Mix_BostonHarbor_MainStreet_GrandBendPatio_1920x1088.mp4  -prefix  "AMD is awesome: "  -s
```
![usage](image2021-4-26_17-15-37.png)

### Parameters Guide
| parameter | description |
| ---       | ---         |
| test | tset|
| i	 | input bitstream file name |
| n	 | frame number |
| o	 | output bitstream file name |
| ox 	| watermarker offset x in target bitstream |
| oy	| watermarker offset y in target bitstream |
| prefix |	prefix info in front of the number watermarker |
| s	| show the picture frame by frame, q: exit ; space : next frame |
| th	| watermarker text height |

##  Talk is cheap, show me the code
```python
#!/usr/bin/env python3
import cv2
import numpy as np
import os
import subprocess as sp
import argparse
args = None

def get_args_parse():
    parser = argparse.ArgumentParser('传入参数：***.py')
    parser.add_argument('-iw','--width', type=int, default=1920, help="input frame width")
    parser.add_argument('-ih','--height', type=int, default=1088, help="input frame height")
    parser.add_argument('-ox','--offset_x', type=int, default=64, help="watermark start offset x")
    parser.add_argument('-oy','--offset_y', type=int, default=128, help="watermark start offset y")
    parser.add_argument('-i','--input', default="input.yuv")
    parser.add_argument('-o','--output', default="out.yuv")
    parser.add_argument('-th','--text_height', type=int, default=100, help="watermark text height")
    parser.add_argument('-prefix','--prefix', default="", help="watermarker prefix, such as AMD-0")
    parser.add_argument('-s','--show',help="show image one by one", action="store_true")
    parser.add_argument('-n','--frame_number',type=int, default=0,help="handle n frames")
    return parser
def add_watermark_to_frame(frame, txt, text_height,offset):
    ft = cv2.freetype.createFreeType2()
    ft.loadFontData(fontFileName='UbuntuMono-Regular.ttf',
                    id=0)
    ft_size, baseline= ft.getTextSize(txt, text_height, -1)
    #print("Msg: {0} {1} dat: {2}".format(ft_size, baseline, txt))
    magin_pixel = 5
    rectangle_start = (offset[0] + baseline - magin_pixel, offset[1] - ft_size[1] - baseline - magin_pixel )
    rectangle_end = (offset[0] + ft_size[0] + magin_pixel ,  offset[1] + baseline + magin_pixel) #
    #print("start: {0} -> end: {1}".format(rectangle_start, rectangle_end))
    cv2.rectangle(frame,
        rectangle_start,
        rectangle_end,
        (250,240,240),
        -1
        )
    ft.putText(img=frame,
            text=txt,
            org=(offset[0], offset[1]),
            fontHeight=text_height,
            color=(255,  10, 10),
            thickness=-1,
            line_type=cv2.LINE_AA,
            bottomLeftOrigin=True)
    return frame

if __name__ == "__main__":
    args = get_args_parse().parse_args()
    print(args)
    print(args.width)
    #get_watermark("temp")
    cap = cv2.VideoCapture(args.input)
    total_frames = int( cap.get(cv2.CAP_PROP_FRAME_COUNT) )
    input_width = int(cap.get(3))
    input_height = int(cap.get(4))
    video_info = 'video : {0}x{1} frames:{2}'.format(input_width, input_height, total_frames)
    print(video_info)
    print("total frames :", total_frames)

    fourcc = cv2.VideoWriter_fourcc(*'X264')
    video_output = cv2.VideoWriter(args.output, fourcc, 30.0, (input_width, input_height))
    if args.frame_number > 0 and args.frame_number < total_frames:
        total_frames = args.frame_number
        print("processing frame number is : ", total_frames)
    for index in range(total_frames):
        # set frame position
        #cap.set(cv2.CAP_PROP_POS_FRAMES,index)
        ret, frame = cap.read()
        marker_text = '{0}{1:0>2}'.format(args.prefix, index)
        add_watermark_to_frame(frame, marker_text,args.text_height, (args.offset_x, args.offset_y))
        video_output.write(frame)
        if args.show:
            cv2.imshow("Video", frame)
            if cv2.waitKey(5000) & 0xFF == ord('q'):
                break
    cap.release()
    video_output.release()
    cv2.destroyAllWindows()


```