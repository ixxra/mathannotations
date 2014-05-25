---
layout: draft
title: "Numerical Benchmarks on the Stochastic Maltus Model"
date: 2014-05-23 00:32:57 -0500
comments: true
categories: sdes
tags: 
---

We will compare Euler-Murayama and Milstein methods to solve the stochastic Maltus model for various possible values of the parameters. Recall *Maltus stochastic model:*

$$dx_t = r x_t dt + c x_t dw_t.$$

As we have shown, its analytic solution is 

$$x_t = x_0 \exp\left(\left(r - \frac{c^2}{2}\right) t + c w_t.\right)$$

We are going to implement Euler-Murayama's and Milstein's in *numpy* and *julia*. Numpy implementation can be found in the [notebook](/assets/ipython/Numerical methods in stochastic differential equations.ipynb) used to perform the calculations, or better yet, it can be [viewed online](#).
