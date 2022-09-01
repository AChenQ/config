---
title: '批量解压shell脚本'
date: 2022-09-01 17:01:14
tags: [shell]
published: true
hideInList: false
feature: 
isTop: false
---
最近需要，写了一波批量解压脚本, 记录一下

```
#! /bin/sh
for i in *.zip
do
k=$i
s=${k%.zip*}
echo $s
ditto -V -x -k --sequesterRsrc $i $s
rm $i
done
```
步骤

将脚本记录在unzip.sh文件中
进入tmp目录，运行./unzip.sh
解压前zip包的结构

```
tmp
├── data.zip
└── data1.zip
```
解压后结构

```
tmp
├── data
└── data1
```
备注:
使用ditto命令进行解压，是因为在macos系统中，unzip不能处理"资源分叉"的文件，关于"资源分叉"，详见:https://en.wikipedia.org/wiki/Resource_fork

解压7z的脚本

```
#! /bin/sh
for i in *.7z
do
k=$i
s=${k%.7z*}
echo $s
7z x $i -o$s
rm $i
done
```
解压目录所有子文件夹中的zip包

```
#! /bin/sh
for j in ./*
do
for i in $j/*.zip
do
k=$i
s=${k%.zip*}
echo $s
ditto -V -x -k --sequesterRsrc $i $s
rm $i
done
done
```
