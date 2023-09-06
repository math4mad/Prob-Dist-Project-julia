using Bootstrap,Statistics,Random,Distributions
cil = 0.95;

data = randn(100);
data2= rand(Normal(),100)
n_boot=1000

bs1 = bootstrap(mean,data2, BasicSampling(n_boot))

bci1 = confint(bs1, NormalConfInt(cil));

bci1
