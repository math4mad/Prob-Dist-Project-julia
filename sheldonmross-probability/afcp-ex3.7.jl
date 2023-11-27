### 1. desc

     #= 
       国王("boy")来自两个孩子的家庭, 另一个孩子是姐姐或或者妹妹的概率
     =#

###  2. total space
     first=second=["boy","girl"]
     total_space=[[x,y] for x in first for y in second]

###  3. conditional  
     pA=filter(x->x[1]=="boy"||x[2]=="boy",total_space)
     pB=filter(x->x[1]=="girl"||x[2]=="girl",pA)
     
     "conditional p"=>length(pB)//length(pA)   #"conditional p" => 2//3



