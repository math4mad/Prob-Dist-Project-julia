### 1. ref
    #= p169
     筛选菱形点: 
     diamond=[Point2([x,y]) for x=xs, y=ys if abs(x)+abs(y)<1 ]
    =#
        

### 2. load package
    using Distributions,Random, GLMakie,GeometryBasics
    Random.seed!(1223)

### 3. get data collection
    xs=ys=range(-1,1,100)
    diamond=[Point2([x,y]) for x=xs, y=ys if abs(x)+abs(y)<1 ]
    sample=rand(diamond,1000)

### 4. plot data collection 

    style=(marker=:circle,markersize=10,color=(:lightgreen,0.1),strokewidth=1,strokecolor=:black)
    fig=scatter(sample;style...)
    #save("./imgs/diamond-random-simulation.png",fig)
