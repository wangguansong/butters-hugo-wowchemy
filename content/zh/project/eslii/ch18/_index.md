---
title: 18 高维问题：p ≫ N
summary: >
  第 649-698 页。

date: 2022-09-30T11:29:00+08:00

weight: 1801

---

本章会讨论在特征数量 $p$ 远大于观测样本数量 $N$ 时的预测问题，通常写为 $p\gg N$。这类问题已经变得越来越重要了，特别是在基因学和其他计算生物学领域中。在这个场景中我们会遇到的主要问题是高方差和过拟合。因此，通常会选择使用结构简单而且高度正则化的方法。本章的第一部分介绍在分类和回归问题中的预测，第二部分介绍特征选择和评估等更基础的问题。

{{< figure
  id="f1801"
  src="https://public.guansong.wang/eslii/ch18/eslii_fig_18_01.png"
  title="**图 18.1**：模拟数据实验的测试误差结果。图中展示的是在 100 次模拟上三个不同 $p$ 值（特征个数）的相对测试误差的箱线图。相对误差是测试误差除以贝叶斯误差 $\sigma^2$。每个图中从左至右，分别是不同正则化参数 $\lambda$ 取值（$0.001$、$100$、和 $1000$）岭回归的结果。拟合中的（平均）自由度展示在了每个图的下方。"
>}}

