---
title: 移民小结-加拿大-签证篇
date: 2022-10-28 17:36:32
tags:
    - 移民
    - 新加坡
    - 签证
    - 英联邦
---

<!-- toc -->

# 修改日志
* 2022/10/28 初稿
# 归纳黄页
[移民归纳--鸽总日记](https://vball.fun/2022/10/28/imm-geziwang-roadmap/)

# TODO

- [ ] 移民路径


# 移民路径
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
    IELTS666("雅思A类6666+")
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