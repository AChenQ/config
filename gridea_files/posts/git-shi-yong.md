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

## git 取消之前的commit --amend
如果只amend了一次，则直接reset即可
```
git reset HEAD~1
```
如果amend了多次，则先使用relog查看需要撤销多少次操作，再使用reset撤销
```
git reflog
git reset HEAD~2
```
默认是soft模式，即把修改返回到暂存区
也可以使用hard，直接丢弃修改代码
```
git reset --hard HEAD~1
```

## git合并多个历史commit
```
# 合并历史两个提交
git rebase -i HEAD~2
```

弹出以下修改界面，按照提示选择前面关键字为`s`或者`d`等即可
```
pick f0b7d8sdf 历史提交1
pick f7c223889 历史提交2
```
修改为, 即表示将历史提交2压缩至历史提交1中
```
pick f0b7d8sdf 历史提交1
s f7c223889 历史提交2
```

## 远程分支查看
官方详细文档[git remote branchs](https://git-scm.com/book/en/v2/Git-Branching-Remote-Branches)
注意在本地仓库中，远程分支有git进行管理，不能直接修改，仅能查看
即如果你只想查看远程仓库中的某个分支的代码时，使用下面代码即可切换到对应的远程分支进行查看
```
git fetch  # 将远程分支同步为最新
git checkout origin/branchName
```

## warring提示

### warning: LF will be replaced by CRLF
问题是由于windows，linux，macos三种系统的文件换行符不一致
windows多数编辑器会使用lf的换行，所以为了支持跨平台的情况，git在提交的时候会自动将LF换行符替换为CRLF
配置下列命令来显示支持自动转换 
```
git config --global core.autocrlf true
```
