---
title: 4 线性分类方法
summary: >
  第 101-138 页。分类模型可被理解为将输入变量空间划分为不同的区域，每个区域会被赋予一个预测的类别。“线性”指的是这些区域的决策边界是线性的（直线或平面），或经过某些单调变换后呈线性。如果在经过扩展后的输入变量空间上构建线性决策边界，还原到原始空间上则可得到非线性的决策边界。

date: 2018-10-04T16:12:07+08:00
lastmod: 2022-06-14T11:05:00+08:00

weight: 401

---

本章回到分类问题，并聚焦于分类问题的线性方法。在分类问题中，模型的预测函数 $G(x)$ 取值在一个离散集合 $\mathcal{G}$ 上，所以（预测函数）总是可以将输入变量空间划分为一些按不同类别标记的区域。如第二章中所见，根据具体的预测函数形式的不同，划分这些区域的边界可能是不规则的或者是光滑的。其中一类重要的方法所对应的决策边界是线性的，也就是本章所指的“分类问题的线性方法”。

构造线性 **决策边界（decision boundary）** 有很多不同的方法。第二章中使用了线性回归模型对各个类型的指示变量进行拟合，并按最大拟合度进行分类。具体来说，假设有 $K$ 个类型，标记为 1、2、……、K，对第 $k$ 个指示变量的拟合线性模型为 $\hat{f}\_k(x)=\hat{\beta}\_{k0}+\hat{\beta}\_k^Tx$。类型 $k$ 和类型 $\ell$ 之间的决策边界是所有满足 $\hat{f}\_k(x)=\hat{f}\_\ell(x)$ 的点的集合，即为集合 $\\{x:(\hat{\beta}\_{k0}-\hat{\beta}\_{\ell0})+(\hat{\beta}\_k-\hat{\beta}\_\ell)^Tx=0\\}$，这是一个仿射集（affine set）[^1]或超平面（hyperplane）[^2]。上述的逻辑适用于任意两个不同的类型，因此输入变量空间被分段的超平面决策边界分割成很多区域，每个区域被赋予一个固定的类型。这个回归方法是一类方法的其中一种，这类方法对每个类型建立 **判别函数（discriminant function）** $\delta_k(x)$，然后将输入变量 $x$ 的分类为其对应判别函数最大的类型。对后验概率 $\operatorname{Pr}(G=k|X=x)$ 建模的方法也是属于这类方法。显然，只要 $\delta_k(x)$ 或 $\operatorname{Pr}(G=k|X=x)$ 为 $x$ 的线性函数，则决策边界也呈线性。

而实际上要想得到线性的判别边界，只需要 $\delta_k$ 或 $\operatorname{Pr}(G=k|X=x)$ 经过某种单调变换后呈线性。以两个类型为例，一个普遍常用的后验概率模型为：

{{< math >}}
$$\begin{align}
\operatorname{Pr}(G=1|X=x) &=\frac{\exp(\beta_0 + \beta^T x)}
                                  {1 + \exp(\beta_0 + \beta^T x)} \\
\operatorname{Pr}(G=2|X=x) &=\frac{1}{1 + \exp(\beta_0 + \beta^T x)}
\end{align}\tag{4.1}$$
{{< /math >}}

其中的单调变换为 logit 转换：$\log[p/(1-p)]$，并且：

{{< math >}}
$$\log\frac{\operatorname{Pr}(G=1|X=x)}{\operatorname{Pr}(G=2|X=x)}
= \beta_0 + \beta^T x \tag{4.2}$$
{{< /math >}}

决策边界为所有使对数几率（log-odds）为零的点，即超平面 $\\{x|\beta_0+\beta^Tx=0\\} $。本章将介绍两个很常见却不同的构建线性 log-odds 或 logit 的方法，分别为线性判别分析和线性对数几率回归。虽然这两种方法的推导过程不同，但其本质上它们只是在用训练集数据拟合线性函数的方法上有些不同。

