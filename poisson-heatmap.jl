### 1. description
        #= 
        假设有 10000名顾客, 以λ的泊松分布致电客服中心, 
        我们可以理解为光子到达手机摄像头 ccd 的形式, 致电的标记为 1, 没有致电的标记为 0
        可以以 heatmap 形式表示
        伯努利分布描述了群体中当个个体的行为.  泊松分布是对整个群体行为的描述
        =#
### 2. load package
   
    using Distributions,GLMakie,Random
    Random.seed!(4545)
    #lambda_arr=[1,2,10,100,200,300]
### 3. define  Distributions
    n=100_00
    parrs=[0.01,0.02,0.05,0.1,0.2,0.5,0.7,0.9,0.99]
    #dists=[Bernoulli(p) for p in  parrs]
    
### 4. plot heatmap
    
    """
    make_data(p::Real,nrows=10,ncols=10)

    利用概率 `p` 生成  nrows*ncols 个 伯努利分布随机数据点矩阵
    """
    function make_data(p::Real,nrows=10,ncols=10)
            d=Bernoulli(p)
            data=rand(d,nrows*ncols)|>d->reshape(d,(nrows,ncols))
            return data
    end

    """
    plot_heatmap()

    绘制不同 p 值 随机采样伯努利分布数据矩阵 heatmap
    """
    function    plot_heatmap()
        fig=Figure(resolution=(900,900))
        for (idx,p) in enumerate(parrs)
            ax=Axis(fig[fldmod1(idx,3)...];title=L"p=%$p")
            data=make_data(p,30,30)
            heatmap!(ax,data)
            hidedecorations!(ax)
        end
        fig
    end

    fig=plot_heatmap()
    #save("./imgs/Bernoulli simulate  photon arrvie at camera ccd.png",fig)

    
    


