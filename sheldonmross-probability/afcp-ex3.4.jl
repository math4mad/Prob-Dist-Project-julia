### 1. question 
    #= 
        概率论基础教程-Sheldon M. Ross(2014).pdf
        ex3.4 掷 两 枚 均 匀 骰 子 ， 求 给 定 两 枚 骰 子 点 数 之 和 为i 的 条 件 下 ， 至少有一枚是 6 的条件概率
    =#

### 2. total probablity  space  
    ma=[[x,y] for x in 1:6, y in 1:6]|>d->reshape(d,(1,36))|>vec
    span=2:12
### 3. according to condition to get sub  probablity  space 
    
    pA=[filter(x->sum(x)==i,ma) for i in span]
    #= 
        [[1, 1]]
        [[2, 1], [1, 2]]
        [[3, 1], [2, 2], [1, 3]]
        [[4, 1], [3, 2], [2, 3], [1, 4]]
        [[5, 1], [4, 2], [3, 3], [2, 4], [1, 5]]
        [[6, 1], [5, 2], [4, 3], [3, 4], [2, 5], [1, 6]]
        [[6, 2], [5, 3], [4, 4], [3, 5], [2, 6]]
        [[6, 3], [5, 4], [4, 5], [3, 6]]
        [[6, 4], [5, 5], [4, 6]]
        [[6, 5], [5, 6]]
        [[6, 6]]
    =#

### 4. computing  conditional probability
    condition(x::Array)::Bool=x[1]==6||x[2]==6
    for (idx,arr) in zip(span,pA)
        local pB=filter(x->condition(x),arr)
        @info "i=$(idx)"=>length(pB)//length(arr)

    end
    #= 
        [ Info: "i=2" => 0//1
        [ Info: "i=3" => 0//1
        [ Info: "i=4" => 0//1
        [ Info: "i=5" => 0//1
        [ Info: "i=6" => 0//1
        [ Info: "i=7" => 1//3
        [ Info: "i=8" => 2//5
        [ Info: "i=9" => 1//2
        [ Info: "i=10" => 2//3
        [ Info: "i=11" => 1//1
        [ Info: "i=12" => 1//1
    =#

    