

using GLMakie
GLMakie.activate!()
vertices = [
    
    1 0 0
    0 1 0
    0 0 1
    ]
faces = [
    1 2 3
    ]
m = GLMakie.Mesh(GLMakie.Makie.to_vertices(vertices), GLMakie.Makie.to_triangles(faces))
mesh(m;transparency=true,color=(:green,0.5))


