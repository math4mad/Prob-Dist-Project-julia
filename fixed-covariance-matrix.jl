#= 
  http://127.0.0.1:8000/scikit-learn-docs/auto_examples/classification/plot_lda_qda.html#sphx-glr-auto-examples-classification-plot-lda-qda-py

  snippetslab://snippet/0F4A7EDD-CE01-48AA-9A5E-EBC4D08BB6A5
=#

import MLJ:transform,predict,predict_mode
using Distributions
using Turing
using GLMakie
using LinearAlgebra
using Random,DataFrames
using MLJ

# Set a random seed.
Random.seed!(3)

function dataset_fixed_cov()
    N = 300

    w = [0.5, 0.5]  #deine  weight of two distributions

    u1 = [0, 0]
    sigma1 = [0.5 1.0; 1.0 0.5]


    d1 = MvNormal(u1, sigma1+1e-8 * I)
    datax = rand(d1, 300)
    datay = datax .+ [1, 1]
    X = hcat(datax, datay)
    y = [fill(1, N)..., fill(0, N)...]
    return X,y
end

# X,y=dataset_fixed_cov()

# X=table(X')
# y=coerce(y, Multiclass)
# LDA = @load LDA pkg=MultivariateStats


# model = LDA()
# mach = machine(model, X, y) |> fit!
# Xproj = transform(mach, X)
# y_hat =predict(mach, X)
# labels = predict_mode(mach, X)
# data=DataFrame(X)
# data.labels=labels
# data.y=y
# gdf1=groupby(data,:y)
# gdf2=groupby(data,:labels)

# colors=[:green, :red]
function plot_res()
    
    fig=Figure()
    ax2=Axis(fig[1,2];title="fixed_cov_data")
    ax1=Axis(fig[1,1];title="data")
    for (idx,df) in enumerate(gdf2)
        scatter!(ax2,df[:,:x1],df[:,:x2];color=(colors[idx],0.4),strokewidth=1,strokecolor=:black)
    end
    for (idx,df) in enumerate(gdf1)
        scatter!(ax1,df[:,:x1],df[:,:x2];color=(colors[idx],0.4),strokewidth=1,strokecolor=:black)
    end
    fig
end
#plot_res()

