using Pipe

suits=["♥️","♠️","♦️","♣️"]
digits=Vector(2:14) # for 2:10,J,Q,K,A


"52 张牌的牌面"

temp=[[color,num] for color in suits,num in digits]|>vec 
poker_face=([i[1]=>i[2] for i  in temp])
