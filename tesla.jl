using Pkg, CSV, DataFrames
using StatsBase, StatsPlots, Gadfly, Plots
using Dates, TimeZones
using CategoricalArrays
using TextAnalysis

# Import the data into a DataFrame
df = DataFrame(CSV.read("tesla_forums.csv", DataFrame))

# Basic Inspecition
summary(df)
describe(df)
print(first(df, 5))

# Convert Columns into preferred formats
df.Time = ZonedDateTime.(df.Time, dateformat"yyyy-mm-dd\THH:MM:SSz")
df.User = CategoricalArray(df.User)
df.Topic = CategoricalArray(df.Topic)

# Remove Duplicate Rows and Drop any Missing
df = unique!(df)
df = dropmissing!(df)
