---
title: 'python搭建日志监控系统'
date: 2022-09-13 11:06:28
tags: [python]
published: true
hideInList: false
feature: 
isTop: false
---
在一个完整的项目中，日志的记录是必不可少的
特别是一些rpa的项目，由于目标流程节点元素容易发生变化，所以在出现错误的时候，快速定位到错误节点并修改

可以在重要节点添加装饰器
可以定义在行数开始
```
def try_log(msg='默认msg'):
    def decorator(func):
        def wrap(*args, **kwargs):
            logmsg = ":" + func.__qualname__ + ":" + msg
            try:
                Message.info(f'#节点开始<{logmsg}>')
                return func(*args, **kwargs)
            except Exception as exception:
                Message.error('节点异常：{}'.format(traceback.format_exc()))
                raise exception
            finally:
                Message.info('#结束节点<{}>'.format(logmsg))
                Message.info(
                    '--------------------------------------------------------------------------------------------')

        return wrap

    return decorator
```
