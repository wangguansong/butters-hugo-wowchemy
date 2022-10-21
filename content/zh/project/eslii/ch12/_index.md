---
title: 12 支持向量机和灵活判别
summary: >
  第 417-458 页。

date: 2022-04-22T15:30:00+08:00
lastmod: 2022-06-14T14:50:00+08:00

weight: 1201

---

本章介绍对分类问题中线性决策边界的推广。

[第四章]({{< relref "../ch04/_index.md" >}})介绍了在两个类别线性可分（linearly separable）的场景下的最优分离超平面（optimal separating hyperplane）。我们会拓展到不可分的情况下，即两个类别存在重叠。然后将这些方法一般化，就得到了支持向量机（support vector machine）。它在特征空间经过转化处理后的一个高维空间上构建线性边界，从而生成了（原空间上的）非线性边界。

另外一些方法推广了费雪（Fisher）的线性判别分析（LDA）。这些推广方法包括：
- 灵活判别分析（flexible discriminant analysis），其构建非线性边界的方式与支持向量机很相似；
- 惩罚判别分析（penalized discriminant analysis），适用于存在大量高度相关特征变量的信号和图片分类；
- 混合判别分析（mixture discriminant analysis），适用于不规则形状类别的分类。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 12.1：[第 12.3 节]({{< relref "../ch12/ch12_03.md#练习-121" >}})
- 练习 12.2：[第 12.3 节]({{< relref "../ch12/ch12_03.md#练习-122" >}})
- 练习 12.3：[第 12.3 节]({{< relref "../ch12/ch12_03.md#练习-123" >}})
- 练习 12.4：
- 练习 12.5：
- 练习 12.6：[第 12.5 节]({{< relref "../ch12/ch12_05.md#练习-126" >}})
- 练习 12.7：[第 12.6 节]({{< relref "../ch12/ch12_06.md#练习-127" >}})
- 练习 12.8：[第 12.6 节]({{< relref "../ch12/ch12_06.md#练习-128" >}})
- 练习 12.9：[第 12.5 节]({{< relref "../ch12/ch12_05.md#练习-129" >}})
- 练习 12.10：[第 12.3 节]({{< relref "../ch12/ch12_03.md#练习-1210" >}})
- 练习 12.11：

----------

### 参考文献

The theory behind support vector machines is due to Vapnik and is de-
scribed in Vapnik (1996). There is a burgeoning literature on SVMs; an
online bibliography, created and maintained by Alex Smola and Bernhard
Schölkopf, can be found at:

http://www.kernel-machines.org .

Our treatment is based on Wahba et al. (2000) and Evgeniou et al. (2000),
and the tutorial by Burges (Burges, 1998).

Linear discriminant analysis is due to Fisher (1936) and Rao (1973). The
connection with optimal scoring dates back at least to Breiman and Ihaka
(1984), and in a simple form to Fisher (1936). There are strong connections
with correspondence analysis (Greenacre, 1984). The description of flexible,
penalized and mixture discriminant analysis is taken from Hastie et al.
(1994), Hastie et al. (1995) and Hastie and Tibshirani (1996b), and all
three are summarized in Hastie et al. (2000); see also Ripley (1996).