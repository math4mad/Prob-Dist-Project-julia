"""
from  Understanding Regression Analysis_ A Conditional Distribution Approah-CRC (2020).pdf  cover
./imgs/regression-dist.jpg
./imgs/normal-noise-data.png

实验数据是真实函数值和随机正态分布值的和
ϵ=rand(normal_dist)
data(x)=f(x)+ε

即: 数据值是受到概率分布的影响. 泛化的观点, 复杂的数据可以用概率分布来对噪音进行建模
"""

using GLMakie,Distributions,Random
Random.seed!(34343)
step=80
xs=ys=range(-4,4,step)
zs=range(0,1,step)

noise_dist=Normal(0,0.4)

f(x)=sin(x)
data=f.(xs)
noise=rand(noise_dist,step)
noise_data=data+noise
zsd=fill(0,step)

fig=Figure(resolution=(800,600))
ax=Axis3(fig[1,1],limits=(-4,4,-4,4,0,1),aspect = (1.5, 1, 2/3))

lines!(ax, xs, data,zsd, linestyle=:dot, linewidth=8,color=(:red, 0.8),label="real data")
scatter!(ax, xs, noise_data,zsd,marker=:circle,markersize=16,color=(:lightgreen,0.1)
,strokewidth=2,strokecolor=:black,label="noise data")

for i in [-2,0,2]
    local dist=Normal(i,0.4)
    local data=[Point3f(i,y,pdf(dist,y)) for y in ys]
    lines!(ax, data,label="noise dist at $i")
end

axislegend(ax)
fig
#save("./imgs/normal-noise-data.png",fig)


#=xzpanelvisible=false,yzpanelvisible=false,
zticksvisible=false,zticklabelsvisible=false,zspinesvisible=false =#