#= 
https://www.mathsisfun.com/activity/dice-experiment-2.html
=#

using GLMakie
data=[i+j for i in 1:6,j in 1:6]

function plot_res()
  fig=Figure()
  ax=Axis(fig[1,1];yreversed=true)
  
  heatmap!(ax,data)
  fig
end
plot_res()