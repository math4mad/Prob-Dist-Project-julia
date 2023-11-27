using GLMakie,Distributions
prob_arr=[0.1,0.3,0.5,0.7,0.9]
dists=[Bernoulli(p)  for p in prob_arr]

ma(dist)=[rand(dist) for  _ in 1:12,_ in 1:12]

data=[ma(d) for d in dists]

function plot_matrx()
fig=Figure()
    for  idx  in  1:4
         ax=Axis(fig[1,idx])
         ax.title="$(prob_arr[idx])"
         heatmap!(ax,data[idx])
    end
fig 
end
plot_matrx()