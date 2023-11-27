include("../2-marble-3.jl")

using Test

function marble_method_test()
    @testset "marble-prob.test" begin
        bag = Bag(15, 18, 10)
        res1 = new_bag_space_prob(bag, red)
        res2 = new_bag_space_prob(res1[1], red)
        
        @test res1[1]==Bag(14,18,10)
        @test res1[2]==15//43
        @test res2[2]==1//3
        @test (res1[2] * res2[2])==5//43
    end;
end
marble_method_test()
