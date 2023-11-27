#= 
 [An Introduction to the Hypergeometric Distribution - Statology](https://www.statology.org/hypergeometric-distribution/)

 例子非常好, 背景知识非常重要, 用扑克牌来做例子, 就不需要在背景知识上花费太多时间
=#

using Distributions,GLMakie 

# 1. problem
"""
For example, there are 4 Queens in a standard deck of 52 cards. 
Suppose we randomly pick a card from a deck, then, without replacement,
 randomly pick another card from the deck. What is the probability that 
 both cards are Queens?
"""

# 2. explain
#= 
  这其实就是capture-recapture
  的方法
    N: population size = 52 cards
    K: number of objects in population with a certain feature = 4 queens
    n: sample size = 2 draws
    k: number of objects in sample with a certain feature = 2 queens
    总的种群为 52, 有 queen 有 4 只, 问题是捕获两只queen 的概率分布, 这是无放回的采样
=#

# 以扑克牌表示, 4 代表有 4 张 queen, 48张不是 queen, 进行 2 次抽样
d1=Hypergeometric(4,48,2) 
#stem(0:2,pdf(d))


##  抽四张牌, 两张是queen的概率
d2=Hypergeometric(4,48,4)
pdf(d2,2)  #0.0249


## 袋中有3 红球, 5 绿球, 随机抽 4 个球,两个红球的概率

d3=Hypergeometric(3,5,4)
pdf(d3,2)  #0.4285


##  篮子内有7 purple marbles and 3 pink marbles,,随机抽出6个球, 抽中 3 个粉色球的概率

d4=Hypergeometric(3,7,6)
pdf(d4,3)  #0.1667