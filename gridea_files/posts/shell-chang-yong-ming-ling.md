---
title: 'shell常用命令'
date: 2022-10-08 09:25:08
tags: [shell]
published: true
hideInList: false
feature: 
isTop: false
---
### 通过进程名查找PID && 通过PID查找进程名
```
ps -ef | grep 'name'
```

name为模糊匹配，所有包括此name的都会打印出来


### 通过端口查看占用进程
通过`netstat`查看所有TCP端口占用情况
```
netstat -ntlp | grep 'port'
```
