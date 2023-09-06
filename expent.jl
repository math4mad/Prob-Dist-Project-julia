
using GLMakie,Distributions,Random

d=Exponential(0.1)
xs=range(0,4,100)
lines(xs,pdf.(d,xs))