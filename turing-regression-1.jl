"""
在./regression-vis.jl 中我们利用函数和随机噪音构建了一个数据集, 
这个过程是正向的, 在实际的实验中, 我们是从数据点出发去寻找最有可能生成这个数据集的模型
在本例中.我们假设函数已知, 然后去搜寻最有可能产生数据噪音的分布
"""

using GLMakie,Distributions,Random
Random.seed!(34343)
step=80
xs=ys=range(-4,4,step)
zs=range(0,1,step)


zsd=fill(0,step)

data=(let
    noise_dist=Normal(0,0.4)
    data=sin.(xs)
    noise=rand(noise_dist,step)
    noise_data=data+noise
    return noise_data end)()


