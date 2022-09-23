---
title: 'zsh 配置'
date: 2022-09-01 13:07:57
tags: [zsh]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

整了一下自己zsh的配置，在这里将其记录下来

# 目录
## oh my zsh
oh my zsh是一款基于zsh命令行的扩展工具集，我们可以通过它简单，快速的配置出自己喜欢的命令行风格

mac目前开始默认使用zsh作为shell(ubuntu也可以自行安装zsh) 你可以通过下列命令一键安装oh my zsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

具体详情参照官网: ohmyzsh

ps: 安装之后，原来的默`认~/.zshrc`文件会被重命名`为~/.zshrc.pre-oh-my-zsh`, 新的`.zshrc`文件为`oh my zsh`的配置文件

## 主题
oh my zsh默认提供了很多不同风格的主题，只需要修改~/.zshrc文件中的`ZSH_THEME="主题"`字段即可

我设置的为`ZSH_THEM=cloud`

官方提供的主题地址: [themes](https://github.com/ohmyzsh/ohmyzsh/wiki/Themes)

### 自定义主题
如果对提供的样例主题不满意，你也可以自定义配置主题

下图是我配置的终端界面，仅显示我想显示的信息
![](https://achenq.github.io/post-images/1662012542941.png)

在上图界面显示中，前面的云朵图案可以按自己的喜好更改，随后依次显示登陆用户名，路径，git信息

右侧则显示的为我当前所使用pyenv工具中python环境的名称

自定义主题具体步骤

在`~/.oh-my-zsh/themes/`中新建一个文件，文件名即为主题名，使用上述的ZSH_THEME配置

ZSH_THEME_CLOUD_PREFIX='☁️' #后面的☁️图案实际上显示是上图中的云朵图案，只不过代码框中不支持
```
PROMPT='%{$fg_bold[cyan]%}$ZSH_THEME_CLOUD_PREFIX  %{$fg[white]%}%n%{$fg_bold[green]%}%p %{$fg[green]%}%~ %{$fg_bold[cyan]%}$(git_prompt_info)%{$fg_bold[blue]%} %{$reset_color%}'

RPROMPT='%{$fg[yellow]%}$(pyenv_prompt_info)'
```
配置方法为`%{$fg[color]%}%message
`
如`%{$fg[white]%}%n`意思便是显示颜色为白色的用户名

ps: PROMPT是指命令行从左往右开始依次显示什么信息，RPROMPT则是从右往左

下表显示一些常用的信息表示符，详细配置请见官网: [Prompt-Expansion](http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)

| 转义变量 | 描述                                                                |
| ----     | ----                                                                |
| %*       | 系统时间（时：分：秒）                                              |
| %D       | 系统日期（年-月-日）                                                |
| %n       | 你的用户名                                                          |
| %~       | 你目前的工作目录相对于～的相对路径（可能在某些zsh版本可能造成乱码） |
| %M       | 计算机的主机名                                                      |

也可以通过编写函数，达到更加复杂的显示逻辑，比如超过多少个字符就将其折叠

### 调色板
由于不同终端的调色板不一样，可能显示出的样式会和样例图有出入

分享一下我使用的调色板, 地址: https://draculatheme.com/iterm/

各颜色示例
![](https://achenq.github.io/post-images/1662012425264.png)

## 插件
oh my zsh还可以快速便捷安装非常好用的插件，这里推荐两个我最常用的，用过之后再也离不开了的那种

### autosuggestions
这个插件会记录你之前输入过的历史命令，并且自动根据当前输入的前缀在历史命令中进行匹配，如果你想直接输入历史命令，按小键盘的→即可补全，类似这样：
![](https://achenq.github.io/post-images/1662012563595.png)

安装命令:
```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

原地址：[zsh-autosuggesstions](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md)

### autojump
与传统的 cd 命令相比，autojump 能够更加快速地导航至目的目录

你可以直接通过 j + 文件夹名进行目录跳转，前提是历史曾经进入过的目录

同时auto夹提供很多其他的命令如jo打开文件夹等，详情见官网:https://github.com/wting/autojump

mac安装

```
brew update
brew install autojump
```

ubuntu 安装
```
apt install autojump
```
