
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  two-pairs  有两对牌点数一样, 1 张不同

=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

total_space,total_size=texa_holdm

### 2.  
   ###   two paris 
    function two_pairs_cond(arr::Array)
        nums=Int[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end  
        lev= counts(nums)|>d->sort!(d;rev=true)
        return  (lev[1]==2)&&(lev[2]==2)&&(lev[3]==1)
        

    end

two_pairs_prob=filter(x->two_pairs_cond(x),total_space)|>length    #123552







    





