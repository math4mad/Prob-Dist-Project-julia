#= """
标准误计算包括两个参数, 总体或者样本标准差和采样的样本容量
一般来说,总体标准差未知
标准误度描述的是采样过程的性质. 如果总体变异较小, 样本容量较少就可以比较好的获得总体的性质,
如果总体变异较大, 需要从总体中抽出较多的个体才能近似的代表总体的性质
""" =#

using Distributions,Statistics,GLMakie

d1=DiscreteUniform(1,100)



function plot_res()
    fig=Figure()
    for (idx, c) in enumerate([10,100,500,1000,2000])
         ax=Axis(fld1(idx...),title="n=$c")
         data=[rand(d1,50) for _ in 1:500].|>mean
    end
end

