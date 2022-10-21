---
title: 13 原型方法和最近邻
summary: >
   第 459-484 页。

date: 2022-05-18T11:59:00+08:00
lastmod: 2022-06-14T14:49:00+08:00

weight: 1301

---

本章介绍一些简单而且基本无模型的分类问题和模式识别方法。它们是高度无结构化的，所以它们对理解样本的特征变量与其类别的内在关系上一般没有什么帮助。不过作为一个“黑盒”预测模型而言，它们可能非常高效，而且在真实数据中通常是表现最好的模型之一。最近邻方法也可用在回归问题中，这在第二章有所介绍，它在低维度的问题中表现基本良好。然而当特征空间维度比较高，偏差方差的均衡（bias-variance tradeoff）会使最近邻方法在回归中的效果不如它在分类问题中的效果。

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 13.1：[第 13.2 节]({{< relref "../ch13/ch13_02.md#练习-131" >}})
- 练习 13.2：[第 13.4 节]({{< relref "../ch13/ch13_04.md#练习-132" >}})
- 练习 13.3：[第 13.3 节]({{< relref "../ch13/ch13_03.md#练习-133" >}})
- 练习 13.4：[第 13.3 节]({{< relref "../ch13/ch13_03.md#练习-134" >}})
- 练习 13.5：[第 13.4 节]({{< relref "../ch13/ch13_04.md#练习-135" >}})
- 练习 13.6：
- 练习 13.7：
- 练习 13.8：

----------

### 参考文献

The nearest-neighbor method goes back at least to Fix and Hodges (1951).
The extensive literature on the topic is reviewed by Dasarathy (1991);
Chapter 6 of Ripley (1996) contains a good summary. K-means clustering
is due to Lloyd (1957) and MacQueen (1967). Kohonen (1989) introduced
learning vector quantization. The tangent distance method is due to
Simard et al. (1993). Hastie and Tibshirani (1996a) proposed the discriminant
adaptive nearest-neighbor technique.