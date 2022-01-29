---
title: ubuntu18.04 安装wine以及添加mono和gecko打开简单.net应用的方法
date: 2022-01-29 09:48:30
tags:
    - Wine
    - Ubuntu
    - Mono
    - Gecko

---
考虑到国内网络的内容隔天可能就没有，所以做一个记录吧。
转载自： https://www.cnblogs.com/hfclszs/p/13760531.html
安装wine 但是过程略坑..这里简单说一下总结之后的过程.

2. 第一步安装wine相关内容

查了下有winehq和wine两种. 我认为应该没啥区别. 但是第一次采坑是用的winhq但是爬出坑的用的是 wine.. 所以简单记录一下 wine的过程.

3. ubuntu现在很牛B 都不需要改apt-get的source.list就可以直接安装了.

安装wine
```bash
sudo apt-get install wine64 mono-complete 
# 注意一定不要使用 root用户进行安装.
# 安装mono 用来开启.net应用
sudo apt-get install axel
# 多线程下载。哈哈
```

4. 但是安装完之后发现还是不行. 会报错 提示没有 一些gecko进行html的渲染操作.

百度,google一翻得到的结果是需要安装gecko还有mono的内容. 只能从网上下载.
```bash
wine的地址
http://dl.winehq.org/wine/wine-mono/4.9.4/wine-mono-4.9.4.msi
gecko的地址
http://dl.winehq.org/wine/wine-gecko/2.47/wine_gecko-2.47-x86_64.msi
这里面我被坑的基本上生活不能自理了.
````

下载完成之后需要放到/home/ubuntu1804/.wine/的目录下面执行安装

注意一定要是放到 wine相关目录里面不然就是白瞎会报错. 提示

err:mscoree:LoadLibraryShim error reading registry key for installroot
安装命令很简单
```bash
wine   msiexec /i  wine-mono-4.9.4.msi
wine   msiexec /i  wine_gecko-2.47-x86_64.msi
```
5.之后就可以了 不过需要改进一下中文乱码的问题等有时间了再看, 



6. 解决中文显示的问题

来源:
http://blog.sina.com.cn/s/blog_686efeba0102vwtj.html
3、设置中文问题
```bash
先把字体simsun.ttc（在你的windows的安装目录里的font文件夹里找，找不到可以从网上下到） 复制到 /home/你的用户名/.wine/drive_c/windows/fonts 文件夹中，要显示隐藏文件夹按Ctrl+H

修改注册表，在命令行输入 gedit ~/.wine/system.reg

找到“[System\\CurrentControlSet\\Hardware Profiles\\Current\\Software\\Fonts]”，将其中的““LogPixels”=dword:00000060”改成 ““LogPixels”=dword:00000070“。

再找到”[Software\\Microsoft\\Windows NT\\CurrentVersion\\FontSubstitutes] xxxx“项，将其中的”MS Shell Dlg“相关的两项修改成如下内容（即更换字体为宋体）：

“MS Shell Dlg”=”SimSun”
“MS Shell Dlg 2&Prime;=”SimSun”

然后：gedit ~/.wine/drive_c/windows/win.ini

在其中加上（如果没有），有的话修改成如下

[Desktop]
menufontsize=13
messagefontsize=13
statusfontsize=13
IconTitleSize=13
```
现在中文显示应该正常了