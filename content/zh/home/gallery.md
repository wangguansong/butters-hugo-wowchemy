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
  image_src: https://images.guansong.wang/2024/20240430_Misc/IMG_20240413_161824.jpg
  caption: 广东村子里小孩子的复合业务：弹弹球抽奖和农家蔬菜摊
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240406_103634.jpg
  caption: 海口海边的篮球场
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240405_150906.jpg
  caption: 海口，Hai Hao
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240405_160737.jpg
  caption: 水桶里泡澡的小孩

---

{{< gallery_remote album="recent" >}}