另一个更直接的方法是对类别之间的判别边界之间构建线性的模型。在 $p$ 维输入空间的二分类问题中，这个方法就是构建一个超平面作为决策边界；换言之，就是确定一个法向量（normal vector）和分界点（cut point）[^3]。我们会介绍两个直接构建“分离超平面（separating hyperplane）”的方法。第一个为 Rosenblatt (1958) 提出的 **感知器（perceptron）** 模型，以及利用训练集数据得到分离超平面（如果存在）的算法。另一个由 Vapnik (1996) 提出，若存在分离超平面则寻找最优的分离超平面，否则对一个训练集上类别重叠程度的度量最小化，找到最优分离超平面。本章只考虑可分（separable）的场景[^4]，[第十二章]({{< relref "../ch12/_index.md" >}})会讨论对不可分（nonseparable）场景的处理。

虽然本章主要讨论线性决策边界，但这些方法有很大的扩展空间。例如，通过引入输入变量 $X_1$、……、$X_p$ 的平方项和交叉项 $X_1^2$、$X_2^2$、……、$X_1X_2$、……，就额外增加了 $p(p+1)/2$ 个变量。扩展后输入变量空间的线性函数对应着原输入变量空间的二次函数，因此扩展空间上的线性决策边界在原空间上是二次决策边界。[图 4.1](#figure-f0401) 展示了这种扩展方式。左图和右图使用相同的训练数据，左图的分类模型为二维空间上的线性决策边界，而右图为在扩展后的五维空间上的线性决策边界。与之类似也可对输入变量空间使用基函数转换 $h(X)$ 进行扩展，即 $h:\mathbb{R}^p\mapsto\mathbb{R}^q, q>p$，这会在后续章节（第十二章）介绍。

{{< figure
  id="f0401"
  src="https://public.guansong.wang/eslii/ch04/eslii_fig_04_01.png"
  title="**图 4.1**：以三个类型的样本数据为例。左图为线性判别分析产生的线性决策边界。右图为二次决策边界，在五个输入变量 $X_1$、$X_2$、$X_1X_2$、$X_1^2$、$X_2^2$ 的空间中产生的线性决策边界。此空间上的线性关系相当于原空间上的二次关系。"
>}}

----------

### 内容概要

{{< list_children >}}

----------

### 本章练习

- 练习 4.1：[第 4.3 节]({{< relref "../ch04/ch04_03.md#练习-41" >}})
- 练习 4.2：[第 4.3 节]({{< relref "../ch04/ch04_03.md#练习-42" >}})
- 练习 4.3：[第 4.3 节]({{< relref "../ch04/ch04_03.md#练习-43" >}})
- 练习 4.4：[第 4.4 节]({{< relref "../ch04/ch04_04.md#练习-44" >}})
- 练习 4.5：[第 4.4 节]({{< relref "../ch04/ch04_04.md#练习-45" >}})
- 练习 4.6：[第 4.5 节]({{< relref "../ch04/ch04_04.md#练习-46" >}})
- 练习 4.7：
- 练习 4.8：[第 4.3 节]({{< relref "../ch04/ch04_03.md#练习-48" >}})
- 练习 4.9：

----------

### 参考文献

Good general texts on classification include Duda et al. (2000), Hand
(1981), McLachlan (1992) and Ripley (1996). Mardia et al. (1979) have
a concise discussion of linear discriminant analysis. Michie et al. (1994)
compare a large number of popular classifiers on benchmark datasets. Linear
separating hyperplanes are discussed in Vapnik (1996). Our account of
the perceptron learning algorithm follows Ripley (1996).

- Fisher, R. A. (1936). The use of multiple measurements in taxonomic problems, Eugen. 7: 179–188. [[pdf](https://www.comp.tmu.ac.jp/morbier/R/Fisher-1936-Ann._Eugen.pdf)]
- Ripley, B. D. (1996). Pattern Recognition and Neural Networks, Cambridge University Press.


[^1]: 译者一直简单地将“affine”理解为“线性”。
[^2]: 原文脚注 1：严格来说，超平面要包含原点，而仿射集不需要。本书中通常忽略这个区别，默认为超平面。（通常会对变量进行中心化处理，所以可以合理地默认包含原点。）
[^3]: 法向量和分界点即为线性平面（超平面）中的 $\beta$ 和 $\beta_0$。
[^4]: 即分离超平面存在。