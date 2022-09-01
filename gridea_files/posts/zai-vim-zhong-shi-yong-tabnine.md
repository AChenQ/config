---
title: '在vim中使用TabNine'
date: 2022-09-01 17:03:05
tags: [vim]
published: true
hideInList: false
feature: 
isTop: false
---
在vim中使用tabnine, tabnine是一个智能补全的工具
其原始项目地址: [TabNine](https://github.com/codota/TabNine)

下面将介绍两种方式来进行安装，我自己是通过coc来使用tabnine

* 使用Plugin管理
* 使用coc管理

#### 使用Plugin
原项目地址: [tabnine-vim](https://github.com/codota/tabnine-vim)

使用步骤:

添加 `"Plug 'zxqfl/tabnine-vim'`
运行`:PlugInstall`即可
开启配置方式:

新建一个空白文件
输入`TabNine::config`即可开启配置页面
输入`TabNine::sem`即可打开当前语言的自动补全
但是这样对我来说有一个问题，我安装的其他coc插件会没法正常使用
比如coc-word将不会自动帮你补全英文单词
所以我采用的是coc进行管理

#### 使用coc
原项目地址: [coc-tabnine](https://github.com/neoclide/coc-tabnine)

使用步骤:

运行`:CocInstall coc-tabnine`安装tabnine插件
运行`:CocCommand tabnine.updateTabNine`进行升级
开启配置方式:

开启配置文件: CocCommand tabnine.openConfig
开启设置网址: CocCommand tabnine.openHub

备注:
新建一个txt文件，输入上面的命令，即可开启对应的配置页面
（因为理论上安装了coc-tabnine 之后，vim输入的所有文字都会被输入到tabnine中进行智能补全，所以新开一个文件，输入上面的命令tabnine就可以检测到了）

接下来接可以开始流畅的码代码啦，可以看到提示菜单中，后缀标签为[TN]即tabnine提供的提示
