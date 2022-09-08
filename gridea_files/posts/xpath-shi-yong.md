---
title: 'xpath使用'
date: 2022-09-08 19:26:19
tags: [xpath]
published: true
hideInList: false
feature: 
isTop: false
---
xpath语法：

`//div`  根目录开始匹配div元素
`//div[@id="as"]` 根目录开始匹配id为as的div元素
`//div[@id="as"]//*` 根目录开始匹配id为as的div元素后所有的元素
`//a[text()="as"]` 匹配text为as的a元素
`//tbody//tr[1]` tbody下的第一个tr元素，注意xpath列表从1开始...(违反直觉)
`"//i[contains(@class, 'aaa')]` class名字包括aaa的i元素
