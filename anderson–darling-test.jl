#= 
[How to Conduct an Anderson-Darling Test in R](https://www.statology.org/anderson-darling-test-r/)
=#

using HypothesisTests,Distributions

dist=Normal(1,2)
data=rand(dist, 100)

OneSampleADTest(data,dist)

#= 
One sample Anderson-Darling test
--------------------------------
Population details:
    parameter of interest:   not implemented yet
    value under h_0:         NaN
    point estimate:          NaN

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.1524

Details:
    number of observations:   100
    sample mean:              0.6635155794481604
    sample SD:                1.941246518245791
    A² statistic:             1.6096743372178
=#

