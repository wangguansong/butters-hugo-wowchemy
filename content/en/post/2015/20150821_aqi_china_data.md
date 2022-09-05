---
title: Collecting and Cleansing AQI Data
summary: >
  Collect and cleanse hourly AQI of five cities of China （where U.S. embassy locations: Beijing, Shanghai, Guangzhou, Shenyang, Chengdu) from 2008 to 2014.

date: 2015-08-21T11:36:35+08:00
lastmod: 2017-09-03
draft: false

authors:
- Butters

tags: ["2015", "aqi"]
categories: []

---


Collect and cleanse hourly AQI of five cities of China （where U.S. embassy locations: Beijing, Shanghai, Guangzhou, Shenyang, Chengdu) from 2008 to 2014.

Link to raw and cleansed dataset：[Baidu Cloud](http://pan.baidu.com/s/1i4vBkep).

----------------

- Data Source: stateair.net
- Create Date: 20150406
- Updata Date: 20150407

Defination of the dataset and introduction can be downloaded from this link: (http://www.stateair.net/web/historical/1/1.html)

Data use statement (http://www.stateair.net/web/historical/1/1.html)

## Files:

- City_PM25_From_To.csv  
  CSV dataset of cleansed data of _city_
- USEmbassyAQI.csv  
  CSV dataset with five cities combied
- USEmbassyAQI.RData  
  In Rdata format
- Raw/*  
  Raw dataset

## Cleansing Process

- Delete the first three rows of text.
- Delete the "Parameter" column, since all have the same value "PM2.5".
- Delete "DATE(LST)" column, keep "Year", "Month", "Day" and "Hour" columns.
- Delete "Unit" column, since all have the same value "ug/m3".
- Delete "QC Name", since all are blank.
- Transfer "Duration" column, which takes two values of "Valid" and "Missing" to a boolean column "Valid".

## Update 20150407

There are 17 pairs of duplicates (same location and time), all of which are at 3:00 am. The duplicates have different values of AQI and the 2:00 am records are missing for all the cases, so correct the first appearance of 3:00 am as 2:00 am record. The following data is adjusted: 

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

Moreover, there are records with value -999 but not marked as invalid in Shanghai, such as:

Row | Site | Year | Month | Day | Hour | Value | Valid
----|------|------|-------|-----|------|-------|------
127905 | Shanghai | 2012 | 1 | 5 | 9 | 49 | TRUE
127906 | Shanghai | 2012 | 1 | 5 | 10 | 49 | TRUE
127907 | Shanghai | 2012 | 1 | 5 | 11 | -999 | TRUE
127908 | Shanghai | 2012 | 1 | 5 | 12 | -999 | TRUE
127909 | Shanghai | 2012 | 1 | 5 | 13 | 50 | TRUE
127910 | Shanghai | 2012 | 1 | 5 | 14 | 50 | TRUE

The two records in the middle is invalid but not properly marked. There are totally 296 cases like this that are adjusted by marking "Valid=FALSE". 

