"""
https://www.statology.org/chi-square-test-real-life-examples/

统计学家想知道男女对于三个政党的投票是否有偏好(男或者女为某一党投票是否有差异)
1. 输入数据, 以矩阵形式,矩阵数据以二维列联表形式计算 marginal 
2. 假设检验
3. 结果分析
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.6492

    p-value>0.05,所以为三个政党投票时没有性别差异
"""

using HypothesisTests


observed=[120 90  40 ; 110 95 45]
#expected=fill(1/4,4)

res=ChisqTest(observed)

"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.23, 0.23, 0.185, 0.185, 0.085, 0.085]
    point estimate:          [0.24, 0.22, 0.18, 0.19, 0.08, 0.09]
    95% confidence interval: [(0.196, 0.284), (0.176, 0.264), (0.136, 0.224), (0.146, 0.234), (0.036, 0.124), (0.046, 0.134)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.6492

Details:
    Sample size:        500
    statistic:          0.8640353908896103
    degrees of freedom: 2
    residuals:          [0.466252, -0.466252, -0.259938, 0.259938, -0.383482, 0.383482]
    std. residuals:     [0.897303, -0.897303, -0.463142, 0.463142, -0.59528, 0.59528]
"""
