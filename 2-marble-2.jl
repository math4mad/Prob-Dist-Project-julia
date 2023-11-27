
"""
与 2-marble 方法相同, 改用 struct 定义
"""


"定义袋子类型"
struct Bag
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
    new_bag_space(bag::Bag, pick::Ball=red)::Bag
从 bag 取出 pick 球(枚举的颜色)以后,返回新的概率空间

"""
function new_bag_space(bag::Bag, pick::Ball=red)::Bag
    (; red, blue, green) = bag
    ball = Int(pick)
    arr = if ball == 1
        [red - 1, blue, green]
    elseif ball == 2
        [red, blue - 1, green]
    else
        [red, blue, green - 1]
    end
    return Bag(arr...)
end


"""
    prob(bag::Bag, pick::Ball)

从 bag 中取出 pick 球的概率
"""
function prob(bag::Bag, pick::Ball)
    (; red, blue, green) = bag
    prob_size = sum_bag(bag)
    ball = Int(pick)
    probs =
        if ball == 1
            red // prob_size
        elseif ball == 2
            blue // prob_size
        else
            green // prob_size
        end
    return probs
end



bag = Bag(15, 18, 10)
sum_bag(bag) = +(bag.red, bag.blue, bag.green)
init_size = sum_bag(bag)

pr1 = prob(bag, red)
bag2 = new_bag_space(bag, red)
pr2=prob(bag2,red)
pr1*pr2
(:first=>pr1,:second=>pr2,:total=>(pr1*pr2))


