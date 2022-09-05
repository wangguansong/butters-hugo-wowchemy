---
title: 17 无向图模型
summary: >
  第 625-648 页。

date: 2022-06-01T15:15:00+08:00
draft: false

weight: 1701

---

一个 **图（graph）** 中包含着一组 **顶点（vertex）** 或节点（node），和一组连接了一些顶点对的 **边（edge）**。在图模型中，每个顶点代表着一个随机变量，图模型提供了一个理解全部随机变量的联合分布的可视化方法。图模型在有监督和无监督学习中都有用处。在 **无向图（undirected graph）** 中的边没有方向箭头。本章讨论的内容为无向图模型，也被称作为 **马尔科夫随机场（Markov random field）** 或 **马尔科夫网络（Markov network）**。在这些图中，两个顶点之间没有边的情况有特殊的含义：给定其他随机变量的条件下，（顶点）对应的随机变量条件独立。

[图 17.1](#figure-f1701) 展示了来自 Sachs et al. (2005) 的流式细胞计量（flow-cytometry）数据集的一个图模型的示例，其中有 $N=7466$ 个细胞的 $p=11$ 个蛋白测量。图中的每个顶点对应着一个蛋白表达水平的数量值。它的网络结构是基于多元高斯分布的假设估计得出的，并且使用了本章后面会介绍的图套索（lasso）方法。

{{< figure
  src="https://public.guansong.wang/eslii/ch17/eslii_fig_17_01.png"
  id="f1701"
  title="**图 17.1**：从流式细胞计量数据集估计得出的一个稀疏无向图示例，其中有 $N=7466$ 个细胞的 $p=11$ 个蛋白测量。这个网络结构使用了本章后续将介绍的图套索方法进行估计。"
>}}

稀疏图的边的数量相对较小，并且易于解释。它们在很多领域中都有应用，比如在基因组学（genomics）和蛋白组学（proteomics）中它们给出了细胞通路（cell pathway）的粗略模型。在无向图结构的定义和理解方面已有了很多研究，可参考文献目录。

在后续章节会讨论到，图中的边可以用一些变量或势（potential）来参数化，这些参数控制着相应的顶点处的随机变量之间的条件相关程度。关于图模型的主要工作是模型选择（决定图的结构）、从数据中对边的参数进行估计、以及基于顶点的联合分布对边际概率和期望的计算。在计算机科学领域，后两个工作有时被称之为学习（learning)和推断（inference）。

本章并不会对这个引人入胜的领域进行一个全面的介绍。我们只会介绍一些基础概念，然后讨论一些用于估计无向图参数和结构的简单方法；这些方法与本书已介绍的方法存在关联。连续变量和离散变量顶点的估计方法有所不同，所以我们分别进行讨论。[第 17.3.1 节]()和[第 17.3.2 节]()可能特别值得关注，它们介绍了一些用于估计图模型的新的基于回归的方法。

对有向图模型（directed graphical model）或贝叶斯网络（Bayesian network）的研究领域也很广泛和活跃。在这些图模型中，边（edge）带有方向箭头（但不存在有向圈）。有向图描述的是可以拆解成条件概率乘积的概率分布，并且可被用于因果性描述。关于无向图和有向图的简要概述，可以参考 Wasserman (2004)；下一节的内容就与[第十八章]({{< relref "../ch18/_index.md" >}})很相关。本章后的文献目录列举了很多有用的参考文献。

----------
### 本章练习

----------
### 参考文献

Much work has been done in defining and understanding the structure of
graphical models. Comprehensive treatments of graphical models can be
found in Whittaker (1990), Lauritzen (1996), Cox and Wermuth (1996),
Edwards (2000), Pearl (2000), Anderson (2003), Jordan (2004), and Koller
and Friedman (2007). Wasserman (2004) gives a brief introduction, and
Chapter 8 of Bishop (2006) gives a more detailed overview. Boltzmann
machines were proposed in Ackley et al. (1985). Ripley (1996) has a detailed
chapter on topics in graphical models that relate to machine learning. We
found this particularly useful for its discussion of Boltzmann machines.