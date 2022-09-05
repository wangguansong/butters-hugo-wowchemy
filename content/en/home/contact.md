---
# An instance of the Contact widget.
# Documentation: https://sourcethemes.com/academic/docs/page-builder/
widget: contact

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 130

title: Contact
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
    street: Wuyang Village
    city: Guangzhou
    region: Guangdong
    postcode: '510000'
    country: China
    country_code: CN
  coordinates:
    latitude: '23.1224641'
    longitude: '113.3088686'
  directions:
  office_hours:
  appointment_url:
  contact_links:
    - icon: twitter
      icon_pack: fab
      name: Twitter
      link: 'https://twitter.com/wangguansong'
    - icon: skype
      icon_pack: fab
      name: Skype
      linke: 'skype:wangguansong?call'

design:
  columns: '2'
---
