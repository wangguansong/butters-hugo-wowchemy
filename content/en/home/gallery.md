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
