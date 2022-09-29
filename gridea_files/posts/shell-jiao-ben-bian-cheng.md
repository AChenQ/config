---
title: 'shell脚本编程'
date: 2022-09-29 09:40:23
tags: [shell]
published: true
hideInList: false
feature: 
isTop: false
---
### 脚本解释器
一般第一行指要用什么解释器来运行此脚本， 一般有`bash`, `zsh`, `sh`等
```
#!/bin/bash
```

可以用命令查看本系统现在支持哪些脚本解释器
```
cat /etc/shells
```

### 变量
通过$进行引用
```
NAME="Tom"
echo "Hello, $NAME"
```

ps: 也可以把命令的输出结果，赋值给某个变量
```
LIST=$(ls)
```

### read-用户输入
通过`read`读取输入, `-p`是指显示提示信息`PROMPT MESSAGE`, 并将用户输入复制给后面的变量
更多选项可参考: [read 使用](http://c.biancheng.net/view/2991.html)
```
read -p "PROMPT MESSAGE" VARIABLE
```

示例
```
#!/bin/bash
read -p "Please Enter You Name: " NAME
echo "Your Name Is: $NAME"
```

shell 还支持很多内置命令, 列举: [shell 内置命令](http://c.biancheng.net/view/1136.html)

### if条件判断
可以通过`if`, `elif`, `else`关键字进行判断

```

if [ condition-is-true ]
then
  command 1
elif [ condition-is-true ]
then
  command 2
elif [ condition-is-true ]
then
  command 3
else
  command 4
fi
```

### 条件是否成立[[]]
由于`[[]]`完全兼容`test`和`[]`，所以推荐使用`[[]]`即可
通常与`if`一起, 可以通过`[[ expression ]]`使用 
注意后面的`[[]]`前后一定要有空格, 不能是`[[expression]]`

```
#!/bin/bash
read age
if [[ $age -le 3 ]]; then
    echo "婴儿"
elif [[ $age -ge 3 && $age -le 8 ]]; then
    echo "幼儿"
else
    echo "成年"
fi

```
#### 文件选项列表
| 选 项                   | 作 用                                                                                                                   |
| ---                     | ---                                                                                                                     |
| -d   filename           | 判断文件是否存在，并且是否为目录文件。                                                                                  |
| -e   filename           | 判断文件是否存在。                                                                                                      |
| -f   filename           | 判断文件是否存在，井且是否为普通文件。                                                                                  |
| -p   filename           | 判断文件是否存在，并且是否为管道文件。                                                                                  |
| -s   filename           | 判断文件是否存在，并且是否为非空。                                                                                      |
| -r   filename           | 判断文件是否存在，并且是否拥有读权限。                                                                                  |
| -w   filename           | 判断文件是否存在，并且是否拥有写权限。                                                                                  |
| -x   filename           | 判断文件是否存在，并且是否拥有执行权限。                                                                                |
| filename1 -nt filename2 | 判断 filename1 的修改时间是否比 filename2 的新。                                                                        |
| filename -ot filename2  | 判断 filename1 的修改时间是否比 filename2 的旧。                                                                        |
| filename1 -ef filename2 | 判断 filename1 是否和 filename2 的 inode 号一致，可以理解为两个文件是否为同一个文件。这个判断用于判断硬链接是很好的方法 |

#### 数值比较
| 选 项         | 作 用 |
| ---           | ---   |
| num1 -eq num2 | 相等  |
| num1 -ne num2 | 不等  |
| num1 -lt num2 | <     |
| num1 -gt num2 | >     |
| num1 -le num2 | <=    |
| num1 -ge num2 | >=    |

####  字符串判断

| 选 项        | 作 用                                       |
| ---          | ---                                         |
| -z str       | 判断str 是否为空。                          |
| -n str       | 判断str 是否为非空。                        |
| str1 == str2 | =和==是等价的，判断 str1 是否和 str2 相等。 |
| str1 != str2 | 判断 str1 是否和 str2 不相等。              |

注意shell中==、<, > 只能用来比较字符串，不能比较数字...

### 整数运算(())
待补充

### for循环
待补充

### 函数
待补充
