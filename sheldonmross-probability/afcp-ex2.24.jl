#= 
同时扔两枚骰 子点数之和为i 的概 率是多 大? 并求 出i= 2，3，...，11，12 时的值
=#

using Combinatorics,DataFrames

total_space=[[i,j] for i  in 1:6 for j in 1:6]
total_size=length(total_space)
for i in 2:12
    res=filter(x->sum(x)==i,total_space)
    @info "$i"=>res
end
#= 
    [ Info: "2" => [[1, 1]]
    [ Info: "3" => [[2, 1], [1, 2]]
    [ Info: "4" => [[3, 1], [2, 2], [1, 3]]
    [ Info: "5" => [[4, 1], [3, 2], [2, 3], [1, 4]]
    [ Info: "6" => [[5, 1], [4, 2], [3, 3], [2, 4], [1, 5]]
    [ Info: "7" => [[6, 1], [5, 2], [4, 3], [3, 4], [2, 5], [1, 6]]
    [ Info: "8" => [[6, 2], [5, 3], [4, 4], [3, 5], [2, 6]]
    [ Info: "9" => [[6, 3], [5, 4], [4, 5], [3, 6]]
    [ Info: "10"=> [[6, 4], [5, 5], [4, 6]]
    [ Info: "11"=> [[6, 5], [5, 6]]
    [ Info: "12"=> [[6, 6]]
=#