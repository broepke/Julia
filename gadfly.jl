using Gadfly
using RDatasets

iris = dataset("datasets", "iris")

plot(iris, x=:SepalLength, y=:SepalWidth, Geom.point)

plot(iris, x=:SepalLength, y=:SepalWidth, color=:Species, Geom.point)

mammals = dataset("MASS", "mammals")

plot(mammals, x=:Body, y=:Brain, label=:Mammal,
         Geom.point, Geom.label, Scale.x_log10, Scale.y_log10)

cars = dataset("datasets", "mtcars")

plot(cars, x=:MPG, y=:Disp, color="Cyl")
