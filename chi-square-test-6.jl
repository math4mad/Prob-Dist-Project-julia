"""
https://www.scribbr.com/statistics/chi-square-tests/

卡方拟合优度检验:  不同鸟类去喂食点的频率是否有差异

1. 输入观测数据和期望值
2. 卡方假设检验
3. 分析结果
   Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.3561
4. 结论
    p-value>0.05,因此不能拒绝 零假设, 根据统计数据做出的推断为:不同鸟类去喂食点的频率没有差异
"""

using HypothesisTests,DataFrames

species=["House sparrow","House finch","Black-capped chickadee","Common grackle","European starling","Mourning dove"]
frequency=[15,12,9,8,8,6]
df=DataFrame(species=species,frequency=frequency)
len=size(df,1)
observed=df[:,2]
expected=fill(1/len,len)

res=ChisqTest(observed,expected)

"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.166667, 0.166667, 0.166667, 0.166667, 0.166667, 0.166667]
    point estimate:          [0.258621, 0.206897, 0.155172, 0.137931, 0.137931, 0.103448]
    95% confidence interval: [(0.1379, 0.3822), (0.08621, 0.3304), (0.03448, 0.2787), (0.01724, 0.2615), (0.01724, 0.2615), (0.0, 0.227)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.3561

Details:
    Sample size:        58
    statistic:          5.517241379310348
    degrees of freedom: 5
    residuals:          [1.71538, 0.750479, -0.214423, -0.536056, -0.536056, -1.17932]
    std. residuals:     [1.8791, 0.822108, -0.234888, -0.58722, -0.58722, -1.29188]
"""

