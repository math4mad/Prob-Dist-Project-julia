#= 
https://discourse.julialang.org/t/makie-series-plot-with-only-one-label-for-legend/105403
=#

using GLMakie, Statistics

trial_1 = [1, 5, 3]
trial_2 = [2, 9, 1]
trial_3 = [4, 2, 7]
trials = [trial_1 trial_2 trial_3]


colors = [:blue, :red]
function plot_res()
    fig = Figure()
    ax = Axis(fig[1, 1])
    series!(ax, trials, solid_color=colors[1])
    lines!(ax, vec(mean(trials, dims=1)), color=colors[2], label="mean")
    elems = [PolyElement(color=c, strokecolor=:blue, strokewidth=1) for c in colors]
    Legend(fig[1, 2], elems, ["Trials", "Mean"])
    fig

end

fig=plot_res();save("one-label.png",fig)

