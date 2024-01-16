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
  image_src: https://images.guansong.wang/2023/20231231_Misc/IMG_20231223_161210.jpg
  caption: 周末的珠江公园草坪
- album: recent
  image_src: https://images.guansong.wang/2023/20231125_Sanya/IMG_20231125_151234.jpg
  caption: 大黑狗也要冲浪吗
- album: recent
  image_src: https://images.guansong.wang/2023/20231111_Jiaochangwei/IMG_20231111_201848.jpg
  caption: 两两作伴
- album: recent
  image_src: https://images.guansong.wang/2023/20231031_Misc/IMG_20231006_132614.jpg
  caption: 在高楼大厦里大概看不到这里的花丛吧
---

{{< gallery_remote album="recent" >}}

