#sdes.jl - This is a sample of stochastic differential equations
#
#writen in julia. Compare it with its python cousin at
#
#http://ixxra.github.io/mathannotations/sdes/2014/05/28/numerical_methods_in_stochastic_differential_equations_python/
#


#Initial setup
T = 2.0
n = 100
dt = T / n

x = zeros(n + 1)

for i = 1:n
    x[i + 1] = x[i] + dt + dt * randn()
end

t = linspace(0, T, n + 1)

#Problem parameters

r = 1
c = 1
x0 = 1

#Analytic solution

factor = r - c^2 / 2.0
x = zeros(n + 1)
w = randn(n + 1) * dt

w[1] = 0
x = x0 .+ exp(factor * t + c * w)

#Euler-Murayama approximation

x2 = zeros(n + 1)
x2[1] = x0

for i = 1:n
    xi = x2[i]
    x2[i + 1] = xi + r * xi * dt + c * xi * randn() * dt
end

#Milstein method

x3 = zeros(n + 1)
x3[1] = x0

for i = 1:n
    xi = x3[i]
    wi = randn() * dt
    x3[i + 1] = xi + r * xi * dt + c * xi * wi + 0.5 * c * xi * c * (wi^2 - dt)
end

