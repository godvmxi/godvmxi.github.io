---
title: python学习方向和常用库介绍
date: 2023-02-09 16:40:15
tags:
    - python
---

<!-- toc -->
# 转码学习python的工作方向

- 测试工程师

- 软件工程师

- 服务器管理


# 常用库
## 桌面程序开发
### pyside
PySide是Qt的亲儿子，各种接口的便捷程度自己脑补
### pyqt
PyQt就比较成熟了，并且资料也很完善，最开始是有PyQt4对应的是Qt4版本，后来推出了PyQt5，对应Qt5版本
### wxpython
Python下的GUI编程框架，与MFC的架构相似，除非你没选择了

## Web开发
总体来说，python开发网站后端不主流，但是也有啊
### Django
http://www.djangoproject.com/
### flask
https://flask.palletsprojects.com/en/2.2.x/
https://www.fullstackpython.com/flask.html
### web2py
小

## 人工智能
### tensorflow
谷歌出品，热门首选

## 办公效率
### XlsxWriter
方便的生成excel文件，格式丰富
https://xlsxwriter.readthedocs.io/

## 网络相关

### scapy
数据包分析，构造，强大到发质的库，自带cli操作

### requests
请求http资源的神器，最好用，没有之一
https://realpython.com/python-requests/


### pyquery
瑞士军刀jquery的python版本，在Python中如网页的 jQuery一样处理文档, 快速解析html文件的好东西，配合lxml可以分析网页

### BeautifulSoup
解析网页的老师傅。没有上边好用，但是可以备用


## 测试
### robotframework
python开发的测试框架，研究一下他的各种插件库，对于当一个测试工程师是必须的

### Selenium
操作浏览的超神工具，做网页测试或者爬网页的必备

## 游戏
### PyGame

基于Python的多媒体开发和游戏软件开发模块
下载地址：http://www.pygame.org/download.shtml

## 科学计算
### Matplotlib
用Python实现的类matlab的第三方库，用以绘制一些高质量的数学二维图形

下载地址：
http://sourceforge.net/projects/matplotlib/files/matplotlib/matplotlib-1.1.0/

### SciPy
基于Python的matlab实现，旨在实现matlab的所有功能

下载地址：http://pypi.python.org/pypi/scipy/

### NumPy
基于Python的科学计算第三方库，提供了矩阵，线性代数，傅立叶变换等等的解决方案

下载地址：http://pypi.python.org/pypi/numpy/

## 配置文件
### json
读写json文件，快速在python数据结构和json之间转换

## 图像处理
### opencv
处理视频等,比如[视频水印添加](/2021/11/16/add-watermarker-to-h264-tool/)
### PIL
基于Python的图像处理库，功能强大，对图形文件的格式支持广泛


## 数据库

### PySQLite
小而美的单文件数据库支持
### MySQLdb
mysql大佬们的玩法

## 发布打包
写完代码后总要发不成二进制文件给别人用吧
### cx_Freeze
方便简洁的打包工具，可跨平台！

### pyinstaller
打包到windows平台的常用工具
https://www.pyinstaller.org/

下载地址：https://cx-freeze.readthedocs.io/en/latest/