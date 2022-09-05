---
title: 3 线性回归方法
summary: >
  第 43-100 页。线性方法简单而有效，而且是很多非线性方法的基础。

date: 2018-09-06T09:51:00+08:00
lastmod: 2022-06-21T10:55:00+08:00
draft: false
math: true

type: book
weight: 301

authors: ["Butters"]
tags: ["译文", "2018"]
categories: ["统计学习基础（译注）"]

---

线性回归模型假设回归函数 $E(Y|X)$ 对输入变量 $X_1,\dots,X_p$ 呈线性。在计算机时代之前，统学计中就已建立起了线性模型的理论，然而在今天的计算机时代，它仍然值得学习和应用。线性模型算法简单，却通常可以满足实际需求并提供输入变量如何影响输出变量的解释性的说明。线性模型有时会在预测表现中优于更高深的非线性模型，特别是在训练样本小、样本信噪比低或数据样本采样稀疏的情况下。最后，应用在输入变量的某种变换的线性模型，可以很大地拓展其能力范围。这种推广方法就是[第五章]({{< relref "../ch05/_index.md" >}})会介绍的基函数方法。

本章的内容是回归问题的线性方法，下一章的内容是分类问题的线性方法。我们深信对线性方法的理解是进一步理解非线性方法的关键，所以本章的讨论会比较细致。事实上，很多非线性方法是本章中线性方法的直接推广。

----------
### 内容概要
{{< list_children >}}

----------
### 本章练习
- 练习 3.1：[第 3.2 节]({{< relref "../ch03/ch03_02.md#练习-31" >}})
- 练习 3.2：[第 3.2 节]({{< relref "../ch03/ch03_02.md#练习-32" >}})
- 练习 3.3：[第 3.2 节]({{< relref "../ch03/ch03_02.md#练习-33" >}})
- 练习 3.4：[第 3.2 节]({{< relref "../ch03/ch03_02.md#练习-34" >}})
- 练习 3.5：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-35" >}})
- 练习 3.6：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-36" >}})
- 练习 3.7：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-37" >}})
- 练习 3.8：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-38" >}})
- 练习 3.9：[第 3.3 节]({{< relref "../ch03/ch03_03.md#练习-39" >}})
- 练习 3.10：[第 3.3 节]({{< relref "../ch03/ch03_03.md#练习-310" >}})
- 练习 3.11：[第 3.2 节]({{< relref "../ch03/ch03_02.md#练习-311" >}})
- 练习 3.12：
- 练习 3.13：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-313" >}})
- 练习 3.14：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-314" >}})
- 练习 3.15：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-315" >}})
- 练习 3.16：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-316" >}})
- 练习 3.17：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-317" >}})
- 练习 3.18：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-318" >}})
- 练习 3.19：[第 3.5 节]({{< relref "../ch03/ch03_05.md#练习-319" >}})
- 练习 3.20：[第 3.7 节]({{< relref "../ch03/ch03_07.md#练习-320" >}})
- 练习 3.21：[第 3.7 节]({{< relref "../ch03/ch03_07.md#练习-321" >}})
- 练习 3.22：[第 3.7 节]({{< relref "../ch03/ch03_07.md#练习-322" >}})
- 练习 3.23：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-323" >}})
- 练习 3.24：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-324" >}})
- 练习 3.25：[第 3.4 节]({{< relref "../ch03/ch03_04.md#练习-325" >}})
- 练习 3.26：
- 练习 3.27：
- 练习 3.28：
- 练习 3.29：
- 练习 3.30：

----------
### 参考文献

统计学教科书：
- Seber (1984)
- Weisberg (1980)
- Mardia et al. (1979)

- Furnival, G. and Wilson, R. (1974). Regression by leaps and bounds, Technometrics 16: 499–511. [[pdf](https://www.stat.cmu.edu/technometrics/90-00/vol-42-01/v4201069.pdf)]
- Efron, B., Hastie, T., Johnstone, I. and Tibshirani, R. (2004). Least angle
regression (with discussion), Annals of Statistics 32(2): 407–499. [[pdf](https://tibshirani.su.domains/ftp/lars.pdf)]

Linear regression is discussed in many statistics books, for example, Seber
(1984), Weisberg (1980) and Mardia et al. (1979). Ridge regression was
introduced by Hoerl and Kennard (1970), while the lasso was proposed by
Tibshirani (1996). Around the same time, lasso-type penalties were pro-
posed in the basis pursuit method for signal processing (Chen et al., 1998).
The least angle regression procedure was proposed in Efron et al. (2004);
related to this is the earlier homotopy procedure of Osborne et al. (2000a)
and Osborne et al. (2000b). Their algorithm also exploits the piecewise
linearity used in the LAR/lasso algorithm, but lacks its transparency. The
criterion for the forward stagewise criterion is discussed in Hastie et al.
(2007). Park and Hastie (2007) develop a path algorithm similar to least
angle regression for generalized regression models. Partial least squares
was introduced by Wold (1975). Comparisons of shrinkage methods may
be found in Copas (1983) and Frank and Friedman (1993).