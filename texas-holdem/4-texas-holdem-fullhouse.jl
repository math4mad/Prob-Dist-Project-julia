include("./utils.jl")
using Combinatorics,DataFrames,StatsBase

total_space,total_size=texa_holdm
###2.  full house  五张牌, 三张点数一样, 两张点数一样

    """
        full_house_cond(arr::Array)::Bool
        筛选 full_house 的机会
        对牌面点数用 Set 统计点数种类,如果是两种点数可以继续操作

        然后对两种点数的扑克牌计数, 任意点数牌为三张就满足 full_house
        条件


    """
    function  full_house_cond(arr::Array)::Bool
        nums=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
        end   
        
        elems=Set(nums)|>collect
        res=false
        
        if length(elems)==2
            r1=count(i->(i==elems[1]), nums)
            r2=count(i->(i==elems[2]), nums)
            res=r1==3||r2==3
        end
        return res
    end


    function  full_house_cond2(arr::Array)::Bool
        nums=Int[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
        end   
        
        lev=counts(nums)|>d->sort!(d;rev=true) #按频数逆序排列
        return (lev[1]==3)&&(lev[2]==2)
    end

#full_house_prob=filter(x->full_house_cond2(x),total_space)|>length #3744




