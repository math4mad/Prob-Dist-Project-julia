### 1. ref
    #= p169
     筛选disc: 
     disc=[Point2([x,y]) for x=xs, y=ys if sqrt(x^2+y^2)<1 ]
    =#
        

### 2. load package
    using Distributions,Random, GLMakie,GeometryBasics
    Random.seed!(1223)

### 3. get data collection
    xs=ys=range(-1,1,100)
    disc=[Point2([x,y]) for x=xs, y=ys if sqrt(x^2+y^2)<1 ]
    sample=rand(disc,1000)

### 4. plot data collection 

    style=(marker=:circle,markersize=10,color=(:lightgreen,0.1),strokewidth=1,strokecolor=:black)
    fig=scatter(sample;style...)
    #save("./Introduction to Probability with Texas Hold'em/imgs/disc-random-simulation.png",fig)
