---
title: 10 提升方法
summary: >
  第 337-388 页。提升方法在迭代过程中不断地调整样本的权重，提高拟合差的样本对基模型的影响力，再将所得到的一系列基模型的加权投票作为最终结果。本节以自适应提升为例演示了提升方法的效果。

date: 2019-01-17T20:40:00+08:00
lastmod: 2022-06-14T14:36:00+08:00
draft: false
math: true

type: book
weight: 1001

authors: ["Butters"]
tags: ["译文"]
categories: ["统计学习基础（译注）"]

---

**提升方法（boosting method）**[^1] 是近二十年提出的最有影响的统计学习概念之一。此方法原本为分类问题而设计，但也可以应用在回归问题中，本章会加以说明。提升方法的思路是将很多能力“弱”的分类器的结果结合在一起，形成一个强大的“委员会”（committee）。从这个角度看，提升方法与自助聚合（bagging）以及其他“委员会”类型的方法（[第 8.8 节]({{< relref "../ch08/ch08_08.md" >}})）有相似之处。然而两者之间的联系最多只是表面上的，提升方法在本质上是不同的。

我们先介绍最流行的提升算法，由 Freund and Schapire (1997) 提出的“**自适应提升 M1**”[^2]（adaboost, adaptive boost）。考虑一个二分类问题，输出变量采用编码 $Y\in\\{-1,1\\}$。给定一个自变量向量 $X$，一个分类器 $G(X)$ 会给出一个取值在 $\\{-1,1\\}$ 中的预测。在训练样本上的错误率为

$$\overline{\text{err}} =
\frac{1}{N} \sum_{i=1}^{N} I(y_i \neq G(x_i))$$

对未来预测（总体样本）的期望错误率为 $\operatorname{E}_{XY}[I(Y \neq G(X))]$。

一个弱分类器是错误率可能只稍好于随机猜测的模型。提升方法则将这个弱分类算法连续重复地应用于调整后的样本数据上，从而产生一个弱分类器的序列 $G_m(x),m=1,2,\cdots,M$。再将它们输出的预测按某种权重进行投票汇总，根据投票的结果产生最终的预测：

$$G(x)=\operatorname{sign}\left(\sum_{m=1}^M\alpha_m G_m(x)\right)\tag{10.1}$$

