---
title: AQI数据搜集整理
summary: >
  收集并清理从2008年到2014年中国五个城市（美国使馆所在城市：北京，上海，广州，沈阳，成都）的每小时空气指数（AQI）。
date: 2015-08-21
lastmod: 2017-09-03
draft: false

authors:
- Butters

tags: ["2015", "空气质量指数"]
categories: []

---

收集并清理从2008年到2014年中国五个城市（美国使馆所在城市：北京，上海，广州，沈阳，成都）的每小时空气指数（AQI）。

原始数据和整理数据：[百度盘](http://pan.baidu.com/s/1i4vBkep).

----------------

- 数据源: stateair.net
- 创建日期: 20150406
- 更新日期: 20150407

本数据的定义和介绍可在这网址下载：http://www.stateair.net/web/historical/1/1.html

适用于本数据的使用声明：http://www.stateair.net/web/historical/1/1.html

## 文件

- City_PM25_From_To.csv  
  分城市清理过的数据
- USEmbassyAQI.csv  
  五个城市组合
- USEmbassyAQI.RData  
  R数据格式
- Raw/*  
  原始数据 

## 清理过程

- 删除前三行文字。
- 删除“Parameter”列，因为所有值都是“PM2.5”。
- 删除“Date(LST)”列，保留“Year”，“Month”，“Day”和“Hour”列。
- 删除“Unit”列，因为所有值都是“ug/m3”。
- 删除“QC NAME”列，因为都是空。
- 转换“Duration”列，原只有两个值“Valid”或”Missing“，改为真假变量“Valid”。

## 更新 20150407

有17个重复的数据（同样地点和时间），所有的重复数据都是在上午三点（3:00am）。但重复数据的AQI不同，而且没有当日两点（2:00am）的数据，所以把第一个重复视为前一小时数据。以下数据被调整：

Row |	Site | Year | Month | Day | Hour | Value | Valid
----|------|------|-------|-----|------|-------|------
6675 | Beijing | 2009 | 3 | 8 | 3 | 179 | TRUE
15579 | Beijing | 2010 | 3 | 14 | 3 | 75 | TRUE
24315 | Beijing | 2011 | 3 | 13 | 3 | 351 | TRUE
50523 | Beijing | 2014 | 3 | 9 | 3 | 55 | TRUE
59355 | Chengdu | 2012 | 3 | 11 | 3 | -999 | FALSE
68091 | Chengdu | 2013 | 3 | 10 | 3 | 176 | TRUE
76827 | Chengdu | 2014 | 3 | 9 | 3 | 65 | TRUE
85683 | Guangzhou | 2011 | 3 | 13 | 3 | -999 | FALSE
94419 | Guangzhou | 2012 | 3 | 11 | 3 | -999 | FALSE
103155 | Guangzhou | 2013 | 3 | 10 | 3 | 92 | TRUE
111891 | Guangzhou | 2014 | 3 | 9 | 3 | 23 | TRUE
120747 | Shanghai | 2011 | 3 | 13 | 3 | -999 | FALSE
129483 | Shanghai | 2012 | 3 | 11 | 3 | 89 | TRUE
138219 | Shanghai | 2013 | 3 | 10 | 3 | 107 | TRUE
146955 | Shanghai | 2014 | 3 | 9 | 3 | 55 | TRUE
155739 | Shenyang | 2013 | 3 | 10 | 3 | -999 | FALSE
164475 | Shenyang | 2014 | 3 | 9 | 3 | 53 | TRUE

另外，上海有无效的数据（-999）但没有被“Valid”列标记，比如：

Row | Site | Year | Month | Day | Hour | Value | Valid
----|------|------|-------|-----|------|-------|------
127905 | Shanghai | 2012 | 1 | 5 | 9 | 49 | TRUE
127906 | Shanghai | 2012 | 1 | 5 | 10 | 49 | TRUE
127907 | Shanghai | 2012 | 1 | 5 | 11 | -999 | TRUE
127908 | Shanghai | 2012 | 1 | 5 | 12 | -999 | TRUE
127909 | Shanghai | 2012 | 1 | 5 | 13 | 50 | TRUE
127910 | Shanghai | 2012 | 1 | 5 | 14 | 50 | TRUE

中间两个数据无效但没有被标记。一共有296个类似的记录，都被更新标记为“Valid=FALSE”。