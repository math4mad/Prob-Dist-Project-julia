"""
The negative binomial distribution describes the probability of experiencing a certain 
amount of failures before experiencing a certain amount of successes in 
a series of Bernoulli trials.

https://www.statology.org/negative-binomial-distribution/  example 3
"""

using Distributions

d=NegativeBinomial(3, 0.167)

pdf(d,4)
