#= 
 [Expectations.jl](https://quantecon.github.io/Expectations.jl/dev/)
=#

using Distributions, Expectations

d=DiscreteUniform(1,6)

E = expectation(d)