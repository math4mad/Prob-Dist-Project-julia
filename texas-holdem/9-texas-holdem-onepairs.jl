
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  two-pairs  有一对牌点数一样, 3 张牌点数不同

=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

total_space,total_size=texa_holdm

### 2.  
   ###   one paris 
    function one_pairs_cond(arr::Array)
        nums=Int[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end  
        #lev= counts(nums)|>d->sort!(d;rev=true)
        len=levels(nums)|>length
        #return  (lev[1]==2)&&(lev[2]==1)&&(lev[3]==1)&&(lev[4]==1)
        return len==4
        

    end

one_pairs_prob=filter(x->one_pairs_cond(x),total_space)|>length    #1098240







    





