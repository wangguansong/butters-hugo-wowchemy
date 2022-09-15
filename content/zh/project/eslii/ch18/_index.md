---
title: 18 高维问题：p ≫ N
summary: >
  第 649-698 页。

date: 2022-06-27T10:00:00+08:00

weight: 1801

---

本章的内容是在特征数量 $p$ 远大于观测样本数量 $N$ 时的预测问题，通常将其写为 $p\gg N$。这类问题已经变得越来越重要了，特别是在基因学和其他计算生物学领域中。在这个场景中我们会遇到的主要问题是高方差和过拟合。因此，通常会选择使用结构简单而且高度正则化的方法。本章的第一部分介绍在分类和回归问题中的预测，第二部分介绍特征选择和评估等更基础的问题。

{{< figure
  id="f1801"
  src="https://public.guansong.wang/eslii/ch18/eslii_fig_18_01.png"
  title="**图 18.1**：Test-error results for simulation experiments. Shown are boxplots of the relative test errors over 100 simulations, for three different values of p, the number of features. The relative error is the test error divided by the Bayes error, σ 2 . From left to right, results are shown for ridge regression with three different values of the regularization parameter λ: 0.001, 100 and 1000. The (average) effective degrees of freedom in the fit is indicated below each plot."
>}}

To get us started, Figure 18.1 summarizes a small simulation study that
demonstrates the “less fitting is better” principle that applies when p ≫ N .
For each of N = 100 samples, we generated p standard Gaussian features
X with pairwise correlation 0.2. The outcome Y was generated according
to a linear model

{{< math >}}
$$Y = \sum_{j=1}^p X_j\beta_j + \sigma\epsilon \tag{18.1}$$
{{< /math >}}

where ε was generated from a standard Gaussian distribution. For each
dataset, the set of coefficients β j were also generated from a standard
Gaussian distribution. We investigated three cases: p = 20, 100, and 1000. The
standard deviation σ was chosen in each case so that the signal-to-noise
ratio Var[E(Y |X)]/σ 2 equaled 2. As a result, the number of significant
univariate regression coefficients 1 was 9, 33 and 331, respectively, averaged
over the 100 simulation runs. The p = 1000 case is designed to mimic the
kind of data that we might see in a high-dimensional genomic or proteomic
dataset, for example.

We fit a ridge regression to the data, with three different values for the
regularization parameter λ: 0.001, 100, and 1000. When λ = 0.001, this
is nearly the same as least squares regression, with a little regularization
just to ensure that the problem is non-singular when p > N . Figure 18.1
shows boxplots of the relative test error achieved by the different estimators
in each scenario. The corresponding average degrees of freedom used in
each ridge-regression fit is indicated (computed using formula (3.50) on
page 68 2 ). The degrees of freedom is a more interpretable parameter than
λ. We see that ridge regression with λ = 0.001 (20 df) wins when p = 20;
λ = 100 (35 df) wins when p = 100, and λ = 1000 (43 df) wins when
p = 1000.

Here is an explanation for these results. When p = 20, we fit all the way
and we can identify as many of the significant coefficients as possible with
low bias. When p = 100, we can identify some non-zero coefficients using
moderate shrinkage. Finally, when p = 1000, even though there are many
nonzero coefficients, we don’t have a hope for finding them and we need
to shrink all the way down. As evidence of this, let t j = β b j / se
b j , where β̂ j is the ridge regression estimate and se
b j its estimated standard error. Then
using the optimal ridge parameter in each of the three cases, the median
value of |t j | was 2.0, 0.6 and 0.2, and the average number of |t j | values
exceeding 2 was equal to 9.8, 1.2 and 0.0.

Ridge regression with λ = 0.001 successfully exploits the correlation in
the features when p < N , but cannot do so when p ≫ N . In the latter case
there is not enough information in the relatively small number of samples
to efficiently estimate the high-dimensional covariance matrix. In that case,
more regularization leads to superior prediction performance.

Thus it is not surprising that the analysis of high-dimensional data
requires either modification of procedures designed for the N > p scenario, or
entirely new procedures. In this chapter we discuss examples of both kinds
of approaches for high dimensional classification and regression; these methods
tend to regularize quite heavily, using scientific contextual knowledge
to suggest the appropriate form for this regularization. The chapter ends
with a discussion of feature selection and multiple testing.

[^1]: 原文脚注 1：We call a regression coefficient significant if $|\hat{\beta}\_j/\hat{se}\_j|\geq 2$, where $\hat{\beta}\_j$ is the estimated (univariate) coefficient and $\hat{se}\_j$ is its estimated standard error.
[^2]: 原文脚注 2：For a fixed value of the regularization parameter λ, the degrees of freedom depends on the observed predictor values in each simulation. Hence we compute the average degrees of freedom over simulations