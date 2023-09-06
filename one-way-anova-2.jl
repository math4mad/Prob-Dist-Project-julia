"""
PlantGrowth  dataset
"""

using HypothesisTests,DataFrames,RCall

# input data from R
@rlibrary datasets
df = rcopy(R"datasets::PlantGrowth")


gdf = groupby(df, :group)   #group

data=[gdf[i][!,:weight] for i in eachindex(gdf)]  # get each weight col

# one way anova
plant_growth_diff= OneWayANOVATest(data...)

#=
  One-way analysis of variance (ANOVA) test
-----------------------------------------
Population details:
    parameter of interest:   Means
    value under h_0:         "all equal"
    point estimate:          NaN

Test summary:
    outcome with 95% confidence: reject h_0
    p-value:                     0.0159

Details:
    number of observations: [10, 10, 10]
    F statistic:            4.84609
    degrees of freedom:     (2, 27)
=#

function tukey_HSD(df)
	@rput df
	R"""
	 df$group <- as.factor(df$group)
     model <- aov(weight~group, data=df)
	 summary(model )
	 TukeyHSD(model) 
	
    """
end



tukey_HSD(df)

#=
    RObject{VecSxp}
    Tukey multiple comparisons of means
        95% family-wise confidence level

    Fit: aov(formula = weight ~ group, data = df)

    $group
                diff        lwr       upr     p adj
    trt1-ctrl -0.371 -1.0622161 0.3202161 0.3908711
    trt2-ctrl  0.494 -0.1972161 1.1852161 0.1979960
    trt2-trt1  0.865  0.1737839 1.5562161 0.0120064
=#


