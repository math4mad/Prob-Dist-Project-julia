
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  flush: 5张牌 suit 一样
  判断条件: bool_suits=Set(suits)|>length==1
  suit 集合如果只有一个元素

  最后的频数需要减掉 royal flush(4) and straight flush (36)
=#
include("./utils.jl")
using Combinatorics,Pipe

total_space,total_size=texa_holdm

###2.  


"""
    flush_cond(arr::Array)

    flush 条件

    `push!(suits,arr[idx][1])`

    `bool_suits=Set(suits)|>length==1`
"""
function flush_cond(arr::Array)
        nums=[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end   
        bool_suits=Set(suits)|>length==1
        return bool_suits

end
flush_prob=filter(x->flush_cond(x),total_space)|>length  # 5148



    





