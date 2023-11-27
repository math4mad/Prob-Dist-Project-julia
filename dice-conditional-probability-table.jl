using DataFrames, PrettyTables,Distributions,Pipe

d1=dice1= fill(1//6,6)
d2=dice2= fill(1//6,6)



function make_df(ma::Matrix)
    name=["da$i" for i in 1:6]
    df=DataFrame(da=name,db1=ma[:,1],db2=ma[:,1],db3=ma[:,3],db4=ma[:,4],db5=ma[:,5],db6=ma[:,6])
end


## 1 general table
ma1=[x*y for x in dice1,y in dice2]
@pt make_df(ma1)



## 2  sum to 9 
ma2=[i+j==9 ? 1 : 0  for i in 1:6,j in 1:6]
@pt make_df(ma2)



## 3 prob
ma3=[ma2[i,j]==1 ? d1[i]*d2[j] : 0  for i in 1:6,j in 1:6]
@pt make_df(ma3)


## 3 prob normalize
ma4=[ma2[i,j]==1 ? d1[i]*d2[j]/sum(ma3) : 0  for i in 1:6,j in 1:6]
@pt make_df(ma4)



