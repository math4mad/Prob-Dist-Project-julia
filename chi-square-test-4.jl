"""
https://www.statology.org/chi-square-test-real-life-examples/

统计学家想知道不同学历水平的婚姻状况是否有统计区别, 卡方独立性检验
1. 输入数据, 以矩阵形式,矩阵数据以二维列联表形式计算 marginal 
2. 假设检验
3. 结果分析
    outcome with 95% confidence: reject h_0
    one-sided p-value:           <1e-04
4. 结论
   由于 p-value <0.05,因此从统计上看,学历水平和婚姻是有关联的
   (关联代表有关系, 但是没有执行因果关系的实验, 所有不能对因果关系做结论)
"""

using HypothesisTests


observed=[20 100 35 ; 
          50 80 15
        ]
#expected=fill(1/4,4)

res=ChisqTest(observed)

"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.120556, 0.112778, 0.31, 0.29, 0.0861111, 0.0805556]
    point estimate:          [0.0666667, 0.166667, 0.333333, 0.266667, 0.116667, 0.05]
    95% confidence interval: [(0.01, 0.1263), (0.11, 0.2263), (0.2767, 0.3929), (0.21, 0.3263), (0.06, 0.1763), (0.0, 0.1096)]

Test summary:
    outcome with 95% confidence: reject h_0
    one-sided p-value:           <1e-04

Details:
    Sample size:        300
    statistic:          22.771333227395516
    degrees of freedom: 2
    residuals:          [-2.68823, 2.77938, 0.725866, -0.750479, 1.80352, -1.86467]
    std. residuals:     [-4.41611, 4.41611, 1.65083, -1.65083, 2.84177, -2.84177]
"""