"""
白话统计学 page76

model=OneSampleTTest(65,10,144,60)

解释为 从均值为 60 的总体中随机抽取 样本均值为 65,标准差为 10,数量为 144 的样本概率为多大?

"""

import  HypothesisTests:confint
using HypothesisTests

model=OneSampleTTest(65,10,144,60)

#= 
   One sample t-test
-----------------
Population details:
    parameter of interest:   Mean
    value under h_0:         60
    point estimate:          65
    95% confidence interval: (63.35, 66.65)

Test summary:
    outcome with 95% confidence: reject h_0
    two-sided p-value:           <1e-07

Details:
    number of observations:   144
    t-statistic:              6.0
    degrees of freedom:       143
    empirical standard error: 0.8333333333333334
=#

confint(model)   # (63.35275650172517, 66.64724349827483)