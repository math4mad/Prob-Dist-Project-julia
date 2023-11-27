
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  straight: 5张牌数字连续, 除开 royalflush 
=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

total_space,total_size=texa_holdm

###2.  

"""
    straight_cond(arr::Array)
    5张连牌, 除开royal flush and straight flush

"""
function straight_cond(arr::Array)
        nums=[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end   
        
        sort!(nums;rev=true)    #[5,4,3,2,1]
        # bool_nums=(nums[1]-nums[2]==1)&&(nums[2]-nums[3]==1)&&(nums[3]-nums[4]==1)&&(nums[4]-nums[5]==1)
        bool_nums= nums==Vector(nums[1]:1:nums[end])
        return   bool_nums

end

straight_prob=filter(x->straight_cond(x),total_space)|>length   #9216





