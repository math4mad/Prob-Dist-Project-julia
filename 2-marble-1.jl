    

    
    
    
    red=1;blue=2;green=3
    pick1=1 #red
    pick2=1 #red

    bag=[15,18,10]
    total_size=sum(bag)
    
    "计算从bag中取出某色球的概率"
    prob(bag::Array,pickball::Int)=bag[pickball]//sum(bag)
    
    """
    bag_space(bag::Array,pickball::Int)
    
    计算从袋中取出pickball 后的概率空间
    
    ## arguments
     1. bag:  装有球的数组, 按序排列
     2. pickball:要取出球的序号
    """
    function bag_space(bag::Array,pickball::Int)
        after_space=if pickball==1
        [bag[1]-1,bag[2:3]...]
        elseif pickball==2
        [bag[1],bag[2]-1,bag[3]]
        else
        [bag[1:2]...,bag[3]-1]
        end
        return after_space
    end

    pr1=prob(bag,pick1)
    pick_1ball_space=bag_space(bag,pick1)
    pr2=prob(pick_1ball_space,pick2)
    both_red=pr1*pr2
    "连续两次红球概率"=> both_red


   