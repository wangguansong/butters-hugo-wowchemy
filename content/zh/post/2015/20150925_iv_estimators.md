---
date: 2015-09-25
lastmod: 2017-09-03
draft: false
tags: ["2015", "高频数据", "波动率", "股票", "R"]
title: 高频数据波动性统计量
summary: >
  一些利用高频数据的波动性统计量在R中的实现。

---



一些利用高频数据的波动性统计量在R中的实现。

Github链接：https://github.com/wangguansong/IVEstimators



主要的统计量的论文：

- Barndorff-Nielsen, O., P. Hansen, A. Lunde, and N. Shephard (2008): “Designing realized kernels to measure the ex post variation of equity prices in the presence of noise,” Econometrica, 76(6), 1481–1536.
- Jacod, J., Y. Li, P. Mykland, M. Podolskij, and M. Vetter (2009): “Microstructure noise in the continuous case: the pre-averaging approach,” Stochastic Processes and their Applications, 119(7), 2249–2276.
- Zhang, L. (2006): “Efficient estimation of stochastic volatility using noisy observations: A multi-scale approach,” BERNOULLI-LONDON-, 12(6), 1019.
- Zhang, L., P. Mykland, and Y. Ait-Sahalia (2005): “A tale of two time scales,” Journal of the American Statistical Association, 100(472), 1394–1411.

当交易数据中的误差有时间序列自相关时，以上统计量会出现存在很大的误差。假设误差项为MA结构（移动平均），则可以调整偏差：

[Realized Kernels with Moving Average Noises and Optimal Weights](/files/rkmacv_master.pdf)
