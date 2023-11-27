using GLMakie 
f(k)=(1//2)^k 
xs=1:8
stem(xs, f.(xs))