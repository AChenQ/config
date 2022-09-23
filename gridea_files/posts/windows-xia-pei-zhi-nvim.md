---
title: 'Windows下配置nvim'
date: 2022-09-06 17:51:08
tags: [windows,vim]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

# 目录
## 安装 nvim
配置了`ChocolateyGet`, 之后，直接安装即可
```
choco install neovim
```

nvim配置文件地址: `nvim C:\Users\hjjge\AppData\Local\nvim\init.vim`

运行`checkhealth`


## 缺少插件问题

### ctag
使用 `tagbarToggle`报错
```
Tagbar: Exuberant ctags not found! Please downloa_NYcc
```
安装 ctag即可, 在网址[ctags](https://www.vim.org/scripts/script.php?script_id=2288)下载`ctags.ext`文件，然后放在在环境变量中的地址即可

### ctrlsf
Ctrlsf需要基于某个别的应用来搜索，推荐`rg`，直接安装即可
```
choco install ripgrep
```

### markdown
安装了tabline后，markdown文件会自动折叠，非常不利于修改
可以添加下列配置进行关闭
```
au FileType markdown let g:indentLine_setConceal= 0
```
参考: https://github.com/Yggdroot/indentLine/issues/349

### python找不到
添加下列配置，设置python地址为python3
```
let g:syntastic_python_python_exec = 'python3'
```
并且安装`pip install neovim`

## coc-config
输入 `CocConfig`， 即可打开coc的配置文件

```
{
    "coc.preferences.rootPatterns": [".git"],
    "python.linting.enabled": false,
    "python.pythonPath": "python",
    "translator.engines": [
        "google",
        "youdao",
        "haici"
    ],
    "translator.maxsize": 1000,
    "translator.window.maxWidth": 500,
    "translator.window.maxHeight": 500,
}
```
