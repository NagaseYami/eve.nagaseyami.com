---
title: 学习进度记录
date: 2021-04-25 11:14:00 +0800
categories: [学习]
tags: []
---

目前接触的新知识非常广泛，写一个笔记方便查看进度  

## 树莓派

上海酒店隔离期间没事干，买了一个来玩  
没有什么特别具体的计划，走一步看一步  

### OpenWrt

出于树莓派性能考虑，插在路由器上当一个单臂路由比较合适  
可以考虑Docker上装OpenWrt当软路由，这样也方便继续使用Debian  
目前似乎还有不少性能上和稳定性问题，如果实在不太合适的话也可以直接买个软路由刷Lean大的OpenWrt固件，就不考虑Docker了  

- [树莓派专用OpenWrt固件](https://github.com/SuLingGG/OpenWrt-Rpi)
- [在Docker 中运行 OpenWrt 旁路网关](https://mlapp.cn/376.html)
- [Lean大的OpenWrt固件](https://github.com/coolsnowwolf/lede)
- [OpenClash](https://github.com/vernesong/OpenClash)

### Debian Pi Aarch64

由树莓派爱好者基地和OPENFANS联合开发的树莓派全系最佳系统  
看了看简介说是性能相当牛逼，正好我过去也就只摸过一些Ubuntu，转Debian难度就很低了  

- [GitHub](https://github.com/openfans-community-offical/Debian-Pi-Aarch64)

## 聊天机器人

专门开了一篇[文章](https://eve.nagaseyami.com/posts/project-asane/)介绍  
  
弄这玩意最早是出于golang的练习以及沙雕群友老说想要一个色图机器人  
结果做出来之后发现很多问题  

1. QQ会和谐各种色图，为了反和谐要用大量的内存对图片做处理，这很消耗内存  
1. 随机色图根本就是一个伪需求，因为随机色图并不一定能让想看色图的人满意，而想看色图的人所认为的`好看`就不是机器人能判断的范畴了。而且实际上群里发色图的人本身也把发色图当作一种社交行为，没有必要让机器人去跟他们"抢饭碗"
1. 最开始色图功能用了yandere的api，但是只支持英文搜索而且也不支持模糊搜索导致搜索起来很麻烦，需要先搜索tag然后搜索图片
1. 目前我在使用的聊天/语音SNS主要有`QQ`、`Telegram`、`Discord`、`开黑啦`，说实话有点想弄成全平台，但是这很花时间，先从QQ开始  

## 硬件相关

### 台式机DIY

目前因为显卡价格太高暂时放置

### NAS

目前因为硬盘价格太高暂时放置

### Unity Il2Cpp 逆向工程相关

- [原神的global-metadata文件保护分析记录](https://bbs.pediy.com/thread-265774.htm)
- [一个Unity游戏保护方案的分析和还原符号信息，偷学对global-metadata保护的思路](https://bbs.pediy.com/thread-260071.htm)
- [djkaty/Il2CppInspector](https://github.com/djkaty/Il2CppInspector)
- [Perfare/Il2CppDumper](https://github.com/Perfare/Il2CppDumper)
- [Il2Cpp Tutorials and Guides](https://github.com/djkaty/Il2CppInspector#tutorials-and-guides)
