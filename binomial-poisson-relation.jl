### 1. question
    #= 
    Introduction to Probability for Data Science-Michigan Publishing (2021).pdf  p176
    当二项式分布的参数n 趋近于无穷大,p趋近于无穷小时, 泊松分布近似于二项式分布
    λ~np
    =#

#### 2. load  package
    using Distributions,GLMakie,Random
    Random.seed!(34343)

#### 3. define  distributions
    k=Vector(0:120)
    bio=Binomial(1000,0.05);poi=Poisson(50)
    pdf1=pdf.(bio,k);pdf2=pdf.(poi,k)


#### 4. plot 
    function plot_bio_poi()
        fig=Figure(resolution=(800,300))
        ax=Axis(fig[1,1])
        stem!(ax,k,pdf1;label=L"Bionmial(n=1000,p=0.05)")
        lines!(ax,k, pdf2; label=L"Possion(λ=50)",linewidth=2, color=:red)
        axislegend(ax)
        fig
    end

    fig=plot_bio_poi()
    #save("./imgs/binomial-poisson-relation.png",fig)

