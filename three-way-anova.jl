#= 
  [How to Perform a Three-Way ANOVA in R](https://www.statology.org/three-way-anova-in-r/)
=#

using RCall,DataFrames

R"""
df <- data.frame(program=rep(c(1, 2), each=20),
                 gender=rep(c('M', 'F'), each=10, times=2),
                 division=rep(c(1, 2), each=5, times=4),
                 height=c(7, 7, 8, 8, 7, 6, 6, 5, 6, 5,
                          5, 5, 4, 5, 4, 3, 3, 4, 3, 3,
                          6, 6, 5, 4, 5, 4, 5, 4, 4, 3,
                          2, 2, 1, 4, 4, 2, 1, 1, 2, 1)) 
    model <- aov(height ~ program * gender * division, data=df)
    summary(model)
"""


