### 1. desc
    #= 
      袋子里有 12 个球,  8 个白球,  抽取四个球, 其中有三个白球, 第一个,第三个是白球的概率,分为放回抽样和无放回抽样
    =#

    using  Distributions

    d=Binomial(4,8//12)

    pdf(d,3)    