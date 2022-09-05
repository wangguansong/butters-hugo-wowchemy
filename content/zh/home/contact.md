---
# An instance of the Contact widget.
# Documentation: https://sourcethemes.com/academic/docs/page-builder/
widget: contact

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 130

title: 联系方式
subtitle:

content:
  # Automatically link email and phone or display as text?
  autolink: true
  
  # Email form provider
  form:
    provider:
    formspree:
      id:
    netlify:
      # Enable CAPTCHA challenge to reduce spam?
      captcha: false

  # Contact details (edit or remove options as required)
  email: mail@guansong.wang
  phone: +86-18624091940
  address:
    street: 五羊邨
    city: 广州
    region: 广东
    postcode: '510000'
    country: 中国
    country_code: CN
  coordinates:
    latitude: '23.1224641'
    longitude: '113.3088686'
  directions:
  office_hours:
  appointment_url:
  contact_links:
    - icon: weixin
      icon_pack: fab
      name: 微信（二维码）
      link: http://public.guansong.wang/images/WeChatQR.png
    - icon: weibo
      icon_pack: fab
      name: 微博
      link: https://weibo.com/u/1935194357

design:
  columns: '2'
---
