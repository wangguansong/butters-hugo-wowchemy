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
  image_src: https://images.guansong.wang/2025/20250125_Shenyang/IMG_20250131_111356.jpg
  caption: Snow-man, Snow-woman, and so many Snow-kids.
- album: recent
  image_src: https://images.guansong.wang/2025/20250125_Shenyang/IMG_20250125_135031.jpg
  caption: An elder man is taking notes in front of the wall of northeastern idioms.
- album: recent
  image_src: https://images.guansong.wang/2025/20250131_Misc/IMG_20250118_133904.jpg
  caption: White takes some curious looks on the blossoming camellia.
- album: recent
  image_src: https://images.guansong.wang/2025/20250131_Misc/IMG_20250101_170531_1.jpg
  caption: Two people are sitting right on the new central axis of Guangzhou, with tourists walking around.

---

{{< gallery_remote album="recent" >}}
