
#= 
   blackjack 有一张牌为 Ace, 另一张牌为 10,j,q,k 任意一张

=#
include("./utils.jl")
using Combinatorics,Pipe,StatsBase,DataFrames

function  blackjack_cond(arr::Array)
    nums=Int[]
    suits=[]
    for idx in eachindex(arr)
        push!(nums,arr[idx][2])
        push!(suits,arr[idx][1])
    end  
    return (nums[1]==1||nums[2]==1)&&(nums[1] in [10:13...]||nums[2] in [10:13...])
end

blackjace_prob=filter(x->blackjack_cond(x),total_space2)|>length
"blackjace_prob"=>blackjace_prob/length(total_space2)