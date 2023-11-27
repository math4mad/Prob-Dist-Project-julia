
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  nothing  5张牌点数全不同, levels(nums)==5, 至少有两个花色

=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

total_space,total_size=texa_holdm

### 2.  
   ###   one paris 
    function nothing_cond(arr::Array)
        nums=Int[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end  
        suit_len=levels(suits)|>length
        num_len=levels(nums)|>length
        return (num_len==5)&&(nums≠[nums[1]:nums[end]...])&&(suit_len>1)
        

    end

    nothing_prob=filter(x->nothing_cond(x),total_space)|>length   #1312740
    
    
    
    




    





