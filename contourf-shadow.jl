using GLMakie


f = Figure()
Axis(f[1, 1])

xs = LinRange(0, 10, 100)
ys = LinRange(0, 15, 100)
zs = [cos(x) * sin(y) for x in xs, y in ys]

contourf!(zs,levels=-1:0.2:1;depth_shift=0)

save("contourf-shadow.png",f)