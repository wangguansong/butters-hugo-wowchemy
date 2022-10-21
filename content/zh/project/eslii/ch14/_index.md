---
title: 14 无监督学习
summary: >
  第 485-586 页。

date: 2022-05-30T11:00:00+08:00

weight: 1401

---

前面章节一直讨论的问题是为给定的一组输入变量或自变量（predictor）$X^T=(X_1,\dots,X_p)$，预测一个或多个输出变量或相应变量（response）$Y=(Y_1,\dots,Y_m)$ 的取值。记 $x_i^T=(x_{i1},\dots,x_{ip})$ 为第 $i$ 个训练样本的输入变量，$y_i$ 为一个响应变量的测量值。预测是基于已有结果的训练样本 $(x_1,y_1)$、……、$(x_N,y_N)$ 给出的，这些样本的所有变量取值都是已知的。这就是所谓的 **监督学习（supervised learning）**，或者“有教师的学习”。在这个比喻中，“学生”指的是训练样本中每个 $x_i$ 对应的预测答案 $\hat{y}_i$，而监督者或“教师”则会提供正确的答案并指出学生答案的错误程度。这一般是通过某个损失函数 $L(y,\hat{y})$ 来实现的，例如 $L(y,\hat{y})=(y-\hat{y})^2$。

若假设 $(X,Y)$ 为服从某个联合概率密度函数 $\operatorname{Pr}(X,Y)$ 的随机变量，那么监督学习可被正式定义为一个密度函数估计问题，它关注的是测定条件密度函数 $\operatorname{Pr}(Y|X)$ 的性质。大家关心的性质通常是使在每个 $x$ 处的期望误差最小的“位置”参数 $\mu$。

{{< math >}}
$$\mu(x) = \underset{\theta}{\operatorname{argmin}}
  \operatorname{E}_{Y|X} L(Y, \theta) \tag{14.1}$$
{{< /math >}}

条件概率密度可写为

{{< math >}}
$$\operatorname{Pr}(X, Y) = \operatorname{Pr}(Y|X) \cdot \operatorname{Pr}(X)$$
{{< /math >}}

其中 $\operatorname{Pr}(X)$ 是 $X$ 随机变量单独的（联合）边际密度函数。在监督学习中，一般不会直接关注 $\operatorname{Pr}(X)$。主要感兴趣的是条件密度函数 $\operatorname{Pr}(Y|X)$ 的性质。因为 $Y$ 通常是低维的（通常是一维），而且只关注它的位置 $\mu(x)$，所以很大程度地简化了问题。如之前章节中的讨论，在各种场景下有很多有效地进行监督学习的方法。

在本章我们介绍 **无监督学习（unsupervised learning）** 或“无教师的学习”。这里的样本是服从联合密度函数 $\operatorname{Pr}(X)$ 的 p 维随机向量 $X$ 的 $N$ 个观测点 $x_1,x_2,\dots,x_N$。目标是直接对这个概率密度函数的性质做推断，而不需要借助一个监督者或教师来为每个样本提供正确答案或者错误的程度。$X$ 的维度有时要原高于在监督学习中的维度，而且所关注的概率性质也通常比简单的位置估计要更复杂。这些因素的影响也没有那么大，因为 $X$ 就代表了待分析的所有变量；也就是说不需要对在另一组变量取值变动条件下 $\operatorname{Pr}(X)$ 性质的变化做推断。

在低维的问题中（例如 $p\leq3$），已经有很多在所有 $X$ 取值下直接估计密度函数 $\operatorname{Pr}(X)$ 的有效的非参数方法，并可以可视化展示（例如 Silverman, 1986）。由于维数灾难，这些方法在高维度中不再适用。这时就只能用比较简略的全局模型做估计，例如高斯混合模型或一些描述 $\operatorname{Pr}(X)$ 特征的简单统计量。

一般来说，这些描述性的统计量会描绘出 $\operatorname{Pr}(X)$ 较大的 $X$ 点或集合。例如，主成分分析、多维尺度分析、自组织映射、和主曲线分析尝试在 $X$ 空间上识别出可表达出高数据密度的低维度流形（manifold）。这可给出变量之间相互关系的信息，以及是否可将它们看成是少数“隐藏“变量的函数。聚类分析试图在 $X$ 空间上寻找包含了 $\operatorname{Pr}(X)$ 的模（mode）的多个凸区域。这样可以判断 $\operatorname{Pr}(X)$ 是否可以被描述为代表了不同类型的样本所服从的更简单的密度函数的一个混合。混合模型与这个做法类似。关联规则试图构建一些简单的说明（合取规则），它们在非常高维度二元数据的特例中描绘出了高密度的区域。

在监督学习中有明确的成功或失败的度量，可被用于判断某方法在特定问题中的适用性，以及在不同的场景中比较不同方法的有效性。联合分布 $\operatorname{Pr}(X,Y)$ 下的期望损失便是对“失败”的直接测量。这可以使用包括交叉验证等很多方法来估计。在无监督学习的情景中，就不存在这样的对成功的度量了。对大部分的无监督学习算法来说，很难弄清楚模型结果得出的推断的是否正确。监督学习一般会通过直接和经验中得到算法的启发；无监督学习则不仅一样依赖于直觉和经验来启发算法，同时又依赖这个启发式的判断（heuristic arguments）[^1]来评判结果。每个方法需要自圆其说，因此方法的有效性更像是一种观点而不是可直接证实的事实，这就导致了在无监督学习下有非常多不同的方法。

