#= 
用6 个字母PEPPER进行排列，一共有多少种不同的排列方式
=#

using Combinatorics,Pipe

arr=['p','e','p','p','e','r']

# 由于三个'p' 的组合没有差异, 所以内部的组合是一样的, 类似 'e' 也一样,有 3!X2! 中排列相同
# 所有中的排列方式有
factorial(6)/(factorial(3)*factorial(2))


arr2=Vector('a':'e')

combinations(arr2,3)|>length

# examp4a
combinations(1:20,3)|>length

#examp4b
woman=1:5
man=1:7
@pipe [combinations(woman,2),combinations(man,3)]|>length.(_)|>*(_...)

