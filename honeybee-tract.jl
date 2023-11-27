
"""
[ref](snippetslab://snippet/79D79B8A-7CD1-4475-BCF2-9C9032B07219)
"""

using Distributions,GLMakie,Random
Random.seed!(12123)

irange=range(-10,10,100)
jrange=krange=range(-1,1,100)
pos=[Point3f(i,j,k) for  i in irange, j in jrange, k in krange]
res=rand(pos,1000)
function plot_res()
    fig=Figure()
    ax=Axis3(fig[1,1])
    ax.limits=(0,20,0,20,0,20)
    scatter!(ax,res)
    fig
end
plot_res()