本章将介绍在实践中最普遍使用的一些无监督学习方法，以及一些作者偏爱的其他方法。

----------

### 内容概览

{{< list_children >}}

----------

### 本章练习

- 练习 14.1：[第 14.3 节]({{< relref "../ch14/ch14_03.md#练习-141" >}})
- 练习 14.2：[第 14.3 节]({{< relref "../ch14/ch14_03.md#练习-142" >}})
- 练习 14.3：[第 14.2 节]({{< relref "../ch14/ch14_02.md#练习-143" >}})
- 练习 14.4：[第 14.2 节]({{< relref "../ch14/ch14_02.md#练习-144" >}})
- 练习 14.5：[第 14.4 节]({{< relref "../ch14/ch14_04.md#练习-145" >}})
- 练习 14.6：[第 14.4 节]({{< relref "../ch14/ch14_04.md#练习-146" >}})
- 练习 14.7：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-147" >}})
- 练习 14.8：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-148" >}})
- 练习 14.9：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-149" >}})
- 练习 14.10：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1410" >}})
- 练习 14.11：[第 14.8 节]({{< relref "../ch14/ch14_08.md#练习-1411" >}})
- 练习 14.12：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1412" >}})
- 练习 14.13：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1413" >}})
- 练习 14.14：[第 14.7 节]({{< relref "../ch14/ch14_07.md#练习-1414" >}})
- 练习 14.15：[第 14.7 节]({{< relref "../ch14/ch14_07.md#练习-1415" >}})
- 练习 14.16：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1416" >}})
- 练习 14.17：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1417" >}})
- 练习 14.18：[第 14.7 节]({{< relref "../ch14/ch14_07.md#练习-1418" >}})
- 练习 14.19：[第 14.7 节]({{< relref "../ch14/ch14_07.md#练习-1419" >}})
- 练习 14.20：[第 14.7 节]({{< relref "../ch14/ch14_07.md#练习-1420" >}})
- 练习 14.21：[第 14.5 节]({{< relref "../ch14/ch14_05.md#练习-1421" >}})
- 练习 14.22：
- 练习 14.23：[第 14.6 节]({{< relref "../ch14/ch14_06.md#练习-1423" >}})
- 练习 14.24：[第 14.6 节]({{< relref "../ch14/ch14_06.md#练习-1424" >}})
- 练习 14.25：

----------

### 参考文献

There are many books on clustering, including Hartigan (1975), Gordon
(1999) and Kaufman and Rousseeuw (1990). K-means clustering goes back
at least to Lloyd (1957), Forgy (1965), Jancey (1966) and MacQueen (1967).
Applications in engineering, especially in image compression via vector
quantization, can be found in Gersho and Gray (1992). The k-medoid pro-
cedure is described in Kaufman and Rousseeuw (1990). Association rules
are outlined in Agrawal et al. (1995). The self-organizing map was proposed
by Kohonen (1989) and Kohonen (1990); Kohonen et al. (2000) give a more
recent account. Principal components analysis and multidimensional scal-
ing are described in standard books on multivariate analysis, for example,
Mardia et al. (1979). Buja et al. (2008) have implemented a powerful en-
vironment called Ggvis for multidimensional scaling, and the user manual
contains a lucid overview of the subject. Figures 14.17, 14.21 (left panel)
and 14.28 (left panel) were produced in Xgobi, a multidimensional data
visualization package by the same authors. GGobi is a more recent im-
plementation (Cook and Swayne, 2007). Goodall (1991) gives a technical
overview of Procrustes methods in statistics, and Ramsay and Silverman
(1997) discuss the shape registration problem. Principal curves and surfaces
were proposed in Hastie (1984) and Hastie and Stuetzle (1989). The idea of
principal points was formulated in Flury (1990), Tarpey and Flury (1996)
give an exposition of the general concept of self-consistency. An excellent
tutorial on spectral clustering can be found in von Luxburg (2007); this was
the main source for Section 14.5.3. Luxborg credits Donath and Hoffman
(1973) and Fiedler (1973) with the earliest work on the subject. A history
of spectral clustering my be found in Spielman and Teng (1996). Indepen-
dent component analysis was proposed by Comon (1994), with subsequent
developments by Bell and Sejnowski (1995); our treatment in Section 14.7
is based on Hyvärinen and Oja (2000). Projection pursuit was proposed by
Friedman and Tukey (1974), and is discussed in detail in Huber (1985). A
dynamic projection pursuit algorithm is implemented in GGobi.

Hastie Stuetzle: Principal Curves

https://hastie.su.domains/Papers/Principal_Curves.pdf

[^1]：A heuristic argument is an argument that reasons from the value of a method or principle that has been shown experimentally (especially through trial-and-error) to be useful or convincing in learning, discovery and problem-solving, but whose line of reasoning involves key oversimplifications that make it not entirely rigorous. (Wikipedia) A heuristic is something "providing aid in the direction of the solution of a problem but otherwise unjustified or incapable of justification."  So heuristic arguments are used to show what we might later attempt to prove, or what we might expect to find in a computer run.  They are, at best, educated guesses. (https://primes.utm.edu/glossary/page.php?sort=Heuristic)