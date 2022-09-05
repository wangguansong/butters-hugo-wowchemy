---
date: 2016-04-11
lastmod: 2016-11-27
draft: false
tags: ["2016", "GARCH", "R", "计量经济学", "译文"]
title: "GARCH模型的实用介绍（译）"
summary: >
  关于波动率聚类以及GARCH(1,1)模型。翻译原文 [A practical introduction to garch modeling](http://www.portfolioprobe.com/2012/07/06/a-practical-introduction-to-garch-modeling/)。
---

## 波动率聚类

波动率聚类看起来是市场数据一个普遍的特征，体现为市场存在相对比较平静的时期和波动很大的时期。对此现象并没有人们一致接受的的解释。GARCH （广义自回归条件异方差，Generalized AutoRegressive Conditional Heteroskedasticity）对此建模，但并没有解释其原因。图一是波动率 GARCH 模型的一个例子。

{{< figure src="/img/2016/20160411_spxvoldecades.png"
    title="S&P 500波动率，GARCH(1,1)模型估计"
    link="/img/2016/20160411_spxvoldecades.png" >}}
 
波动率明显随时间而变化。图一只是波动率的模型，而不是真实的波动率。但如果为真实的波动率的时间曲线会和图一非常相似。

## 所需数据

GARCH 模型最适合使用每日数据。当然也可以使用周度/月度数据，但是在会把一些 GARCH 特征在合成数据中丢失。

GARCH 也可以使用日间数据，但是操作很复杂。在每日中，波动率有周期性。而周期性取决于具体的交易市场，也可能取决于具体的某个资产。一个关于此的例子考察了日间的 VaR。

另外，应该给 GARCH 模型提供多少每日数据？某种程度上，回答是“多多益善”。以下是原因。

图一并不是真实的波动率，因为我们无法观测到波动率。波动率从来只是间接地显示出来。所以我们是在估计一个我们永远无法观测到的值。

{{< figure src="/img/2016/20160411_garchsketch1.png"
    title="去掉噪声的GARCH模型原型"
    link="/img/2016/20160411_garchsketch1.png" >}}
 
GARCH 认为波动率突然出现峰值，然后缓慢下降，直到下一个峰值的出现。在图一中无法看出这种表现因为图一的曲线被压缩很多，在图三中这种模式更加明显。

{{< figure src="/img/2016/20160411_garMMM.png"
    title="MMM股票的波动率，GARCH(1,1)模型估计"
    link="/img/2016/20160411_garMMM.png" >}}
 
当然，在真实数据中存在各种大小的冲击，并不是只有大的冲击。

另外，来自于消息发布的波动率（对比于以外冲击）与此不同：波动率随着发布时间临近而慢慢攀升，然后在发布结束之后消失。

GARCH 模型的估计主要是在估计波动率消失的速率。而模型所观察到的波动率衰退中有很多噪声，所以它需要很多数据。在此处很多数据意味着以万记的每日数据。

同时，以下两个原因又建议不要采取上万的数据：

- 并没有那么多的数据
- 市场随着时间在变化

所以折衷而言，2000 个每日数据大概并不会太离谱。

如果只有不到 1000 个每日数据，那么估计的结果不太可能给出关于模型参数的太多真实信息。最好只是手选一个“差不多合理”的模型，即其持续性大致符合数据，alpha1 参数在 0 到 0.1 之间，beta1 参数在 0.9 到 1 之间。

## 估计方法

我们现考虑 GARCH(1,1) 模型。并不是因为它是最好的（它显然不是），因为它是最普遍可得的，普遍使用的，而且在多数情况下足够好。

GARCH 模型几乎总是用最大似然估计。这是个比较困难的求最优问题，同时也是为什么要尽量获得更多数据的原因。假设有足够多的数据来保证最优问题可以求解，即使最好的 GARCH 模型实现，在似然函数最优解上也让人不忍直视。

我们知道回报率不是正态分布，它们有厚尾（long tails）。然而可以完全合理地提出假设，厚尾完全是由 GARCH 现象所造成的，那么在 GARCH 模型中使用正态分布是正合适的。 但在似然函数中用厚尾的分布几乎总会得到一个更好地 GARCH 估计。用 t 分布就会得到很好的结果。

## 自相关

如果模型正确解释了波动率聚类的现象，那么平方后的标准化误差就不会存在自相关。通常用 Ljung-Box 检验测试自相关。

以下是 MMM 回报率（假设正态分布）估计后的测试结果（实际上是 Box-Pierce 检验）：

```
    Q-Statistics on Standardized Squared Residuals
    ------------------------------------
          statistic p-value
    Lag10     2.973  0.9821
    Lag15     5.333  0.9889
    Lag20     6.532  0.9980
```
    
仔细阅读结果中的 p值，很异常。p值十分诡异地接近于 1。这个结果说明，我们用 4 个参数过度拟合了 1547 个数据。而这是 1547 个非常多干扰的数据，并不太可能过度拟合。

一个更好地解释是这个检测对此类数据并不稳健，虽然这个检测本身是非常稳健的。此种对误差平方的检测大概是无效的。检测标准化误差平方的 ranks 会是更好的检测。

## 稳定性

GARCH 模型的稳定性是关于冲击过后大波动率消失的速度。对 GARCH(1,1) 模型，主要统计量是两个参数之和（alpha1 和 beta1）。

参数 alpha1 和 beta1 之和应该小于1。如果和大于1，那么预测的波动率会爆炸地增长，并不太可信。如果和小于1，我们得到指数衰减模型。

可以用半衰期表达稳定性。半衰期为`log(0.5) / log(alpha1 + beta1)`，单位是回报率的频率（比如每日回报率频率为天）。当 alpha1 和 beta1 的和为 1 时，半衰期为永恒。

为什么会得到估计结果导致永恒的半衰期？持续性是由数据样本中的衰退速度估计来的。如果在样本期间存在这一个波动率的趋势，估计量会“认为”它永远不会看到波动率的衰退。样本期间越短，越可能存在一个趋势迷惑了估计方法。

样本内的波动率估计在不同的参数估计下会大体相同。即使我们改变对应模型的参数估计，图一和图三并不会有太多变化。但是参数对于样本外的预测却十分重要。

## 用处

GARCH模型主要两个用处：

- 可以用来预测
- 可以用来模拟

## 预测

要预测的时间离现在越远，对模型近乎完美的要求越高。GARCH 模型根本算不上完美。如果你要预测一个月或更久之后，那么 GARCH 模型对你的帮助不会大于找几个骰子。如果你要预测几天之后，GARCH 会有一些用处。

模型的持续性是预测的关键核心：它决定了预测值以多快的速度回到平静时期的波动率。如果波动率真的有很强的持续性而模型准确的估计出了持续性，那么预测更远时期也会得到很好的结果。

可以预测的两个变量：

- 在预测期间每个时间点的波动率
- 从一个时期起始到这个时期各个点的平均波动率（被称为期限结构，term structure）
例如，影响期权价格的波动率是现在到除权日的平均波动率，而不是除权日当日波动率。

所以在预测是要了解两点：

- 想要预测什么
- 预测到了什么

## 模拟

GARCH 模型模拟需要：

- GARCH 模型（包括参数值）
- 模型波动率的状态
- 标准化（方差为1）的随机数值

多数情况下，模型波动率的状态是在数据样本结尾的状态，即现在。我们想要用当前波动率的状态，模拟未来的走势。

利用实证中的分布，即模型拟合后的标准误差，常常是随机数值最好的选择。模型拟合中假设的分布，也会对影响模拟后的标准误差。

估计过程“试图”让误差项和假设的分布统一。使用同样的样本，假设正态分布的模型产生的标准化误差，会比假设t分布的模型产生的标准化误差，更接近于正态分布。

模拟依赖于估计的参数，但并没有预测值那样大的依赖。模型的误差在模拟较远的未来中不断的合成，但在预测较远的未来时的合成却是恶意满满。

## R扩展包

在 R 中的 GARCH 模型有很多选择。其中没有最好的一个，根据你想要实现的目的选择合适的。对于大多数来说，rugarch 大概是不错的选择。

我（原作者）并没有大量使用任何这些扩展包，所以评论仅供参考。

### rugarch

此包把模型的设定作为独立的对象。有拟合（估计参数），预测和模拟的函数。

以一个t分布的拟合为例：
```
    > gspec.ru <- ugarchspec(mean.model=list(
          armaOrder=c(0,0)), distribution="std")
    > gfit.ru <- ugarchfit(gspec.ru, sp5.ret[,1])
    > coef(gfit.ru)
              mu        omega       alpha1        beta1        shape 
    7.300187e-04 2.266325e-06 6.911640e-02 9.272781e-01 4.194994e+00 
    > # plot in-sample volatility estimates
    > plot(sqrt(252) * gfit.ru@fit$sigma, type='l')
```
在我（原作者）讨论的扩展包中，这个包中的求最优大概是最成熟和可信的。

### fGarch

fGarch是Rmetrics套件的一部分。

和上面一样的t分布的拟合：
```
    > gfit.fg <- garchFit(data=sp5.ret[,1], cond.dist="std")
    > coef(gfit.fg)
              mu        omega       alpha1        beta1        shape 
    7.263209e-04 2.290834e-06 6.901898e-02 9.271553e-01 4.204087e+00
    > # plot in-sample volatility estimates
    > plot(sqrt(252) * gfit.fg@sigma.t, type="l")
```    

### tseries

这个包大概是最先公开包含GARCH函数的R扩展包。它限制与正态分布。
```
    > gfit.ts <- garch(sp5.ret[,1])
    > coef(gfit.ts)
              a0           a1           b1 
    6.727470e-06 5.588495e-02 9.153086e-01 
    > # plot in-sample volatility estimates
    > plot(sqrt(252) * gfit.ts$fitted.values[, 1], type="l")
```

### bayesGARCH

我（原作者）认为在GARCH模型中使用贝叶斯估计是非常自然的做法。我们对参数的可能取值有一些相对具体的了解。

这个包中唯一的模型是假设t分布的GARCH(1,1)。
```R
    > gbayes <- bayesGARCH(sp5.ret[,1])
```    
但这个命令出错。把回报率用百分数表示后这个命令可以运行。
```R
    > gbayes <- bayesGARCH(sp5.ret[,1] * 100)
```    
这可能也是有关最大似然估计的问题。总是有至少一个GARCH设定，在用百分率表达回报率时的结果会大大好于用其他单位表达的结果。你可以改变回报率的单位然后比较求最优结果。

bayesGARCH函数没有给出估计结果。它得到一个矩阵，每一列对应一个参数，每一行对应一个马尔科夫蒙特卡洛访问数（visits）。或者说，这是一个参数的后验分布。

如果对持续性进行限制，我们会得到一个更有用的分析结果。为此我们建立一个限制函数：
```R
    > persistenceCons
    function(psi)
        {
          psi[2] + psi[3] < .9986
        }
```    
即，半衰期要小于两年。然后使用这个限制函数：
```R
    > gbayesCons <- bayesGARCH(sp5.ret[,1] * 100, 
        control=list(addPriorConditions=persistenceCons))
```    
根据得到的参数分布，计算半衰期的分布：
```R
    > gbayesChain <- gbayesCons$chain1[-1:-2500,][c(TRUE,FALSE),]
    > gbayesHalflife <- log(.5)/log(rowSums(gbayesChain[, 
        c("alpha1", "beta")]))
```     
结果如图。

{{< figure src="/img/2016/20160411_bayesgarchpersist.png"
    title="MMM股票的波动率半衰期的贝叶斯估计"
    link="/img/2016/20160411_bayesgarchpersist.png" >}}
 
### betategarch

这个包用EGARCH模型和t分布。EGARCH是一个很聪明的模型，使一些事情很容易，也使另一些事情很复杂。
```R
    > gest.te <- tegarch.est(sp5.ret[,1])
    > gest.te$par
          delta        phi1      kappa1  kappa1star          df 
    -0.05879721  0.98714860  0.03798604  0.02487405  4.50367108 
    > gfit.te <- tegarch.fit(sp5.ret[,1], gest.te$par)
    > pp.timeplot(sqrt(252) * gfit.te[, "sigma"] * 
        sd(gfit.te[,"epsilon"]))
```    

（以下不明，未翻译）

That the plotting function is pp.timeplot is an indication that the names of the input returns are available on the output — unlike the output in the other packages up to here. Figure 4 compares this estimate with a garch(1,1) estimate (from rugarch but they all look very similar).

{{< figure src="/img/2016/20160411_garMMMbetate.png"
    title="MMM股票的波动率，GARCH(1,1)模型估计（蓝色）和beta-t EGARCH模型估计（金色）"
    link="/img/2016/20160411_garMMMbetate.png" >}}

 
### dynamo

我（原作者）理解的这个包的应用：
```R
    gfit.dm <- dm(sp5.ret[,1] ~ garch(1,1))
```    
但这条命令会出错并终结R过程

### AutoSEARCH

这个包会自动选择（某种意义上的）最优ARCH模型设定（p）。在学术上有意义，但我（原作者）对它在实践中的应用怀疑。

### rgarch

这个包被淘汰：它的后来者为rugarch和rmgarch。