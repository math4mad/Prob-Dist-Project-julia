
#= 
  @ref https://www.intmath.com/counting-probability/poker.php
  straightflush: 5张牌数字连续, 除开 royalflush 
  sort!(num)
  bool_nums= nums==Vector(nums[1]:1:nums[end])
  5张牌数字 等于步长为 最小值:1:最大值的数组
=#
include("./utils.jl")
using Combinatorics,Pipe

total_space,total_size=texa_holdm

###2.  

"""
    straight_flush_cond(arr::Array)
     

"""
function straight_flush_cond(arr::Array)
        nums=[]
        suits=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
            push!(suits,arr[idx][1])
        end   
        bool_suits=Set(suits)|>length==1
        sort!(nums)    #[5,4,3,2,1]
        #bool_nums=(nums[1]-nums[2]==1)&&(nums[2]-nums[3]==1)&&(nums[3]-nums[4]==1)&&(nums[4]-nums[5]==1)
        bool_nums= nums==Vector(nums[1]:1:nums[end])
        return  bool_suits&&bool_nums

    end

straight_flush_prob=filter(x->straight_flush_cond(x),total_space)|>length #36

    





