---
title: UnriadNAS折腾记录
date: 2021-07-19 20:23:00 +0800
categories: [记录]
tags: [unraid,docker,nas]
---

前几天朋友低价转手给我一个全新8TB的希捷SMR盘，于是就开始折腾起了NAS。

## 安装于初始设置

### 制作启动盘

没有什么难度，基本按照[官网的教程](https://wiki.unraid.net/Articles/Getting_Started#Getting_Started)走就行。  
只讲重点。  

1. 用质量好点的U盘，假冒伪劣产品有可能没序列号导致无法使用。
1. [Unraid官网下载USB Creator](https://unraid.net/download)。想白嫖也可以去找找开心版。
1. 用USB Creator把Unraid系统刷进U盘。
1. 插上主板，开机。
1. 尝试默认的本地域名`http://tower`/`http://tower.local`，又或者是通过路由器或者局域网扫描找到Unraid的IP。
1. 默认是root用户没密码直接就能进，进去之后立刻设置密码。
1. 进去之后激活KEY，或者先试用30天。

### 特殊准备

为了之后安装各种社区应用，先把`hosts`改了，并写进go文件里，这样就能开机自动改。  

```shell
nano /etc/hosts
```

```txt
199.232.28.133  raw.githubusercontent.com
199.232.4.133   raw.githubusercontent.com
199.232.4.133   raw.github.com
```

```shell
nano /boot/config/go
```

```shell
echo "199.232.28.133  raw.githubusercontent.com" >> /etc/hosts
echo "199.232.4.133   raw.githubusercontent.com" >> /etc/hosts
echo "199.232.4.133   raw.github.com" >> /etc/hosts
```

### 安装社区应用插件

论坛帖：<https://forums.unraid.net/topic/38582-plug-in-community-applications/>  
通过安装社区插件来让Unraid内置社区插件浏览功能。  

`https://raw.githubusercontent.com/Squidly271/community.applications/master/plugins/community.applications.plg`  

### Unassigned Devices

论坛贴：<https://forums.unraid.net/topic/92462-unassigned-devices-managing-disk-drives-and-remote-shares-outside-of-the-unraid-array/>  
基本上是必备插件，可以识别各种文件系统的储存设备，比如刚从Windows上拆下来的NTFS的盘，这样就能拷进整列里了。  

`https://github.com/dlandon/unassigned.devices/raw/master/unassigned.devices.plg`  

### 共享文件夹

`共享`选项卡里点击`添加共享`即可，具体的设置就不介绍了，`SMB安全设置`的`导出`选`是`，`安全性`选`私有`，下面就会多出一个`SMB用户访问权限`，在这里就可以设置每一个用户的访问权限了。（用户的管理在`用户`选项卡里）  

## 远程下载NAS上的东西

由于我国网络运营商是封禁了SMB的445端口，而Windows访问SMB时又不能指定其他端口，于是映射445端口开放SMB到外网这条路是走不通的。  
所以大致思路是使用SFTP协议远程连接NAS，不过还是有几个问题。  

### 大内网

大内网就是因为IPv4的IP已经不够用了，各大运营商只好再搞一层内网套娃，导致一片区域的人可能都在共用同一个公网IP。  
解决方案就是直接打电话给运营商然后说自己家需要公网IP（我国搞网站是要备案的，如果运营商起疑心觉得你想搞网站那就可能不会给你公网IP，可以说自己家需要装监控摄像头）。  

### 动态IP

解决方案就是买一个域名然后用ddns动态更新A record。  
域名我以前在amazon上买了，所以我得用route53来更新A record。  

### ddns-route53

Github：<https://github.com/crazy-max/ddns-route53>  
Docker Image : `crazymax/ddns-route53`  
动态IP的ddns解决方案。  
由于我的域名是amazon负责管理的，所以要用到这个Image，Unraid社区里搜ddns-route53就有。  
使用方法参考文档：<https://crazymax.dev/ddns-route53/>  
设置完毕之后启动即可，一般默认5分钟检测一次IP然后更新A record就行。  

### CrushFTP10

Docker Hub : <https://hub.docker.com/r/markusmcnugen/crushftp>  
Docker Image ： `markusmcnugen/crushftp:latest`  

CrushFTP支持FTP, Implicit FTPS, SFTP, HTTP, HTTPS协议，适合作为远程下载的解决方案

如果想搞成Web服务，也可以考虑HTTP和HTTPS，不过问题是HTTP常用的80、8080端口也是我国网络运营商的封禁对象，加上http本来也不安全，所以要弄就得考虑https。虽然我自己觉得太麻烦就干脆没弄了。  
设置也没啥难度，SFTP和HTTP端口映射到Host上，想共享的NAS上的文件夹就Mount一下，启动Container之后用浏览器访问HTTP页面，然后在设置里就能设置用户，用户组，以及他们能够访问的文件夹之类的东西了。  
最后在自己家的路由器上把某个自己喜欢的端口映射到CrushFTP的SFTP端口即可。  

## BT

用了这么多年BT下载也是承蒙各位Seeder的照顾了，必须回礼。

### qbittorrent

Docker Image : `linuxserver/qbittorrent`  
社区里搜`qbittorent`就有，是我自己比较喜欢的BT客户端，主要是UI看着舒服。  
设置起来也没啥难度，唯一一个坑就是HTTP用的Host和Container内部端口必须一致，否则会进不去，也不知道为啥。  
例：设置WEBUI_PORT环境变量为9000，然后映射Host的9000端口至Container的9000端口。  
建议专门设置一个文件夹给BT，方便整理，然后种子丢进去就不管了，24小时开着做种。  
