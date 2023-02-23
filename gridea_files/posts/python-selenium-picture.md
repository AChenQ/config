---
title: 'python selenium 全屏截图'
date: 2023-02-20 16:41:13
tags: [python]
published: true
hideInList: false
feature: 
isTop: false
---

主要思路: 滚动条下滑，屏幕截图之后，通过PIL库拼接

主要问题: selenium获取的页面高度存在误差，会导致拼接出来的图片存在重叠或者覆盖

实现逻辑:

1. 获取总页面高度 `body_height`
2. 将滚动条下滑到最底端, 
3. 获取此时滚动条顶端与页面顶端的距离 `scroll_to_top`
4. 获取滚动条的长度 `scroll_length`, 也是下滑截图时间隔
5. 将滚动条挪到最顶端，开始截图
6. 移动滚动条，每次下滑`scroll_length`, 并截图，拼接
7. 直到当前滚动条顶端与页面顶端的距离, 小于滚动条长度时，代表下一张图到达了网页的底端
8. 最后一张图片会与上一张图片有重合的内容，覆盖间隔为当前滚动条顶端与`scroll_to_top`的差额

代码实现:

```python
from PIL import Image
from selenium import webdriver

def join_images(self, png1, png2, size=0):
    """
    图片拼接
    :param png1: 图片1
    :param png2: 图片2
    :param size: 两个图片重叠的距离
    :return:
    """
    img1, img2 = Image.open(BytesIO(png1)), Image.open(BytesIO(png2))  # 打开图片对象
    size1, size2 = img1.size, img2.size  # 获取两张图片的大小
    joint = Image.new('RGB', (size1[0], size1[1] + size2[1] - size))  # 创建一个空白图片
    # 设置两张图片要放置的初始位置
    loc1, loc2 = (0, 0), (0, size1[1] - size)
    # 分别放置图片
    joint.paste(img1, loc1)
    joint.paste(img2, loc2)

    # 图片转bytes返回
    img_bytes_arr = BytesIO()  # 二进制容器
    joint.save(img_bytes_arr, format="PNG")
    return img_bytes_arr.getvalue()

driver = webdriver.Chrome(webdriver.ChromeOptions())
image_bytes = driver.get_screenshot_as_png()
body_height = driver.execute_script("return document.documentElement.scrollHeight")
driver.execute_script("window.scroll({top:document.body.clientHeight,left:0,behavior:'auto'});")
# 滚动条滚动到最底端时，滚动条顶端距离页面顶端的距离
bottom_h = driver.execute_script("return document.documentElement.scrollTop")
# 滚动条的changdu
scroll_length = body_height - bottom_h
current_h = 0
driver.execute_script("window.scroll({top:0,left:0,behavior:'auto'});")
while current_h < bottom_h:
    # 如果剩余的高度大于滚动条的高度，则下滑直接完整拼接
    if bottom_h - current_h > scroll_length:
        current_h += scroll_length
        join_size = 0
    # 如果剩余的高度小于滚动条的高度，则接下来为最后一张图，需要处理拼接
    else:
        join_size = bottom_h - current_h
        current_h += join_size
    # 1. 滚动到指定锚点
    driver.execute_script("window.scroll({top:%d,left:0,behavior:'auto'});".format(current_h))
    # 2. 截图
    image_bytes_r = driver.get_screenshot_as_png()
    # 3. 拼接
    image_bytes = self.join_images(image_bytes, image_bytes_r, join_size)

# 截图保存本地
with open(f"test.png", mode="wb") as f:
    f.write(image_bytes)
```
