---
title: 15 随机森林
summary: >
  第 587-604 页。

date: 2022-05-30T17:06:00+08:00
lastmod: 2022-06-14T11:20:00+08:00

weight: 1501

---

自助聚合（bagging，bootstrap aggregation，[第 8.7 节]({{< relref "../ch08/ch08_07.md" >}})）是一个降低估计预测函数的方差的方法。自助聚合应用在方差大而偏差小的方法上效果非常好，比如数模型。在回归问题中，我们只需要在训练集的自助抽样样本（bootstramp sample）上多次拟合同一个回归树模型，然后对结果取平均。在分类问题中，我们则通过一组树模型的一人一票的投票结果来决定预测的类别。

[第十章]({{< relref "../ch10/_index.md" >}}) 中的提升方法在最初被提出时也是一个委员会方法（committee method），但与自助聚合不同的是组成它的弱学习器会逐渐进化，而且它们采取的是带权重的投票。提升方法在很多问题上优于自助聚合，所以变成了首选的方法。

随机森林（Breiman, 2001）是对自助聚合的一个重要的改进，它构建了一大组不相关的数模型，然后对它们取平均。在很多问题中随机森林的效果与提升方法相似，而且随机森林更容易训练和调参。随机森林也因此被普遍使用，在很多软件中都有实现。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 15.1：[第 15.2 节]({{< relref "../ch15/ch15_02.md#练习-151" >}})
- 练习 15.2：[第 15.3 节]({{< relref "../ch15/ch15_03.md#练习-152" >}})
- 练习 15.3：[第 15.3 节]({{< relref "../ch15/ch15_03.md#练习-153" >}})
- 练习 15.4：[第 15.2 节]({{< relref "../ch15/ch15_02.md#练习-154" >}})
- 练习 15.5：[第 15.4 节]({{< relref "../ch15/ch15_04.md#练习-155" >}})
- 练习 15.6
- 练习 15.7：[第 15.3 节]({{< relref "../ch15/ch15_03.md#练习-157" >}})

----------

### 参考文献

Random forests as described here were introduced by Breiman (2001),
although many of the ideas had cropped up earlier in the literature in
different forms. Notably Ho (1995) introduced the term “random forest,” and
used a consensus of trees grown in random subspaces of the features. The
idea of using stochastic perturbation and averaging to avoid overfitting was
introduced by Kleinberg (1990), and later in Kleinberg (1996). Amit and
Geman (1997) used randomized trees grown on image features for image
classification problems. Breiman (1996a) introduced bagging, a precursor
to his version of random forests. Dietterich (2000b) also proposed an
improvement on bagging using additional randomization. His approach was
to rank the top 20 candidate splits at each node, and then select from the
list at random. He showed through simulations and real examples that this
additional randomization improved over the performance of bagging.
Friedman and Hall (2007) showed that sub-sampling (without replacement) is
an effective alternative to bagging. They showed that growing and
averaging trees on samples of size N/2 is approximately equivalent (in terms
bias/variance considerations) to bagging, while using smaller fractions of
N reduces the variance even further (through decorrelation).

There are several free software implementations of random forests. In
this chapter we used the randomForest package in R, maintained by Andy
Liaw, available from the CRAN website. This allows both split-variable
selection, as well as sub-sampling. Adele Cutler maintains a random forest
website http://www.math.usu.edu/∼adele/forests/ where (as of
August 2008) the software written by Leo Breiman and Adele Cutler is freely
available. Their code, and the name “random forests”, is exclusively
licensed to Salford Systems for commercial release. The Weka machine learn-
ing archive http://www.cs.waikato.ac.nz/ml/weka/ at Waikato University,
New Zealand, offers a free java implementation of random forests.