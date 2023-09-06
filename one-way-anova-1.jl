"""
from:stat-one-way-anvoa.pluto.jl

检测三个年龄组的儿童冰淇淋喜好是否有差异

如果拒绝 0假设, 可以执行 tukey_HSD 检测组间的方差差异,使用 R 语言的软件包
"""

using HypothesisTests,DataFrames,RCall

# input data
data1=[5,5, 4, 4 ,3]
data2=[5, 4, 4, 3, 3]
data3=[4,3 ,2, 2,1]
df = DataFrame(five=data1, eight=data2,tweleve=data3)

# anova test

icecream_taste_res= OneWayANOVATest(eachcol(df)...)

#=

    One-way analysis of variance (ANOVA) test
    -----------------------------------------
    Population details:
        parameter of interest:   Means
        value under h_0:         "all equal"
        point estimate:          NaN

    Test summary:
        outcome with 95% confidence: reject h_0
        p-value:                     0.0269

    Details:
        number of observations: [5, 5, 5]
        F statistic:            4.96296
        degrees of freedom:     (2, 12)
=#

# tukey_HSD 

function tukey_HSD(df)
	@rput df
	R"""
	 df$group <- as.factor(df$group)
     model <- aov(value~group, data=df)
	 summary(model )
	 TukeyHSD(model) 
	
    """
end


# df变换为 第一列为 value, 第二列为 group

value=[data1...,data2...,data3...]
group=[fill("5",5)...,fill("8",5)...,fill("12",5)...]
df2=DataFrame(:value=>value,:group=>group)

tukey_HSD(df2)

#=
    RObject{VecSxp}
    Tukey multiple comparisons of means
        95% family-wise confidence level

    Fit: aov(formula = value ~ group, data = df)

    $group
        diff        lwr      upr     p adj
    5-12  1.8  0.1992818 3.400718 0.0277219
    8-12  1.4 -0.2007182 3.000718 0.0891867
    8-5  -0.4 -2.0007182 1.200718 0.7866927
=#