
### 1. reference
    #=
    ref :https://www.statology.org/negative-binomial-vs-poisson/

    negative-binomial-data.csv
    ["offers", "division", "exam"]
    =#

### 2. loading package
    using HypothesisTests,GLM,RCall,Pipe,CSV,DataFrames,UnicodePlots

### 3. make csv from R code
    #= R"""
        data <- data.frame(offers = c(rep(0, 700), rep(1, 100), rep(2, 100),
                                    rep(3, 70), rep(4, 30)),
                        division = sample(c('A', 'B', 'C'), 100, replace = TRUE),
                        exam = c(runif(700, 60, 90), runif(100, 65, 95),
                                    runif(200, 75, 95)))
        """
        df=@rget data
        CSV.write("negative-binomial-data.csv",df) 
    =#



### 4.  reg:  p_model  poisson reg model, n_model: negative binomial reg

    data=CSV.File("./data/negative-binomial-data.csv")|>DataFrame

    p_model=lm(@formula(offers ~division+exam), data) 
    n_model = negbin(@formula(offers ~division+exam), data,LogLink())
    p_resid=residuals(p_model)
    #n_resid=residuals(n_model)

### plot residues
    fitting=predict(n_model,select(data,[:division,:exam]))
    #scatterplot(fitting,p_resid)
    
    




