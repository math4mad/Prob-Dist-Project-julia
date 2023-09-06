"""
多元微积分 page 208  二元微分的图片 绘制
https://beautiful.makie.org/dev/examples/generated/2d/meshes/how_to_cube/
使用函数 func(x,y)=−𝑒^(−x^2−y^2)  多元微积分 page 31 习题


https://beautiful.makie.org/dev/examples/generated/2d/mscatters/SSAO_mgrid/ 打开 sso

从 9X9  乘法表开始表示矩阵的特性
f(x,y)=x*y  也是点积, 可以认为是衡量两个数的相似性
"""

using GLMakie,Statistics
GLMakie.activate!(ssao=true)
GLMakie.closeall() 


struct Pair
    xs::Vector{Int}
    ys::Vector{Int}
end

"""
    cubic(;x=0,y=0,h=3,w=w)

    # 绘制长方体的方法
    ## params

    -  x,y  起始点的坐标
    -  w    底边正方形的宽度
    -  h    立方体的高度
"""
function  make_cubic(;x=0,y=0,h,w=1)
    return  Rect3f(Vec3f(x,y,0), Vec3f(w,w,h))
end



fig = Figure(resolution = (800, 800))
ssao = Makie.SSAO(radius = 8.0, blur = 3)
ax1 = LScene(fig[1, 1]; show_axis=false, scenekw=(ssao=ssao,))
ax1.scene.ssao.bias[] = 0.025

paras1=Pair(Vector(1:9),Vector(1:9))
paras2=Pair([1:5...,5:-1:1...],[1:5...,5:-1:1...])
paras3=Pair(Vector(1:16),Vector(1:16))
paras4=Pair(Vector(1:16),Vector(16:-1:1))
paras5=Pair(repeat([1,2],4),repeat([1,2],4))
paras6=Pair(repeat([1,2,3],3),repeat([1,2,3],3))
paras7=Pair(rand(1:10,10),rand(1:10,10))
paras8=Pair(repeat([1,2,2,1],4),repeat([1,2,2,1],4))
paras9=Pair(Vector(1:4),Vector(4:-1:1))

function  plot_table(pair::Pair,fig=fig)
    xlen,ylen=length(pair.xs),length(pair.ys)
    xrange,yrange=1:xlen,1:ylen
    for i in  xrange
        for j in yrange
            cub=make_cubic(;x=i,y=j,h=pair.xs[i]*pair.ys[j],w=0.9)
            mesh!(ax1, cub; color=:lightblue, transparency=false,ssao=true)
            wireframe!(ax1, cub;color=(:black,0.8))

        end
    end
    return fig
end
fig=plot_table(paras7)
save("paras7.png",fig)




