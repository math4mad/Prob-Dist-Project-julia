"""
从乘法口诀表中探索矩阵问题
"""

using GLMakie,LinearAlgebra,Pipe,Random
Random.seed!(34343)

struct Pair
    xs::Vector{Int}
    ys::Vector{Int}
end
make_matrix=(pair::Pair)->[x*y for x in pair.xs, y in pair.ys]
function plot_matrix(pair::Pair)
    matrix=make_matrix(pair)
    xlen,ylen=length(pair.xs),length(pair.ys)
    xrange,yrange=1:xlen,1:ylen
    fig=Figure(resolution=(700,350))
    ax1=Axis(fig[1,1])
    ax2=Axis3(fig[1,2])
    @pipe (xrange,yrange,matrix)|>[heatmap!(ax1,_...),surface!(ax2,_...)]
    fig
end
paras1=Pair(Vector(1:9),Vector(1:9))
paras2=Pair([1,2,3,4,5,4,3,2,1],[1,2,3,4,5,4,3,2,1])
paras3=Pair(Vector(1:16),Vector(1:16))
paras4=Pair(Vector(1:16),Vector(16:-1:1))
paras5=Pair(repeat([1,2],4),repeat([1,2],4))
paras6=Pair(repeat([1,2,3],3),repeat([1,2,3],3))
paras7=Pair(rand(1:10,10),rand(1:10,10))
paras8=Pair(repeat([1,2,2,1],4),repeat([1,2,2,1],4))
plot_matrix(paras8)
