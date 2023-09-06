"""
在一个划分为6000个格子的区域中有 100 个格子有石油, 
钻探次数与发现石油的概率 
"""

using Distributions

total=6000
oil=100
prob=100/total

ns=[2,3,4,5,10,100,500,1000,2000,3000,5000,5999,6000,7000]  #钻井次数
ds=[TDist(n-1) for n in ns]

pdf.(ds,prob)