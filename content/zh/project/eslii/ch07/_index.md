---
title: 7 模型评估和选择
summary: >
  第 219-260 页。

date: 2018-11-23T12:33:07+08:00
lastmod: 2022-06-14T10:42:00+08:00
draft: false
math: true

type: book
weight: 701

authors: ["Butters"]
tags: ["译文"]
categories: ["统计学习基础（译注）"]

---

一个学习方法的 **泛化（generalization）** 表现指的是它在独立的测试数据上的预测能力。在实践中对泛化表现的评估极其重要，因为它是选择学习方法或模型的标准，同时也对最终所选模型的效果提供一个指标。

本章会介绍并演示评估（模型）表现的重要方法，并展示如何用它们来选择模型。在那之前，会先对偏差、方差、和模型复杂度之间的相互关系做个介绍。


----------
### 内容概要
{{< list_children >}}

----------
### 本章练习
- 练习 7.1：[第 7.4 节]({{< relref "../ch07/ch07_04.md" >}})
- 练习 7.2：[第 7.3 节]({{< relref "../ch07/ch07_03.md" >}})
- 练习 7.3：[第 7.10 节]({{< relref "../ch07/ch07_10.md" >}})
- 练习 7.4：[第 7.4 节]({{< relref "../ch07/ch07_04.md" >}})
- 练习 7.5：[第 7.6 节]({{< relref "../ch07/ch07_06.md" >}})
- 练习 7.6：[第 7.9 节]({{< relref "../ch07/ch07_09.md" >}})
- 练习 7.7：[第 7.10 节]({{< relref "../ch07/ch07_10.md" >}})
- 练习 7.8：[第 7.9 节]({{< relref "../ch07/ch07_09.md" >}})
- 练习 7.9：[第 7.11 节]({{< relref "../ch07/ch07_11.md" >}})
- 练习 7.10：[第 7.10 节]({{< relref "../ch07/ch07_10.md" >}})

### 参考文献

Key references for cross-validation are Stone (1974), Stone (1977) and
Allen (1974). The AIC was proposed by Akaike (1973), while the BIC
was introduced by Schwarz (1978). Madigan and Raftery (1994) give an
overview of Bayesian model selection. The MDL criterion is due to Rissa-
nen (1983). Cover and Thomas (1991) contains a good description of coding
theory and complexity. VC dimension is described in Vapnik (1996). Stone
(1977) showed that the AIC and leave-one out cross-validation are asymp-
totically equivalent. Generalized cross-validation is described by Golub et
al. (1979) and Wahba (1980); a further discussion of the topic may be found
in the monograph by Wahba (1990). See also Hastie and Tibshirani (1990),
Chapter 3. The bootstrap is due to Efron (1979); see Efron and Tibshi-
rani (1993) for an overview. Efron (1983) proposes a number of bootstrap
estimates of prediction error, including the optimism and .632 estimates.
Efron (1986) compares CV, GCV and bootstrap estimates of error rates.
The use of cross-validation and the bootstrap for model selection is stud-
ied by Breiman and Spector (1992), Breiman (1992), Shao (1996), Zhang
(1993) and Kohavi (1995). The .632+ estimator was proposed by Efron
and Tibshirani (1997).
Cherkassky and Ma (2003) published a study on the performance of
SRM for model selection in regression, in response to our study of section
7.9.1. They complained that we had been unfair to SRM because had not
applied it properly. Our response can be found in the same issue of the
journal (Hastie et al. (2003)).

- Akaike, H. (1973). Information theory and an extension of the maximum likelihood principle, Second International Symposium on Information Theory, pp. 267–281.（[pdf](https://www.gwern.net/docs/statistics/decision/1998-akaike.pdf)）
- Schwarz, G. (1978). Estimating the dimension of a model, Annals of Statistics 6(2): 461–464.（[pdf](https://sites.stat.washington.edu/courses/stat527/s13/readings/ann_stat1978.pdf)）
- Madigan, D. and Raftery, A. (1994). Model selection and accounting for model uncertainty using Occam’s window, Journal of the American Statistical Association 89: 1535–46.（[pdf](https://sites.stat.washington.edu/raftery/Research/PDF/madigan1994.pdf)）
- Rissanen, J. (1983). A universal prior for integers and estimation by minimum description length, Annals of Statistics 11: 416–431.
- Cover, T. and Thomas, J. (1991). Elements of Information Theory, Wiley, New York.
- Vapnik, V. (1996). The Nature of Statistical Learning Theory, Springer, New York.
- Stone, M. (1974). Cross-validatory choice and assessment of statistical predictions, Journal of the Royal Statistical Society Series B 36: 111–147. （[pdf](https://sites.stat.washington.edu/courses/stat527/s13/readings/Stone1974.pdf)）
- Stone, M. (1977). An asymptotic equivalence of choice of model by cross-validation and Akaike’s criterion, Journal of the Royal Statistical Society Series B. 39: 44–7. （[pdf](https://sites.stat.washington.edu/courses/stat527/s13/readings/Stone1977.pdf)）
- Golub, G., Heath, M. and Wahba, G. (1979). Generalized cross-validation as a method for choosing a good ridge parameter, Technometrics 21: 215–224.
- Wahba, G. (1980). Spline bases, regularization, and generalized cross-validation for solving approximation problems with large quantities of noisy data, Proceedings of the International Conference on Approximation theory in Honour of George Lorenz, Academic Press, Austin, Texas, pp. 905–912.
- Wahba, G. (1990). Spline Models for Observational Data, SIAM, Philadelphia.
- Hastie, T. and Tibshirani, R. (1990). Generalized Additive Models, Chapman and Hall, London. Chapter 3.
- Efron, B. (1979). Bootstrap methods: another look at the jackknife, Annals of Statistics 7: 1–26.（[pdf](https://sites.stat.washington.edu/courses/stat527/s14/readings/ann_stat1979.pdf)）
- Efron, B. (1983). Estimating the error rate of a prediction rule: some improvements on cross-validation, Journal of the American Statistical Association 78: 316–331.
- Efron, B. (1986). How biased is the apparent error rate of a prediction rule?, Journal of the American Statistical Association 81: 461–70.
- Efron, B. and Tibshirani, R. (1993). An Introduction to the Bootstrap, Chapman and Hall, London.
- Efron, B. and Tibshirani, R. (1997). Improvements on cross-validation: the 632+ bootstrap: method, Journal of the American Statistical Association 92: 548–560.
- Breiman, L. and Spector, P. (1992). Submodel selection and evaluation in regression: the X-random case, International Statistical Review 60: 291–319.
- Breiman, L. (1992). The little bootstrap and other methods for dimensionality selection in regression: X-fixed prediction error, Journal of the American Statistical Association 87: 738–754.
- Shao, J. (1996). Bootstrap model selection, Journal of the American Statistical Association 91: 655–665.
- Zhang, P. (1993). Model selection via multifold cross-validation, Annals of Statistics 21: 299–311.
- Kohavi, R. (1995). A study of cross-validation and bootstrap for accuracy estimation and model selection, International Joint Conference on Artificial Intelligence (IJCAI), Morgan Kaufmann, pp. 1137–1143.