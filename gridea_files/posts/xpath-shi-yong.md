---
title: 'selenium使用'
date: 2022-09-21 9:20:19
tags: [xpath]
published: true
hideInList: false
feature: 
isTop: false
---

### Select选择框使用
支持选择框选择，注意仅支持`select`元素，不支持`div`等元素
```
from selenium.webdriver.support.select import Select

element = driver.find_element_by_xpath("//select")
Select(element).select_by_value("value1")
```

### xpath语法：

`//div`  根目录开始匹配div元素
`//div[@id="as"]` 根目录开始匹配id为as的div元素
`//div[@id="as"]//*` 根目录开始匹配id为as的div元素后所有的元素
`//a[text()="as"]` 匹配text为as的a元素
`//tbody//tr[1]` tbody下的第一个tr元素，注意xpath列表从1开始...(违反直觉)
`"//i[contains(@class, 'aaa')]` class名字包括aaa的i元素
