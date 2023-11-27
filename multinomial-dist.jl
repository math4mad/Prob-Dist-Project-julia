
#= 
Suppose an urn contains 6 yellow marbles, 2 red marbles, and 2 pink marbles.

If we randomly select 4 balls from the urn, with replacement, what is the probability that all 4 balls are yellow?
=#

using Distributions,GLMakie 


prob_vec=[0.6,0.2,0.2]  # for  yellow, red, pink marble 

d=Multinomial(4,prob_vec)

pdf(d,[4,0,0])  # 0.1296




