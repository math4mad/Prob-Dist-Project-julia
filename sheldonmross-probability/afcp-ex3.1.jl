
### 1. question 
    #= 
    概率论基础教程-Sheldon M. Ross(2014).pdf
    ex3.1 掷两枚均匀的酸子，求已知两枚假子点数不同的条件下，至少有一枚点数为6 的条件概率。
    =#

### 2. total probablity  space  
    ma=[[x,y] for x in 1:6, y in 1:6]|>d->reshape(d,(1,36))|>vec

### 3. according to condition to get sub  probablity  space 
    pA=filter(x->x[1] !=x[2],ma)

### 4.  conditional probablity
    pB=filter(x->x[1]==6||x[2]==6,pA)
    length(pB)//length(pA)      #1//3


