#= 
https://www.statology.org/chi-square-test-of-independence-in-r/

可以直接使用矩阵形式,NamedArray 结果相同
=#


## 1. load package
using NamedArrays,HypothesisTests

## 2. load data
matrix=[120 90 40;110  95  45]
n=NamedArray(matrix,(["Female", "Male"],["Rep","Dem","Ind"]),("Rows", "Cols"))
    #= 
    2×3 Named Matrix{Int64}
    Rows ╲ Cols │ Rep  Dem  Ind
    ────────────┼──────────────
    Female      │ 120    0   40
    Male        │ 110   95   45
    =#
## 3. test
ChisqTest(n)
#= 
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
=#