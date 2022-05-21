---
title: 使用git管理日记，安利笔记工具gitnote，Zettel
date: 2022-05-21 12:36:51
tags:
    - Note
    - Git
---

# 背景

日常有太多需要收藏的笔记、待办事项、读书笔记，但不是面临各种意外情况
- 本地保存：换电脑或者电脑崩溃你就要和你的工作说再见了
- 云存储：除非你用墙外服务区貌似安全，但是身在中国大陆，别说云存储，连你都说没有就没有了
- 专业笔记软件，还是身在大陆，敏感词慢慢的就把你的文章动态清零了，一段时候后，你都看不懂**口死比尔**的内容啥意思了
    - 印象笔记：纯国产软件，不付费都不让用了，并且分享审核有要死，我珍藏的笔记就那么没了。
    - 为知笔记：国内国外两个版本，弃用原因如上
    - OneNote: 巨硬和党国合作如此紧密，你放心就好


# 安利PC端编辑器gitnote
官方主站： [gitnoteapp](https://gitnoteapp.com/zh/), [作者博客](https://zhaopeng.me/), 他的优点：
- 跨平台，win,mac,linux
- 富文本和markdown语法支持
- 基于git的版本管理
- 支持自动同步到远端，基于https协议
- 支持思维导图（基于插件）
- 支持流程图（基于插件）
- 支持图片嵌入git管理（基于插件）
- 更多插件

## markdown编辑器
![alt](gitnote_markdown.png)
## 流程图
![alt](gitnote_flow.png)
## 思维导图
![alt](gitnote_mind.png)

# 初始化使用
## github账号注册跳过
[githug](https://www.github.com)
## 新建存放日记的repo
### 修改默认的分支为master
讨厌白左政治正确，搞得软件也不好用
![](github_change_master.png)
### 新建分支

![](github_new_repo.png)
![](github_new_repo2.png)
### 获取日记的地址

![](github_new_repo3.png)
![](github_new_repo4.png)



### 获取登录token
右上角用户头像-> settings -> Developer settings -> Personal access tokens  -> generate new token -> 全部勾选算了 -> generate token
![](github_token.png)
复制这个token，就是你的下边需要的密码
### 回到软件,克隆刚才新建的仓库
设置成功后，重启就可以使用
![](gitnote_clone.png)


## 日记使用
### markdown语法提示
![](gitnote_helper.png)


## 常见问题
[gitnote 手动插件安装](https://zhaopeng.me/index.php/archives/gitnote-install-plugin.html)
[GitNote 无法和GitHub 同步问题1](https://www.zhaopeng.me/index.php/archives/gitnote-github-issue-1.html)
[gitnote 手动插件安装](https://zhaopeng.me/index.php/archives/gitnote-install-plugin.html)




# 安利内容,可以跳过
## Markdown
Markdown 是一种轻量级标记语言，它允许人们使用易读易写的纯文本格式编写文档，然后转换成有效的 XHTML（或者HTML）文档。 一句话，用纯文本写你的格式化文档，不用担心word乱码之类的问题，并且随时可以导出word，html，pdf都多种格式。
## Git
Git是码农最爱，跟踪自己的修改，可以本地，并且可以结合文件协议随时和远端代码库进行同步，包含你能想到的所有存储协议了。
## Github
这个只是git库的互联网托管服务，类似的服务多如牛毛，并且你随时可以把你的本地存储迁移到任意其他服务商。gitlab，google code. 并且他们基本都可以提供静态网页服务，也就是说，你写完对应的文章后，他就给你生成静态网页了。
## 大陆服务商
没有没有，不要拿国产的**gitee**来说事，分化开源社区之类的高大上的理由就不说了，直接说他垃圾就行了，不服提交给代码试试。效果绝对超过**口死比尔**

![alt](gitee_shit.jpg)


