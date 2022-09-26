---
title: '利用precommit对git仓库进行检查'
date: 2022-09-26 16:01:17
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

## python常用检查工具推荐
pre-commit是通过添加对应的github repo地址添加检查工具的，所以需要对应的repo中有.pre-commit-hooks.yaml配置文件

### isort
说明: 对import部分进行排序, 是的包导入更加规范，减少多人协作时由于修改包位置导致的冲突
主要分为以下四大类, 通类别内部按照字母顺序排序
```
from __future__ import absolute_import

import os
import sys

from third_party import (lib1, lib2, lib3, lib4, lib5, lib6, lib7, lib8,
                         lib9, lib10, lib11, lib12, lib13, lib14, lib15)

from my_lib import Object, Object2, Object3
```
官方地址: [isort](https://github.com/pycqa/isort)

### black
介绍: 按照 PEP 8 规范自动格式化python代码
官方地址: [black](https://github.com/psf/black)

注意isort和black一起用时会有冲突, 使用`--profile=black`参数来避免冲突

```
  - repo: https://github.com/pycqa/isort
    rev: 5.5.2
    hooks:
      - id: isort
        types: [python]
        args: ["--profile=black"]
```

### mypy
介绍: python静态语法检查
注意mypy没有官方适配pre-commit，所以可以使用pre-commit提供的镜像仓库
mypy静态仓库: [mirrors-mypy](https://github.com/pre-commit/mirrors-mypy)
官方地址: [mypy](https://github.com/python/mypy)
配置参考

```
  - repo: https://github.com/pre-commit/mirrors-mypy
    rev: v0.910
    hooks:
      - id: mypy
        types: [python]
        exclude: "(test_\\w*\\.py$)"
        additional_dependencies: [types-PyYAML, types-mock, types-requests>=2.26.0, click]
        args:
          [
            "--cache-dir=/tmp/mypy_cache/",
            "--ignore-missing-imports",
            "--warn-unreachable",
            "--show-error-code",
            "--strict-equality",
            "--strict",
          ]
```
