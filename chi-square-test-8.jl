"""
https://www.statology.org/chi-square-test-by-hand/
卡方独立性检验:  扔出骰子各面机会是否一致

1. 输入观测数据和期望值
2. 卡方假设检验
   H_0: 骰子各面出现机会一致
   H_a: 骰子各面出现机会不同
3. 分析结果
    value under h_0:         [0.166667, 0.166667, 0.166667, 0.166667, 0.166667, 0.166667]
    point estimate:          [0.133333, 0.2, 0.3, 0.15, 0.116667, 0.1]
    95% confidence interval: [(0.01667, 0.2606), (0.08333, 0.3273), (0.1833, 0.4273), (0.03333, 0.2773), (0.0, 0.244), (0.0, 0.2273)]
   
4. 结论
   p-value>0.05,因此不能拒绝H_0, 骰子各面出现机会一致
"""

using HypothesisTests


observed=[8,12,18,9,7,6]

len=length(observed)
expected=fill(1/len,len)
res=ChisqTest(observed,expected)

"""
Pearson's Chi-square Test
-------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.166667, 0.166667, 0.166667, 0.166667, 0.166667, 0.166667]
    point estimate:          [0.133333, 0.2, 0.3, 0.15, 0.116667, 0.1]
    95% confidence interval: [(0.01667, 0.2606), (0.08333, 0.3273), (0.1833, 0.4273), (0.03333, 0.2773), (0.0, 0.244), (0.0, 0.2273)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.0811

Details:
    Sample size:        60
    statistic:          9.799999999999999
    degrees of freedom: 5
    residuals:          [-0.632456, 0.632456, 2.52982, -0.316228, -0.948683, -1.26491]
    std. residuals:     [-0.69282, 0.69282, 2.77128, -0.34641, -1.03923, -1.38564]
"""
