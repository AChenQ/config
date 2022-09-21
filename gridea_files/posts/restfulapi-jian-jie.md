---
title: 'RESTfulAPI简介'
date: 2022-09-21 14:22:18
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
@[TOC]

RESTful目前在很多公司都有着广泛的应用, 其中Github的API设计就是很标准的RESTful API.
可以在这里中看到许多实际的api: [github restful api](https://docs.github.com/en/rest), 
这也是我之前项目中一个重要的参考学习点.

RESTful API 就是满足REST架构风格的接口, 而REST是一种设计风格, 所以其并没有一个很严格的标准, 只是当作指导方向即可.

### RESTful API主要特征
1. 以资源为基础: 除了二进制的资源外, 更多的信息普遍以json格式
2. 统一接口: 对资源的操作包括获取、创建、修改和删除，分别对应HTTP协议提供的GET、POST、PUT和DELETE方法. 所以, 使用RESTful风格的接口可能只定位其资源, 而具体的操作则通过HTTP协议的不同方法来判断.

```
GET（SELECT）：从服务器取出资源(一项或多项)
POST（CREATE）：在服务器新建一个资源
PUT（UPDATE）：在服务器更新资源(客户端提供完整数据)
PATCH（UPDATE）：在服务器更新资源(客户端提供修改的部分数据)
DELETE（DELETE）：从服务器删除资源
```

3. URI指向资源: 每种资源可能由一个或多个URI对应，每个URI只指向一种资源
4. 无状态: 服务器不保存客户端的信息, 每一次从客户端发送的请求中, 要包含所有必须的状态信息, 会话信息由客户端保存, 服务器端根据这些状态信息来处理请求
要从URL路径、HTTP请求动词、状态码和返回结果等方面详细考虑。至于其他的方面例如错误处理、过滤信息等规范这里就不详细介绍了。

### URL路径设计
通常是通过URL定位到资源: 而一个完整的URL组成通常由以下几个部分构成：

```
URI = scheme "://" host  ":"  port "/" path [ "?" query ][ "#" fragment ]
```

* scheme: 指底层用的协议，如http、https、ftp
* host: 服务器的IP地址或者域名
* port: 端口，http默认为80端口
* path: 访问资源的路径，就是各种web 框架中定义的route路由
* query: 查询字符串，为发送给服务器的参数，在这里更多发送数据分页、排序等参数。
* fragment: 锚点，定位到页面的资源


其中path是尤其需要认真考虑的, 通常一个RESTful API的path组成如下：

```
/{version}/{resources}/{resource_id}
```

这是找到的一些规范，设计时可以参考
1. 不用大写字母，所有单词使用英文且小写。
2. 连字符用中杠"-"而不用下杠"_"
3. 正确使用 "/"表示层级关系,URL的层级不要过深，并且越靠前的层级应该相对越稳定
4. 结尾不要包含正斜杠分隔符"/"
5. URL中不出现动词，用请求方式表示动作
6. 资源表示用复数不要用单数
7. 不要使用文件扩展名

### HTTP动词

不同操作具体的含义如下：

```
GET /collection：从服务器查询资源的列表
GET /collection/resource：从服务器查询单个资源
POST /collection：在服务器创建新的资源
PUT /collection/resource：更新服务器资源
DELETE /collection/resource：从服务器删除资源
```
注意RESTful风格的API要求在URL上都以名词的方式出现，从几种请求方式上就可以看出想要进行的操作

### 状态码和返回数据

状态码主要分为五大类：

```
1xx：相关信息
2xx：操作成功
3xx：重定向
4xx：客户端错误
5xx：服务器错误
```

细分说明

```
200 OK - [GET]：服务器成功返回用户请求的数据，该操作是幂等的（Idempotent）。
201 CREATED - [POST/PUT/PATCH]：用户新建或修改数据成功。
202 Accepted - [*]：表示一个请求已经进入后台排队（异步任务）
204 NO CONTENT - [DELETE]：用户删除数据成功。
400 INVALID REQUEST - [POST/PUT/PATCH]：用户发出的请求有错误，服务器没有进行新建或修改数据的操作，该操作是幂等的。
401 Unauthorized - [*]：表示用户没有权限（令牌、用户名、密码错误）。
403 Forbidden - [*] 表示用户得到授权（与401错误相对），但是访问是被禁止的。
404 NOT FOUND - [*]：用户发出的请求针对的是不存在的记录，服务器没有进行操作，该操作是幂等的。
406 Not Acceptable - [GET]：用户请求的格式不可得（比如用户请求JSON格式，但是只有XML格式）。
410 Gone -[GET]：用户请求的资源被永久删除，且不会再得到的。
422 Unprocesable entity - [POST/PUT/PATCH] 当创建一个对象时，发生一个验证错误。
500 INTERNAL SERVER ERROR - [*]：服务器发生错误，用户将无法判断发出的请求是否成功。
```
