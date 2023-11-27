#= 
   using function method
=#

## 1. define params



w = 5
b= 7
total= w+ b

## 2. load package
using  Pipe,Combinatorics

## 3. define  function 
function pick_trail(list::Vector{Char})
    arr=[]
    for  i in list

        if i=='b'
        push!(arr,b//total)
        global b=b+2
        total=w+b
        else
            push!(arr,w//total)
        global  w=w+2
            global total=w+b
        end
       
    end
    return arr
end

#p1=@pipe pick_trail(['b','b','w','w'])|>reduce(*,_)

res=permutations([1,2,3,4], 4)|>collect


