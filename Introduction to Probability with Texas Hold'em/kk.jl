include("./utils.jl")

two_cards_space=pick_n_cards(2)
two_cards_size=length(two_cards_space)



kk=filter(pickup_kk_cond,two_cards_space)

"抽中两张 kk的概率"=>length(kk)//two_cards_size  #1//221



