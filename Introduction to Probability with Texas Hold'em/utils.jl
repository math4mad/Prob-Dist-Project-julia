using Combinatorics

# 1. define poker  total space 
suits=["♥️","♠️","♦️","♣️"]
digits=Vector(2:14) # for 2:10,J,Q,K,A


"52 张牌的牌面"
poker_face=[[color,num] for color in suits,num in digits]|>vec


"""
    pick_n_cards(n::Int)
    从一副牌中抽取 n 张的组合
"""
pick_n_cards(n::Int)=combinations(poker_face,n)|>collect


"""
    get_card_faces(arr::Array)::Tuple{Vector{Int},Vector{AbstractString}}
    
    从数组获得牌面的点数和suits
"""
function get_card_faces(arr::Array)::Tuple{Vector{Int},Vector{AbstractString}}
    nums=Vector{Int}(undef, 5)
    suits=Vector{AbstractString}(undef, 5)
    for idx in eachindex(arr)
        nums[idx]=arr[idx][2]
        suits[idx]=arr[idx][1]
    end  
    return (nums,suits)
end


"""
    pickup_kk_cond(arr::Array)::Bool
    抽出两张牌都是 King,King概率
"""
function pickup_kk_cond(arr::Array)::Bool
    nums,suits=get_card_faces(arr) 
    
    return sum(nums)==26&&(nums[1]==nums[2])
end

function pickup_aa_cond(arr::Array)::Bool
    nums,suits=get_card_faces(arr) 
    
    return sum(nums)==28
end