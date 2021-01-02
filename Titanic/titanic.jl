# https://tngd4ryl.medium.com/an-overview-of-julia-examples-in-exploratory-data-analysis-933f93bbc0d6

using Pkg, CSV, DataFrames
using StatsBase, StatsPlots, Gadfly, Plots

df = DataFrame(CSV.read("./Titanic/train.csv", DataFrame))

summary(df)
describe(df)
first(df, 5)

#Survivors vs Non-Survivors
countmap(df[!, :Survived])

#Gender distribution of passengers
countmap(df[!, :Sex])

#Distributution by ticket class
countmap(df[!, :Pclass])

p1 = Gadfly.plot(
    df,
    x = :Sex,
    y = :Survived,
    color = "Survived",
    Geom.histogram(position = :dodge),
    Scale.color_discrete_manual("salmon", "lightblue"),
)

p2 = Gadfly.plot(
    df,
    x = :Pclass,
    y = :Survived,
    color = "Pclass",
    Geom.bar(),
    Scale.color_discrete_manual("blue", "purple", "yellow"),
)

p3 = Gadfly.plot(
    df,
    x = :Fare,
    y = :Survived,
    color = "Survived",
    Geom.histogram(),
    Scale.color_discrete_manual("blue"),
)


filter(c -> count(ismissing, df[:, c]) / size(df, 1) > 0.1, names(df))

df1 = select!(df, Not([:Age, :Cabin]))

show(first(df1,1),allcols=true)

# Machine Learning in Julia
using MLJ

models()
