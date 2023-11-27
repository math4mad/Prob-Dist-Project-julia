
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  four of a kind : 3张牌数字一样, 2张不同
  StatsBase.counts 函数会对跳过的没有的点数计算为 0, 逆序排列后把 0 放在后面
  取出数组前三位做判断
  对取出的牌点数进行计数,从大到小排列,level[1]==3,level[2]==1,level[3]==1
   lev= counts(nums)|>d->sort!(d;rev=true)
   return  (lev[1]==3)&&(lev[2]==1)&&(lev[3]==1)
=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

total_space,total_size=texa_holdm

### 2.  
   ###  three of a Kind  3张同点数, 2张不同
    function three_kind_cond(arr::Array)
        nums=Int[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end  
        lev= counts(nums)|>d->sort!(d;rev=true)
        return  (lev[1]==3)&&(lev[2]==1)&&(lev[3]==1)
        
    end

#three_kind_prob=filter(x->three_kind_cond(x),total_space)|>length  # 54912


#levels([3,3,3,1,2])|>length



    





