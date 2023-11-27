#= 
 @ref https://www.mathscareers.org.uk/taxicab-geometry/
 范数 1 的几何解释. 当出租车在城市里从一地到另一地时, 走的不是飞行直线,而只能沿着街道行走
 所以距离是沿着南北方向移动的距离加上东西方向移动的距离
=#

using GLMakie
xs=ys=0:0.04:8
fig=Figure(resolution=(600,600))
ax=Axis(fig[1,1];xticks=(0:8),yticks=(0:8))
scatter!(ax,[4],[4];marker=:circle,markersize=18,color=(:red,0.6),strokewidth=2,strokecolor=:black)



"""
    plot_norm1()
    plot 范数 1: taxicab distance
TBW
"""
function plot_norm1()
    xs=ys=0:8
    arr=[[x,y]  for  x in xs, y in ys]|>vec
    norm1=filter(x->(abs(x[1]-4)+(abs(x[2]-4)))==4,arr)|>d->Point2.(d)
    scatter!(ax,norm1;marker=:circle,markersize=14,color=(:lightgreen,0.6),
    strokewidth=2,strokecolor=:black)
end

"""
    plot_norm2()
    plot 范数 2:  欧式距离
"""
function plot_norm2()
    xs=ys=0:0.04:8
    arr=[[x,y]  for  x in xs, y in ys]|>vec
    norm2=filter(x->sqrt((x[1]-4)^2+((x[2]-4)^2))==4,arr)|>d->Point2.(d)
    scatter!(ax,norm2;marker=:circle,markersize=10,color=(:blue,0.6),strokewidth=2,strokecolor=:black)
end


#fig;save("./imgs/normal2.png",fig)


