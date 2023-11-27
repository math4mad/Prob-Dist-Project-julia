#= 
 Suppose you have A♥ 7♦. Given only this information about your two cards, what is the probability that the player on your left has pocket aces?
=#

include("./utils.jl")
using StatsBase

your_hands=[["♦️",7],["♥️",14]]
other_hands=setdiff(poker_face,your_hands)
cond_space=combinations(other_hands,2)|>collect
filter(pickup_aa_cond,cond_space)
#= 
  [["♠️", 14], ["♦️", 14]]
  [["♠️", 14], ["♣️", 14]]
  [["♦️", 14], ["♣️", 14]]
=#
