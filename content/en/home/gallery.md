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
  image_src: https://images.guansong.wang/2024/20241001_National_Day/IMG_20241004_171048.jpg
  caption: A group of kids climbing hill together. Will they miss this happy afternoon after a few years?
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241109_203414.jpg
  caption: Wealth of Guangzhou (written on a tour boat)
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241116_163015_1.jpg
  caption: Junior C++ Engineer
- album: recent
  image_src: https://images.guansong.wang/2024/20241130_Misc/IMG_20241123_175246.jpg
  caption: Will the old tell the young that he witnessed how those skyscrapers were bulit along the years?


- album: recent
  image_src: https://images.guansong.wang/2024/20240430_Misc/IMG_20240413_161824.jpg
  caption: A group of kids in the village setting up multiple business, lottery and homegrown vegetables.
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240406_103634.jpg
  caption: Baseketball courts by the beach in Haikou
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240405_150906.jpg
  caption: Is it Haikou, or Haihao?
- album: recent
  image_src: https://images.guansong.wang/2024/20240404_Haikou/IMG_20240405_160737.jpg
  caption: A boy bathing in a basket and his sister

---

{{< gallery_remote album="recent" >}}
