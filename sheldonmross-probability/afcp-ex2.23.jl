using Combinatorics,DataFrames 

total_space=[[i,j] for i  in 1:6, j in 1:6]|>vec

function secondmoreone_cond(arr::Array)
    return arr[2]>arr[1]
end

secondmoreone=filter(secondmoreone_cond,total_space)
length(secondmoreone)//length(total_space)  #5//12
