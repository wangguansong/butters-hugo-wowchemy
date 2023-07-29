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
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_112725.jpg
  caption: International Finance Center
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_110048.jpg
  caption: Dragon boat race
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_104450.jpg
  caption: Training
- album: recent
  image_src: https://images.guansong.wang/2023/20230630_Misc/IMG_20230622_195808.jpg
  caption: Dragon boat banquet
---

{{< gallery_remote album="recent" >}}
