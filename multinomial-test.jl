#= 
 https://www.statology.org/multinomial-test/
=#

## 1. load package
    using NamedArrays,HypothesisTests

## 2.  data 
probs=fill(1/6,6)
data=[4, 5, 2, 9, 5, 5]

## 3. test
MultinomialLRTest(data,probs)

#= 
 Multinomial Likelihood Ratio Test
---------------------------------
Population details:
    parameter of interest:   Multinomial Probabilities
    value under h_0:         [0.166667, 0.166667, 0.166667, 0.166667, 0.166667, 0.166667]
    point estimate:          [0.133333, 0.166667, 0.0666667, 0.3, 0.166667, 0.166667]
    95% confidence interval: [(0.0, 0.3329), (0.03333, 0.3662), (0.0, 0.2662), (0.1667, 0.4995), (0.03333, 0.3662), (0.03333, 0.3662)]

Test summary:
    outcome with 95% confidence: fail to reject h_0
    one-sided p-value:           0.4002

Details:
    Sample size:        30
    statistic:          5.129848630227849
    degrees of freedom: 5
    residuals:          [-0.447214, 0.0, -1.34164, 1.78885, 0.0, 0.0]
    std. residuals:     [-0.489898, 0.0, -1.46969, 1.95959, 0.0, 0.0]
=#