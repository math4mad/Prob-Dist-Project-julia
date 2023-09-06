"""
白话统计学   page 199  卡方独立性检验

统计学家想知道男女在选择专业上是否有差别
1. 输入数据, 以矩阵形式,矩阵数据以二维列联表形式计算 marginal ,矩阵转置与否对结果没有影响
2. 假设检验
3. 结果分析
   outcome with 95% confidence: reject h_0
   one-sided p-value:           <1e-05
4. 结论
   由于 p-value<0.05 因此可以推断性别和学科选择有关联

"""

using HypothesisTests


observed=[35 50 15; 
          30 25 45
         ]
#expected=fill(1/4,4)



"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.1625, 0.1625, 0.1875, 0.1875, 0.15, 0.15]
    point estimate:          [0.175, 0.15, 0.25, 0.125, 0.075, 0.225]
    95% confidence interval: [(0.11, 0.2471), (0.085, 0.2221), (0.185, 0.3221), (0.06, 0.1971), (0.01, 0.1471), (0.16, 0.2971)]

Test summary:
    outcome with 95% confidence: reject h_0
    one-sided p-value:           <1e-05

Details:
    Sample size:        200
    statistic:          23.717948717948715
    degrees of freedom: 2
    residuals:          [0.438529, -0.438529, 2.04124, -2.04124, -2.73861, 2.73861]
    std. residuals:     [0.754851, -0.754851, 3.65148, -3.65148, -4.6291, 4.6291]
"""

res=ChisqTest(observed)