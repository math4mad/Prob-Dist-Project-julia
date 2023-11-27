using GLMakie
xs=ys=zs=range(0,1,100)
data=[Point3(x,y,z) for x in xs, y in ys , z in zs ]|>d->filter(x->sum(x)==1,d)

fig=Figure()
ax=Axis3(fig[1,1])
scatter!(ax,data;size=2,color=(:lightgreen,0.5))
lines!(ax,[1,0,0],[0,1,0],[0,0,1])
fig