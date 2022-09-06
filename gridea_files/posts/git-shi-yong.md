---
title: 'git使用'
date: 2022-09-06 17:27:19
tags: [git]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

# git使用集合
## 删除本地commit
```
git reset --soft HEAD~1
git reset --hard HEAD~1
```

soft和hard的区别为，soft会将撤销的commit修改放在暂存区中，hard则不会保留 


## 查看git操作记录
```
git reflog
```
gridea的机制是不保留commit，会强制覆盖整个仓库，
我之前不了解这个机制，导致本地和云端的笔记都被强制覆盖成初始状态了
最终靠`relog`找到了最开始clone下来时的commit，才找回了之前的笔记


## 重命名远程分支
先本地将分支修改为目标名字, 推送目标分支到远端，再删除远端分支

示例，将dev修改为develop

```
git checkout dev
git pull origin dev
git checkout master
git branch -m dev devlope
git push origin develop
git push origin --delete develop
```
