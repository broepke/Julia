using Pkg, CSV, DataFrames, DataFramesMeta
using StatsBase, StatsPlots, Gadfly, Plots
using Dates, TimeZones
using CategoricalArrays
using TextAnalysis

# Import the data into a DataFrame
df = DataFrame(CSV.read("tesla_forums.csv", DataFrame))

# Convert Columns into preferred formats
df.Time = ZonedDateTime.(df.Time, dateformat"yyyy-mm-dd\THH:MM:SSz")
df.User = CategoricalArray(df.User)
df.Topic = CategoricalArray(df.Topic)

# Remove Duplicate Rows and Drop any Missing
df = unique!(df)
df = dropmissing!(df)

# Basic Inspecition
size(df)
names(df)
summary(df)
describe(df)
first(df, 5)

#foo = @linq df |>
#  transform(Text_Len = length(:Discussion))

df[!, :Text_Len] .= length(df[!, :Discussion])



df2 = DataFrame(str=["one", "two", "three", "four", "five", "six"])
df2[map(str->length(str)<=3, df2[!, :str]),:]

p1 = Gadfly.plot(
    df,
    y = :User,
    Geom.histogram(),
)
