#=  
    https://www.statology.org/chi-square-goodness-of-fit-test-in-r/

    老板声称商店里每天到店的顾客数一样, 通过五天的观察, 检验老板的描述

    1. 输入观测数据和期望值
    2. 卡方假设检验
    3. 分析结果
        95% confidence interval: [(0.14, 0.2657), (0.18, 0.3057), (0.1, 0.2257), (0.128, 0.2537), (0.152, 0.2777)]
        在每个观测点, 假设都落在置信区间内
        结论:不能拒绝 0 假设, 老板的描述正确
=#

using HypothesisTests


observed=[50, 60, 40, 47, 53]
expected=[.2, .2, .2, .2, .2]

res=ChisqTest(observed,expected)

#=
    Pearson's Chi-square Test
    -------------------------
    Population details:
        parameter of interest:   Multinomial Probabilities
        value under h_0:         [0.2, 0.2, 0.2, 0.2, 0.2]
        point estimate:          [0.2, 0.24, 0.16, 0.188, 0.212]
        95% confidence interval: [(0.14, 0.2657), (0.18, 0.3057), (0.1, 0.2257), (0.128, 0.2537), (0.152, 0.2777)]

    Test summary:
        outcome with 95% confidence: fail to reject h_0
        one-sided p-value:           0.3595

    Details:
        Sample size:        250
        statistic:          4.3599999999999985
        degrees of freedom: 4
        residuals:          [0.0, 1.41421, -1.41421, -0.424264, 0.424264]
        std. residuals:     [0.0, 1.58114, -1.58114, -0.474342, 0.474342]
=#

