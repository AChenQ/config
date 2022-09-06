---
title: '利用precommit对git仓库进行检查'
date: 2022-09-01 16:53:17
tags: [pre-commit]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

pre-commit可以很方便的管理git repo中的各种检查工具
其基本原理是作为git repo里面的钩子，可以对要提交的代码进行语法检查，格式化操作。
配置好之后，git commit时会自动触发检查
![](https://achenq.github.io/post-images/1662022462405.png)

## 基本用法

1. 安装pre-commit `pip install pre-commit`
2. 进入项目根目录运行`pre-commit install`, 将pre-commit添加到此repo中的钩子中
3. 在仓库的根目录下添加`.pre-commit-config.yaml`文件
4. 运行`pre-commit run --all-files`即可开始检查

## yaml文件示例
`.pre-commit-config.yaml`文件内容
```
---
default_stages: [commit]
default_language_version:
  python: python3.8
repos:
  - repo: https://github.com/asottile/pyupgrade
    rev: v2.29.1
    hooks:
      - id: pyupgrade
        args: [--py36-plus]
```
字段说明:
default_stages: 在什么动作的时候触发pre-commit检查
repos: 使用什么工具进行检查

如何添加检查工具
pre-commit是通过添加对应的github repo地址添加检查工具的，所以需要对应的repo中有.pre-commit-hooks.yaml配置文件

### black
参考: [black](https://github.com/psf/black)
black: 自动格式化python代码

### mypy
当需要的repo没有对应的hook配置文件时，可以通过fork的方式进行添加
参考: [mypy](https://github.com/pre-commit/mirrors-mypy)
mypy: python语法检查
