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
  image_src: https://images.guansong.wang/2022/20220619_Dongshan/DSC03734.JPG
  caption: 广州塔
- album: recent
  image_src: https://images.guansong.wang/2022/20220619_Dongshan/DSC03736.JPG
  caption: 剪影
- album: recent
  image_src: https://images.guansong.wang/2022/20220603_Chaozhou/IMG_20220604_170427.jpg
  caption: 门口
- album: recent
  image_src: https://images.guansong.wang/2022/20220603_Chaozhou/IMG_20220603_171925.jpg
  caption: 下棋
---

{{< gallery_remote album="recent" >}}

