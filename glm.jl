using DataFrames, GLM, Random, Statistics, CSV

using StatsBase, StatsPlots, Gadfly, Plots 

Random.seed!(1);

data = DataFrame(y = rand(100), x = categorical(repeat([1, 2, 3, 4], 25)));

lm(@formula(y ~ x), data)

data2 = DataFrame(y = rand(100), x = repeat([1, 2, 3, 4], 25));

lm(@formula(y ~ x), data2, contrasts = Dict(:x => DummyCoding()))


users = [182301, 232824, 265517, 307827, 450753, 484245, 535776, 594604, 629684, 659109, 694050, 874305]
cogs = [4761393, 5104714, 5023121, 5834911, 5599829, 6712668, 7083847, 7296756, 7602863, 7643765, 7739618, 9147263]

aws = DataFrame(users = users, cogs = cogs)

model = lm(@formula(cogs ~ users), aws)


summary(aws)

describe(aws)
