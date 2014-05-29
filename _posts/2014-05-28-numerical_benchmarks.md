---
layout: post
title: "Numerical Benchmarks on the Stochastic Maltus Model"
date: 2014-05-23 00:32:57 -0500
comments: true
categories: sdes
category: sdes
tags: benchmark julia python sdes stochastic maltus 
---

We will compare Euler-Murayama and Milstein methods to solve the stochastic Maltus model for various possible values of the parameters. Recall *Maltus stochastic model:*

$$dx_t = r x_t dt + c x_t dw_t.$$

As we have shown, its analytic solution is 

$$x_t = x_0 \exp\left(\left(r - \frac{c^2}{2}\right) t + c w_t.\right)$$

We are going to implement Euler-Murayama's and Milstein's in [numpy]({{site.baseurl}}{% post_url 2014-05-28-numerical_methods_in_stochastic_differential_equations_python %}) and [julia]({{site.baseurl}}{% post_url 2014-05-28-numerical-calculations-in-sdes-with-julia %}). Numpy implementation can be found in the [notebook]({{site.baseurl}}{{"/assets/ipython/Numerical methods in stochastic differential equations.ipynb" | uri_escape}}) used to perform the calculations. Likewise, julia implementation can be downloaded [here]({{site.baseurl}}/assets/julia/sdes.jl).
