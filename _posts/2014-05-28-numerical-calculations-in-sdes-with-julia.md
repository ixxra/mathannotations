---
layout: post
title: Numerical methods with julia
date: 2014-05-28 22:55:54 -0500
comments: true
categories: sdes
category: sdes
tags: numerical methods julia sdes benchmark
---

Results obtained with julia. <small>[Source]({{site.baseurl}}/assets/julia/sdes.jl)</small>

Initial setup

{% highlight julia %}
 T = 2.0
 n = 100
dt = T / n

x = zeros(n + 1)

for i = 1:n
    x[i + 1] = x[i] + dt + dt * randn()
end

t = linspace(0, T, n + 1)
{% endhighlight %}

Problem parameters

{% highlight julia %}
 r = 1
 c = 1
x0 = 1
{% endhighlight%}

Analytic solution


{% highlight julia %}
factor = r - c^2 / 2.0
x = zeros(n + 1)
w = randn(n + 1) * dt

w[1] = 0
x = x0 .+ exp(factor * t + c * w)
{% endhighlight %}

Euler-Murayama approximation

{% highlight julia %}
x2 = zeros(n + 1)
x2[1] = x0

for i = 1:n
    xi = x2[i]
    x2[i + 1] = xi + r * xi * dt + c * xi * randn() * dt
end
{% endhighlight %}

Milstein method

{% highlight julia %}
x3 = zeros(n + 1)
x3[1] = x0

for i = 1:n
    xi = x3[i]
    wi = randn() * dt
    x3[i + 1] = xi + r * xi * dt + c * xi * wi + 0.5 * c * xi * c * (wi^2 - dt)
end
{% endhighlight %}

#Comparing results
