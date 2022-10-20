---
title: 11 神经网络
summary: >
  第 389-416 页。

date: 2019-02-15T19:09:00+08:00
lastmod: 2022-06-14T14:51:00+08:00

weight: 1101

---

本章将介绍一类学习方法，其在不同的领域中，统计学和人工智能，基于基本相同的模型分别发展而来。其中心思想是将输入变量的线性组合提取为衍生特征，然后将目标变量建模为这些特征的一个非线性函数。这样得出的是一个强大的学习方法，在很多领域中都有广泛的应用。我们首先介绍在半参数统计学和函数平滑中发展来的投影寻踪（projection pursuit）模型。本章的其他部分介绍神经网络（neural network）模型。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 11.1：
- 练习 11.2：[第 11.5 节]({{< relref "../ch11/ch11_05.md#练习-112" >}})
- 练习 11.3：[第 11.4 节]({{< relref "../ch11/ch11_04.md#练习-113" >}})
- 练习 11.4：[第 11.7 节]({{< relref "../ch11/ch11_07.md#练习-114" >}})
- 练习 11.5：
- 练习 11.6：
- 练习 11.7：

----------

### 参考文献

Projection pursuit was proposed by Friedman and Tukey (1974), and
specialized to regression by Friedman and Stuetzle (1981). Huber (1985) gives
a scholarly overview, and Roosen and Hastie (1994) present a formulation
using smoothing splines. The motivation for neural networks dates back
to McCulloch and Pitts (1943), Widrow and Hoff (1960) (reprinted in
Anderson and Rosenfeld (1988)) and Rosenblatt (1962). Hebb (1949) heavily
influenced the development of learning algorithms. The resurgence of neural
networks in the mid 1980s was due to Werbos (1974), Parker (1985) and
Rumelhart et al. (1986), who proposed the back-propagation algorithm.
Today there are many books written on the topic, for a broad range of
audiences. For readers of this book, Hertz et al. (1991), Bishop (1995) and
Ripley (1996) may be the most informative. Bayesian learning for neural
networks is described in Neal (1996). The ZIP code example was taken from
Le Cun (1989); see also Le Cun et al. (1990) and Le Cun et al. (1998).

We do not discuss theoretical topics such as approximation properties of
neural networks, such as the work of Barron (1993), Girosi et al. (1995)
and Jones (1992). Some of these results are summarized by Ripley (1996).