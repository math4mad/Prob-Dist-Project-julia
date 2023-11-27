#= 
    """
    @ref :https://rss.onlinelibrary.wiley.com/doi/10.1111/j.1740-9713.2019.01315.x
    """ 
=#

using  Distributions

λ=0.932;d=Poisson(λ)  # λ 使用观测数据计算,参见文献

hit_bomb_times=Vector(0:6) # 定义遭受 v2 飞弹攻击的次数

expected_values=[pdf(d,times)*576|>d->round(d,digits=2) for times in hit_bomb_times]
