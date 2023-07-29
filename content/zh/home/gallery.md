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
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_112725.jpg
  caption: 国际金融中心
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_110048.jpg
  caption: 赛龙舟
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_104450.jpg
  caption: 训练
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_195808.jpg
  caption: 龙船宴
---

{{< gallery_remote album="recent" >}}

