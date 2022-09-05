---
# An instance of the Blank widget with a Gallery page element.
# Documentation: https://wowchemy.com/docs/getting-started/page-builder/
widget: blank

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 66

title: Recent Photos
subtitle: "[See More Photos](gallery)"

design:
  columns: '2'

gallery_thumb_suffix: "!medium"
gallery_original_suffix: "!original"
gallery_item:
- album: recent
  image_src: https://images.guansong.wang/2022/20220619_Dongshan/DSC03734.JPG
  caption: The Canton Tower
- album: recent
  image_src: https://images.guansong.wang/2022/20220619_Dongshan/DSC03736.JPG
  caption: Shadow Image
- album: recent
  image_src: https://images.guansong.wang/2022/20220603_Chaozhou/IMG_20220604_170427.jpg
  caption: Entrance
- album: recent
  image_src: https://images.guansong.wang/2022/20220603_Chaozhou/IMG_20220603_171925.jpg
  caption: Playing in the Rain

---

{{< gallery_remote album="recent" >}}
