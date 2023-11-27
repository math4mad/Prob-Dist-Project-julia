#= 
  [Generate a Sampling Distribution in R](https://www.statology.org/sampling-distribution-in-r/)
=#

using Distributions, GLMakie,Random
Random.seed!(3434)

n=1000
d=Normal(2,3)
#samples=Vector{Float64}(undef,n)
nsamples::Vector{Float64}=[mean(rand(d,100)) for _ in 1:n]

hist(nsamples)