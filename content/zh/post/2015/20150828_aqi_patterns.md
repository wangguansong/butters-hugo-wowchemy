---
date: 2015-08-28
lastmod: 2017-09-03
draft: false
tags: ["2015", "空气质量指数", "R"]
title: "中国五市 AQI 时间序列特征"
summary: >
  每天几点钟的空气更好更适合锻炼，一年中是否冬季真的空气最差，不同城市的空气质量特征是否相同，利用中国五座城市的历史 AQI 试图回答以上的问题。试图回答以上的问题。
---

一般而言，每天几点钟的空气更好更适合锻炼，一年中是否冬季真的空气最差，不同城市的空气质量特征是否相同，利用中国五座城市的历史 AQI 试图回答以上的问题。

所用脚本链接：[Github](https://github.com/wangguansong/AQI-USEmbassy)

注：（1）文中图片可以点击打开原图。（2）AQI（Air Quality Index）：空气质量指数，由测量pm2.5含量所得，指数越高空气质量越差。

## AQI 时间序列

首先，把每小时的数据一一列出来并没有什么意义。于是生成了每一天的平均 AQI 值，五座城市的日均值堆砌出一副[五彩纷腾的画](/img/2015/cities_Daily.png)，但并没有什么（*）用。

于是在日均 AQI 基础上，又生成了周均 AQI 和月均 AQI，曲线就有些眉目了。

{{< figure src="/img/2015/cities_Weekly.png"
    title="五城市周均AQI"
    link="/img/2015/cities_Weekly.png" >}}
{{< figure src="/img/2015/cities_Monthly.png"
    title="五城市月均AQI"
    link="/img/2015/cities_Monthly.png" >}}

图中只显示了所有城市都有数据的时间段，大概从2013年到2015年。很明显所有城市的 AQI 都具有周期性。北京的曲线几乎形成了五座城市的上围，广州和上海形成了下围。冬季是所有城市的空气质量最差时间段。这些观察和直观的印象基本是吻合的。

肉眼观测来看，随着时间的推移，AQI 并没有显著的下降或上升趋势，也就是说在这段时间里 AQI 是一个平稳的时间序列。加入时间变量的回归也验证了这个现象。

下面的是（所有城市的）月均 AQI 和分城市的总体平均 AQI 的直方图，其中数据由虚拟变量回归所得。

{{< figure src="/img/2015/cities_reg_month.png"
    title="月份因素"
    link="/img/2015/cities_reg_month.png" >}}
{{< figure src="/img/2015/cities_reg_city.png"
    title="城市因素"
    link="/img/2015/cities_reg_city.png" >}}

直方图中能看出从十月到次年二月，AQI 明显高于年中其他月份；平均来看，北京的空气质量最差，广州和上海最好，而沈阳要好过成都。

## 每日内分时AQI

有人说晨练空气好，有人说夜跑空气好。下面就来看看，按 AQI 算，一天中到底什么时候空气最好。

每日每小时，计算出该时高出或低处当日平均 AQI 的百分比。例如，某天平均 AQI 为 50，在九点时 AQI 为 60，则计算出九点钟偏离日均 AQI 为 (60-50)/50=20%。如此处理是为了避免统计结果被高 AQI 的时期影响过多。在回归中可以直接取 log 达到一样的效果。

{{< figure src="/img/2015/cities_reg_hour.png"
    title="日内分时因素"
    link="/img/2015/cities_reg_hour.png" >}}

数据说明，下午三点钟的空气是最好的，AQI 低于日均值 11.7%。早晨六七点钟的空气基本和日均值持平，但晚上七点之后，空气质量就快速下降到高于日均值了。大部分人在工作日都没办法在下午出去活动，所以相比早上和晚上，还是早上锻炼空气更好了，当然前提是能起得来。

另外，从凌晨到下午三点的明显 AQI 下落趋势，在七到八点钟被短暂逆转，不是是否与上班高峰的尾气有关。但现在没有数据可以来证实。

## 北京AQI

以上分析在五座城市混合数据中完成，但不同城市的 AQI 特征并不一定是一样的。为了避免地区因素的干扰，我对各个城市分别进行了同样的分析过程。不同城市得到的结果基本类似，北京的空气质量收到的关注最多，以下便以北京为例作为展示，其他城市的链接列在下面。

{{< figure src="/img/2015/Beijing_Weekly.png"
    title="北京周均 AQI"
    link="/img/2015/Beijing_Weekly.png" >}}
{{< figure src="/img/2015/Beijing_Monthly.png"
    title="北京月均 AQI"
    link="/img/2015/Beijing_Monthly.png" >}}
{{< figure src="/img/2015/Beijing_reg_month.png"
    title="北京月均 AQI 直方图"
    link="/img/2015/Beijing_reg_month.png" >}}
{{< figure src="/img/2015/Beijing_reg_hour.png"
    title="北京分时 AQI 直方图"
    link="/img/2015/Beijing_reg_hour.png" >}}


其他城市

- 上海：
    [周均 AQI](/img/2015/Shanghai_Weekly.png)
    [月均 AQI](/img/2015/Shanghai_Monthly.png)
    [月均 AQI 直方图](/img/2015/Shanghai_reg_month.png)
    [分时 AQI 直方图](/img/2015/Shanghai_reg_hour.png)
- 广州：
    [周均 AQI](/img/2015/Guangzhou_Weekly.png)
    [月均 AQI](/img/2015/Guangzhou_Monthly.png)
    [月均 AQI 直方图](/img/2015/Guangzhou_reg_month.png)
    [分时 AQI 直方图](/img/2015/Guangzhou_reg_hour.png)
- 沈阳：
    [周均 AQI](/img/2015/Shenyang_Weekly.png)
    [月均 AQI](/img/2015/Shenyang_Monthly.png)
    [月均 AQI 直方图](/img/2015/Shenyang_reg_month.png)
    [分时 AQI 直方图](/img/2015/Shenyang_reg_hour.png)
- 成都：
    [周均 AQI](/img/2015/Chengdu_Weekly.png)
    [月均 AQI](/img/2015/Chengdu_Monthly.png)
    [月均 AQI 直方图](/img/2015/Chengdu_reg_month.png)
    [分时 AQI 直方图](/img/2015/Chengdu_reg_hour.png)
    
    

## AQI 与温度

上述 AQI 的时间序列图表明，北方城市比南方城市高，冬季比其他季节高，凌晨比下午高，可以概括为温度与 AQI 为负相关。

与此会引发很多有趣的讨论。例如一年中冬季的 AQI 高峰在控制了气温变量后是否还与取暖有关，此外不仅北方城市有冬季 AQI 高峰，南方不取暖的城市（广州）也有冬季的 AQI 高峰。再例如，加入温度变量后，上下班高峰的尾气排放是否会更显著地影响分时 AQI，以检验汽车尾气对空气质量的影响有多大。

另外两个可能影响空气质量的因素是降雨量和风向/风速，以后可以继续搜集相关数据。