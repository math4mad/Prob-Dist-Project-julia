using Combinatorics,DataFrames 

total_space=[[i,j] for i  in 1:6, j in 1:6]|>vec

function first_3_cond(arr::Array)
    return  arr[1]==3
end

first_dice_3=filter(first_3_cond,total_space)
@info "first_dice_three"=>first_dice_3

