---
title: '笔记本改家用服务器记录'
date: 2023-02-02 13:20:50
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
原来笔记本铰链坏了，也不怎么用了，最近有空准备刷成ubuntu放在家里当服务器用

改造步骤
1. 刷ubuntu系统
2. 配置ubuntu系统
3. 使用cpolar配置内网穿透
4. 运行服务

### 刷ubuntu系统

#### 下载iso镜像
因为屏幕还能用，所以刷了一个带桌面的ubuntu系统
国内可以在清华大学开源软件镜像站下载，网址: https://mirrors.tuna.tsinghua.edu.cn/
点击获取下载连接，我选择的20.04.5 (amd64, Desktop LiveDVD)

### 通过rufus制作启动盘

rufus下载地址： http://rufus.ie/zh

下载后选择u盘和iso镜像安装即可，注意制作前会清空u盘原有存储内容


#### 配置ubuntu系统

#### 配置ubuntu源
编辑 /etc/apt/sources.list, 最前列添加以下源
```
# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
```

运行
```
sudo apt-get update
sudo apt-get upgrade
```

#### 配置系统不自动休眠
由于多数时候是远程控制，所以要保证系统不会自动休眠

```
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

```
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

#### 配置梯子
使用v2ray进行配置
1. 安装v2ray
参考
https://qiyuan-z.github.io/2020/02/23/Ubuntu%E9%85%8D%E7%BD%AEv2ray%E8%AF%A6%E7%BB%86%E6%95%99%E7%A8%8B/#post-comment

### 配置cpolar内网穿透
 家用网络通常是不存在公网ip的，所以需要通过工具来配置公网ip以便访问

1. 注册cpolar账号, 获取token
[cpolar官网](https://www.cpolar.com/)


2. 安装cpolar
```
curl -L https://www.cpolar.com/static/downloads/install-release-cpolar.sh | sudo bash
```

3. 配置token
```
cpolar authtoken xxxxxxx
```

4. 添加并启动cpolar

```
sudo systemctl enable cpolar
sudo systemctl start cpolar
```

5. 查看公网ip
打开 https://dashboard.cpolar.com/status

[注]: 更多cpolar操作请查看 [cpolar使用文档](https://www.cpolar.com/docs)
