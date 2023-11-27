using Distributions, GLMakie, Random, Pipe

vecs = [[0.1, 0.1, 0.1], [0.2, 0.2, 0.2], [1, 1, 1], [2, 2, 2], [6, 6, 6], [10, 10, 10], [20, 20, 20], [50, 50, 50], [100, 100, 100]]
sas = @pipe vecs |> Dirichlet.(_) |> rand.(_, 1000)

xs = ys = zs = range(0, 1, 100)
#data = [Point3(x, y, z) for x in xs, y in ys, z in zs] |> d -> filter(x -> sum(x) == 1, d)
data = [Point3(x, y, z) for x in xs, y in ys, z in zs] |> d -> filter(x -> sum(x) == 1, d)

function plot_res()
    fig = Figure(resolution=(900, 900))
    axs = [Axis3(fig[i, j]; elevation=0.15pi, azimuth=0.25pi) for i in 1:3, j in 1:3]

    for (ax, sa, vec) in zip(axs, sas, vecs)
        ax.title = "$vec"

        lines!(ax, [1, 0, 0, 1], [0, 1, 0, 0], [0, 0, 1, 0], color=(:lightgreen, 0.4),linewidth=4)
        scatter!(ax, eachrow(sa)...; markersize=6, color=(:orange, 0.8))
        hidedecorations!(ax)
        hidespines!(ax)
    end


    fig
end

fig=plot_res()


