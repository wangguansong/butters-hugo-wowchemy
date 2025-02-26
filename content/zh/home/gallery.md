---
# An instance of the Blank widget with a Gallery page element.
# Documentation: https://wowchemy.com/docs/getting-started/page-builder/
widget: blank

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 66

title: 近期照片
subtitle: "[查看更多照片](gallery)"

design:
  columns: '2'

gallery_thumb_suffix: "!medium"
gallery_original_suffix: "!original"
gallery_item:
- album: recent
  image_src: https://images.guansong.wang/2025/20250125_Shenyang/IMG_20250131_111356.jpg
  caption: 大雪男人，大雪女人，和很多小雪人儿童。
- album: recent
  image_src: https://images.guansong.wang/2025/20250125_Shenyang/IMG_20250125_135031.jpg
  caption: 一位老先生在东北方言墙前面，认真地写着笔记。
- album: recent
  image_src: https://images.guansong.wang/2025/20250131_Misc/IMG_20250118_133904.jpg
  caption: 大白好奇地看着刚开放的茶花。
- album: recent
  image_src: https://images.guansong.wang/2025/20250131_Misc/IMG_20250101_170531_1.jpg
  caption: 两个人在游人环绕的花城广场上，正正的坐在新中轴线上。

---

{{< gallery_remote album="recent" >}}

