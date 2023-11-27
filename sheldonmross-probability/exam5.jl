
using  Combinatorics
### 1  5a
    #= 
    掷两枚色子, 点数合计为 7 的概率
    =#
    total=[[x,y] for x in 1:6, y in 1:6]
    sum7=filter(x->sum(x)==7,vec(total))
    length(sum7)//length(total)

###  2  5b      6个白球, 5 个黑球, 取出三个,恰好一个白球,两个黑球的概率

total2=permutations([repeat('w',6)...,repeat('b',5)...], 3)|>collect

cond(x)=(x[1]=='w'&&x[2]=='b'&&x[3]=='b')||(x[1]=='b'&&x[2]=='w'&&x[3]=='b')||(x[1]=='b'&&x[2]=='b'&&x[3]=='w')
res2=filter(x->cond(x),total2)

"恰好一个白球,两个黑球的概率"=>length(res2)//length(total2)
#"恰好一个白球,两个黑球的概率" => 4//11

### 3. 6个男人, 9 个女人,选取 5 人委员会, 由 3 个男性,2 个女性概率多大?
        function get_man(arr::Array)::Bool
            num=0
            for idx in   eachindex(arr)
                arr[idx]=='m' ? num+=1 : nothing
            end   

            return  num==3 ? true : false
            
        end

    total3=permutations([repeat('m',6)...,repeat('w',9)...], 5)|>collect
    res3=filter(x->get_man(x),total3)
    " 3个男性,2个女性委员会概率"=>length(res3)//length(total3)
    

#### 5f  一手牌是顺子的概率有多大?
colors5=["♥️","♠️","♦️","♣️"]
numbers5=[1:10...,11,12,13] # 1 for A, 11-13 for  J,Q,K
poker=[[color,num] for color in colors5,num in numbers5]|>vec

#= 
  ["♥️", 1]
  ["♠️", 1]
  ["♦️", 1]
 ⋮
 ["♠️", 13]
 ["♦️", 13]
 ["♣️", 13]
=#

total5=combinations(poker,5)|>collect

function cond5(arr)
    nums=[]
    colors=[]
    for idx in eachindex(arr)
        push!(nums,arr[idx][2])
        push!(colors,arr[idx][1])
    end   
    sort!(nums;rev=true) #[5,4,3,2,1]
    color_bool=!(colors[1]==colors[2]==colors[3]==colors[4]==colors[5])
    nums_bool=(nums[1]-nums[2]==1)&&(nums[2]-nums[3]==1)&&(nums[3]-nums[4]==1)&&(nums[4]-nums[5]==1)
    return  color_bool&&nums_bool
    
end

res5=filter(x->cond5(x),total5)

# 概率还不对
"抽出五张牌为顺子的概率为"=>length(res5)/length(total5)

### 5g   full house  五张牌, 三张点数一样, 两张点数一样

function  cond5g(arr)
        nums=[]
        for idx in eachindex(arr)
            push!(nums,arr[idx][2])
        end   
        
        return Set(nums)|>length==2
end

res5g=filter(x->cond5g(x),total5)

"full-house 概率"=> length(res5g)

###  Royal Flush

function cond_royalflush(arr::Array)
    nums=[]
    suits=[]
    for idx in eachindex(arr)
        push!(nums,arr[idx][2])
        push!(suits,arr[idx][1])
    end   
    bool_suits=Set(suits)|>length==1
    sort!(nums)
    bool_nums=nums[2]==10&&nums[3]==11&&nums[4]==12&&nums[5]==13&&nums[1]==1
    return bool_suits&&bool_nums
 
end
res_royalflush=filter(x->cond_royalflush(x),total5)

"royalflush 概率"=>length(res_royalflush)//length(total5)

###  straight_flush
#= 
  因为这里 用 1 表示A 
  所以 royalflush [1,10,11,12,13] 不满足bool_nums条件 
  straight_flush 有 36种 
  @ref https://www.intmath.com/counting-probability/poker.php
=#
function straight_flush_cond(arr::Array)
    nums=[]
    suits=[]
    for idx in eachindex(arr)
        push!(nums,arr[idx][2])
        push!(suits,arr[idx][1])
    end   
    bool_suits=Set(suits)|>length==1
    sort!(nums;rev=true)    #[5,4,3,2,1]
    bool_nums=(nums[1]-nums[2]==1)&&(nums[2]-nums[3]==1)&&(nums[3]-nums[4]==1)&&(nums[4]-nums[5]==1)
    return  bool_suits&&bool_nums

end

straight_flush=filter(x->straight_flush_cond(x),total5)|>length


###  Four of a Kind  四张同点数, 一张不同
function four_kind_cond(arr::Array)
    nums=[]
    suits=[]
    for idx in eachindex(arr)
        push!(nums,arr[idx][2])
        push!(suits,arr[idx][1])
    end   
    
    elems=Set(nums)|>collect
    res=false
    if length(elems)==2
        r1=count(i->(i==elems[1]), nums)
        r2=count(i->(i==elems[2]), nums)
        res=r1==4||r2==4
    end
    return res

end

four_kind_len=filter(x->four_kind_cond(x),total5)
"four_kind 概率"=>length(four_kind_len)/length(total5)