其中的 $\alpha_1,\alpha_2,\cdots,\alpha_M$ 从提升算法的过程中得出，并被用作每个相应的分类器 $G\_m(x)$ 在投票中的权重。它们的作用是在最终投票中，给予序列中更准确的分类器更高的权重。[图10.1](#figure-f1001) 展示了自适应提升的示意图。

{{< figure
  id="f1001"
  src="https://public.guansong.wang/eslii/ch10/eslii_fig_10_01.png"
  title="**图 10.1**：自适应提升的示意图。每一步迭代，在被权重调整过的数据集上训练分类器，然后将这一系列分类器结合在一起得出最终的预测。"
>}}

在提升的每一步，为训练样本 $(x_i,y_i),i=1,2,\cdots,N$ 赋予权重 $w_1,w_2,\cdots,w_N$。初始化的权重为 $w_i=1/N$，所以第一步简单地相当于在训练样本上按通常的方式应用弱分类器。后续迭代的每一步 $m=2,3,\cdots,M$，会调整每一个样本的权重，并将分类算法应用于权重调整后的样本上。在第 $m$ 步，上一步中分类器 $G_{m-1}(x)$ 误分类的样本会被赋予更高的权重，而正确分类的样本会被赋予更低的权重。因此随着不断地迭代，难以分类的样本的影响力会不断地增加。因此过程中的每个分类器都会着重于被之前模型误分类的那部分训练样本。

----------
#### 算法 10.1：自适应提升 M1
1. 初始化样本权重为 $w_i=1/N,i=1,2,\cdots,N$.
2. 对每个迭代步骤 $m=1$ 到 $M$：
   1. 在用权重 $w_i$ 调整过的训练样本上，训练分类器 $G_m(x)$。
   2. 计算加权错误率
      $$\text{err}\_m = \frac{\sum_{i=1}^N w_i I(y_i \neq G_m(x_i))}{\sum_{i=1}^N w_i}$$
   3. 计算投票权重 $\alpha_m = \log((1-\text{err}\_m)/\text{err}\_m)$
   4. 对每个样本 $i$ 更新权重为 $w_i \leftarrow w_i \cdot \exp[\alpha_m \cdot I(y_i \neq G_m(x_i ))],i=1,2,\cdots,N$.
3. 输出预测结果 $G(x)=\operatorname{sign}\left[\sum_{i=1}^N \alpha_m G_m(x)\right]$

----------

算法 10.1 详细说明了自适应提升 M1 算法。步骤 2.1 在加权的样本上训练当前的分类器 $G_m(x)$。步骤 2.2 计算所得的加权错误率。步骤 2.3 计算分类器 $G_m(x)$ 在最终的分类结果 $G(x)$ 中（第 3 行）所占的权重 $\alpha_m$。步骤 2.4 更新下一步迭代的每个样本权重。$G_m(x)$ 误分类的样本的权重会放大到 $exp(\alpha_m)$ 倍，相对地增加了它们对迭代下一步中的分类器 $G_{m+1}(x)$ 的影响力。

因为基分类器的输出为离散的类别标签，Friedman et al. (2000) 将自适应提升 M1 算法称为“离散自适应提升”。如果基分类器返回的是一个实数值的预测（例如将一个概率预测值映射到 $[-1,1]$ 区间上），自适应提升经过相应调整后也可适用。（参考 Friedman et al. (2000) 中的“连续自适应提升”）。

{{< figure
  id="f1002"
  src="https://public.guansong.wang/eslii/ch10/eslii_fig_10_02.png"
  title="**图 10.2**：模拟数据（等式10.2）：基于决策树桩模型提升方法的测试错误率，横轴为提升的迭代次数。同时也展示了单个树桩模型和 244 个节点的分类决策树的错误率。"
>}}

[图 10.2](#figure-f1002) 演示了通过适应性提升极大地提高了一个很弱的分类器的表现。特征变量 $X_1,\dots,X_{10}$ 服从独立的标准高斯分布（正态分布），真实的目标变量定义如下：

$$Y=\begin{cases}
1 & \text{当}\sum_{j=1}^{10} X_j^2 > \chi_{10}^2(0.5)\\\\
-1 & \text{其它}
\end{cases}\tag{10.2}$$

其中的 $\chi^2_{10}(0.5) = 9.34$ 为自由度 10 的卡方分布（10 个标准高斯分布的平方和）的中位数。训练样本大小为 2000，其中每个类别大约有 1000 个；测试样本大小为 10,000。这里使用的弱分类器是一个“树桩”模型：只有两个终节点的分类树。在训练样本上训练这个简单的分类器，其在测试集上错误率为 45.8%，对比随机猜测 50% 的错误率，可以说这是一个比较差的表现。然而，随着提升迭代次数的增加，错误率稳步地下降，在 400 次迭代后降到了 5.8%。可见，基于这个非常简单的弱分类器的提升方法，将预测错误率降低到近乎原来的八分之一[^3]。它的表现也优于一个大的分类决策树（错误率 24.7%）。自这个方法出现后，有很多解释自适应提升得出准确分类器的能力的文献。其中大部分都以分类决策树作为基模型 $G(x)$，带来的效果改善也常常十分显著。Breiman (NIPS Workshop, 1996) 称基于决策树的自适应提升为“世界上最好的现成可用的分类器”（另见 Breiman (1998)）。在数据挖掘的领域中尤其如此，本章[第 10.7 节]({{< relref "../ch10/ch10_07.md" >}})会更详细地讨论。

### 10.1.1 本章内容概要

以下为本章的内容概要：

* 自适应提升可以看作是拟合了基学习器的一个加性模型，对一个独特的指数损失函数进行最优化。这个损失函数与（负）二项分布的对数似然函数很相似（第 10.2-10.4 节）。
* 指数损失函数的样本总体最小值点，是分类概率的对数几率（[第 10.5 节]({{< relref "../ch10/ch10_05.md" >}})）。
* 在分类和回归问题中，可以选择比平方误差和指数损失函数更稳健的损失函数（[第 10.6 节]({{< relref "../ch10/ch10_06.md" >}})）。
* 在数据挖掘的提升方法应用中，决策树被认为是理想的基学习器（第 10.7 和 10.9 节）。
* 梯度提升模型（GBM）可基于任意的损失函数对树模型提升（[第 10.10 节]({{< relref "../ch10/ch10_10.md" >}})）。
* 强调了“慢速学习”的重要性，通过对新进入模型的每一项进行收缩（shrinkage）（[第 10.12 节]({{< relref "../ch10/ch10_12.md" >}})）以及随机采样（[第 10.12.2 节]({{< relref "../ch10/ch10_12.md" >}})）来实现。
* 介绍了用于理解拟合模型的工具（[第 10.13 节]({{< relref "../ch10/ch10_13.md" >}})）。

{{< list_children >}}

----------
### 本章练习

----------
### 参考文献
Schapire (1990) developed the first simple boosting procedure in the PAC
learning framework (Valiant, 1984; Kearns and Vazirani, 1994). Schapire
showed that a weak learner could always improve its performance by training
two additional classifiers on filtered versions of the input data stream.
A weak learner is an algorithm for producing a two-class classifier with
performance guaranteed (with high probability) to be significantly better
than a coin-flip. After learning an initial classifier G 1 on the first N training
points,
* $G_2$ is learned on a new sample of N points, half of which are misclassified
by G 1 ;
* $G_3$ is learned on N points for which $G_1$ and $G_2$ disagree;
* the boosted classifier is $G_B = \text{majority vote}(G_1,G_2,G_3)$.
Schapire’s “Strength of Weak Learnability” theorem proves that G B has
improved performance over $G_1$.

Freund (1995) proposed a “boost by majority” variation which combined
many weak learners simultaneously and improved the performance of the
simple boosting algorithm of Schapire. The theory supporting both of these
algorithms requires the weak learner to produce a classifier with a fixed
error rate. This led to the more adaptive and realistic AdaBoost (Freund
and Schapire, 1996a) and its offspring, where this assumption was dropped.

Freund and Schapire (1996a) and Schapire and Singer (1999) provide
some theory to support their algorithms, in the form of upper bounds on
generalization error. This theory has evolved in the computational learning
community, initially based on the concepts of PAC learning. Other
theories attempting to explain boosting come from game theory (Freund and
Schapire, 1996b; Breiman, 1999; Breiman, 1998), and VC theory (Schapire
et al., 1998). The bounds and the theory associated with the AdaBoost
algorithms are interesting, but tend to be too loose to be of practical
importance. In practice, boosting achieves results far more impressive than
the bounds would imply. Schapire (2002) and Meir and Rätsch (2003) give
useful overviews more recent than the first edition of this book.

Friedman et al. (2000) and Friedman (2001) form the basis for our exposition
in this chapter. Friedman et al. (2000) analyze AdaBoost statistically,
derive the exponential criterion, and show that it estimates the log-odds
of the class probability. They propose additive tree models, the right-sized
trees and ANOVA representation of Section 10.11, and the multiclass logit
formulation. Friedman (2001) developed gradient boosting and shrinkage
for classification and regression, while Friedman (1999) explored stochastic
variants of boosting. Mason et al. (2000) also embraced a gradient approach
to boosting. As the published discussions of Friedman et al. (2000) shows,
there is some controversy about how and why boosting works.

Since the publication of the first edition of this book, these debates have
continued, and spread into the statistical community with a series of papers
on consistency of boosting (Jiang, 2004; Lugosi and Vayatis, 2004; Zhang
and Yu, 2005; Bartlett and Traskin, 2007). Mease and Wyner (2008),
through a series of simulation examples, challenge some of our
interpretations of boosting; our response (Friedman et al., 2008a) puts most of
these objections to rest. A recent survey by Bühlmann and Hothorn (2007)
supports our approach to boosting.

[^1]: 参考了[中文维基](https://zh.wikipedia.org/wiki/%E6%8F%90%E5%8D%87%E6%96%B9%E6%B3%95)中的术语。
[^2]: 参考了[中文维基](https://zh.wikipedia.org/wiki/AdaBoost)中的术语。
[^3]: 原文为“Thus, boosting this ... classifier reduces its prediction error rate by almost a factor of four”。译者认为预测误差从 45.8% 降低到 5.8% 应该是“reduced by almost a factor of eight”。
