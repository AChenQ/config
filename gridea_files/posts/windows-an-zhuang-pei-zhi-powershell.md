---
title: 'Windows安装配置PowerShell'
date: 2022-09-02 17:18:49
tags: [windows]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

以下操作均在win11下安装

#目录
## 安装 windows Terminal

直接在下列地址下载最新的exe，点击安装即可
[microsoft-terminal](https://github.com/microsoft/terminal/releases)

## 安装 windows power shell

首先查看当前的版本, 通常情况下自带的是5.x版本
```
$PSVersionTable
```

访问官网进行下载: [powershell](https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.2)
下载最新的`msi`文件

## 安装 oh my posh

运行下列命令即可安装
```
winget install JanDeDobbeleer.OhMyPosh -s winget
```

在`$profile`添加下列行用以设置主题
直接 `vim $profile`即可打开配置文件
```
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\amro.omp.json" | Invoke-Expression
```

访问[oh my posh 文档](https://ohmyposh.dev/docs/installation/windows)获取更详细的配置

## 插件

安装PSReadLine获取命令自动补全功能
```
Install-Module PSReadLine
```

并在`$profile`文件中添加下列行开启此功能
```
# auto suggestions
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
```

安装posh-git获取git信息显示功能
```
Install-Module posh-git
```

## Alias
在`$profile`中通过下列方式添加alias
```
function gitStatus{
    git status
}
Set-Alias gst gitStatus
```

注意如果配置的快捷命令已存在的话，需要先解除绑定
```
Remove-Item alias:\ls
```

## 软链接
```
New-Item -ItemType SymbolicLink -Path C:\Users\hjjge\AppData\Local\nvim\init.vim -Target init.vim
```

## 包管理
可以使用chocolatey进行安装， 先安装`ChocolateyGet`
```
Install-PackageProvider ChocolateyGet -Force
```

如果要安装 `nodejs` , 直接这样安装即可
```
Find-Package nodejs -Verbose -Provider ChocolateyGet | Install-Package
```
官网: [ChocolateyGet](https://github.com/jianyunt/ChocolateyGet)

## clashx代理
![](https://achenq.github.io/post-images/1662025904438.png)
![](https://achenq.github.io/post-images/1662025909255.png)
获取命令后，粘贴在命令行运行即可，类似
```
$Env:http_proxy="http://127.0.0.1:7890";$Env:https_proxy="http://127.0.0.1:7890"
```
