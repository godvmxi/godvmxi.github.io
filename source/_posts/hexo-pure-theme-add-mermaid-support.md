---
title: Hexo pure theme add mermaid support
enlink: hexo-pure-theme-add-mermaid-support
date: 2019-11-12 09:55:37
categories:
- tools
- hexo
tags:
- mermaid
- hexo
---
## 一、说明
### 开启
1. 安装hexo插件
```bash
npm install hexo-filter-mermaid-diagrams -s
```
2. 修改`themes/pure/_config.yml` 的 `mermaid.on`，开启主题支持
```yml
# Mermaid 支持
mermaid:
  on: true
  cdn: //cdn.jsdelivr.net/npm/mermaid@8.4.2/dist/mermaid.min.js
  #cdn: //cdnjs.cloudflare.com/ajax/libs/mermaid/8.3.1/mermaid.min.js
  options: # 更多配置信息可以参考 https://mermaidjs.github.io/#/mermaidAPI
    theme: 'default'
    startOnLoad: true
    flowchart:
      useMaxWidth: false
      htmlLabels: true
```
3. 添加主题渲染支持 themes/pure/layout/_common/head.ejs
```yml
  <% if (theme.mermaid.enable) { %>
    <script src='https://unpkg.com/mermaid@<%= theme.mermaid.version %>/dist/mermaid.min.js'></script>
    <script>
      if (window.mermaid) {
        mermaid.initialize({theme: 'forest'});
      }
    </script>
  <% } %>
```
4. 在markdown中，像写代码块一样写图表
![](demo.png)


## 二、示例
以下示例源码可以在这边查看 [本文源码](https://github.com/yelog/blog/blob/master/source/_posts/tools/3-hexo%E6%94%AF%E6%8C%81mermaid%E5%9B%BE%E8%A1%A8.md)
更多示例可以查看官网：[https://mermaidjs.github.io](https://mermaidjs.github.io)

### 1. flowchart
```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
```mermaid
graph TB
    c1-->a2
    subgraph one
    a1-->a2
    end
    subgraph two
    b1-->b2
    end
    subgraph three
    c1-->c2
    end
```

### 2.Sequence diagrams

```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail!
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!
```

### 3.Class diagrams
```mermaid
classDiagram
     Animal <|-- Duck
     Animal <|-- Fish
     Animal <|-- Zebra
     Animal : +int age
     Animal : +String gender
     Animal: +isMammal()
     Animal: +mate()
     class Duck{
         +String beakColor
         +swim()
         +quack()
     }
     class Fish{
         -int sizeInFeet
         -canEat()
     }
     class Zebra{
         +bool is_wild
         +run()
     }
```

### 4.State diagrams
```mermaid
stateDiagram
       [*] --> Active
       state Active {
           [*] --> NumLockOff
           NumLockOff --> NumLockOn : EvNumLockPressed
           NumLockOn --> NumLockOff : EvNumLockPressed
           --
           [*] --> CapsLockOff
           CapsLockOff --> CapsLockOn : EvCapsLockPressed
           CapsLockOn --> CapsLockOff : EvCapsLockPressed
           --
           [*] --> ScrollLockOff
           ScrollLockOff --> ScrollLockOn : EvCapsLockPressed
           ScrollLockOn --> ScrollLockOff : EvCapsLockPressed
       }
```

### 5.Gantt diagrams
```mermaid
gantt
       dateFormat  YYYY-MM-DD
       title Adding GANTT diagram functionality to mermaid
       section A section
       Completed task            :done,    des1, 2014-01-06,2014-01-08
       Active task               :active,  des2, 2014-01-09, 3d
       Future task               :         des3, after des2, 5d
       Future task2              :         des4, after des3, 5d
       section Critical tasks
       Completed task in the critical line :crit, done, 2014-01-06,24h
       Implement parser and jison          :crit, done, after des1, 2d
       Create tests for parser             :crit, active, 3d
       Future task in critical line        :crit, 5d
       Create tests for renderer           :2d
       Add to mermaid                      :1d
       section Documentation
       Describe gantt syntax               :active, a1, after des1, 3d
       Add gantt diagram to demo page      :after a1  , 20h
       Add another diagram to demo page    :doc1, after a1  , 48h
       section Last section
       Describe gantt syntax               :after doc1, 3d
       Add gantt diagram to demo page      :20h
       Add another diagram to demo page    :48h
```

### 6.Pie chart diagrams
```mermaid
pie
    "Dogs" : 386
    "Cats" : 85
    "Rats" : 15
```

