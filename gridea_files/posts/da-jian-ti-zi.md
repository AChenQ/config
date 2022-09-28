---
title: '10min 搭建V2ray梯子'
date: 2022-09-22 17:14:45
tags: [V2ray]
published: true
hideInList: false
feature: 
isTop: false
---
主要参考下列教程进行搭建
[美国VPS Hostwinds一键脚本搭建V2Ray最新中文教程](https://github.com/xiaoming2028/FreePAC/wiki/%E7%BE%8E%E5%9B%BDVPS-Hostwinds%E4%B8%80%E9%94%AE%E8%84%9A%E6%9C%AC%E6%90%AD%E5%BB%BAV2Ray%E6%9C%80%E6%96%B0%E4%B8%AD%E6%96%87%E6%95%99%E7%A8%8B)

在搭建过程中对上列教程一些补充的点:

1. 
按照教程在服务器上安装好V2ray后，没有发现教程有提及如何下载 `v2rayN.exe`文件
可以在此链接下载 [v2rayN-Core](https://github.com/AChenQ/config/releases/download/untagged-5a42cf861f6d976bb870/v2rayN-Core.zip)
下载后解压打开，继续流程即可

2. 
windows powershell 终端代理开启
```
$Env:http_proxy="http://127.0.0.1:10809";$Env:https_proxy="http://127.0.0.1:10809"
```

点击设置可以看到V2ray是监听的`10808`端口, 然后默认情况下代理是`socks+1`，所以是`10809`

3.
生成链接二维码和url
  * `v2ray url`  : 生成 vmess URL 链接
  * `v2ray qr`   : 生成二维码链接
  * `v2ray ssqr` : 生成 Shadowsocks 二维码链接

4.PAC模式使用
PAC模式下，需要自定义需要代理网址的名单，不在名单中的则一律不走代理
按照下列模式添加即可
![](https://achenq.github.io/post-images/1664189761475.png)

