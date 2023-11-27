
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  four of a kind : 4张牌数字一样, 一张不同
=#
include("./utils.jl")
using Combinatorics,Pipe

total_space,total_size=texa_holdm

### 2.  
   ###  Four of a Kind  四张同点数, 一张不同
    function four_kind_cond(arr::Array)
        nums=[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end   
        
        elems=Set(nums)|>collect
        res=false
        if length(elems)==2
            r1=count(i->(i==elems[1]), nums)
            r2=count(i->(i==elems[2]), nums)
            res=r1==4||r2==4
        end
        return res

    end

four_kind_prob=filter(x->four_kind_cond(x),total_space)|>length

    





