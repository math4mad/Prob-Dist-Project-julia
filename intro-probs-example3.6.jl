using GLMakie
xs=[0,1,4]
ys=[1//4,2//4,1//4]
cum_ys=cumsum(ys)

function plot_pmf_cdf()
    fig=Figure(resolution=(600,300))
    axs=[Axis(fig[1,i]) for i in 1:2]
    axs[1].title="PMF"
    axs[2].title="CDF"
    stem!(axs[1],xs,ys)
    stairs!(axs[2],xs,cum_ys)
    fig

end

fig=plot_pmf_cdf()
save("intro-probs-example3.6.png",fig)