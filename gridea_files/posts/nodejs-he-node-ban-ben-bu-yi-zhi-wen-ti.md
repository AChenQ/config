---
title: 'nodejs和node版本不一致问题'
date: 2023-04-19 17:27:20
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
安装包遇见了这样的问题
```
ERROR: npm v9.5.1 is known not to run on Node.js v12.22.9.
```

但是调用版本命令发现node的版本不一致
```
$ npm -v
 9.5.1
$ node -v
 v18.16.0
$ nodejs --versions
 v12.22.9
```

发现机器上有两个nodejs，包读取的node为另一个
排除发现是node是通过 `n`工具安装的，需要把另一个系统安装的去除

```
sudo apt-get remove nodejs
```
