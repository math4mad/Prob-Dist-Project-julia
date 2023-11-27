
"""
与 2-marble-2 方法相同, struct 简化方法,使用 mutable struct
这个方法不能用, 测试不通过. 原位修改会出问题, 直接用 struct,不修改原 struct
直接建立新的
"""


"定义袋子类型"
mutable struct Bag
    red::Int
    blue::Int
    green::Int
end

"""
枚举限定球种类
@ref:snippetslab://snippet/6016DF64-9B90-420E-83F7-7C6FF7D4A139
"""
@enum Ball red = 1 blue = 2 green = 3



"""
    new_bag_space_prob(bag::Bag, pick::Ball=red)::Tuple{Bag,Real}

从 bag 中取出 pick球以后, 返回取出该球的概率和取出该球之后的概率空间

如果取出的球为红色,定义新的(Bag([red - 1, blue, green]...) eg.
"""
function new_bag_space_prob(bag::Bag, pick::Ball=red)::Tuple{Bag,Real}
    (; red, blue, green) = bag # struct 解构
    ball = Int(pick) # @enum 类型需要转换为整型
    prob_size =+(red,blue,green)  # 合计球总数
    res::Tuple{Bag,Real} = if ball == 1
        bag.red-=1
        (bag, red // prob_size)
    elseif ball == 2
        bag.blue-=1
        (bag, blue // prob_size)
    else
        bag.green-=1
        (bag, green // prob_size)
    end
    return res
end


bag = Bag(15, 18, 10)

res1 = new_bag_space_prob(bag, red)
res2 = new_bag_space_prob(res1[1], red)
res1[2] * res2[2]

