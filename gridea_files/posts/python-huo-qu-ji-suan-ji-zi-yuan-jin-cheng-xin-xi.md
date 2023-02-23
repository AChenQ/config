---
title: 'python 获取计算机资源，进程信息'
date: 2022-11-30 14:15:49
tags: [python]
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

主要通过psutil进行操作
官网地址: https://psutil.readthedocs.io/en/latest/

### 进程管理

```
for proc in psutil.process_iter(["cmdline"]):
    if process_name in "".join(proc.cmdline()):
        Message.info(f"检测{process_name}正在运行中")
```

获取平均使用率
### CPU管理
```
cpu_usage = psutil.cpu_percent()
```

### 内存管理
```
memory_usage = psutil.virtual_memory().percent
```

### 磁盘管理
```
disk_usage = psutil.disk_usage("/").percent
```
