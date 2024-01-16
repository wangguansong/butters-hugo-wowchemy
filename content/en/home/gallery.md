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
  image_src: https://images.guansong.wang/2023/20231231_Misc/IMG_20231223_161210.jpg
  caption: The lawn in the Zhujiang Park in a sunny weekend
- album: recent
  image_src: https://images.guansong.wang/2023/20231125_Sanya/IMG_20231125_151234.jpg
  caption: Do you want to surf too, Blackie?
- album: recent
  image_src: https://images.guansong.wang/2023/20231111_Jiaochangwei/IMG_20231111_201848.jpg
  caption: Double date
- album: recent
  image_src: https://images.guansong.wang/2023/20231031_Misc/IMG_20231006_132614.jpg
  caption: People in those skyscrapers probably won't be able to see the blossom here.
---

{{< gallery_remote album="recent" >}}
