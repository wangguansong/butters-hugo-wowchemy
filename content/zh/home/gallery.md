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
  image_src: https://images.guansong.wang/2024/20241001_National_Day/IMG_20241004_171048.jpg
  caption: 一起爬山的好朋友。多年以后，他们是否会想起这个无忧无虑的下午？
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241109_203414.jpg
  caption: 广州财富
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241116_163015_1.jpg
  caption: 小 C++ 程序员
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241123_175246.jpg
  caption: 老猴子会和小猴子讲它如何看着这一片高楼建起来的故事吗？

---

{{< gallery_remote album="recent" >}}

