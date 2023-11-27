
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  Ten, J, Q, K, A of one suit  
  共有四种机会
=#
include("./utils.jl")
using Combinatorics,Pipe

total_space,total_size=texa_holdm

###2.  
    """
            royal_flush_cond(arr::Array)::Bool
            皇家 flush 的条件
            
            同一 suit
            从小到大排列为:[10,11,12,13,14] 
            for  10,J,Q,K,A
    """
        function  royal_flush_cond(arr::Array)::Bool
            nums=[]
            suits=[]
            for idx in eachindex(arr)
                push!(nums,arr[idx][2])
                push!(suits,arr[idx][1])
            end   
            bool_suits=Set(suits)|>length==1
            bool_nums=sort(nums)|>d->d==[10:14...]
            return bool_suits&&bool_nums
        end

royal_flush_prob=filter(x->royal_flush_cond(x),total_space)|>length

    





