---
date: 2016-04-14
lastmod: 2016-11-27
draft: false
tags: ["2016", "GARCH", "R", "计量经济学", "股票"]
title: GARCH：中国股指
summary: >
  把上证指数、沪深300和深证成指代入ARMA(1,1)-GARCH(1,1)，应用rugarch扩展包。
---

时间段为2003年12月8日，至2016年4月14日，每个指数包括3000个数据。沪深300大概有3190个数据，于是取整到了3000个数据。尝试带入所有数据时，rugarch报错，大概是最优解时出现了问题，没有细究。

三个过程高度吻合，也捕捉到了中国股市主要的波动。深证成指（红色）更多的出现在上围，上证指数（黑色）则更多出现在下围。这和深圳交易所比上海交易所的股票风险更高的印象符合。

{{< figure src="/img/2016/20160414_garchvol_cn.png"
    title="中国股指 GARCH"
    link="/img/2016/20160414_garchvol_cn.png" >}}

R代码如下。

第一部分读取数据，用到了我之前的代码（链接）。第二部分应用rugarch。在模型配置（spec）中，分别配置期望模型和方差模型（即GARCH），distribution.model设定计算最大似然函数所用的残差分布。其中还有很多可以改动的参数，有兴趣可参考[手册](//mirrors.xmu.edu.cn/CRAN/web/packages/rugarch/index.html)。

```R
require("rugarch")

source("~/Work/Workspace/get_chinese_stocks/GetSymbols.netease.R")
GetSymbols.netease("0000001", dfname="SH000001")
SH000001 <- SH000001[nrow(SH000001):1, ]
rownames(SH000001) <- 1:nrow(SH000001)
GetSymbols.netease("0000300", dfname="SH000300")
SH000300 <- SH000300[nrow(SH000300):1, ]
rownames(SH000300) <- 1:nrow(SH000300)
GetSymbols.netease("1399001", dfname="SZ399001")
SZ399001<- SZ399001[nrow(SZ399001):1, ]
rownames(SZ399001) <- 1:nrow(SZ399001)

spec <- ugarchspec(variance.model: list(model = "sGARCH", 
                                         garchOrder: c(1, 1), 
                                         submodel: NULL, 
                                         external.regressors: NULL, 
                                         variance.targeting: FALSE), 

                   mean.model    : list(armaOrder = c(1, 1), 
                                         external.regressors: NULL),
                   distribution.model: "std",
                   start.pars: list(),
                   fixed.pars: list())

garchssec <- ugarchfit(spec, tail(SH000001$PCHG/100, 3000))
garchhs300 <- ugarchfit(spec, tail(SH000300$PCHG/100, 3000))
garchszec <- ugarchfit(spec, tail(SZ399001$PCHG/100, 3000))

plotdev <- "png"

if (plotdev=="X11") {
  X11()
} else if (plotdev=="png") {
  png("garchvol_cn.png", height=768, width=1366)
}

datex <- as.Date(tail(SH000001$DATE, 3000), "%Y-%m-%d")

plot(datex, garchssec@fit$sigma, type="l", col="black", lwd=2,
     xlab="日期", ylab="GARCH波动率", main="中国主要股指GARCH波动率")
rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4],
     col="aliceblue")
grid()

lines(datex, garchssec@fit$sigma, type="l", col="black", lwd=1)
lines(datex, garchhs300@fit$sigma, type="l", col="blue", lwd=1)
lines(datex, garchszec@fit$sigma, type="l", col="red", lwd=1)
legend("topleft", legend=c("上证指数", "沪深300", "深证成指"),
       lwd=c(2, 2, 2),
       col=c("black", "blue", "red"))

par(new=TRUE)
if (plotdev=="X11") {
} else {
  dev.off()
}
```