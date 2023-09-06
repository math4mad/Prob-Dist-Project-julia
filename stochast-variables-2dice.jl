
"""
应用随机过程.pdf  page31
"""
sample_space=[(x,y) for x in 1:6 for y in 1:6]
total_size=length(sample_space)
for i in  2:12
    local filter_res=filter(p->p[1]+p[2]==i,sample_space)
    len=length(filter_res)
    @info "P{X=$i} =P{$(filter_res...)}=$len//$total_size"
end

#= 
    [ Info: P{X=2} =P{(1, 1)}=1//36
    [ Info: P{X=3} =P{(1, 2)(2, 1)}=2//36
    [ Info: P{X=4} =P{(1, 3)(2, 2)(3, 1)}=3//36
    [ Info: P{X=5} =P{(1, 4)(2, 3)(3, 2)(4, 1)}=4//36
    [ Info: P{X=6} =P{(1, 5)(2, 4)(3, 3)(4, 2)(5, 1)}=5//36
    [ Info: P{X=7} =P{(1, 6)(2, 5)(3, 4)(4, 3)(5, 2)(6, 1)}=6//36
    [ Info: P{X=8} =P{(2, 6)(3, 5)(4, 4)(5, 3)(6, 2)}=5//36
    [ Info: P{X=9} =P{(3, 6)(4, 5)(5, 4)(6, 3)}=4//36
    [ Info: P{X=10} =P{(4, 6)(5, 5)(6, 4)}=3//36
    [ Info: P{X=11} =P{(5, 6)(6, 5)}=2//36
    [ Info: P{X=12} =P{(6, 6)}=1//36
=#