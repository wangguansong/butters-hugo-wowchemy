---
date: 2016-04-27
lastmod: 2016-11-27
draft: false
tags: ["2016", "Ubuntu"]
title: Ubuntu 16.04 Xenial Xerus 安装配置
summary: >
  安装Ubuntu系统之后的后续安装，和环境配置。记录以供以后安装系统参考。
---

Ubuntu 16.04 LTS 在4月21日发布。于是开始折腾各个电脑。可选择合适的镜像（[镜像列表](https://launchpad.net/ubuntu/+cdmirrors)）下载系统启动盘或者bt种子。

## 安装

安装过程基本顺畅，只是在从U盘启动时，没有正常进入安装界面，而是提示错误：
```
gfxboot.c32: not a COM32R image
```
之前也遇到过类似情况，直接在命令行输入“live”即可进入“体验Ubuntu”。

## 换源

选择中国区的镜像；改变检查更新频率为从不；更新源，安装更新包。

根据需要添加以下PPA：
- ppa:marutter/rrutter
- ppa:libreoffice/ppa
- ppa:qbittorrent-team/qbittorrent-stable
- ppa:geany-dev/ppa
- ppa:otto-kesselgulasch/gimp
- ppa:rvm/smplayer

## 安装软件
```bash
sudo apt-get install ...
```
- 系统相关  
  aptitude build-essential unity-tweak-tool synaptic apt-xapian-index gdebi
- 常用软件  
  vim git indicator-multiload qbittorrent unrar chromium skype
- 多媒体  
  flashplugin-installer smplayer audacious gimp
- 工作相关  
  r-base texlive vim-latexsuite geany (rstudio)
- R扩展包依赖  
  libxml2-dev xml2-config libssl-dev libcurl4-openssl-dev
- 不需要安装  
  nautilus-openterminal wqy-font

## 配置

需要配置文件/软件：
- 安装完整语言包，添加中文。Ibus中没有拼音可以添加，需要安装ibus-m17n。
- Firefox同步
- 用户配置：.vimrc .bashrc .Rprofile
- R扩展包：rvest RSelenium ggplot2
- texlive扩展包：

--------
Update

2016-11-27: typo