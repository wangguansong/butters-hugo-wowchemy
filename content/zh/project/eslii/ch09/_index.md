---
title: 9 加性模型、树模型和相关方法
summary: >
  第 295-336 页。

date: 2018-12-28T10:12:00+08:00
lastmod: 2022-09-26T17:25:00+08:00
linktitle: 9 加性模型和树模型

weight: 900

---

本章开始讨论监督学习的一些特定方法。这些方法都会对未知的回归函数做出（不同的）结构形式上的假设，也以此来应对维数灾难。当然这也有可能带来模型误设（misspecification）的代价，所以在每个问题中都需要进行取舍。这些方法延续了第 3-6 章的内容。本章描述了五个相关方法：广义加性模型、树模型、多元自适应回归样条（MARS）、耐心规则归纳方法（PRIM）和层级混合专家（HME）。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 9.1：[第 9.1 节]({{< relref "../ch09/ch09_01.md#练习-91" >}})
- 练习 9.2：[第 9.1 节]({{< relref "../ch09/ch09_01.md#练习-92" >}})
- 练习 9.3：[第 9.1 节]({{< relref "../ch09/ch09_01.md#练习-93" >}})
- 练习 9.4：[第 9.1 节]({{< relref "../ch09/ch09_01.md#练习-94" >}})
- 练习 9.5：[第 9.2 节]({{< relref "../ch09/ch09_02.md#练习-95" >}})
- 练习 9.6：[第 9.4 节]({{< relref "../ch09/ch09_04.md#练习-96" >}})

----------

### 参考文献

The most comprehensive source for generalized additive models is the text
of that name by Hastie and Tibshirani (1990). Different applications of
this work in medical problems are discussed in Hastie et al. (1989) and
Hastie and Herman (1990), and the software implementation in Splus is
described in Chambers and Hastie (1991). Green and Silverman (1994)
discuss penalization and spline models in a variety of settings. Efron and
Tibshirani (1991) give an exposition of modern developments in statistics
(including generalized additive models), for a nonmathematical audience.
Classification and regression trees date back at least as far as Morgan and
Sonquist (1963). We have followed the modern approaches of Breiman et
al. (1984) and Quinlan (1993). The PRIM method is due to Friedman
and Fisher (1999), while MARS is introduced in Friedman (1991), with an
additive precursor in Friedman and Silverman (1989). Hierarchical mixtures
of experts were proposed in Jordan and Jacobs (1994); see also Jacobs et
al. (1991).