[图 18.1](#figure-f1801) 展示了一个小型的模拟研究，它演示了当 $p\gg N$ 时的“拟合越简单结果越好（less fitting is better）”的原则。在每个 $N=100$ 的样本集中，生成 $p$ 个标准高斯分布特征变量 $X$，两两之间相关性为 0.2。输出变量 $Y$ 由一个线性模型生成：

{{< math >}}
$$Y = \sum_{j=1}^p X_j\beta_j + \sigma\varepsilon \tag{18.1}$$
{{< /math >}}

其中的 $\varepsilon$ 来自于一个标准高斯分布。在每个数据集中，系数 $\beta_j$ 也是从一个标准高斯分布生成。我们研究了三个场景：$p=20$、$p=200$、以及 $p=1000$。标准差 $\sigma$ 的选取是使得信号噪声比率 $\operatorname{Var}[\operatorname{E}(Y|X)]/\sigma^2$ 等于 2。结果在 100 次模拟实验中取平均数，单边量回归中显著系数的个数[^1]分别是 9、33、和 331。$p=1000$ 的情况是为了模拟我们在高维问题中所面对的数据集，例如基因组数据集或蛋白组数据集。

在数据上使用了岭回归来拟合，其中使用了三个不同的正则化参数 $\lambda$：$0.001$、$100$、和 $1000$。当 $\lambda=0.001$ 时，这于最小二乘回归几乎完全相同，其中微小的正则化只是为了保证当 $p>N$ 时求解仍是非奇异的。[图 18.1](#figure-f1801) 展示了每个场景中不同估计值得到的测试误差的箱线图。图中标记处了每个岭回归拟合所对应的平均自由度（计算公式如 68 页的[式 3.50]({{< relref "../ch03/ch03_04.md" >}})）[^2]。自由度参数与 $\lambda$ 相比更容易理解。图中可见当 $p=20$ 时，$\lambda=0.001$（20 自由度）是最优的；当 $p=100$ 时，$\lambda=100$（35 自由度）是最优的；而当 $p=1000$ 时，$\lambda=1000$（43 自由度）是最优的。

以下是对这些结果的一个解释。当 $p=20$ 时，我们可以尽量地拟合，并可以较低的偏差来识别出尽可能多的显著系数。当 $p=100$ 时，我们通过适度的收缩可以识别出一部分非零的系数。最后当 $p=1000$ 时，虽然有非常多的非零系数，但我们根本无法识别出它们，并且需要尽量地进行收缩。为验证上述解释，令 $t_j=\hat{\beta}\_j/\hat{\text{se}\_j}$，其中的 $\hat{\beta}\_j$ 是岭回归的估计、$\hat{\text{se}}\_j$ 是它的估计标准差。对从小到大的三个 $p$，$|t_j|$ 的中位数分别是 $2.0$、$0.6$、和 $0.2$，$|t_j|$ 的值大于 2 的平均个数分别是 $9.8$、$1.2$、和 $0.0$。

当 $p<N$ 时，$\lambda=0.001$ 的岭回归可以有效地利用特征变量之间的相关性，但在 $p\gg N$ 时就无法实现。在后一种场景中，在相对小的样本中的信息不足以有效地估计高维的协方差矩阵。在这种情况下，更强的正则化能够得出更好的预测表现。

因此就可预见在高维数据的分析中，需要对那些在 $N>p$ 的情况下使用的方法进行修改，或者要重新开发新的方法。本章将介绍这两个方向的高维数据分类和回归的各种方法；这些方法往往会加上很强的正则化，而且会利用具体问题背景中的专业知识来决定正则化恰当的形式。本章最后会讨论特征选择和多重检验（multiple testing）。

----------

### 本章练习

- 练习 18.1：
- 练习 18.2：[第 18.2 节]({{< relref "../ch18/ch18_02.md#练习-182" >}})
- 练习 18.3：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-183" >}})
- 练习 18.4：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-184" >}})
- 练习 18.5：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-185" >}})
- 练习 18.6：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-186" >}})
- 练习 18.7：
- 练习 18.8：
- 练习 18.9：
- 练习 18.10：
- 练习 18.11：[第 18.4 节]({{< relref "../ch18/ch18_04.md#练习-1811" >}})
- 练习 18.12：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-1812" >}})
- 练习 18.13：[第 18.3 节]({{< relref "../ch18/ch18_03.md#练习-1813" >}})
- 练习 18.14：[第 18.5 节]({{< relref "../ch18/ch18_05.md#练习-1814" >}})
- 练习 18.15：[第 18.5 节]({{< relref "../ch18/ch18_05.md#练习-1815" >}})
- 练习 18.16：[第 18.7 节]({{< relref "../ch18/ch18_07.md#练习-1816" >}})
- 练习 18.17：[第 18.7 节]({{< relref "../ch18/ch18_07.md#练习-1817" >}})
- 练习 18.18：[第 18.7 节]({{< relref "../ch18/ch18_07.md#练习-1818" >}})
- 练习 18.19：[第 18.7 节]({{< relref "../ch18/ch18_07.md#练习-1819" >}})
- 练习 18.20：[第 18.7 节]({{< relref "../ch18/ch18_07.md#练习-1820" >}})

----------

### 参考文献

Many references were given at specific points in this chapter; we give some
additional ones here. Dudoit et al. (2002a) give an overview and comparison
of discrimination methods for gene expression data. Levina (2002)
does some mathematical analysis comparing diagonal LDA to full LDA, as
p, N → ∞ with p > N . She shows that with reasonable assumptions diagonal
LDA has a lower asymptotic error rate than full LDA. Tibshirani et al.
(2001a) and Tibshirani et al. (2003) proposed the nearest shrunken-centroid
classifier. Zhu and Hastie (2004) study regularized logistic regression. High-
dimensional regression and the lasso are very active areas of research, and
many references are given in Section 3.8.5. The fused lasso was proposed
by Tibshirani et al. (2005), while Zou and Hastie (2005) introduced the
elastic net. Supervised principal components is discussed in Bair and
Tibshirani (2004) and Bair et al. (2006). For an introduction to the analysis
of censored survival data, see Kalbfleisch and Prentice (1980).

Microarray technology has led to a flurry of statistical research: see for
example the books by Speed (2003), Parmigiani et al. (2003), Simon et al.
(2004), and Lee (2004).

The false discovery rate was proposed by Benjamini and Hochberg (1995),
and studied and generalized in subsequent papers by these authors and694
many others. A partial list of papers on FDR may be found on Yoav
Benjamini’s homepage. Some more recent papers include Efron and Tibshirani
(2002), Storey (2002), Genovese and Wasserman (2004), Storey and
Tibshirani (2003) and Benjamini and Yekutieli (2005). Dudoit et al. (2002b)
review methods for identifying differentially expressed genes in microarray
studies.

[^1]: 原文脚注 1：回归系数显著的标准是 $|\hat{\beta}\_j/\hat{\text{se}}\_j|\geq2$，其中的 $\hat{\beta}\_j$ 是（单边量回归的）参数估计，而 $\hat{\text{se}}\_j$ 是它的估计标准差。
[^2]: 原文脚注 2：对于正则化参数 $\lambda$ 的一个固定取值，拟合自由度依赖于每次模拟样本中观测样本预测变量的取值。因此我们在所有模拟样本上取平均的自由度。