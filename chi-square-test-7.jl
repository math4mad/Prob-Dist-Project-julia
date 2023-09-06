"""
https://mathcenter.oxford.emory.edu/site/math117/probSetChiSquareTests/

卡方独立性检验:  Harvest Blend M&M's 中各色的糖豆是否以同一比例混合

1. 输入观测数据和期望值
2. 卡方假设检验
3. 分析结果
    value under h_0:         [0.25, 0.25, 0.25, 0.25]
    point estimate:          [0.263636, 0.277273, 0.25, 0.209091]
    95% confidence interval: [(0.1955, 0.3351), (0.2091, 0.3487), (0.1818, 0.3214), (0.1409, 0.2805)]
   
4. 结论
    Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.5143
    p-value>0.05,因此不能拒绝 零假设, 根据统计数据做出的推断为:各色糖豆以同比例混合
"""

using HypothesisTests,DataFrames

colors=["Yellow","Brown","Red","Maroon"]
numbers=[58,61,55,46]
df=DataFrame(colors=colors,numbers=numbers)
len=size(df,1)
observed=df[:,2]
expected=fill(1/len,len)

res=ChisqTest(observed,expected)

"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.25, 0.25, 0.25, 0.25]
    point estimate:          [0.263636, 0.277273, 0.25, 0.209091]
    95% confidence interval: [(0.1955, 0.3351), (0.2091, 0.3487), (0.1818, 0.3214), (0.1409, 0.2805)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.5143

Details:
    Sample size:        220
    statistic:          2.290909090909085
    degrees of freedom: 3
    residuals:          [0.40452, 0.80904, 0.0, -1.21356]
    std. residuals:     [0.467099, 0.934199, 0.0, -1.4013]
"""