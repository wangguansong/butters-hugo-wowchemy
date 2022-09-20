---
title: 16 集成学习
summary: >
  第 605-624 页。

date: 2022-06-01T11:27:00+08:00
lastmod: 2022-06-16T17:41:00+08:00

weight: 1601

---

集成学习的思想是通过一些简单基模型（base model）的能力的组合来构建一个预测模型。我们已经讨论过的许多模型都可以归类于此。

[第 8.7 节]({{< relref "../ch08/ch08_07.md" >}})的自助聚合和[第十五章]({{< relref "../ch15/_index.md" >}})的随机森林都是分类问题中的集成方法，其中树模型的**委员会**中的每个模型为类别的预测进行投票。[第十章]({{< relref "../ch10/_index.md" >}})的提升方法在开始被提出的时候也是作为一个委员会方法，不过与随机森林不同的是弱学习器的委员会可以逐渐进化，而且其成员的投票是加权的。堆叠（stacking，[第 8.8 节]({{< relref "../ch08/ch08_08.md" >}})）是组合一些拟合模型的一种新方法。实际上，任意的字典方法（dictionary method），例如回归样条，都可以被看作是一个集成方法，其中的基函数就起到了弱学习器的作用。

非参数回归的贝叶斯方法也可被理解为集成方法：根据参数设定结构的后验概率分布，对很多备选模型进行平均（参考 Neal and Zhang, 2006）。

可以将集成学习分解成两个步骤：从训练集中开发出一群基学习器，然后将它们组合起来形成一个复合（composite）预测函数本章将进一步地讨论提升方法；它通过在弱学习器的高维度空间上进行正则化和有监督的搜索，来构建一个集成模型。

集成学习的一个早期案例是为多类别的分类而设计的一个方法，它使用了纠错输出编码（error-correcting output codes，ECOC，(Dietterich and Bakiri, 1995)）。在 10 个类别的数字识别分类问题中，表 16.1 为编码矩阵 $\mathbf{C}$。

| Digit | $C_1$ | $C_2$ | $C_3$ | $C_4$ | $C_5$ | $C_6$ | $\dots$ | $C_{15}$ |
|-------|-------|-------|-------|-------|-------|-------|---------|----------|
| 0 | 1 | 1 | 0 | 0 | 0 | 0 | $\dots$ | 1 |
| 1 | 0 | 0 | 1 | 1 | 1 | 1 | $\dots$ | 0 |
| 2 | 1 | 0 | 0 | 1 | 0 | 0 | $\dots$ | 1 |
| $\vdots$ | $\vdots$ | $\vdots$ | $\vdots$ | $\vdots$ | $\vdots$ | $\vdots$ | $\dots$ | $\vdots$ |
| 8 | 1 | 1 | 0 | 1 | 0 | 1 | $\dots$ | 1 |
| 9 | 0 | 1 | 1 | 1 | 0 | 0 | $\dots$ | 0 |

**表 16.1**：10 类别的数字分类问题的 15 位纠错编码矩阵 $\mathbf{C}$ 的一部分。每一列定义了一个二分类问题。

注意到编码矩阵的第 $\ell$ 列向量 $C_\ell$ 将原始类别合并成了两个类别，从而定义了一个二分类问题。这个方法的具体步骤如下：
1. 为编码矩阵的列所定义的 $L=15$ 个二分类问题各自训练一个分类器。
2. 在一个目标测试点 $x$ 处，令 $\hat{p}_\ell(x)$ 为它的第 $l$ 个输出结果为一的预测概率。
3. 将第 $k$ 个类别的判别函数定义为 $\delta_k(x)=\sum\_{\ell=1}^L |C\_{k\ell}-\hat{p}\_\ell(x)|$，其中的 $C\_{k\ell}$ 为表 16.1 中矩阵第 $k$ 行第 $\ell$ 列的元素。

矩阵 $\mathbf{C}$ 的每一行是对应类别的一个二进制编码。每行中的位数大于（识别原始类别）必要的位数，其原因是多余的“纠错”位可以允许一定的误差，从而可以改进效果。事实上，上面完整的编码矩阵 $\mathbf{C}$ 每两行之间的最小汉明（Hamming）距离为 7。然而即使指示输出编码（[第 4.2 节]({{< relref "../ch04/ch04_02.md" >}})）也是存在冗余的，因为实现 10 个类别的唯一表达只需要 $\lceil \log_2 10\rceil=4$ 位。Dietterich and Bakiri (1995) 在许多多类别问题中使用了分类树模型作为基分类器后得到了巨大的改进。

James and Hastie (1998) 分析了 ECOC 方法，并且证明了随机编码可以达到与构建的最佳纠错编码一样的效果。同时他们也认为编码的好处主要来自于方差缩减（与自助聚合和随机森林一样），因为不同编码的问题会产生不同的树模型，并且步骤三中的去编码（decoding）过程与取平均起到相似的作用。

----------
### 内容概览

----------
### 本章练习

----------
### 参考文献

As noted in the introduction, many of the new methods in machine learning
have been dubbed “ensemble” methods. These include neural networks
boosting, bagging and random forests; Dietterich (2000a) gives a survey of
tree-based ensemble methods. Neural networks (Chapter 11) are perhaps
more deserving of the name, since they simultaneously learn the parameters
of the hidden units (basis functions), along with how to combine them.
Bishop (2006) discusses neural networks in some detail, along with the
Bayesian perspective (MacKay, 1992; Neal, 1996). Support vector machines
(Chapter 12) can also be regarded as an ensemble method; they perform
L 2 regularized model fitting in high-dimensional feature spaces. Boosting
and lasso exploit sparsity through L 1 regularization to overcome the high-
dimensionality, while SVMs rely on the “kernel trick” characteristic of L 2
regularization.

C5.0 (Quinlan, 2004) is a commercial tree and rule generation package,
with some goals in common with Rulefit.

There is a vast and varied literature often referred to as “combining clas-
sifiers” which abounds in ad-hoc schemes for mixing methods of different
types to achieve better performance. For a principled approach, see Kittler
et al. (1998).

https://remonstrate.wordpress.com/2012/01/08/%e9%87%8d%e8%af%bb-esl%ef%bc%88%e5%85%ab%ef%bc%89/

[^1]: 原文脚注 1：两个向量之间的汉明距离（Hamming distance）为对应元素不相等的个数。