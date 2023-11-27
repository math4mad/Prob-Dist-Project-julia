
# 1. question 
    #= @ref :https://corporatefinanceinstitute.com/resources/data-science/poisson-distribution/
    Say that, on average, the daily sales volume of 60-inch 4K-UHD TVs at XYZ Electronics is five.
    Calculate the probability of XYZ Electronics selling nine TVs today. 
    =#

#2. loading package
    using  Distributions

#3. according to question  defining Distributions
    λ=5;d=Poisson(λ)

#4. computing 
# 每日平均卖出 5 台 HDTV, 卖出 9 台的概率为?
    pdf(d,9)*100   #=>0.036

