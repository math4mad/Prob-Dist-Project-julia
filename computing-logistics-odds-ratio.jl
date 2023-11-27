#= 
 [R: How to Calculate Odds Ratios in Logistic Regression Model](https://www.statology.org/r-logistic-regression-odds-ratio/)
=#
import ScientificTypes:schema
using GLMakie,CSV,GLM,DataFrames,PrettyTables,ScientificTypes

df=CSV.File("./data/Default.csv")|>DataFrame

@pt first(df,10)

#= 
┌─────────┬─────────┬─────────┬─────────┐
│ default │ student │ balance │  income │
│  String │  String │ Float64 │ Float64 │
├─────────┼─────────┼─────────┼─────────┤
│      No │      No │ 729.526 │ 44361.6 │
│      No │     Yes │  817.18 │ 12106.1 │
│      No │      No │ 1073.55 │ 31767.1 │
│      No │      No │ 529.251 │ 35704.5 │
│      No │      No │ 785.656 │ 38463.5 │
│      No │     Yes │ 919.589 │ 7491.56 │
│      No │      No │ 825.513 │ 24905.2 │
│      No │     Yes │ 808.668 │ 17600.5 │
│      No │      No │ 1161.06 │ 37468.5 │
│      No │      No │     0.0 │ 29275.3 │
└─────────┴─────────┴─────────┴─────────┘
=#
transform!(df, [:student] => ByRow(x->x=="Yes" ? 1 : 0) => [:student])
transform!(df, [:default] => ByRow(x->x=="Yes" ? 1 : 0) => [:default])
data = coerce(df, :student=>Multiclass,
                  :defalut=>Multiclass,
                  :balance=>Continuous,
                  :income=>Continuous)
#schema(df).scitypes                  

model=glm(@formula(default~student+balance+income), data, Binomial(), ProbitLink())

#= 
default ~ 1 + student + balance + income

Coefficients:
─────────────────────────────────────────────────────────────────────────────────
                   Coef.   Std. Error       z  Pr(>|z|)    Lower 95%    Upper 95%
─────────────────────────────────────────────────────────────────────────────────
(Intercept)  -5.47535     0.238471     -22.96    <1e-99  -5.94275     -5.00796
student: 1   -0.295981    0.118822      -2.49    0.0127  -0.528867    -0.0630943
balance       0.00282078  0.000113862   24.77    <1e-99   0.00259761   0.00304394
income        2.10138e-6  4.12088e-6     0.51    0.6101  -5.9754e-6    1.01781e-5
─────────────────────────────────────────────────────────────────────────────────
=#

res=predict(model,data[:,[:student,:balance,:income]])
