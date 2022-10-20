---
title: 8 模型的推断和平均
summary: >
  第 261-294 页。本章阐述了最大似然法和贝叶斯方法下的推断。

date: 2018-12-13T16:04:00+08:00
lastmod: 2022-06-14T11:07:00+08:00

weight: 801

---

在本书中大部分模型的拟合（学习），回归问题是通过最小化一个平方和目标函数，分类问题是通过最小化交叉熵。实际上这两个最小化都可以视为最大似然拟合方法的具体实例。

本章一般性地阐述了最大似然方法，和贝叶斯方法下的推断。在此背景下再引入第七章介绍的自助法，并描述其与最大似然和贝叶斯方法的联系。最后会介绍一些模型平均和改进的相关方法，包括委员会（committee）方法、自助聚合（bagging）、堆叠（stacking）和 bumping。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 8.1：[第 8.5 节]({{< relref "../ch08/ch08_05.md#练习-81" >}})
- 练习 8.2：[第 8.5 节]({{< relref "../ch08/ch08_05.md#练习-82" >}})
- 练习 8.3：[第 8.6 节]({{< relref "../ch08/ch08_06.md#练习-83" >}})
- 练习 8.4：[第 8.7 节]({{< relref "../ch08/ch08_07.md#练习-84" >}})
- 练习 8.5
- 练习 8.6
- 练习 8.7：[第 8.5 节]({{< relref "../ch08/ch08_05.md#练习-87" >}})

----------

### 参考文献

There are many books on classical statistical inference:
Cox and Hinkley (1974) and Silvey (1975) give nontechnical accounts.
The bootstrap is due to Efron (1979) and is described more fully in
Efron and Tibshirani (1993) and Hall (1992).
A good modern book on Bayesian inference is Gelman et al. (1995).
A lucid account of the application of Bayesian methods to neural networks
is given in Neal (1996).
The statistical application of Gibbs sampling is due to
Geman and Geman (1984), and Gelfand and Smith (1990),
with related work by Tanner and Wong (1987).
Markov chain Monte Carlo methods, including Gibbs sampling and
the Metropolis-Hastings algorithm, are discussed in Spiegelhalter et al. (1996).
The EM algorithm is due to Dempster et al. (1977); as the discussants in that
paper make clear, there was much related, earlier work. The view of EM as
a joint maximization scheme for a penalized complete-data log-likelihood
was elucidated by Neal and Hinton (1998); they credit Csiszar and Tusnády
(1984) and Hathaway (1986) as having noticed this connection earlier.
Bagging was proposed by Breiman (1996a). Stacking is due to Wolpert (1992);