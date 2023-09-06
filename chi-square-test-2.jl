"""
https://www.statology.org/chi-square-test-real-life-examples/

生物学家声称每周四种不同的鹿进入一片区域的数量相同

1. 输入观测数据和期望
2. 卡方假设检验
3. 分析结果
95% confidence interval: [(0.12, 0.3228), (0.1, 0.3028), (0.13, 0.3328), (0.25, 0.4528)]
0.25都落在置信区间内, 所以无法决绝 h-0假设, 数据支持生物学家的观点:每周四种不同的鹿进入一片区域的数量相同


"""

using HypothesisTests


observed=[22, 20,23,35]
expected=fill(1/4,4)

res=ChisqTest(observed,expected)


"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.25, 0.25, 0.25, 0.25]
    point estimate:          [0.22, 0.2, 0.23, 0.35]
    95% confidence interval: [(0.12, 0.3228), (0.1, 0.3028), (0.13, 0.3328), (0.25, 0.4528)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.1374

Details:
    Sample size:        100
    statistic:          5.52
    degrees of freedom: 3
    residuals:          [-0.6, -1.0, -0.4, 2.0]
    std. residuals:     [-0.69282, -1.1547, -0.46188, 2.3094]
"""
res
