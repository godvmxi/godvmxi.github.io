---
title: 红米K40s刷国际版记录，过play，gpay，网银认证
date: 2023-05-03 16:19:18
tags:
- Redmi
- K40s
- Poco F4
---

<!-- toc -->
# Change Log

- 大致记录
- 2023/05/19 修复摄像头错误
# 问题进度
解决的问题汇总：
- 刷入国际版
- 隐藏root，bootloader未加锁
    - play认证
    - gpay认证
    - 各种网银检测
- 解决部分运营商不能打电话问题
    - 原生拨号软件没有支持volte，运营商又不支持GSM等
- 前后相机翻转
    - 网银人脸识别摄像头错误
    - 支付宝摄像头报错

待解决问题：


发现：
- 国行内置老大哥不是吹的，插卡进手机就是反诈骗中心、大使馆短信，垃圾短信三联
- 谷歌全家桶真好用

# 起因
坡县东西真贵，看了一圈手机，成功被三星，OV等一系列的超低性价比劝退，寻觅一圈，Redmi K40s进入眼球。
- 晓龙870当打之年
- 12G RAM + 256G ROM
- NFC
- 红外
- 国外对应POCO F4，有多种版本可以刷新
- 其他要啥自行车

# 填坑开始
## 购机，转运
狗东打折1700入手，转运加税20天到手
## 解锁
感谢我家静静的小米员工身份，解锁零等待，普通的用户请登录小米账户，168小时后再去申请解锁。[http://www.miui.com/unlock/](http://www.miui.com/unlock/)

## 刷机
### ROM下载
ROM自行选择下载：[xiaomifirmwareupdater](https://xiaomifirmwareupdater.com/archive/miui/munch/), [xiaomirom](https://xiaomirom.com/en/rom/redmi-k40s-poco-f4-munch-indonesia-fastboot-recovery-rom/), [miuier](https://roms.miuier.com/en-us/devices/munch/), 我用了第三个   

下载后解压，确保你能找到images目录，后续多次用到

版本选择：
- Global-TLMMIXM（没发现老大哥系列，如果需要红外遥控器参数，刷这个）
- EEA-TLMEUXM（原来说是没有小米全家桶，其实发现还有部分，我用的这个）
- CN- TLMCNXM（肯定不选啊）

### 开始刷机
下载miflash tool, [xiaomiflashtool](https://xiaomiflashtool.com/), [xiaomiflash](https://www.xiaomiflash.com/)   
1. 软件下载后第一次运行建议右键使用管理员权限，需要安装必要的驱动   
2. 手机关机，然后音量下+电源进入fastboot
3. 选择你的rom目录，包含images的那层，选择最下边的删除所有，如果不小心选择了删除后锁定，你就开不了机了，重新解锁即可

![](miflash.jpg)


此刻你已经拥有了比较完整的国际版体验，但是很多应用会检测到你系统已经解锁，导致无法使用，比如play和gpay，如果没有需求，say bye bye

### 安装magisk

#### 下载magisk
我使用了是Magisk Delta，官方版本没有内置支持MagiskHide, 并且使用shamiko貌似也没有很好的隐藏（大概率是我没用好）
[Magisk Delta](https://github.com/HuskyDG/magisk-files/releases), [Magisk Official](https://github.com/topjohnwu/Magisk/releases/tag/v26.1)
![](MagiskDeltaHide.jpg)，    
复制到手机进行安装，安装后启动可以检测三个选项：

- 1. 版本号
- 2. Zygisk状态
- 3. Ramdisk 状态

![](MagiskDelta.jpg)


点击右上角齿轮进入设置，使能Zygisk
![](MagiskDeltaEnableZygisk.jpg)

#### 下载fastboot
后边需要单独刷写boot.img,需要下载fastboot工具， [pc6](https://www.pc6.com/softview/SoftView_85883.html), [google](https://dl.google.com/android/repository/platform-tools-latest-windows.zip?spm=a2c6h.12873639.article-detail.4.41157f83HBuIQi&file=platform-tools-latest-windows.zip), 下载解压。
![](fastboot_dir.jpg)

#### 对Ramdisk打补丁
去解压后的镜像目录找到boot.img, 复制到你的手机中（我一般选择downloads目录），运行magisk，依次安装->选择并修补一个文件，找到你的boot.img,选择打补丁, 会在同目录生成一个boot_xxxx.img的文件，要的就是它。然后复制到电脑上，放置在你上一步解压的fastboot目录
![](MagiskDeltaInstall_1.jpg)

#### 重新刷入打了补丁的Ramdisk
关机重启手机到fastboot模式，命令行切换到fastboot目录，执行
```bash
fastboot.exe flash boot boot_xxxx.img
fastboot.exe reboot
```
重启手机后可以发现三个选项全部为使能即可
![](MagiskDelta.jpg)

进入设置，勾选上强制使用超级用户列表，这里是个可以访问超级用户权限的白名单，如果需要程序su超级用户访问，需要这边勾选对应的程序
![](MagiskDeltaHide.jpg)


#### 治疗不明白，请移步MagiskCN详细教程研读
**如果觉得我写的不清楚，移步[magiskcn](https://magiskcn.com/)反复研读**

### 配置CTS信息过play验证
#### 安装MagiskHide Props Config 模块
下载[github](https://github.com/Magisk-Modules-Repo/MagiskHidePropsConf/releases)
复制zip包到手机中，回到magisk delta，选择模块，安装，选择对应的zip包，安装完成重启。

#### 安装termux
这里需要bash命令行，你也可以用adb shell， 这里选择termux-app, [github](https://github.com/termux/termux-app/releases),复制到手机进行安装

#### 配置Props信息
进入MagiskDelta,对termux给与
进入termux，设置->Magiskhide, 配置超级用户列表，勾选termux。
![](MagiskDeltaSuList.jpg)

手机启动termux， 执行命令
```bash
su -c props
```
同意su权限，选择1配置手机型号，后续一路继续，然后重启即可
![](Props.jpg)

### 检查安全通过
#### SafetyNetTest
[safetynetchecker](https://play.google.com/store/apps/details?id=rikka.safetynetchecker) OR
[safetynettest](https://play.google.com/store/apps/details?id=org.freeandroidtools.safetynettest)

![](SafetyNetTest.jpg)

#### google 验证
play商店中，应该已经没有了未验证设备信息了，gpay也不会出现错误了
![](GpayFail.jpg)

### 后续安装LSPosed
这个移步[magiskcn](https://magiskcn.com/lsposed-install)

## 无法拨号
坡县或者其他地方的运营商默认关闭了GSM网络，导致google 拨号不能打电话，安装对应运营商的volte软件即可  

## 摄像头修复
使用同一版本号CN镜像的的摄像头配置文件替换即可, 这里写了一个magisk module，使用magisk刷入即可 [magisk module](https://github.com/godvmxi/magisk-module-fix-redmi-k40s-camera)

# 总结
不得不说中国手机供应商做的真好，各种适配和二次开发确实厉害， 相比之下，谷歌原生就是个半成品，如果没有圣上翻大饼和各种老大哥应用的嵌入，养蛊玩法的大陆手机，玩死其他手机厂商不是梦。   
其实在各行各业，大陆的厂家都是养蛊式的内卷，相比之下，外边真是一个能打的都没有。   
圣上赶紧滚蛋吧，给中国经济一条活路。