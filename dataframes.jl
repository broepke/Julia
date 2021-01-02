using DataFrames
using Tables

df = DataFrame(A = 1:4, B = ["M", "F", "F", "M"])

df.A

df."A"

df.A === df[!, :A]

df.A === df[:, :A]

df.A == df[:, :A]

df.A === df[!, "A"]

df.A === df[:, "A"]

df.A == df[:, "A"]

df.A === df[!, 1]

df.A === df[:, 1]

df.A == df[:, 1]

firstcolumn = :A

df[!, firstcolumn] === df.A

df[:, firstcolumn] === df.A

df[:, firstcolumn] == df.A

names(df)

propertynames(df)

size(df, 1)

size(df, 2)

size(df)

df = DataFrame(A = Int[], B = String[])

push!(df, (1, "M"))
push!(df, [2, "N"])
push!(df, Dict(:B => "F", :A => 3))

v = [(a=1, b=2), (a=3, b=4)]

df = DataFrame(v)

Tables.rowtable(df)

df = DataFrame(A = 1:2:1000, B = repeat(1:10, inner=50), C = 1:500)
