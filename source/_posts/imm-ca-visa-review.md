---
title: 移民归纳 - 路径差异与成功率
date: 2022-10-31 13:33:50
categories:
    - 移民
tags:
    - 移民
---
<!-- toc -->

# 修改日志
* 2022/10/29 初稿, 汇总一下当天别人的问题

# 归纳黄页
[移民归纳--鸽总日记](/2022/10/28/imm-geziwang-roadmap/)


# 签证审核

## 审核考量


### 资金
连准备花的钱都没有，你出来干嘛呢？想吃我国的福利嘛？gun！！！  
要点：
- 多多益善
- 细水长流，我工资不低，长远值得期待

### 移民倾向
移民倾向一个大家都心知肚明，但是都要装作没有的东西，你准备各种资料装作不想移民，移民官负责找你的漏洞
- 父母双亡穷逼大龄单身狗， 一看来了不想走
- 没车没房，原因如上
- 国内没啥值得留恋的东西和关系，那你明显是想赖上我了

### 移民政策
移民局的政策是随着国际国内形势不断调整的：

- 我国留学生少，没有他们的学费，我们教育部门怎么做下一年的预算，用爱发电嘛
- 国内劳工高中低端都确认，赶紧放水，是活的就行（比如疫情期间）
- 俄罗斯是坏蛋，移民官： 看到大毛我就生气，看到孝子也生气
- 乌克兰被欺负，二毛不哭，爸爸爱你
- 中国，印度 这些人基本来了都不想走，好好审一下，择优录取


## 加拿大的签证审核路径

不同的签证走不同的签证审核流程和不同的国家的部门

**通过指数只是当前情况下的相对参数，不代表通过率**

| 类型 | 计算机预审 | 人工审核部门 | 通过指数/10分 | 备注 |
| --- | --- | --- | --- | ---|
| 旅游签 | 必须 | 北京 | 6 |都是中国通，一眼看穿你的资料和想法 |
| 普通学签 | 必须 | 北京 | 8 |都是中国通，一眼看穿你的资料和想法 |
| SDS学签 | 无 | 北京 | 9 | 英语好，一看就是学霸，欢迎 |
| 旅转学签证 | 无 | 加麻大 | 9 | 都来旅游了，资质应该可以，稍微看看吧 |
| 低龄学签 | 大概率有 | 北京 | 9 |小孩子能有什么坏心眼呢？况且钱也不少，稍微看看吧 |
| 陪读旅游签 | 大概率有 | 北京 | 9 |人家有钱，陪孩子上学，合情合理啊，稍微看看吧 |
| 双录取学签 | 大概率有 | 北京 | 7 |语言学渣，还想上学，我认真考虑一下 |
| 工签 | 无 | 忘记了，稍后补充 | 9 |有公司要，还有Ca审核的LIMA，稍微看看吧 |


## 换国家申请
按照固定，只要你在第三国呆满6个月，你就可以从第三国申请，走第三国的审核通道，少了很多中国通，也少了慢慢多的工作量，通过率会好很多。但是有了新的问题

- 你第三国长期签证类型是啥，还能回去嘛？
- 你能在第三国合法停留吗，旅游签？滚！


一句话，增大了你的移民倾向。。。除非你有绿卡，不然不建议。当然利弊自己评估



# 不同方式的学签移民路径
这里针对普通人，能直接高学历高技术海外捞人的，忽略这段。  
文明国家中，你在目标国的工作决定你的移民。
```mermaid
graph TB
    Child("低龄孩子")
    Adult("成人")
    ChildStudyPermit("孩子低龄学签")
    AdultChildTravelPermit("成人陪读旅游签")
    AdultTravelPermit("成人旅游签")
    AdultStudyPermit("成人学签")
    SDSStudyPermit("SDS学签")
    AdultStudying("学期2年+")
    SpouseWorkPermit("配偶开放工签")
    LanguageSchool("语言学校\英法\雅思4.5分+")
    PGWP("毕业工签/PGWP")
    WorkHistory("工作经历")
    PR("绿卡")
    Citizen("公民护照")
    ImmJail("移民监")
    ChildFreeStudy("孩子免费教育")
    IELTS666("雅思A类总分6分+")
    SDS("SDS快速通道")
    CustomsDepartureStudy("学签出境")
    CustomsDepartureStudy2("学签出境")
    CustomsDepartureTravel("旅行签出境")
    EntrySchool("入学")

    IELTS2("雅思加分")
    WaitingPool("候选池子")
    Nominate("提名")




    style AdultChildTravelPermit fill:#260,stroke:#333,stroke-width:5px
    style AdultTravelPermit fill:#260,stroke:#333,stroke-width:5px

    style ChildStudyPermit fill:#1bf,stroke-width:2px,color:#fff,stroke-dasharray: 5 5
    style SDSStudyPermit fill:#07f,stroke-width:2px,color:#fff,stroke-dasharray: 5 5


    style SpouseWorkPermit fill:#0bf,stroke-width:2px,color:#fff,stroke-dasharray: 5 5
    style PGWP fill:#0bf,stroke-width:2px,color:#fff,stroke-dasharray: 5 5
    style WorkHistory fill:#C9f,stroke:#333,stroke-width:4px

    style CustomsDepartureStudy fill:#F0f,stroke:#333,stroke-width:4px
    style CustomsDepartureStudy2 fill:#F0f,stroke:#333,stroke-width:4px
    style CustomsDepartureTravel fill:#F0f,stroke:#333,stroke-width:4px

    Child -->|通过率>90%| ChildStudyPermit 
    Adult -->|通过率没法看| AdultTravelPermit 
    ChildStudyPermit -->|基本都给| AdultChildTravelPermit
     
    AdultChildTravelPermit --> CustomsDepartureStudy
    CustomsDepartureStudy --> LanguageSchool

    AdultTravelPermit --> CustomsDepartureTravel
    CustomsDepartureTravel --> LanguageSchool
    LanguageSchool --> AdultStudyPermit

    AdultStudyPermit --> EntrySchool

    EntrySchool --> AdultStudying
    EntrySchool -->|通过率极高| SpouseWorkPermit
    EntrySchool --> ChildFreeStudy
    AdultStudying --> PGWP
    
    PGWP --> WorkHistory

    IELTS2 --> WaitingPool 
    WorkHistory --> WaitingPool
    WaitingPool --> Nominate
    Nominate --> PR
    PR -.-> Citizen
    PR -.-> ImmJail
    ImmJail -.-> ImmJail
    ImmJail -.-> Citizen

    
    SpouseWorkPermit --> WorkHistory
    

    IELTS666 --> SDS
    SDS  -->|通过率极高| SDSStudyPermit
    SDSStudyPermit --> CustomsDepartureStudy2
    CustomsDepartureStudy2 --> EntrySchool


```
# 旅行签的必要性

